import os
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import ModuleDef, Ioport
from pyverilog.vparser.ast import (
    Ioport, Decl, Input, Output, Width, IntConst
)
from jinja2 import Environment, FileSystemLoader
import json
import math
import re
from collections import defaultdict
import jinja2
import json
import argparse
import sys

def prepend_verilog_header(verilog_path: str, header_text: str) -> None:
    """
    Prepend `header_text` to the beginning of the Verilog file at `verilog_path`.
    This writes in-place using a temporary file to avoid data loss on failure.
    """
    # Create a temporary file in the same directory
    dir_name = os.path.dirname(verilog_path)
    fd, temp_path = tempfile.mkstemp(dir=dir_name, text=True)
    os.close(fd)

    try:
        # Write header + original contents into temp file
        with open(temp_path, 'w') as out_f:
            out_f.write(header_text.rstrip() + '\n\n')
            with open(verilog_path, 'r') as in_f:
                # Copy rest of the file
                for line in in_f:
                    out_f.write(line)
        # Replace original file with the temp file
        os.replace(temp_path, verilog_path)
    finally:
        # Cleanup temp if something went wrong
        if os.path.exists(temp_path):
            os.remove(temp_path)

def get_module_ports(ast, target_module_name):
    """
    Return a list of top-level port names for the given module.
    """
    port_names = []
    
    # The root of the AST is 'ast.description', which contains all definitions.
    for definition in ast.description.definitions:
        #print("the value of AST def name is:", definition.portlist)
        # Process only ModuleDef nodes.
        if isinstance(definition, ModuleDef) and definition.name == target_module_name:
            # definition.portlist.ports is a list of 'Port' objects.
            for port in definition.portlist.ports:
                # if isinstance(port, Ioport):
                #     # io.first is the Input/Output declaration node
                #     decl = port.first
                #     port_names.append(decl.name)
                # else:
                #     # fallback if you ever see a raw Port node here
                #     port_names.append(port.name)

                port_names.append(port.name)
    return port_names


def get_module_ports_s_axi(ast, target_module_name):
    """
    Return a list of top-level port names for the given module.
    """
    port_names = []
    
    # The root of the AST is 'ast.description', which contains all definitions.
    for definition in ast.description.definitions:
        #print("the value of AST def name is:", definition.portlist)
        # Process only ModuleDef nodes.
        if isinstance(definition, ModuleDef) and definition.name == target_module_name:
            # definition.portlist.ports is a list of 'Port' objects.
            for port in definition.portlist.ports:
                if isinstance(port, Ioport):
                    # io.first is the Input/Output declaration node
                    decl = port.first
                    port_names.append(decl.name)
                else:
                    # fallback if you ever see a raw Port node here
                    port_names.append(port.name)

                #port_names.append(port.name)
    return port_names

def get_buffer_names(ports):
    """
    Given a list of port names, returns a sorted list of unique buffer names.
    A buffer name is defined as any prefix preceding one of the suffixes:
    address0, ce0, q0, we0, or d0.
    """
    # Define the pattern: capture everything before an underscore that precedes one of the suffixes.
    pattern = re.compile(r'^(.*)_(address0|ce0|q0|we0|d0)$')
    buffer_names = set()
    
    for port in ports:
        match = pattern.match(port)
        if match:
            # Group 1 is the part before the underscore-suffix
            buffer_names.add(match.group(1))
    
    return sorted(buffer_names)

def get_width(node_width):
    """Given a Pyverilog Width node, return numeric width or 1 if not an IntConst."""
    if node_width is not None and isinstance(node_width, Width):
        msb, lsb = node_width.msb, node_width.lsb
        if isinstance(msb, IntConst) and isinstance(lsb, IntConst):
            msb_val = int(msb.value)
            lsb_val = int(lsb.value)
            return abs(msb_val - lsb_val) + 1
    # Default
    return 1

def check_and_store(signal_name, width_val, result_dict):
    """Check if signal_name ends with _address0, _q0, or _d0;
       then store in result_dict under [base_name][suffix]."""
    if signal_name.endswith("address0"):
        base_name = signal_name.rsplit("_address0", 1)[0]
        suffix    = "address0"
    elif signal_name.endswith("q0"):
        base_name = signal_name.rsplit("_q0", 1)[0]
        suffix    = "q0"
    elif signal_name.endswith("d0"):
        base_name = signal_name.rsplit("_d0", 1)[0]
        suffix    = "d0"
    else:
        return  # not one of the signals we care about
    
    result_dict[base_name][suffix] = width_val

def generate_instance_code(verilog_file, target_module_name, instance_name, template):
    """
    1. Parse the specified Verilog file to extract ports from 'target_module_name'.
    2. Render those ports with a Jinja2 template, using 'instance_name'.
    3. Return the generated instantiation code as a string.
    """
    # Parse the Verilog file.
    ast, _ = parse([verilog_file])
    ports = get_module_ports(ast, target_module_name)
    ap_signals = ['ap_start', 'ap_done', 'ap_idle', 'ap_ready']
    extracted_ap_signals = [signal for signal in ap_signals if signal in ports]
    BRAM_buffer_names = get_buffer_names(ports)
    module = ast.description.definitions[0]

    result_dict = defaultdict(dict)
    full_result_dict = {}

    for item in module.items:
        if isinstance(item, Ioport):
            # Modern, ANSI-style port
            port = item.first  # Input(...) or Output(...)
            if isinstance(port, (Input, Output)):
                sname = port.name
                width_val = get_width(port.width)
                full_result_dict[sname] = width_val
                check_and_store(sname, width_val, result_dict)

        elif isinstance(item, Decl):
            # Old-style port or other declarations
            for decl_obj in item.list:
                if isinstance(decl_obj, (Input, Output)):
                    sname = decl_obj.name
                    width_val = get_width(decl_obj.width)
                    full_result_dict[sname] = width_val
                    check_and_store(sname, width_val, result_dict)


    signals_to_be_excluded = ['ap_clk', 'ap_rst', 'ap_start', 'ap_done', 'ap_idle', 'ap_ready']
    final_dict = dict(result_dict)
    full_final_dict = {
    name: width
    for name, width in full_result_dict.items()
    if name not in signals_to_be_excluded
    }
    print("the value of tagrget module name is:", target_module_name)
    print("the value of full_final_dict is:", full_final_dict)
    # 1) collect every base name that has an _ap_vld companion
    ap_vld_bases = {k[:-7] for k in full_final_dict if k.endswith("_ap_vld")}

    # 2) build a new dict whose values are [old_value, flag]
    full_final_dict_annotated = {
        k: [v, 1 if (k.endswith("_ap_vld") or k in ap_vld_bases) else 0]
        for k, v in full_final_dict.items()
    }
    print("the value of full_final_dict_annotated is:", full_final_dict_annotated)
    # Render the template.
    output_str = template.render(
        top_func_name = target_module_name,  # e.g., "top_func_A"
        instance_name = instance_name,       # e.g., "grp_func_A_fu_130"
        port_list     = ports,                # list of ports from the module
        extracted_ap_signals = extracted_ap_signals,
        final_dict = full_final_dict_annotated
    )
    return output_str

