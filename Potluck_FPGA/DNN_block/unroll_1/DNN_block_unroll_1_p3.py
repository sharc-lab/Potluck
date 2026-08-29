from __future__ import annotations
from pynq import Overlay
from pynq import allocate
import numpy as np
import pynq
import pickle
import glob
import re
from pathlib import Path
import os
import json
from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Optional, Sequence, Tuple
from collections import defaultdict


def to_fixed_point(dst, src, *, width=None, iwidth, signed=True):
    if width is None:
        width = dst.dtype.itemsize * 8

    fwidth = width - iwidth
    epsilon = 1.0 / (2.0 ** fwidth)
    min_ = -1.0 * (2.0 ** (iwidth - 1)) if signed else 0.0
    max_ = (2.0 ** (iwidth - (1 if signed else 0))) - epsilon

    src = np.copy(src)
    src = src.reshape(dst.shape)
    src[src < min_] = min_
    src[src > max_] = max_
    if signed:
        src[src < 0] += (2 ** iwidth)
    dst[:] = np.around(src * (2.0 ** fwidth)).astype(dst.dtype)

def from_fixed_point(src, *, width=None, iwidth, signed=True):
    if width is None:
        width = src.dtype.itemsize * 8

    fwidth = width - iwidth
    dst = np.array(src, dtype='<f4')
    if signed:
        dst[dst >= (2 ** (width - 1))] -= (2 ** width)
    dst /= 2.0 ** fwidth
    return dst
def load_generated_instructions(folder: str):
    # Regex to capture the three numbers in the filename
    pattern = re.compile(r"generated_instructions_(\d+)_(\d+)_(\d+)\.txt$")
    
    entries = []
    # Discover all matching files
    for path in Path(folder).glob("generated_instructions_*.txt"):
        m = pattern.match(path.name)
        if not m:
            continue
        i, j, k = map(int, m.groups())
        entries.append(((i, j, k), path))
    
    # Sort by the index tuple so order is deterministic
    entries.sort(key=lambda x: x[0])
    
    all_instructions = []
    file_indices    = []
    
    for (i, j, k), path in entries:
        # Read non-empty, stripped lines
        with open(path, "r") as f:
            lines = [line.strip() for line in f if line.strip()]
        
        all_instructions.append(lines)
        file_indices.append((i, j, k))
    
    return all_instructions, file_indices

def reorg_instructions(
    instruction_lists: List[T],
    indices: List[Tuple[int, int, int]]
) -> List[List[List[T]]]:
    """
    Return a 3-level nested list with no placeholder [] entries.
    Each node stores exactly the sub-lists whose (i,j,k) coordinates
    appear in *indices*.

       result[i][j][k_idx]  ←  sub-list at the k_idx-th existing k
                               for that (i,j) pair, in ascending k order.
    """
    # 1. Gather everything in a 3-level dict:  dict[i][j][k] = sublist
    store = defaultdict(lambda: defaultdict(dict))
    for (i, j, k), sub in zip(indices, instruction_lists):
        store[i][j][k] = sub

    # 2. Convert to nested lists, sorting the keys so the order is stable
    result: List[List[List[T]]] = []
    for i in sorted(store):                      # layer i
        layer_i: List[List[T]] = []
        for j in sorted(store[i]):               # row j
            row_j = [store[i][j][k]              # k runs 0,1,2,…
                     for k in sorted(store[i][j])]
            layer_i.append(row_j)
        result.append(layer_i)

    return result

def generate_pynq_arrays(name_list, size_list, dtype=np.float32, suffix='float'):
    """
    Given two equally‐long lists:
      name_list – list of base names (e.g. ['input_array_1', …])
      size_list – list of ints
    Allocates a pynq buffer for each, named "<name>_<suffix>", 
    injects it into globals(), and RETURNS a dict mapping those names → buffers.
    """
    if len(name_list) != len(size_list):
        raise ValueError("name_list and size_list must have the same length")
    
    buffers = {}
    for name, size in zip(name_list, size_list):
        var_name = f"{name}_{suffix}"
        buf = pynq.allocate(shape=(size,), dtype=dtype)
        globals()[var_name] = buf
        buffers[var_name] = buf
    
    return buffers

