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
from __future__ import annotations
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

ol = Overlay("./streaming_unroll_4_baseline_1.bit")
ol.ip_dict
hls_ip = ol.top_0 

SEQ_LEN = 8
HIDDEN_DIM = 128

dram_input =  np.loadtxt("./dram_array_1/DRAM_input.txt")
dram_weight_one = np.loadtxt("./dram_array_1/DRAM_weight_one.txt")
dram_weight_two = np.loadtxt("./dram_array_1/DRAM_weight_two.txt")


dram_input_buf = pynq.allocate(shape=(SEQ_LEN * HIDDEN_DIM), dtype='u4')
dram_weight_one_buf = pynq.allocate(shape=(HIDDEN_DIM * HIDDEN_DIM), dtype='u4')
dram_weight_two_buf = pynq.allocate(shape=(HIDDEN_DIM * HIDDEN_DIM), dtype='u4')
dram_output_buf = pynq.allocate(shape=(SEQ_LEN * HIDDEN_DIM), dtype='u4')

to_fixed_point(dram_input_buf,dram_input, width = 32, iwidth = 10)
to_fixed_point(dram_weight_one_buf,dram_weight_one, width = 32, iwidth = 10)
to_fixed_point(dram_weight_two_buf,dram_weight_two, width = 32, iwidth = 10)

hls_ip.write(0x10, dram_input_buf.physical_address)
hls_ip.write(0x1c, dram_weight_one_buf.physical_address)
hls_ip.write(0x28, dram_weight_two_buf.physical_address)
hls_ip.write(0x34, dram_output_buf.physical_address)

hls_ip.write(0x00,1)
while (1):
    isready = hls_ip.read(0x00)
    if (isready != 1):
        break

rom pynq import MMIO
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