def generate_instance_code_axi(verilog_file, target_module_name, instance_name, template):
    """
    1. Parse the Verilog file to extract ports from 'target_module_name'.
    2. Render the instantiation using the provided Jinja2 template.
    3. Return the generated instantiation code as a string.
    """
    # Parse the Verilog file.
    ast, _ = parse([verilog_file])
    ports = get_module_ports(ast, target_module_name)
    #print("the value of port is:", ports)
    ap_signals = ['ap_start', 'ap_done', 'ap_idle', 'ap_ready']
    extracted_ap_signals = [signal for signal in ap_signals if signal in ports]
    BRAM_buffer_names = get_buffer_names(ports)
    module = ast.description.definitions[0]

    result_dict = defaultdict(dict)
    full_result_dict = {}

    for item in module.items:
        if isinstance(item, Ioport):
            # Modern, ANSI-style port
            port = item.first  # Input(...) or Output(...)
            if isinstance(port, (Input, Output)):
                sname = port.name
                width_val = get_width(port.width)
                full_result_dict[sname] = width_val
                check_and_store(sname, width_val, result_dict)

        elif isinstance(item, Decl):
            # Old-style port or other declarations
            for decl_obj in item.list:
                if isinstance(decl_obj, (Input, Output)):
                    sname = decl_obj.name
                    width_val = get_width(decl_obj.width)
                    full_result_dict[sname] = width_val
                    check_and_store(sname, width_val, result_dict)


    signals_to_be_excluded = ['ap_clk', 'ap_rst', 'ap_start', 'ap_done', 'ap_idle', 'ap_ready']
    final_dict = dict(result_dict)
    full_final_dict = {
    name: width
    for name, width in full_result_dict.items()
    if name not in signals_to_be_excluded
    }
    filtered_final_dict = {k: v for k, v in full_final_dict.items() if "m_axi" not in k}
    special_signal_dict = {k: v for k, v in full_final_dict.items() if "WDATA" in k or "WSTRB" in k}
    with open(args.axi_interface_mapping_json, "r") as f:
        data = json.load(f)

    # 2) Extract the mappings dict
    mappings = data["mappings"]
    inverted_mapping = {}
    for port, funcs in mappings.items():
        for func in funcs:
            inverted_mapping.setdefault('top_' + func, []).append(port)
    interface_name = inverted_mapping[target_module_name][0]
    WDATA_width = next(
    v for k, v in special_signal_dict.items() 
    if k.endswith('WDATA')
    )
    WSTRB_width = next(
        v for k, v in special_signal_dict.items() 
        if k.endswith('WSTRB')
    )
    # Render the template (the template includes logic for suffix matching).
    output_str = template.render(
        top_func_name = target_module_name,
        instance_name = instance_name,
        interface_name = interface_name,
        WDATA_width = WDATA_width,
        data_width = WDATA_width,
        WSTRB_width = WSTRB_width,
        port_list     = ports,
        final_dict    = filtered_final_dict
    )
    return output_str


def generate_instance_code_s_axi(verilog_file, target_module_name, instance_name, template, target_ports, target_ports_original):

    ast, _ = parse([verilog_file])
    ports = get_module_ports_s_axi(ast, target_module_name)
    
    result_dict = defaultdict(dict)
    full_result_dict = {}
    widths = {}
    print("the value of target port is:", target_ports)
    print("the value of target port origin is:", target_ports_original)
    for d in ast.description.definitions:
        if isinstance(d, ModuleDef) and d.name == target_module_name:
            # ---- ANSI-style ports live here -----------------------------
            for p in d.portlist.ports:          # each p is an Ioport
                decl = p.first                  # Input/Output node
                if isinstance(decl, (Input, Output)):
                    name = decl.name
                    if name in target_ports:
                        idx = target_ports.index(name)
                        original_name = target_ports_original[idx]
                        widths[original_name] = get_width(decl.width)
            break                               # found the module
    return widths

def get_user_defined_ports(all_ports):
    """
    Return the list of ports that are not part of the fixed sets.
    These will be rendered in the template with .port(port).
    """
    # Combine all known fixed ports
    fixed = set(AXI_FIXED_PORTS + CONTROL_FIXED_PORTS + OTHER_FIXED_PORTS)
    
    # We'll also treat ap_clk and ap_rst_n_inv as special cases if they appear
    # but note that in your top-level code, "ap_clk" and "ap_rst_n_inv" 
    # are pinned down. So let's exclude them as well if needed:
    # For example, if you store them in the parse function as "ap_clk" 
    # and "ap_rst_n_inv" but we never want them to appear as "user-defined" 
    # because they're hard-coded in the template:
    fixed.update(["ap_clk", "ap_rst_n_inv"])

    # Return anything else from the port list
    return [p for p in all_ports if p not in fixed]


def compute_bit_width(n):
    """
    Compute the number of bits needed for the selection signal.
    Uses ceil(log2(n)) for n mappings. If n is exactly a power of 2,
    the bit width is incremented by one so that the highest code (2^bit_width - 1)
    is reserved for 'bx.
    """
    if n <= 0:
        return 1  # default to 1 bit if no mappings exist
    bits = math.ceil(math.log2(n))
    if 2 ** bits == n:
        bits += 1
    return bits

def extract_axi_name(module_name):
    name_no_prefix = re.sub(r'^top_', '', module_name)
    name_no_suffix = re.sub(r'_m_axi$', '', name_no_prefix)
    return name_no_suffix  # or .upper() if preferred

# def generate_top_interface_port(config_path, template_path, code_snippets):
#     CONFIG_PATH = config_path + "top_interface_port.json"

#     initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

#     with open(initialize_block_json_file_path, "r") as f:
#         initialize_block_json_file_path = json.load(f)

#     substitutions = initialize_block_json_file_path["substitutions"]


#     env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

#     # Load the template file.
#     template_2 = env.get_template(template_path + "top_interface_port.j2")

#     # template_2 = Template(template_str2)
#     rendered_verilog = template_2.render(substitutions)

#     #print("the value of rendered verilog is:", rendered_verilog)
#     code_snippets.append(rendered_verilog)

#     return code_snippets


def generate_top_interface_port_dram(config_path, template_path, code_snippets):
    CONFIG_PATH = config_path + "top_interface_port.json"
    
    NEW_NAME = "INPUT2"
    # 1) Load existing JSON
    with open(CONFIG_PATH, "r") as f:
        data = json.load(f)

    # 2) Safely get the list (in case "substitutions" or "axi_interfaces" is missing)
    interfaces = data.setdefault("substitutions", {}).setdefault("axi_interfaces", [])

    # 3) Only append if NEW_NAME isn’t already present
    if not any(item.get("name") == NEW_NAME for item in interfaces):
        interfaces.append({"name": NEW_NAME})
        # 4) Write the updated data back out
        with open(CONFIG_PATH, "w") as f:
            json.dump(data, f, indent=2)

    initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)

    substitutions = initialize_block_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "top_interface_port.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)

    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)

    return code_snippets