def load_input_buffers_from_txt(
    buffers_float,       # dict mapping '<name>_float' → PynqBuffer
    dram_names,          # list of base names, e.g. ['input_array_1', …]
    directions,          # parallel list of 'input'/'output'
    data_dir="."
):
    """
    Loads each '<name>.txt' into buffers_float['<name>_float'] for names
    marked 'input' in directions, then flushes.
    """
    for name, dir_flag in zip(dram_names, directions):
        if dir_flag.lower() == "input":
            buf_name = f"{name}_float"
            buf = buffers_float.get(buf_name)
            if buf is None:
                raise KeyError(f"No float buffer found for '{buf_name}'")
            
            path = os.path.join(data_dir, f"{name}.txt")
            if not os.path.isfile(path):
                raise FileNotFoundError(f"Cannot find data file: {path}")
            
            data = np.loadtxt(path, dtype=buf.dtype)
            if data.size != buf.size:
                raise ValueError(
                    f"Size mismatch for {name}: "
                    f"file has {data.size} elements, buffer expects {buf.size}"
                )
            
            buf[:] = data.reshape(buf.shape)
            buf.flush()
            print(f"Loaded {buf.size} values into '{buf_name}'")
            
def convert_to_fixed(dram_names, buffers_float, buffers_fixed, directions, width, iwidth):
    """
    For each DRAM array name in dram_names, if the corresponding
    direction is 'input', convert the float buffer to fixed-point
    using to_fixed_point.
    """
    for name, dir_flag in zip(dram_names, directions):
        if dir_flag.lower() == 'input':
            float_buf = buffers_float[f"{name}_float"]
            fixed_buf = buffers_fixed[f"{name}_fixed"]
            to_fixed_point(fixed_buf, float_buf, width=width, iwidth=iwidth)
            to_fixed_point(fixed_buf, float_buf, width=width, iwidth=iwidth)
            
def write_registers_from_txt(hls_ip, reg_names, reg_addresses, data_dir="."):
    """
    Reads each '<reg_name>.txt' (containing a single integer) and writes its
    value to the HLS IP at the given register offset.

    Args:
      hls_ip             – your HLS IP handle with a .write(addr, value) method
      reg_names          – list of register base names, e.g. ['n', 'm', ...]
      reg_addresses      – list of hex-string offsets, e.g. ['0x40', '0x44', ...]
      data_dir           – directory where '<reg_name>.txt' files are located
    """
    if len(reg_names) != len(reg_addresses):
        raise ValueError("reg_names and reg_addresses must have the same length")

    for name, addr_str in zip(reg_names, reg_addresses):
        # build path to the .txt file
        path = os.path.join(data_dir, f"{name}.txt")
        if not os.path.isfile(path):
            raise FileNotFoundError(f"Data file not found: {path}")

        # read and parse the integer value
        with open(path, 'r') as f:
            text = f.read().strip()
        try:
            value = int(text, 0)  # allows decimal or hex in file
        except ValueError:
            raise ValueError(f"Cannot parse integer from '{path}': {text!r}")

        # convert the register address and write
        reg_offset = int(addr_str, 16)
        hls_ip.write(reg_offset, value)
        print(f"Wrote register '{name}' (0x{reg_offset:02x}) = {value}")
        
def write_dram_addresses(hls_ip, buffers_fixed, names, addresses, directions):
    """
    Writes each buffer’s physical address into the IP at the given register offset.

    Args:
      hls_ip             – your HLS IP handle with a .write(addr, value) method
      buffers_fixed      – dict mapping '<name>_fixed' → PynqBuffer
      names              – list of base names, e.g. ['input_array_1', …]
      addresses          – list of hex-string offsets, e.g. ['0x10', …]
      directions         – list of 'input'/'output' flags (same order)
    """
    for name, addr_str, dir_flag in zip(names, addresses, directions):
        reg_offset = int(addr_str, 16)
        buf = buffers_fixed.get(f"{name}_fixed")
        if buf is None:
            raise KeyError(f"No fixed buffer for '{name}_fixed'")
        hls_ip.write(reg_offset, buf.physical_address)
        print(f"Wrote {name}_fixed at 0x{reg_offset:02x}")


