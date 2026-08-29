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

with open('./configuration_top_control_s_axi/top_control_s_axi_config.json', 'r') as f:
    cfg = json.load(f)

C_S_AXI_ADDR_WIDTH = cfg["C_S_AXI_ADDR_WIDTH"]
C_S_AXI_DATA_WIDTH = cfg["C_S_AXI_DATA_WIDTH"]
ADDR_BITS           = cfg["ADDR_BITS"]
user_regs       = cfg["user_regs"]

print("the value of user_regs are:")
print(user_regs)
user_regs_output_list = []
user_regs_input_list = []
for i in range (len(user_regs)):
    reg_type = user_regs[i]['type']
    reg_rw_info = user_regs[i]['rw_info']
    if reg_type == 'reg' and reg_rw_info == 'w':
        user_regs_input_list.append(user_regs[i]) 
    else:
        user_regs_output_list.append(user_regs[i])
           
code_snippets = []
code_snippets.append("`timescale 1 ns / 1 ps")
# 1) configure Jinja
env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

template = env.get_template('./top_control_s_axi_template/top_interface.j2')

rendered = template.render(
    C_S_AXI_ADDR_WIDTH=C_S_AXI_ADDR_WIDTH,
    C_S_AXI_DATA_WIDTH=C_S_AXI_DATA_WIDTH,
    user_defined_ports_output=user_regs_output_list,
    user_defined_ports_input=user_regs_input_list
)
code_snippets.append(rendered)

addr_width = C_S_AXI_ADDR_WIDTH
for r in user_regs:
    
    b = int(r['base'], 16) if isinstance(r['base'], str) else r['base']
    # DATA_0
    r['base_literal'] = f"{addr_width}'h{b:02x}"
    # only arrays get DATA_1 = base + 4
    if r['type']=='array':
        r['data1_literal'] = f"{addr_width}'h{(b+4):02x}"
        ctrl_offset = 8
    else:
        ctrl_offset = 4
    # CTRL = base + offset
    r['ctrl_literal'] = f"{addr_width}'h{(b+ctrl_offset):02x}"

# 3) set up Jinja
env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

tmpl = env.get_template('./top_control_s_axi_template/signal_def.j2')

# 4) render and write out
output = tmpl.render(
    C_S_AXI_ADDR_WIDTH = C_S_AXI_ADDR_WIDTH,
    user_defined_ports_output=user_regs_output_list,
    user_defined_ports_input=user_regs_input_list,
    ADDR_BITS=ADDR_BITS,
)
code_snippets.append(output)

env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

# 2) load the template
template = env.get_template('./top_control_s_axi_template/axi_write_fsm.j2')

# 3) render (pass variables here if you need any)
rendered_verilog = template.render()

code_snippets.append(rendered_verilog)

env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)
template = env.get_template('./top_control_s_axi_template/axi_read_fsm.j2')

rendered = template.render(user_defined_ports_output=user_regs_output_list, user_defined_ports_input=user_regs_input_list)
code_snippets.append(rendered)

env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)
tpl = env.get_template('./top_control_s_axi_template/register_logic.j2')
out = tpl.render(user_defined_ports_output=user_regs_output_list, user_defined_ports_input=user_regs_input_list)
code_snippets.append(out)

code_snippets.append("\n")
code_snippets.append("endmodule")
combined_output = "\n".join(code_snippets)
output_filename = './architecture_design_RTL/top_control_s_axi.v'
with open(output_filename, 'w') as v_file:
    v_file.write(combined_output)