def generate_top_interface_port_dram_debug(config_path, template_path, code_snippets):
    CONFIG_PATH = config_path + "top_interface_port.json"
    
    NEW_NAME = "INPUT2"
    # 1) Load existing JSON
    with open(CONFIG_PATH, "r") as f:
        data = json.load(f)

    # 2) Safely get the list (in case "substitutions" or "axi_interfaces" is missing)
    interfaces = data.setdefault("substitutions", {}).setdefault("axi_interfaces", [])

    # 3) Only append if NEW_NAME isn’t already present
    if not any(item.get("name") == NEW_NAME for item in interfaces):
        interfaces.append({"name": NEW_NAME})
        # 4) Write the updated data back out
        with open(CONFIG_PATH, "w") as f:
            json.dump(data, f, indent=2)

    initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)

    substitutions = initialize_block_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "top_interface_port_debug.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)

    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)

    return code_snippets


# def generate_top_interface_port_debug(config_path, template_path, code_snippets):
#     CONFIG_PATH = config_path + "top_interface_port.json"

#     initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

#     with open(initialize_block_json_file_path, "r") as f:
#         initialize_block_json_file_path = json.load(f)

#     substitutions = initialize_block_json_file_path["substitutions"]


#     env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

#     # Load the template file.
#     template_2 = env.get_template(template_path + "top_interface_port_debug.j2")

#     # template_2 = Template(template_str2)
#     rendered_verilog = template_2.render(substitutions)

#     #print("the value of rendered verilog is:", rendered_verilog)
#     code_snippets.append(rendered_verilog)

#     return code_snippets



def generate_top_interface_stream_definition(config_path, template_path, code_snippets):
    CONFIG_PATH = config_path + "top_interface_stream_definition.json"

    initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)

    substitutions = initialize_block_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "top_interface_stream_definition.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)

    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)

    return code_snippets

def generate_top_interface_stream_definition_debug(config_path, template_path, code_snippets):
    CONFIG_PATH = config_path + "top_interface_stream_definition.json"

    initialize_block_json_file_path = os.path.join(script_dir, CONFIG_PATH)

    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)

    substitutions = initialize_block_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "top_interface_stream_definition_debug.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)

    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)

    return code_snippets


def generate_s_axi_control_module(config_path, template_path, code_snippets):
    with open(config_path + "s_axi_control_module.json", "r") as f:
        data = json.load(f)

    s_axi_control_signal_json_file_path = os.path.join(config_path + "s_axi_control_module.json")
    with open(s_axi_control_signal_json_file_path, "r") as f:
        s_axi_control_signal_json_file_path = json.load(f)   
    ctx = s_axi_control_signal_json_file_path["ctx"]
    signal_names = s_axi_control_signal_json_file_path["signal_names"]
    signal_names_original = s_axi_control_signal_json_file_path["signal_names_original"]
    signal_names_type = s_axi_control_signal_json_file_path["signal_names_type"]
    signal_rw = s_axi_control_signal_json_file_path["signal_rw"]

    verilog_file = './architecture_design_RTL/top_control_s_axi.v'
    target_module_name = 'top_control_s_axi'
    instance_name = 'control_s_axi_U'
    top_fixed_parameters = ["C_S_AXI_ADDR_WIDTH", "C_S_AXI_DATA_WIDTH"]
    env = Environment(loader=FileSystemLoader('.'))
    template = env.get_template(template_path + "s_axi_control_module.j2")
    width_dict = generate_instance_code_s_axi(verilog_file, target_module_name, instance_name, template, signal_names, signal_names_original)
    print("the value of width_dict is:", width_dict)
    
    width_dict_output = []
    width_dict_input = []
    for name, typ, rw in zip(signal_names_original, signal_names_type, signal_rw):
        w = width_dict.get(name)
        if w is None:
            # optionally handle missing names
            continue

        pair = (name, w)
        if typ == 1 and rw == "w":
            width_dict_input.append(pair)
        else:
            width_dict_output.append(pair)

    # for i in range (len(signal_names)):
    #     if signal_names_type[i] == 1 and signal_rw[i] == "w":
    #         width_dict_input.append(width_dict.items()[i]) 
    #     else:
    #         width_dict_output.append(width_dict.items()[i])   
    print("the value of width_dict is:")  
    print(width_dict_output) 
    print(width_dict_input)         
    user_defined_ports_temp = list(zip(signal_names, signal_names_original))
    print("the value of user_defined_ports_temp is:", user_defined_ports_temp)
    user_defined_ports_output = []
    user_defined_ports_input = []
    for i in range (len(user_defined_ports_temp)):
        if signal_names_type[i] == 1 and signal_rw[i] == "w":
            user_defined_ports_input.append(user_defined_ports_temp[i]) 
        else:
            user_defined_ports_output.append(user_defined_ports_temp[i])  
            
    # Render the template with your parameters
    rendered_verilog = template.render(
        user_parameters = top_fixed_parameters, 
        user_defined_ports_input=user_defined_ports_input,
        user_defined_ports_output=user_defined_ports_output,
        *ctx,
        width_dict_output=width_dict_output,
        width_dict_input=width_dict_input
    )
    code_snippets.append(rendered_verilog)
    return code_snippets