def _str_to_int(s: str) -> int:
    """Accepts binary strings, 0b..., 0x..., or decimal."""
    s = s.strip()
    if s.startswith(("0x","0X")): return int(s, 16)
    if s.startswith(("0b","0B")): return int(s, 2)
    if all(ch in "01" for ch in s): return int(s, 2)
    return int(s)
def fetch_insts_for_name(name: str, inst_3d) -> list:
    """
    Map 'inst_array_i_j' → inst_3d[i][j].
    Raises with a clear message if the name/index is invalid.
    """
    m = re.fullmatch(r"inst_array_(\d+)_(\d+)", name)
    if not m:
        raise ValueError(f"Bad inst array name '{name}' (expected 'inst_array_i_j').")
    i, j = int(m.group(1)), int(m.group(2))
    try:
        return inst_3d[i][j]
    except Exception as e:
        raise IndexError(f"Index [{i}][{j}] not found in current_instruction_list") from e

def pack_instructions_to_dma_buffer(bytes_per_inst: int, insts: list, dma_buf, target_len: int = None):
    """
    Fill dma_buf with little-endian instruction bytes.
    Pads with zeros if target_len > len(insts); truncates otherwise.
    """
    n = len(insts) if target_len is None else int(target_len)
    need = bytes_per_inst * n
    if dma_buf.size < need:
        raise ValueError(f"dma_buf too small: need {need} bytes, have {dma_buf.size}")

    for i in range(n):
        if i < len(insts):
            raw_val = insts[i]
            val = _str_to_int(raw_val) if isinstance(raw_val, str) else int(raw_val)
        else:
            val = 0  # pad
        start, end = i * bytes_per_inst, (i + 1) * bytes_per_inst
        dma_buf[start:end] = np.frombuffer(
            val.to_bytes(bytes_per_inst, byteorder="little", signed=False),
            dtype=np.uint8
        )
    return dma_buf

def write_inst_buffers(hls_ip, names, addresses, inst_bits, inst_3d, *, verbose=True):
    """
    For each 'inst_array_i_j' in names:
      - fetch inst_3d[i][j]
      - allocate a uint8 DMA buffer sized inst_bits/8 * sizes[k]
      - pack instructions (little-endian), padding/truncating to sizes[k]
      - write the buffer's physical address to the IP register at addresses[k]
    Returns: dict name -> dma_buf (so you can start DMA later).
    """
    if inst_bits % 8 != 0:
        raise ValueError(f"inst_bits must be a multiple of 8, got {inst_bits}")
    bpi = inst_bits // 8

    inst_buffers = {}
    for idx, (name, addr_str) in enumerate(zip(names, addresses)):
        reg_offset = int(addr_str, 16)
        
        insts = fetch_insts_for_name(name, inst_3d)
        target_len = len(insts)
        dma_bytes = bpi * target_len

        dma_buf = pynq.allocate(shape=(dma_bytes,), dtype=np.uint8)
        pack_instructions_to_dma_buffer(bpi, insts, dma_buf, target_len=target_len)

        hls_ip.write(reg_offset, dma_buf.physical_address)
        inst_buffers[name] = dma_buf

        if verbose:
            print(f"[inst] {name}: {len(insts)}→{target_len} insts, "
                  f"{bpi} B/inst, wrote IP@0x{reg_offset:02x} = phys 0x{dma_buf.physical_address:08x}")

    return inst_buffers