def generate_load_inst_stream_module(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "load_inst_module.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'), extensions=['jinja2.ext.loopcontrols'])

    # Load the template file.
    template_2 = env.get_template(template_path + "load_inst_module.j2")

    rendered_verilog = template_2.render(**modules_to_parse[0])
    
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_inst_fifo_module(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "load_inst_module.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'), extensions=['jinja2.ext.loopcontrols'])

    # Load the template file.
    template_2 = env.get_template(template_path + "inst_fifo_module.j2")

    rendered_verilog = template_2.render(**modules_to_parse[0])
    
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_load_inst_module(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "module_block_axi_new_input_inst.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'), extensions=['jinja2.ext.loopcontrols'])

    # Load the template file.
    template_2 = env.get_template(template_path + "module_block_axi_new_input_inst.j2")

    # Accumulate all generated instantiations.
    all_instances = ""
    for item in modules_to_parse:
        instance_code = generate_instance_code_axi(
            verilog_file       = item["verilog_file"],
            target_module_name = item["target_module_name"],
            instance_name      = item["instance_name"],
            template           = template_2
        )
        # Append each instance with a newline for separation.
        all_instances += instance_code
    
    code_snippets.append(all_instances)
    return code_snippets

def generate_axi_control_master_input_inst(config_path, template_path, code_snippets):
    with open(config_path + "axi_control_master_input_inst.json", "r") as jf:
        data = json.load(jf)
        contexts = data["contexts"]

    # 2) Setup Jinja2 environment
    template_dir = template_path  # adjust as needed
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(template_dir),
        trim_blocks=True,
        lstrip_blocks=True
    )
    env.globals['extract_axi_name'] = extract_axi_name
    template = env.get_template("axi_control_master_input_inst.j2")

    # 3) Render each context
    all_modules_code = []
    for ctx in contexts:
        rendered = template.render(**ctx)
        all_modules_code.append(rendered)

    # 4) Combine and write out
    combined_code = "\n".join(all_modules_code)
    code_snippets.append(combined_code)
    return code_snippets

def generate_axi_control_master_input_inst_assign_value(config_path, template_path, code_snippets):
    with open(config_path + "axi_control_master_input_inst.json", "r") as jf:
        data = json.load(jf)
        contexts = data["contexts"]

    # 2) Setup Jinja2 environment
    template_dir = template_path  # adjust as needed
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(template_dir),
        trim_blocks=True,
        lstrip_blocks=True
    )
    env.globals['extract_axi_name'] = extract_axi_name
    template = env.get_template("axi_control_master_input_inst_assign_value.j2")

    # 3) Render each context
    all_modules_code = []
    for ctx in contexts:
        rendered = template.render(**ctx)
        all_modules_code.append(rendered)

    # 4) Combine and write out
    combined_code = "\n".join(all_modules_code)
    code_snippets.append(combined_code)
    return code_snippets

def generate_BRAM_module_inst(config_path, template_path, code_snippets):
    BRAM_module_json_file_path = config_path + "BRAM_module_inst.json"

    with open(BRAM_module_json_file_path, "r") as f:
        BRAM_module_data = json.load(f)
        
    BRAM_modules = BRAM_module_data["BRAM_modules"]
    inst_fifo_module = BRAM_module_data["inst_fifo_module"]
    load_inst_modules = BRAM_module_data["load_inst_modules"]

    #script_dir = os.path.dirname(os.path.abspath(__file__))
    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_module_inst.j2")

    # Render the template with the modules data
    output = template.render(BRAM_modules=BRAM_modules, inst_fifo_module = inst_fifo_module, load_inst_modules = load_inst_modules)
    code_snippets.append(output)
    return code_snippets




def generate_initialize_block(config_path, template_path, code_snippets):
    initialize_block_json_file_path = os.path.join(config_path + "initialize_block.json")
    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)
    substitutions = initialize_block_json_file_path["substitutions"]
    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)
    # Load the template file.
    template_2 = env.get_template(template_path + "/initialize_block.j2")
    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)
    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_axi_control_master_input(config_path, template_path, code_snippets):
    with open(config_path + "axi_control_master_input.json", "r") as jf:
        data = json.load(jf)
        contexts = data["contexts"]

    # 2) Setup Jinja2 environment
    template_dir = template_path  # adjust as needed
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(template_dir),
        trim_blocks=True,
        lstrip_blocks=True
    )
    env.globals['extract_axi_name'] = extract_axi_name
    template = env.get_template("axi_control_master_input.j2")

    # 3) Render each context
    all_modules_code = []
    for ctx in contexts:
        rendered = template.render(**ctx)
        all_modules_code.append(rendered)

    # 4) Combine and write out
    combined_code = "\n".join(all_modules_code)
    code_snippets.append(combined_code)
    return code_snippets

# def generate_axi_control_master_input_assign_value(config_path, template_path, code_snippets):
#     with open(config_path + "axi_control_master_input.json", "r") as jf:
#         data = json.load(jf)
#         contexts = data["contexts"]

#     # 2) Setup Jinja2 environment
#     template_dir = template_path  # adjust as needed
#     env = jinja2.Environment(
#         loader=jinja2.FileSystemLoader(template_dir),
#         trim_blocks=True,
#         lstrip_blocks=True
#     )
#     env.globals['extract_axi_name'] = extract_axi_name
#     template = env.get_template("axi_control_master_input_assign_value.j2")

#     # 3) Render each context
#     all_modules_code = []
#     for ctx in contexts:
#         rendered = template.render(**ctx)
#         all_modules_code.append(rendered)

#     # 4) Combine and write out
#     combined_code = "\n".join(all_modules_code)
#     code_snippets.append(combined_code)
#     return code_snippets


def generate_axi_control_master_output(config_path, template_path, code_snippets):
    with open(config_path + "axi_control_master_output.json", "r") as jf:
        data = json.load(jf)
        contexts = data["contexts"]

    # 2) Setup Jinja2 environment
    template_dir = template_path  # adjust as needed
    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(template_dir),
        trim_blocks=True,
        lstrip_blocks=True
    )
    env.globals['extract_axi_name'] = extract_axi_name
    template = env.get_template("axi_control_master_output.j2")

    # 3) Render each context
    all_modules_code = []
    for ctx in contexts:
        rendered = template.render(**ctx)
        all_modules_code.append(rendered)

    # 4) Combine and write out
    combined_code = "\n".join(all_modules_code)
    code_snippets.append(combined_code)
    return code_snippets

# def generate_axi_control_master_output_assign_value(config_path, template_path, code_snippets):
#     with open(config_path + "axi_control_master_output.json", "r") as jf:
#         data = json.load(jf)
#         contexts = data["contexts"]

#     # 2) Setup Jinja2 environment
#     template_dir = template_path  # adjust as needed
#     env = jinja2.Environment(
#         loader=jinja2.FileSystemLoader(template_dir),
#         trim_blocks=True,
#         lstrip_blocks=True
#     )
#     env.globals['extract_axi_name'] = extract_axi_name
#     template = env.get_template("axi_control_master_output_assign_value.j2")

#     # 3) Render each context
#     all_modules_code = []
#     for ctx in contexts:
#         rendered = template.render(**ctx)
#         all_modules_code.append(rendered)

#     # 4) Combine and write out
#     combined_code = "\n".join(all_modules_code)
#     code_snippets.append(combined_code)
#     return code_snippets

def generate_module_block(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "module_block.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'))

    # Load the template file.
    template_2 = env.get_template(template_path + "module_block.j2")


    # Accumulate all generated instantiations.
    all_instances = ""
    for item in modules_to_parse:
        instance_code = generate_instance_code(
            verilog_file       = item["verilog_file"],
            target_module_name = item["target_module_name"],
            instance_name      = item["instance_name"],
            template           = template_2
        )
        # Append each instance with a newline for separation.
        all_instances += instance_code
    
    code_snippets.append(all_instances)
    return code_snippets

def generate_BRAM_module_1p(config_path, template_path, code_snippets):
    BRAM_module_json_file_path = config_path + 'BRAM_module_1p.json'
    if not os.path.isfile(BRAM_module_json_file_path):
        return code_snippets
    with open(BRAM_module_json_file_path, "r") as f:
        BRAM_module_data = json.load(f)  
    BRAM_modules = BRAM_module_data["BRAM_modules"]
    #script_dir = os.path.dirname(os.path.abspath(__file__))
    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_module_1p.j2")

    # Render the template with the modules data
    output = template.render(BRAM_modules=BRAM_modules)
    code_snippets.append(output)
    return code_snippets

def generate_BRAM_module_2p(config_path, template_path, code_snippets):
    BRAM_module_json_file_path = config_path + 'BRAM_module_2p.json'
    if not os.path.isfile(BRAM_module_json_file_path):
        return code_snippets
    with open(BRAM_module_json_file_path, "r") as f:
        BRAM_module_data = json.load(f)  
    BRAM_modules = BRAM_module_data["BRAM_modules"]
    #script_dir = os.path.dirname(os.path.abspath(__file__))
    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_module_2p.j2")

    # Render the template with the modules data
    output = template.render(BRAM_modules=BRAM_modules)
    code_snippets.append(output)
    return code_snippets

def generate_module_block_axi_input(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "module_block_axi_new_input.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'), extensions=['jinja2.ext.loopcontrols'])

    # Load the template file.
    template_2 = env.get_template(template_path + "module_block_axi_new_input.j2")


    # Accumulate all generated instantiations.
    all_instances = ""
    for item in modules_to_parse:
        instance_code = generate_instance_code_axi(
            verilog_file       = item["verilog_file"],
            target_module_name = item["target_module_name"],
            instance_name      = item["instance_name"],
            template           = template_2
        )
        # Append each instance with a newline for separation.
        all_instances += instance_code
    
    code_snippets.append(all_instances)
    return code_snippets


def generate_module_block_axi_output(config_path, template_path, code_snippets):
    module_block_json_file_path = os.path.join(config_path + "module_block_axi_new_output.json")

    with open(module_block_json_file_path, "r") as f:
        module_block_json_file_path = json.load(f)
        
    modules_to_parse = module_block_json_file_path["modules_to_parse"]

    env = Environment(loader=FileSystemLoader('.'), extensions=['jinja2.ext.loopcontrols'])

    # Load the template file.
    template_2 = env.get_template(template_path + "module_block_axi_new_output.j2")


    # Accumulate all generated instantiations.
    all_instances = ""
    for item in modules_to_parse:
        instance_code = generate_instance_code_axi(
            verilog_file       = item["verilog_file"],
            target_module_name = item["target_module_name"],
            instance_name      = item["instance_name"],
            template           = template_2
        )
        # Append each instance with a newline for separation.
        all_instances += instance_code
    
    code_snippets.append(all_instances)
    return code_snippets

def generate_initialize_block_inst(config_path, template_path, code_snippets):
    initialize_block_json_file_path = os.path.join(config_path + "initialize_block_inst.json")

    with open(initialize_block_json_file_path, "r") as f:
        initialize_block_json_file_path = json.load(f)

    substitutions = initialize_block_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "initialize_block_inst.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)

    #print("the value of rendered verilog is:", rendered_verilog)
    code_snippets.append(rendered_verilog)
    return code_snippets


def generate_BRAM_address_ce_inst(config_path, template_path, code_snippets):
    BRAM_address_ce_json_file_path = os.path.join(config_path + "BRAM_address_ce_inst.json")

    with open(BRAM_address_ce_json_file_path, "r") as f:
        BRAM_address_ce_data = json.load(f)

    buffers = BRAM_address_ce_data["buffers"]
    #print("the value of buffers is:", buffers)
    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_address_ce_inst.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
        return code_snippets
    

def generate_FU_q0_inst(config_path, template_path, code_snippets):
    FU_q0_json_file_path = os.path.join(config_path + "FU_q0_inst.json")
    if not os.path.isfile(FU_q0_json_file_path):
        return code_snippets
    with open(FU_q0_json_file_path, "r") as f:
        FU_q0_json_file_path = json.load(f)

    buffers = FU_q0_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "FU_q0_inst.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
        return code_snippets

def generate_FU_start_reg_inst_fifo(config_path, template_path, code_snippets):
    FU_start_json_file_path = os.path.join(config_path + "FU_start_reg_inst_fifo.json")

    with open(FU_start_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "FU_start_reg_inst_fifo.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(modules)
    code_snippets.append(rendered_verilog)
    return code_snippets

# def generate_FU_start_reg_inst(config_path, template_path, code_snippets):
#     FU_start_json_file_path = os.path.join(config_path + "FU_start_reg_inst.json")

#     with open(FU_start_json_file_path, "r") as f:
#         modules = json.load(f)

#     env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

#     # Load the template file.
#     template_2 = env.get_template(template_path + "FU_start_reg_inst.j2")

#     # template_2 = Template(template_str2)
#     rendered_verilog = template_2.render(modules)
#     code_snippets.append(rendered_verilog)
#     return code_snippets

def generate_FU_start_reg_inst(config_path, template_path, code_snippets):
    FU_start_json_file_path = os.path.join(config_path + "FU_start_reg_inst.json")

    with open(FU_start_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "FU_start_reg_inst.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(**modules)
    code_snippets.append(rendered_verilog)
    return code_snippets


def generate_FU_start_reg_inst_condition(config_path, template_path, code_snippets):
    """
    Renders FU_start_reg_inst from JSON + Jinja and appends to code_snippets.

    Args:
        config_path   : directory containing FU_start_reg_inst.json OR full file path
        template_path : directory containing FU_start_reg_inst.j2 OR full file path
        code_snippets : list[str] to append rendered code into

    Returns:
        list[str]: updated code_snippets
    """
    # Resolve config file
    cfg_file = os.path.join(config_path + "FU_start_reg_inst_condition.json")
    with open(cfg_file, "r") as f:
        modules = json.load(f)

    # Pull fields
    load_inst_instance_name = modules["load_inst_instance_name"]
    initial_state = modules["initial_state"]
    condition_regs = modules.get("condition_regs", [])

    # Build the OR chain like: icmp_ln365_ap_vld == 1'b1 || icmp_ln406_ap_vld == 1'b1 || ...
    any_ap_vld = " || ".join(f"{r}_ap_vld == 1'b1" for r in condition_regs)

    env = Environment(
        loader=FileSystemLoader('.'),
        trim_blocks=True,
        lstrip_blocks=True
    )
    template_2 = env.get_template(template_path + "FU_start_reg_inst_condition.j2")

    rendered_verilog = template_2.render(
        load_inst_instance_name=load_inst_instance_name,
        initial_state=initial_state,
        condition_regs=condition_regs,
        any_ap_vld=any_ap_vld
    )

    code_snippets.append(rendered_verilog)
    return code_snippets


def generate_FU_start_status_reg_inst(config_path, template_path, code_snippets):
    FU_start_json_file_path = os.path.join(config_path + "FU_start_reg_inst.json")

    with open(FU_start_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "FU_start_status_reg_inst.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(modules)
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_BRAM_we_d0_inst(config_path, template_path, code_snippets):
    BRAM_we_json_file_path = os.path.join(config_path + "BRAM_we_d0_inst.json")

    with open(BRAM_we_json_file_path, "r") as f:
        BRAM_we_json_file_path = json.load(f)

    buffers = BRAM_we_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_we_d0_inst.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_AXI_interface_reg_inst(config_path, template_path, code_snippets):
    AXI_reg_json_file_path = os.path.join(config_path + "AXI_interface_reg_inst.json")

    with open(AXI_reg_json_file_path, "r") as f:
        AXI_reg_data = json.load(f)

    buffers = AXI_reg_data["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "AXI_interface_reg_inst.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        
        # Optionally, add a comment header to separate each buffer's code.
        code_snippets.append(rendered_verilog)
    return code_snippets

def _numeric_pairs(cond_index_map: dict):
    """
    Build: { reg: [ {sel:'<str>', idx:<int>}, ... ] } sorted by numeric sel if possible.
    """
    out = {}
    for reg, m in cond_index_map.items():
        items = list(m.items())
        try:
            items.sort(key=lambda kv: int(kv[0]))
        except ValueError:
            items.sort(key=lambda kv: kv[0])
        out[reg] = [{"sel": str(sel), "idx": int(idx)} for sel, idx in items]
    return out


def generate_AXI_interface_reg_inst_condition(
    config_dir: str,                 # directory containing AXI_interface_reg_inst.json
    template_path: str,              # full path to AXI_interface_reg_inst.j2
    code_snippets: list,
):
    # Load buffers config
    with open(os.path.join(config_dir, "AXI_interface_reg_inst.json"), "r") as f:
        AXI_reg_data = json.load(f)
    buffers = AXI_reg_data["buffers"]
    with open(os.path.join(config_dir, "AXI_interface_reg_inst_condition.json"), "r") as f:
        obj = json.load(f)
        
    cond_index_map = obj["cond_index_map"]
    cond_index_pairs = _numeric_pairs(cond_index_map)

    # Jinja
    env = Environment(
        loader=FileSystemLoader("."),
        extensions=['jinja2.ext.loopcontrols']
    )
    template = env.get_template(template_path + "AXI_interface_reg_inst_condition.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"])
        ctx = dict(buffer)
        ctx["bit_width"] = compute_bit_width(num_cases)
        ctx["cond_index_pairs"] = cond_index_pairs  # ← used by template

        rendered_verilog = template.render(ctx)
        code_snippets.append(rendered_verilog)

    return code_snippets




def generate_BRAM_address_ce_1p(config_path, template_path, code_snippets):
    BRAM_address_ce_json_file_path = os.path.join(config_path + "BRAM_address_ce_1p.json")
    if not os.path.isfile(BRAM_address_ce_json_file_path):
        return code_snippets
    with open(BRAM_address_ce_json_file_path, "r") as f:
        BRAM_address_ce_data = json.load(f)

    buffers = BRAM_address_ce_data["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_address_ce_1p.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets


def generate_BRAM_address_ce_2p(config_path, template_path, code_snippets):
    BRAM_address_ce_json_file_path = os.path.join(config_path + "BRAM_address_ce_2p.json")
    if not os.path.isfile(BRAM_address_ce_json_file_path):
        return code_snippets
    with open(BRAM_address_ce_json_file_path, "r") as f:
        BRAM_address_ce_data = json.load(f)

    buffers = BRAM_address_ce_data["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_address_ce_2p.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_AXI_interface_input(config_path, template_path, code_snippets):
    json_path     = config_path + "AXI_interface_input.json"
    template_path = template_path + "AXI_interface_input.j2"

    # Load buffer configurations directly
    with open(json_path, 'r') as f:
        data = json.load(f)
    buffers = data.get("buffers", [])

    # Set up Jinja2 environment
    template_dir = os.path.dirname(os.path.abspath(template_path))
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template(os.path.basename(template_path))

    # Render each buffer
    all_verilog_snippets = []
    for buf in buffers:
        num_cases = len(buf.get("case_mappings", []))
        buf["bit_width"] = compute_bit_width(num_cases)

        rendered = template.render(buf)
        code_snippets.append(rendered)
    return code_snippets

def generate_AXI_interface_input_inst(config_path, template_path, code_snippets):
    json_path     = config_path + "AXI_interface_input_inst.json"
    template_path = template_path + "AXI_interface_input_inst.j2"

    # Load buffer configurations directly
    with open(json_path, 'r') as f:
        data = json.load(f)
    buffers = data.get("buffers", [])

    # Set up Jinja2 environment
    template_dir = os.path.dirname(os.path.abspath(template_path))
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template(os.path.basename(template_path))

    # Render each buffer
    all_verilog_snippets = []
    for buf in buffers:
        num_cases = len(buf.get("case_mappings", []))
        buf["bit_width"] = compute_bit_width(num_cases)

        rendered = template.render(buf)
        code_snippets.append(rendered)
    return code_snippets

def generate_AXI_interface_output(config_path, template_path, code_snippets):
    json_path     = config_path + "AXI_interface_output.json"
    template_path = template_path + "AXI_interface_output.j2"

    # Load buffer configurations directly
    with open(json_path, 'r') as f:
        data = json.load(f)
    buffers = data.get("buffers", [])

    # Set up Jinja2 environment
    template_dir = os.path.dirname(os.path.abspath(template_path))
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template(os.path.basename(template_path))

    # Render each buffer
    all_verilog_snippets = []
    for buf in buffers:
        num_cases = len(buf.get("case_mappings", []))
        buf["bit_width"] = compute_bit_width(num_cases)

        rendered = template.render(buf)
        code_snippets.append(rendered)
    return code_snippets

def generate_BRAM_we_d0_1p(config_path, template_path, code_snippets):
    BRAM_we_json_file_path = os.path.join(config_path + "BRAM_we_d0_1p.json")
    if not os.path.isfile(BRAM_we_json_file_path):
        return code_snippets
    with open(BRAM_we_json_file_path, "r") as f:
        BRAM_we_json_file_path = json.load(f)

    buffers = BRAM_we_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_we_d0_1p.j2")

    for buffer in buffers:
        
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets


def generate_BRAM_we_d0_2p(config_path, template_path, code_snippets):
    BRAM_we_json_file_path = os.path.join(config_path + "BRAM_we_d0_2p.json")
    if not os.path.isfile(BRAM_we_json_file_path):
        return code_snippets
    with open(BRAM_we_json_file_path, "r") as f:
        BRAM_we_json_file_path = json.load(f)

    buffers = BRAM_we_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_we_d0_2p.j2")

    for buffer in buffers:
        
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_FU_q0(config_path, template_path, code_snippets):
    FU_q0_json_file_path = os.path.join(config_path + "BRAM_q0.json")

    with open(FU_q0_json_file_path, "r") as f:
        FU_q0_json_file_path = json.load(f)

    buffers = FU_q0_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_q0.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_FU_q1(config_path, template_path, code_snippets):
    FU_q0_json_file_path = os.path.join(config_path + "BRAM_q1.json")

    with open(FU_q0_json_file_path, "r") as f:
        FU_q0_json_file_path = json.load(f)

    buffers = FU_q0_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_q1.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_FU_q1(config_path, template_path, code_snippets):
    FU_q0_json_file_path = os.path.join(config_path + "BRAM_q1.json")
    if not os.path.isfile(FU_q0_json_file_path):
        return code_snippets
    with open(FU_q0_json_file_path, "r") as f:
        FU_q0_json_file_path = json.load(f)

    buffers = FU_q0_json_file_path["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "BRAM_q1.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        
        # Render the template with the current buffer's configuration.
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets


def generate_FU_start_reg(config_path, template_path, code_snippets):
    FU_start_json_file_path = os.path.join(config_path + "FU_start_reg.json")

    with open(FU_start_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "FU_start_reg.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(modules)
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_ap_done_trigger(config_path, template_path, code_snippets):
    ap_done_trigger_json_file_path = os.path.join(config_path + "ap_done_trigger.json")

    with open(ap_done_trigger_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "ap_done_trigger.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(modules)
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_AXI_reg(config_path, template_path, code_snippets):
    AXI_reg_json_file_path = os.path.join(config_path + "AXI_interface_reg.json")

    with open(AXI_reg_json_file_path, "r") as f:
        AXI_reg_data = json.load(f)

    buffers = AXI_reg_data["buffers"]

    env = Environment(loader=FileSystemLoader(script_dir), extensions=['jinja2.ext.loopcontrols'])
    template = env.get_template(template_path + "AXI_interface_reg.j2")

    for buffer in buffers:
        num_cases = len(buffer["case_mappings"]) 
        buffer["bit_width"] = compute_bit_width(num_cases)
        rendered_verilog = template.render(buffer)
        code_snippets.append(rendered_verilog)
    return code_snippets

def generate_flexible_FSM(config_path, template_path, code_snippets):
    FSM_json_file_path = os.path.join(config_path + "flexible_fsm_state_transit_logic.json")

    with open(FSM_json_file_path, "r") as f:
        FSM_json_file_path = json.load(f)

    substitutions = FSM_json_file_path["substitutions"]


    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "flexible_fsm_state_transit_logic.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(substitutions)
    code_snippets.append(rendered_verilog)

    return code_snippets

def generate_FU_start_status_reg(config_path, template_path, code_snippets):
    FU_start_json_file_path = os.path.join(config_path + "FU_start_reg.json")

    with open(FU_start_json_file_path, "r") as f:
        modules = json.load(f)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template file.
    template_2 = env.get_template(template_path + "FU_start_status_reg.j2")

    # template_2 = Template(template_str2)
    rendered_verilog = template_2.render(modules)
    code_snippets.append(rendered_verilog)
    return code_snippets

def generate_condition_reg(config_path, template_path, code_snippets):
    condition_reg_file_path = os.path.join(config_path + "condition_reg.json")
    with open(condition_reg_file_path, "r") as f:
        conditions = json.load(f)

    # 2) Set up Jinja2 to load template.j2 from the current directory
    env = Environment(
        loader=FileSystemLoader("."),  
        trim_blocks=True,
        lstrip_blocks=True
    )
    template = env.get_template(template_path + "condition_reg.j2")

    # 3) Render!
    rtl_code = template.render(conditions=conditions)
    code_snippets.append(rtl_code)
    
    return code_snippets
    
def generate_condition_reg_definition(config_path, template_path, code_snippets):
    """
    Generates Verilog register definitions from a JSON config and Jinja template.

    Parameters
    ----------
    config_path : str or Path
        Path to the JSON file containing {"regs": [...]}
    template_path : str or Path
        Path to the Jinja2 template file (e.g., regs.j2)
    code_snippets : list
        List of code strings to append to

    Returns
    -------
    list
        Updated list of code snippets
    """
    # Load register names from JSON
    full_config_path = os.path.join(config_path + "condition_reg_definition.json")
    with open(full_config_path, "r", encoding="utf-8") as f:
        config = json.load(f)
    if isinstance(config, dict) and "regs" in config:
        regs = config["regs"]
    elif isinstance(config, list):
        regs = config
    else:
        raise ValueError(f"Invalid JSON format in {config_path}")

    # Load Jinja template
    env = Environment(
        loader=FileSystemLoader("."),  
        trim_blocks=True,
        lstrip_blocks=True
    )
    tmpl = env.get_template(template_path + "condition_reg_definition.j2")

    # Render Verilog code
    rendered_code = tmpl.render(regs=regs)

    # Append to code snippets
    code_snippets.append(rendered_code)
    return code_snippets


code_snippets = []
script_dir = os.path.dirname(os.path.abspath(__file__))
code_snippets.append("`timescale 1 ns / 1 ps")
code_snippets.append("\n")
#config_path = "./configuration_final/"
config_path = "./configuration_final_generate/"
template_path = "./template_library_final/"
#inst_config_path = "./configuration_inst/"
inst_config_path = "./inst_configuration_final_generate/"
inst_template_path = "./template_library_inst/"
final_RTL_path = "./architecture_design_RTL/"


# 1) Load data_width from JSON
with open(inst_config_path + 'inst_load_inst.json', 'r') as f:
    cfg = json.load(f)
data_width = cfg['data_width']

# 2) Compute bit_width = log2(data_width)
bit_width = int(math.log2(data_width))

inst_num_bit_width = cfg['inst_num_bit_width']

# 3) Set up Jinja environment
#    - Assume your template lives in ./templates/top_load_inst.v.j2
env = Environment(
    loader=FileSystemLoader(script_dir),
    trim_blocks=True,
    lstrip_blocks=True
)
template = env.get_template(inst_template_path + 'load_inst_dram.j2')

# 4) Render the template
rendered = template.render(
    data_width=data_width,
    bit_width=bit_width,
    inst_num_bit_width = inst_num_bit_width
)

output_path = final_RTL_path + 'top_load_inst.v'
with open(output_path, 'w') as out:
    out.write(rendered)


env = Environment(
    loader=FileSystemLoader(script_dir),
    trim_blocks=True,
    lstrip_blocks=True
)
template = env.get_template(inst_template_path + 'load_inst_dram_pipeline.j2')

# 4) Render the template
rendered = template.render(
    data_width=data_width,
    bit_width=bit_width,
    inst_num_bit_width = inst_num_bit_width
)

output_path = final_RTL_path + 'top_load_inst_pipeline.v'
with open(output_path, 'w') as out:
    out.write(rendered)


header = """module inst_fifo_w32_d5_S
#(parameter
    MEM_STYLE   = "shiftReg",
    DATA_WIDTH  = 64,
    ADDR_WIDTH  = 3,
    DEPTH       = 5)
(
    // system signal
    input  wire                  clk,
    input  wire                  reset,

    // write
    output wire                  if_full_n,
    input  wire                  if_write_ce,
    input  wire                  if_write,
    input  wire [DATA_WIDTH-1:0] if_din,
    
    // read 
    output wire [ADDR_WIDTH:0]   if_num_data_valid, // for FRP
    output wire [ADDR_WIDTH:0]   if_fifo_cap,       // for FRP
    output wire                  if_empty_n,
    input  wire                  if_read_ce,
    input  wire                  if_read,
    output wire [DATA_WIDTH-1:0] if_dout
);
//------------------------Parameter----------------------

//------------------------Local signal-------------------
    wire [ADDR_WIDTH-1:0]     addr;
    wire                      push;
    wire                      pop;
    reg signed [ADDR_WIDTH:0] mOutPtr;
    reg                       empty_n = 1'b0;
    reg                       full_n  = 1'b1;
    // with almost full?  no 
    // has output register?  no 
//------------------------Instantiation------------------
    top_fifo_w32_d5_S_ShiftReg 
    #(  .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (ADDR_WIDTH),
        .DEPTH      (DEPTH))
    U_top_fifo_w32_d5_S_ShiftReg (
        .clk        (clk),
        .reset      (reset),
        .we         (push),
        .addr       (addr),
        .din        (if_din),
        .dout       (if_dout)
    );
//------------------------Task and function--------------

//------------------------Body---------------------------
    // has num_data_valid ? 
    assign if_num_data_valid = mOutPtr + 1'b1; // yes
    assign if_fifo_cap = DEPTH; // yes  

    // has almost full ? 
    assign if_full_n  = full_n; //no 
    assign push       = full_n & if_write_ce & if_write;

    // has output register? 
    assign if_empty_n = empty_n;  // no
    assign pop        = empty_n & if_read_ce & if_read; // no 

    assign addr       = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0] : {ADDR_WIDTH{1'b0}};

    // mOutPtr
    always @(posedge clk) begin
        if (reset == 1'b1)
            mOutPtr <= {ADDR_WIDTH+1{1'b1}};
        else if (push & ~pop)
            mOutPtr <= mOutPtr + 1'b1;
        else if (~push & pop)
            mOutPtr <= mOutPtr - 1'b1;
    end

    // full_n
    always @(posedge clk) begin
        if (reset == 1'b1)
            full_n <= 1'b1;
        else if (push & ~pop) begin
            if (mOutPtr == DEPTH - 2)
                full_n <= 1'b0;
        end
        else if (~push & pop)
            full_n <= 1'b1;
    end

    // almost_full_n 

    // empty_n
    always @(posedge clk) begin
        if (reset == 1'b1)
            empty_n <= 1'b0;
        else if (push & ~pop)
            empty_n <= 1'b1;
        else if (~push & pop) begin
            if (mOutPtr == 0)
                empty_n <= 1'b0;
        end
    end
 
    // num_data_valid 

    // dout_vld 

endmodule  


module top_fifo_w32_d5_S_ShiftReg
#(parameter
    DATA_WIDTH  = 64,
    ADDR_WIDTH  = 3,
    DEPTH       = 5)
(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  we,
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [DATA_WIDTH-1:0] din,
    //output register? 
    output wire [DATA_WIDTH-1:0] dout // no 
);

    reg [DATA_WIDTH-1:0] SRL_SIG [0:DEPTH-1];
    integer i;

    always @ (posedge clk) begin
        if (we) begin
            for (i=0; i<DEPTH-1; i=i+1)
                SRL_SIG[i+1] <= SRL_SIG[i];
            SRL_SIG[0] <= din;
        end
    end

    //read from SRL, output register? 
    assign dout = SRL_SIG[addr];// no 

endmodule

"""

parser = argparse.ArgumentParser(
    description="Generate top‐level modules with optional debug output"
)
parser.add_argument(
    "--debug",
    action="store_true",
    default=False,         # explicit default
    help="enable debug mode (default: False)"
)
parser.add_argument(
    "--axi-interface-mapping-json",
    required=True,
    help="Path to the JSON file containing AXI interface mappings"
)

# parse right here
args = parser.parse_args()

code_snippets.append(header)

if args.debug:
    code_snippets = generate_top_interface_port_dram_debug(config_path, template_path, code_snippets)
    #code_snippets = generate_top_interface_stream_definition_debug(config_path, template_path, code_snippets)
else:
    code_snippets = generate_top_interface_port_dram(config_path, template_path, code_snippets)
    #code_snippets = generate_top_interface_stream_definition(config_path, template_path, code_snippets)

with open(config_path + "condition_reg_definition.json", "r") as f:
    data = json.load(f)
    condition_regs = data["regs"]
if (len(condition_regs) > 0):
    code_snippets = generate_condition_reg_definition(config_path, template_path, code_snippets)

code_snippets = generate_s_axi_control_module(config_path, template_path, code_snippets)
#code_snippets = generate_load_inst_stream_module(inst_config_path, inst_template_path, code_snippets)
code_snippets = generate_axi_control_master_input_inst(inst_config_path, inst_template_path, code_snippets)
code_snippets = generate_load_inst_module(inst_config_path, inst_template_path, code_snippets)
code_snippets = generate_axi_control_master_input_inst_assign_value(inst_config_path, inst_template_path, code_snippets)
#code_snippets = generate_BRAM_module_inst(inst_config_path, inst_template_path, code_snippets)
code_snippets = generate_inst_fifo_module(inst_config_path, inst_template_path, code_snippets)

code_snippets = generate_axi_control_master_input(config_path, template_path, code_snippets)
code_snippets = generate_axi_control_master_output(config_path, template_path, code_snippets)


code_snippets = generate_BRAM_module_1p(config_path, template_path, code_snippets)
code_snippets = generate_BRAM_module_2p(config_path, template_path, code_snippets)
code_snippets = generate_module_block(config_path, template_path, code_snippets)
code_snippets = generate_module_block_axi_input(config_path, template_path, code_snippets)
code_snippets = generate_module_block_axi_output(config_path, template_path, code_snippets)

#code_snippets = generate_axi_control_master_input_assign_value(config_path, template_path, code_snippets)
#code_snippets = generate_axi_control_master_output_assign_value(config_path, template_path, code_snippets)

code_snippets = generate_initialize_block(config_path, template_path, code_snippets)
code_snippets = generate_initialize_block_inst(inst_config_path, inst_template_path, code_snippets)
#code_snippets = generate_FU_start_reg_inst_fifo(inst_config_path, inst_template_path, code_snippets)
if (len(condition_regs) > 0):
    code_snippets = generate_FU_start_reg_inst_condition(inst_config_path, inst_template_path, code_snippets)
else:
    code_snippets = generate_FU_start_reg_inst(inst_config_path, inst_template_path, code_snippets)
code_snippets = generate_AXI_interface_input_inst(inst_config_path, inst_template_path, code_snippets)
#code_snippets = generate_BRAM_address_ce_inst(inst_config_path, inst_template_path, code_snippets)
#code_snippets = generate_FU_q0_inst(inst_config_path, inst_template_path, code_snippets)
#code_snippets = generate_BRAM_we_d0_inst(inst_config_path, inst_template_path, code_snippets)
if (len(condition_regs) > 0):
    code_snippets = generate_AXI_interface_reg_inst_condition(inst_config_path, inst_template_path, code_snippets)
else:
    code_snippets = generate_AXI_interface_reg_inst(inst_config_path, inst_template_path, code_snippets)

code_snippets = generate_FU_start_reg(config_path, template_path, code_snippets)
code_snippets = generate_AXI_interface_input(config_path, template_path, code_snippets)
code_snippets = generate_AXI_interface_output(config_path, template_path, code_snippets)
code_snippets = generate_BRAM_address_ce_1p(config_path, template_path, code_snippets)
code_snippets = generate_BRAM_address_ce_2p(config_path, template_path, code_snippets)
code_snippets = generate_BRAM_we_d0_1p(config_path, template_path, code_snippets)
code_snippets = generate_BRAM_we_d0_2p(config_path, template_path, code_snippets)
code_snippets = generate_FU_q0(config_path, template_path, code_snippets)
code_snippets = generate_FU_q1(config_path, template_path, code_snippets)
code_snippets = generate_AXI_reg(config_path, template_path, code_snippets)
code_snippets = generate_ap_done_trigger(config_path, template_path, code_snippets)
code_snippets = generate_flexible_FSM(config_path, template_path, code_snippets)
code_snippets = generate_FU_start_status_reg(config_path, template_path, code_snippets)

code_snippets = generate_condition_reg(config_path, template_path, code_snippets)
#code_snippets = generate_FU_start_status_reg_inst(inst_config_path, inst_template_path, code_snippets)

debug_output = """assign dbg_ap_start = ap_start;
assign dbg_ap_done = ap_done;
"""
if args.debug:
    code_snippets.append(debug_output)

code_snippets.append("\n")
code_snippets.append("endmodule")
combined_output = "\n".join(code_snippets)
output_filename = './architecture_design_RTL/top.v'
with open(output_filename, 'w') as v_file:
    v_file.write(combined_output)

print(f"Output has been appended to {output_filename}.")