def _infer_inst_bits_one(val) -> int:
    """
    Infer bit-width of a single instruction value (str or int).
    Rounds up to the next multiple of 8 bits.
    """
    if isinstance(val, str):
        s = val.strip()
        if s.startswith(("0x","0X")):
            bits = int(s, 16).bit_length()
        elif s.startswith(("0b","0B")):
            bits = int(s, 2).bit_length()
        elif all(ch in "01" for ch in s) and len(s) > 0:
            bits = len(s)  # pure binary string
        else:
            bits = int(s, 0).bit_length()
    else:
        bits = int(val).bit_length()
    # round up to a whole byte
    return ((bits + 7) // 8) * 8

def _flatten_one_level(x):
    """If x looks like [[...]] (one extra nesting), flatten one level."""
    if isinstance(x, (list, tuple)) and len(x) == 1 and isinstance(x[0], (list, tuple)):
        return list(x[0])
    return x

def _insts_for_n_name(name: str, inst_3d):
    """
    Map 'n_inst_i_j' → current_instruction_list[i][j].
    """
    m = re.fullmatch(r"n_inst_(\d+)_(\d+)", name)
    if not m:
        raise ValueError(f"Bad name '{name}' (expected 'n_inst_i_j').")
    i, j = int(m.group(1)), int(m.group(2))
    try:
        insts = inst_3d[i][j]
    except Exception as e:
        raise IndexError(f"Index [{i}][{j}] not found in current_instruction_list") from e
    return _flatten_one_level(insts)

def write_n_inst_from_current_list(hls_ip, reg_names, reg_addresses, inst_3d, *, verbose=True):
    """
    For each 'n_inst_i_j' in reg_names:
      - fetch current_instruction_list[i][j]
      - compute the number of instructions (len)
      - infer instruction bit-width (from the first element) for logging
      - write the count to HLS IP at the given register offset.

    Returns: dict {name: {"count": n, "inst_bits": bits}}
    """
    if len(reg_names) != len(reg_addresses):
        raise ValueError("reg_names and reg_addresses must have the same length")

    summary = {}
    for name, addr_str in zip(reg_names, reg_addresses):
        insts = _insts_for_n_name(name, inst_3d)
        n = len(insts)
        bits = _infer_inst_bits_one(insts[0]) if n > 0 else 0

        reg_offset = int(addr_str, 16)
        hls_ip.write(reg_offset, int(n))
        summary[name] = {"count": n, "inst_bits": bits}

        if verbose:
            print(f"[n_inst] {name}: count={n}, inst_bits≈{bits}, wrote IP@0x{reg_offset:02x} = {n}")
    return summary


def convert_outputs_from_fixed(
    names,
    directions,
    buffers_fixed,
    width,
    iwidth
):
    """
    Converts every fixed-point buffer with direction 'output' back to float.

    Args:
      names           – list of base names, e.g. ['input_array_1', …]
      directions      – parallel list of 'input'/'output'
      buffers_fixed   – dict mapping '<name>_fixed' → PynqBuffer
      width, iwidth   – fixed-point parameters to pass to from_fixed_point

    Returns:
      dict mapping '<name>_float' → the returned float buffer
    """
    outputs = {}
    for name, dir_flag in zip(names, directions):
        if dir_flag.lower() == 'output':
            fixed_key = f"{name}_fixed"
            if fixed_key not in buffers_fixed:
                raise KeyError(f"Missing fixed buffer for '{fixed_key}'")
            fixed_buf = buffers_fixed[fixed_key]
            # perform conversion
            float_buf = from_fixed_point(fixed_buf, width=width, iwidth=iwidth)
            float_key = f"{name}_float"
            outputs[float_key] = float_buf
    return outputs


def save_output_buffers_to_txt(
    names,
    directions,
    buffers_float,
    data_dir="."
):
    """
    Saves each '<name>_float' buffer to '<name>.txt' for names
    marked as 'output' in directions, writing exactly one value per line.
    Creates data_dir if it does not exist.
    """
    # Ensure the output directory exists
    os.makedirs(data_dir, exist_ok=True)

    for name, dir_flag in zip(names, directions):
        if dir_flag.lower() == "output":
            key = f"{name}_float"
            buf = buffers_float.get(key)
            if buf is None:
                raise KeyError(f"No float buffer found for '{key}'")

            arr = np.array(buf).flatten()
            path = os.path.join(data_dir, f"{name}.txt")

            # Write one element per line, no extra formatting
            with open(path, "w") as f:
                for val in arr:
                    f.write(f"{val}\n")

            print(f"Saved '{key}' → '{path}'")



program_index = 2
width, iwidth = 32, 10
with open("./config.json", "r") as f:
    cfg = json.load(f)
    
mapping_table_path = f"./mapping_table_{program_index + 1}.json"

with open(mapping_table_path, "r") as f:
    mapping_table = json.load(f)
    
DRAM_array_name_list    = cfg["DRAM_array_name_list"]
DRAM_array_direction    = cfg["DRAM_array_direction"]
DRAM_array_size         = cfg["DRAM_array_size"]
DRAM_array_address_list = cfg["DRAM_array_address_list"]

normal_reg_name_list    = cfg["normal_reg_name_list"]
normal_reg_address_list = cfg["normal_reg_address_list"]

control_status_reg_list            = cfg["control_status_reg_list"]
control_status_reg_dram_address_list = cfg["control_status_reg_dram_address_list"]
control_status_reg_dram_ap_vld_list   = cfg["control_status_reg_dram_ap_vld_list"]

inst_bits = cfg["inst_bits"]

DRAM_array_name_in_use_list = list(mapping_table.keys())
selected_DRAM_array_name_in_use_list = []
selected_DRAM_array_name_list = []
selected_normal_reg_name_in_use_list = []
selected_normal_reg_name_list = []
selected_control_status_reg_in_use_list = []
selected_control_status_reg_list = []
for i in range (len(DRAM_array_name_in_use_list)):
    mapped_name = mapping_table[DRAM_array_name_in_use_list[i]][1]
    if mapped_name.startswith('dram_array_'):
        selected_DRAM_array_name_list.append(mapped_name)
        selected_DRAM_array_name_in_use_list.append(DRAM_array_name_in_use_list[i])
    elif mapped_name.startswith('dram_reg_'):
        if mapped_name not in control_status_reg_list:
            selected_normal_reg_name_list.append(mapped_name)
            selected_normal_reg_name_in_use_list.append(DRAM_array_name_in_use_list[i])
        else:
            selected_control_status_reg_list.append(mapped_name)
            selected_control_status_reg_in_use_list.append(DRAM_array_name_in_use_list[i])
    else:
        selected_control_status_reg_list.append(mapped_name)
        selected_control_status_reg_in_use_list.append(DRAM_array_name_in_use_list[i])
        
        
selected_DRAM_array_index_list = []
for i in range (len(selected_DRAM_array_name_list)):
    selected_index = DRAM_array_name_list.index(selected_DRAM_array_name_list[i])
    selected_DRAM_array_index_list.append(selected_index)
selected_normal_reg_index_list = []  
for i in range (len(selected_normal_reg_name_list)):
    selected_index = normal_reg_name_list.index(selected_normal_reg_name_list[i])
    selected_normal_reg_index_list.append(selected_index)
selected_control_status_reg_index_list = []
for i in range (len(selected_control_status_reg_list)):
    selected_index = selected_control_status_reg_list.index(selected_control_status_reg_list[i])
    selected_control_status_reg_index_list.append(selected_index)

selected_DRAM_array_direction = []  
for i in range (len(selected_DRAM_array_index_list)):
    selected_DRAM_array_direction.append(DRAM_array_direction[selected_DRAM_array_index_list[i]])
selected_DRAM_array_size = []
for i in range (len(selected_DRAM_array_index_list)):
    selected_DRAM_array_size.append(DRAM_array_size[selected_DRAM_array_index_list[i]])
selected_DRAM_array_address = []  
for i in range (len(selected_DRAM_array_index_list)):
    selected_DRAM_array_address.append(DRAM_array_address_list[selected_DRAM_array_index_list[i]])    
    
selected_normal_reg_address = []
for i in range (len(selected_normal_reg_index_list)):
    selected_normal_reg_address.append(normal_reg_address_list[selected_normal_reg_index_list[i]])
    
instruction_lists, indices = load_generated_instructions("./inst/")
inst_3d_final = reorg_instructions(instruction_lists, indices)


selected_inst_array_name_list = []
for i in range (len(DRAM_array_name_list)):
    DRAM_array_name = DRAM_array_name_list[i]
    if 'inst_array' in DRAM_array_name:
        selected_inst_array_name_list.append(DRAM_array_name)
        
selected_inst_array_index_list = []
for i in range (len(selected_inst_array_name_list)):
    selected_inst_array_index_list.append(DRAM_array_name_list.index(selected_inst_array_name_list[i]))

selected_inst_array_direction_list = []
selected_inst_array_size_list = []
selected_inst_array_address_list = []
for i in range (len(selected_inst_array_index_list)):
    array_direction = DRAM_array_direction[selected_inst_array_index_list[i]]
    #array_size = DRAM_array_size[selected_inst_array_index_list[i]]
    array_address = DRAM_array_address_list[selected_inst_array_index_list[i]]
    selected_inst_array_direction_list.append(array_direction)
    #selected_inst_array_size_list.append(array_size)
    selected_inst_array_address_list.append(array_address)

selected_inst_num_name_list = []
for i in range (len(normal_reg_name_list)):
    inst_num_name = normal_reg_name_list[i]
    if 'n_inst' in inst_num_name:
        selected_inst_num_name_list.append(inst_num_name)
selected_inst_num_index_list = []
for i in range (len(selected_inst_num_name_list)):
    selected_inst_num_index_list.append(normal_reg_name_list.index(selected_inst_num_name_list[i]))
selected_inst_num_address_list = []
for i in range (len(selected_inst_num_index_list)):
    inst_num_address = normal_reg_address_list[selected_inst_num_index_list[i]]
    selected_inst_num_address_list.append(inst_num_address)


ol = Overlay("./Potluck_bitstream.bit")
ol.ip_dict
hls_ip = ol.top_0 

buffers_float = generate_pynq_arrays(selected_DRAM_array_name_in_use_list, selected_DRAM_array_size, dtype = np.float32, suffix = 'float')
buffers_fixed = generate_pynq_arrays(selected_DRAM_array_name_in_use_list, selected_DRAM_array_size, dtype = 'u4', suffix = 'fixed')

#DRAM_array_path = f"./configuration_input_program_double_buffer_{program_index + 1}"
DRAM_array_path = f"./dram_array_{program_index + 1}"

load_input_buffers_from_txt(
    buffers_float=buffers_float,
    dram_names=selected_DRAM_array_name_in_use_list,
    directions=selected_DRAM_array_direction,
    data_dir=DRAM_array_path   # folder where input_array_*.txt live
)

convert_to_fixed(
    dram_names=selected_DRAM_array_name_in_use_list,
    buffers_float=buffers_float,
    buffers_fixed=buffers_fixed,
    directions=selected_DRAM_array_direction,
    width=width,
    iwidth=iwidth
)
write_registers_from_txt(
    hls_ip=hls_ip,
    reg_names=selected_normal_reg_name_in_use_list,
    reg_addresses=selected_normal_reg_address,
    data_dir=DRAM_array_path   # folder containing n.txt, m.txt, etc.
)
write_dram_addresses(
    hls_ip=hls_ip,
    buffers_fixed=buffers_fixed,
    names=selected_DRAM_array_name_in_use_list,
    addresses=selected_DRAM_array_address,
    directions=selected_DRAM_array_direction
)

current_instruction_list = inst_3d_final[program_index]

inst_bits = 256
inst_buffers = write_inst_buffers(
    hls_ip=hls_ip,
    names=selected_inst_array_name_list,
    addresses=selected_inst_array_address_list,
    inst_bits=inst_bits,
    inst_3d=current_instruction_list,
    verbose=True
)
n_summary = write_n_inst_from_current_list(
    hls_ip=hls_ip,
    reg_names=selected_inst_num_name_list,
    reg_addresses=selected_inst_num_address_list,
    inst_3d=current_instruction_list,
    verbose=True
)


hls_ip.write(0x00,1)
while (1):
    isready = hls_ip.read(0x00)
    if (isready != 1):
        break

DRAM_array_output_path = f"./configuration_output_program_{program_index + 1}"
buffers_output_float = convert_outputs_from_fixed(
    names=selected_DRAM_array_name_in_use_list,
    directions=selected_DRAM_array_direction,
    buffers_fixed=buffers_fixed,
    width=width,
    iwidth=iwidth,
)
save_output_buffers_to_txt(
    names=selected_DRAM_array_name_in_use_list,
    directions=selected_DRAM_array_direction,
    buffers_float=buffers_output_float,
    data_dir=DRAM_array_output_path
)

from pynq import MMIO
base = ol.ip_dict['axi_gpio_0']['parameters']['C_BASEADDR']
GPIO_BASE  = int(base, 16)
gpio_mmio = MMIO(GPIO_BASE, 0x10)
LOW_OFFSET  = 0x00
HIGH_OFFSET = 0x08

def read_cycle_count():
    lo   = gpio_mmio.read(LOW_OFFSET)
    hi   = gpio_mmio.read(HIGH_OFFSET)
    return (hi << 32) | lo
count = read_cycle_count()
print(f"Cycle count = {count} ap_clk cycles")

