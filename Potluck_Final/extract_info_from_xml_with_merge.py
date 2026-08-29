import xml.etree.ElementTree as ET
from pprint import pprint
import re
from collections import OrderedDict
from collections import defaultdict
import json
from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast import InstanceList
from pyverilog.vparser.ast import ModuleDef
from pyverilog.vparser.ast import Instance, PortArg, IntConst
from itertools import chain
from pyverilog.vparser.parser import parse, ParseError
from typing import List, Dict
import os
import shutil
import argparse
import sys
from pyverilog.vparser.ast import ModuleDef, Decl, Input, Output, Inout
from typing import List, Any
from itertools import product
from collections import deque
from collections.abc import Iterable
import pickle
import pprint
from copy import deepcopy
from pathlib import Path
from typing import List, Set, Optional
from itertools import zip_longest

# Define the Node class for our linked list
class ListNode:
    def __init__(self, val):
        self.val = val  # value will store the node label (from/to value)
        self.next = None    # pointer to the next node

    def __repr__(self):
        return f"ListNode({self.val})"
class SegmentNode:
    """
    head      – ListNode chain representing a linear segment
    children  – list[SegmentNode] for each outgoing branch
    cond      – (literal_name, literal_val) required to reach this node
                from its parent, or None for the root / linear prefixes
    """
    def __init__(self, head, cond=None):
        self.head     = head
        self.children = []
        self.cond     = cond          # (name, val) pair or None

    def __repr__(self):
        tag = f", cond={self.cond}" if self.cond else ""
        return f"SegmentNode({self.head}{tag})"
# Function to build the linked list based on the transitions and an external condition.
# def build_linked_list(transitions, external_condition):
#     if not transitions:
#         return None

#     # Initialize the linked list with the "from" value of the first transition.
#     head = ListNode(transitions[0]["from"])
#     current = head

#     # Loop through each transition in the list.
#     for t in transitions:
#         # If there is a literal condition in the transition, check against the external condition.
#         if t["literal_name"] is not None:
#             # If the external condition matches the literal value, break the link.
#             if external_condition == t["literal_val"]:
#                 current.next = None
#                 return head
#             # Otherwise, continue linking normally.
        
#         # Normal linking: create a new node for the "to" field and link it.
#         new_node = ListNode(t["to"])
#         current.next = new_node
#         current = new_node

#     # The last node automatically points to None.
#     return head

# def build_linked_list(transitions, branch_condition_mapping):
#     from collections import defaultdict

#     # Build a quick lookup: from_state -> list of outgoing transitions
#     adj = defaultdict(list)
#     for t in transitions:
#         adj[t["from"]].append(t)

#     def _build(start_state):
#         # Start a fresh linear segment
#         head = ListNode(start_state)
#         curr = head
#         state = start_state

#         while True:
#             # Check for any branching transitions out of `state`
#             branches = [
#                 t for t in adj.get(state, [])
#                 if t["literal_name"] in branch_condition_mapping
#             ]
#             if branches:
#                 # We split here.  The segment (head→…→curr) ends at `state`,
#                 # and we now create one subtree per possible literal_val.
#                 branch_name = branches[0]["literal_name"]
#                 subtree_list = []
#                 for val in branch_condition_mapping[branch_name]:
#                     # find the transition corresponding to this value
#                     t_val = next((b for b in branches if b["literal_val"] == val), None)
#                     if t_val:
#                         subtree_list.append(_build(t_val["to"]))
#                 return [head, subtree_list]

#             # Otherwise follow the single "normal" transition (literal_name is None)
#             normal = [t for t in adj.get(state, []) if t["literal_name"] is None]
#             if not normal:
#                 # no more edges → end of this path
#                 return head

#             # assume at most one normal outgoing edge
#             t_next = normal[0]
#             nxt = ListNode(t_next["to"])
#             curr.next = nxt
#             curr = nxt
#             state = t_next["to"]

#     # Kick off from the very first "from" in your transitions list
#     return _build(transitions[0]["from"])

# def build_linked_list(transitions, branch_condition_mapping):
#     from collections import defaultdict

#     # adjacency: from_state -> list of transitions
#     adj = defaultdict(list)
#     for t in transitions:
#         adj[t["from"]].append(t)

#     def _build(state):
#         # start a new linear segment
#         head = ListNode(state)
#         curr = head

#         while True:
#             # any branching transitions out of `state`?
#             branches = [
#                 t for t in adj[state]
#                 if t["literal_name"] in branch_condition_mapping
#             ]
#             if branches:
#                 # split here: segment ends at `state`
#                 branch_name = branches[0]["literal_name"]
#                 trees = []
#                 for val in branch_condition_mapping[branch_name]:
#                     t_val = next((b for b in branches if b["literal_val"] == val), None)
#                     if t_val:
#                         # recurse on its "to" state
#                         trees.append(_build(t_val["to"]))
#                 return [head, trees]

#             # otherwise follow the single “normal” edge (literal_name is None)
#             normals = [t for t in adj[state] if t["literal_name"] is None]
#             if not normals:
#                 # dead end → return the final linear list
#                 return head

#             t_next = normals[0]
#             nxt = ListNode(t_next["to"])
#             curr.next = nxt
#             curr = nxt
#             state = t_next["to"]

#     # kick off from the first "from" in your transitions
#     return _build(transitions[0]["from"])

def parse_xml_safe(path):
    """
    Try a normal ET.parse; on failure, escape any < or > inside
    attribute values and re-parse from string.
    """
    try:
        return ET.parse(path)
    except ET.ParseError:
        with open(path, 'r', encoding='utf-8') as f:
            text = f.read()
        # This pattern finds any attr="value" where value contains < or >
        pattern = re.compile(r'(?P<name>\w+)="(?P<value>[^"]*[<>][^"]*)"')
        # Escape only the < and > inside those attribute values
        clean = pattern.sub(
            lambda m: f'{m.group("name")}="{m.group("value").replace("<","&lt;").replace(">","&gt;")}"',
            text
        )
        # Now build a tree from the cleaned text
        return ET.ElementTree(ET.fromstring(clean))


def print_linked_list(head):
    current = head
    counter = 0
    while current:
        print(current.value, end=" -> ")
        if (current.value == '10'):
            counter = counter + 1
        if (counter > 2):
           external_condition = '1' 
        current = current.next
    print("None")

def parse_state_list(tree):
    """
    Parse a Vivado‐HLS schedule XML (or similar) into a nested Python list.

    Each node record now has the shape:
        [node_id, bw, op_bw_list, cdata, ssdm_name, literal_name, literal_val]

    * literal_name / literal_val come from the first
      <literal name="…" val="…"/> found under
      <condition><or_exp><and_exp>…</and_exp></or_exp></condition>.
      If no literal is present they are both set to "NULL".
    """
    root = tree.getroot()
    states_list = []

    for state in root.findall('.//state'):
        state_id = state.attrib.get('id')
        st_id    = state.attrib.get('st_id')
        node_list = []

        for op in state.findall('operation'):
            node_elem = op.find('Node')
            if node_elem is None:
                continue

            # ------------------------------------------------------------
            #  Basic attributes
            # ------------------------------------------------------------
            node_id = node_elem.attrib.get('id')
            bw      = node_elem.attrib.get('bw')

            # collect op_<n>_bw in numeric order
            op_bw_pairs = []
            for k, v in node_elem.attrib.items():
                m = re.fullmatch(r'op_(\d+)_bw', k)
                if m:
                    op_bw_pairs.append((int(m.group(1)), v))
            op_bw_pairs.sort(key=lambda x: x[0])
            op_bw_list = [v for _, v in op_bw_pairs]

            # cdata (strip lines, keep commas tight)
            if node_elem.text:
                node_cdata = "".join(node_elem.text.strip().splitlines())
            else:
                node_cdata = ""

            # ssdm name
            ssdm_elem  = op.find('StgValue/ssdm')
            ssdm_name  = ssdm_elem.attrib.get('name') if ssdm_elem is not None else ""

            # ------------------------------------------------------------
            #  Branch-literal (may be absent)
            # ------------------------------------------------------------
            literal_name = literal_val = "NULL"
            cond_elem = op.find('condition')
            if cond_elem is not None:
                lit_elem = cond_elem.find('.//literal')
                if lit_elem is not None:
                    literal_name = lit_elem.attrib.get('name', 'NULL')
                    literal_val  = lit_elem.attrib.get('val',  'NULL')

            # ------------------------------------------------------------
            #  Assemble node record
            # ------------------------------------------------------------
            node_record = [
                node_id,          # 0
                bw,               # 1
                op_bw_list,       # 2
                node_cdata,       # 3
                ssdm_name,        # 4
                literal_name,     # 5
                literal_val       # 6
            ]
            node_list.append(node_record)

        # state record: [state_id, st_id, [nodes…]]
        states_list.append([state_id, st_id, node_list])

    return states_list


# def parse_state_list(tree):
#     #root = ET.fromstring(xml_str)
#     root = tree.getroot()
#     states_list = []  # final multi-dimensional list

#     # Iterate over each <state> element
#     for state in root.findall('.//state'):
        
#         state_id = state.attrib.get('id')
#         st_id = state.attrib.get('st_id')
#         node_list = []  # collect nodes for the current state

#         # For each <operation> under the state, process the Node
#         for op in state.findall('operation'):
#             node_elem = op.find('Node')
#             if node_elem is None:
#                 continue

#             # Extract the 'id' and 'bw' attributes from Node
#             node_id = node_elem.attrib.get('id')
#             bw = node_elem.attrib.get('bw')

#             # Collect all op attributes that match the pattern op_<number>_bw
#             op_list = []
#             pattern = re.compile(r'op_(\d+)_bw')
#             op_attrs = []
#             for key, value in node_elem.attrib.items():
#                 match = pattern.fullmatch(key)
#                 if match:
#                     index = int(match.group(1))
#                     op_attrs.append((index, value))
#             op_attrs.sort(key=lambda x: x[0])
#             op_list = [value for index, value in op_attrs]

#             # Get the Node's CDATA text.
#             # We join the splitlines without adding extra space so that if a line ends with a comma,
#             # it is directly concatenated with the next line.
#             if node_elem.text:
#                 node_text = node_elem.text.strip()
#                 node_cdata = "".join(node_text.splitlines())
#             else:
#                 node_cdata = ''

#             # Get the ssdm name from <StgValue>/<ssdm>
#             ssdm_elem = op.find('StgValue/ssdm')
#             ssdm_name = ssdm_elem.attrib.get('name') if ssdm_elem is not None else ''

#             # Create the node record: [node_id, bw, [op_list], node_cdata, ssdm_name]
#             node_record = [node_id, bw, op_list, node_cdata, ssdm_name]
#             node_list.append(node_record)

#         # Build the state record: [state_id, st_id, [node1_list, node2_list, ...]]
#         state_record = [state_id, st_id, node_list]
#         states_list.append(state_record)

#     return states_list

def extract_instruction_info(states_list):
    """From the parsed states_list, extract information from the node_cdata of each node.
    For each node, extract:
      - Function call name: the word following '@' (e.g. "load")
      - Operand names: extract op names from each argument. We use a regex pattern for type-operand pairs (like "i32 %INPUT_r").
    The result is a multi-dim list: one entry per state:
      [ [node1_info_list, node2_info_list, ...], ... ]
    where each node_info_list is:
      [func_call_name, op_name_1, op_name_2, ... ]
    """
    # Prepare the final structure: a list per state
    final_info = []
    final_condition_info = []
    # Regex pattern to extract the function call name after '@'
    func_pattern = re.compile(r'@(\w+)')
    # Regex pattern to find type and operand pairs. We assume LLVM IR types (e.g. i32, i64)
    operand_pattern = re.compile(r'\b(i\d+)\s+%(\w+)')
    
    # Iterate over each state record in states_list
    for state in states_list:
        # state record structure: [state_id, st_id, [node_list...]]
        nodes = state[2]
        state_info = []  # list to hold node info for this state
        state_condition_info = []
        for node in nodes:
            # node record structure: [node_id, bw, op_list, node_cdata, ssdm_name]
            node_cdata = node[3]
            
            # Extract function call name: search for pattern "@(\w+)"
            func_match = func_pattern.search(node_cdata)
            func_call_name = func_match.group(1) if func_match else ''
            
            # Extract operand names using type-operand pattern.
            # This will extract all occurrences like "i32 %INPUT_r" and capture "INPUT_r".
            op_names = operand_pattern.findall(node_cdata)
            # Each match is a tuple (type, operand_name); we only want the operand_name.
            op_names = [operand for typ, operand in op_names]
            
            # Optionally, to avoid including the lhs temp register (e.g. call_ln161) if present at the beginning,
            # we can remove the first occurrence if it appears before the '=' character.
            # For simplicity, here we assume that the first operand from the call arguments is the first one after the '@' function name.
            # In the given example, the first type-operand pair corresponds to the first argument.
            
            # Build the node info list as required
            node_info = [func_call_name] + op_names
            state_info.append(node_info)
            
            node_condition_reg_name = node[5]
            node_condition_reg_value = node[6]
            state_condition_info.append((node_condition_reg_name, node_condition_reg_value))
        
        final_info.append(state_info)
        final_condition_info.append(state_condition_info)
    
    return final_info, final_condition_info

def filter_final_info(info, condition_info):
    """
    Given a multi-dim list of states info (each state is a list of node info lists),
    remove node info lists that:
      - are empty or have an empty first element, and
      - whose first element starts with '_ssdm_op'.
    
    Args:
       info (list): The final_info structure.
       
    Returns:
       list: The filtered multi-dimensional list.
    """
    filtered_info = []
    filtered_info_condition = []
    for i in range (len(info)):
        state = info[i]
        state_condition = condition_info[i]
        filtered_state = []
        filtered_state_condition = []
        
        for j in range (len(state)):
            node = state[j]
            node_condition = state_condition[j]
            if not node or not node[0]:
                continue
            
            first_elem = node[0]
            # skip if it starts with '_ssdm_op'
            if first_elem.startswith('_ssdm_op'):
                continue

            # otherwise keep it
            filtered_state.append(node)
            filtered_state_condition.append(node_condition)
        filtered_info.append(filtered_state)
        filtered_info_condition.append(filtered_state_condition)
            
    
    # for state in info:
    #     filtered_state = []
    #     # Expanded from: [node for node in state 
    #     #                 if node and node[0] 
    #     #                 and not node[0].startswith('_ssdm_op')]
    #     for node in state:
    #         # skip if the node list is empty or the first element is falsy
    #         if not node or not node[0]:
    #             continue

    #         first_elem = node[0]
    #         # skip if it starts with '_ssdm_op'
    #         if first_elem.startswith('_ssdm_op'):
    #             continue

    #         # otherwise keep it
    #         filtered_state.append(node)

    #     filtered_info.append(filtered_state)
    return filtered_info, filtered_info_condition

# def filter_final_info(info):
#     """
#     Given a multi-dim list of states info (each state is a list of node info lists),
#     remove node info lists that:
#       - are empty or have an empty first element, and
#       - whose first element starts with '_ssdm_op'.
    
#     Args:
#        info (list): The final_info structure.
       
#     Returns:
#        list: The filtered multi-dimensional list.
#     """
#     filtered_info = []
#     for state in info:
#         # Filter each node list in the current state
#         filtered_state = [node for node in state 
#                           if node and node[0] and not node[0].startswith('_ssdm_op')]
#         filtered_info.append(filtered_state)
#     return filtered_info


def get_in_out_direction(final_info, HLS_project_solution_path):
    function_call_in_out_info_list = []
    for i in range (len(final_info)): # iterate through the number of states
        temp_info_list = []
        for j in range (len(final_info[i])): # iterate through the number of nodes
            function_call = final_info[i][j][0]
            #print("the value of path is:", HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')
            #tree = ET.parse(HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')  # replace with your actual XML filename
            xml_file = HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml'
            tree = parse_xml_safe(xml_file)
            root = tree.getroot()
            temp_temp_info_list = []
            for port in root.findall('.//port'):
                port_id = port.get('id')
                port_name = port.get('name')
                port_dir = port.get('dir')
                
                core_elem = port.find('core')
                core_val = core_elem.text if core_elem is not None else 'NULL'
                
                stg_elem = port.find('StgValue/ssdm')
                stg_name = stg_elem.get('name') if stg_elem is not None else 'NULL'

                #print([port_id, port_name, port_dir, core_val, stg_name])
                temp_temp_info_list.append([port_id, port_name, port_dir, core_val, stg_name])
            temp_info_list.append(temp_temp_info_list)
        function_call_in_out_info_list.append(temp_info_list)
    return function_call_in_out_info_list

def get_func_call_port_name(function_call, access_index, func_call_name, func_call_program_index, HLS_project_solution_path_program_list):
    index = func_call_name.index('top_' + function_call)
    HLS_project_solution_path = HLS_project_solution_path_program_list[int(func_call_program_index[int(index)])]
    #tree = ET.parse(HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')  # replace with your actual XML filename
    xml_file = HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml'
    tree = parse_xml_safe(xml_file)
    root = tree.getroot()
    port_name_list = []
    for port in root.findall('.//port'):
        port_name = port.get('name')
        port_name_list.append(port_name)

    return port_name_list[access_index]

def get_func_call_port_name_condition_reg(function_call, access_index, func_call_program_index, HLS_project_solution_path_program_list):
    HLS_project_solution_path = HLS_project_solution_path_program_list[func_call_program_index]
    #tree = ET.parse(HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')  # replace with your actual XML filename
    xml_file = HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml'
    tree = parse_xml_safe(xml_file)
    root = tree.getroot()
    port_name_list = []
    for port in root.findall('.//port'):
        port_name = port.get('name')
        port_name_list.append(port_name)

    return port_name_list[access_index]

def get_func_call_bram_port_name(function_call, func_call_program_index, HLS_project_solution_path_program_list):
    HLS_project_solution_path = HLS_project_solution_path_program_list[int(func_call_program_index)]
    #tree = ET.parse(HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')  # replace with your actual XML filename
    xml_file = HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml'
    tree = parse_xml_safe(xml_file)
    root = tree.getroot()
    port_name_list = []
    for port in root.findall('.//port'):
        port_name = port.get('name')
        #print("the value of port name is:", port_name)
        core = port.find('core')
        if core is not None and core.text == 'RAM':
            port_name_list.append(port_name)
    return port_name_list


def build_instance_map(verilog_files):
    """
    Parse the given Verilog files one time, and return a dict mapping
    each module_type → list of its instance names.
    """
    ast, _ = parse(verilog_files)
    inst_map = defaultdict(list)

    def recurse(node):
        if isinstance(node, InstanceList):
            # node.module is the module type being instantiated
            for inst in node.instances:
                inst_map[node.module].append(inst.name)
        for child in node.children():
            recurse(child)

    recurse(ast)
    return inst_map

def build_axi_mapping(info_list, prefix="axi_dram"):
    """
    Given a list of rows like
      [id, access, src_name, src_type, src_bitwidth,
       src_size_or_depth, hw_name, hw_bitwidth]
    return a dict mapping src_name -> 
      "{access}_{src_type}_{src_bitwidth}_{src_size_or_depth}_{hw_name}_{hw_bitwidth}_{prefix}_{idx}"
    incrementing idx per unique base.
    """
    counts = {}       # keeps track of how many times we've seen each base
    name_mapping = {} # final mapping src_name -> new_name

    for row in info_list:
        # unpack
        _, access, src_name, src_type, bitwidth, size_depth, hw_name, hw_bitwidth = row

        # build the “base” prefix
        base = f"{access}_{src_type}_{bitwidth}_{size_depth}_{hw_name}_{hw_bitwidth}"
        
        # bump the counter for this base
        counts[base] = counts.get(base, 0) + 1
        idx = counts[base]

        # build the full new name
        new_name = f"{base}_{prefix}_{idx}"
        
        # record it
        name_mapping[src_name] = new_name

    return name_mapping

def build_axi_reg_mapping(info_list, prefix="axi_dram"):
    """
    Given a list of rows like
      [id, access, src_name, src_type, src_bitwidth,
       src_size_or_depth, hw_name, hw_bitwidth]
    return a dict mapping src_name -> 
      "{access}_{src_type}_{src_bitwidth}_{src_size_or_depth}_{hw_name}_{hw_bitwidth}_{prefix}_{idx}"
    incrementing idx per unique base.
    """
    counts = {}       # keeps track of how many times we've seen each base
    name_mapping = {} # final mapping src_name -> new_name
    
    # helper to replace special chars and collapse multiple "_"
    def sanitize(s):
        # replace anything not 0-9, a-z, A-Z with "_"
        t = re.sub(r'[^0-9A-Za-z]+', '_', s)
        # collapse multiple underscores, strip leading/trailing "_"
        t = re.sub(r'_+', '_', t).strip('_')
        return t

    for row in info_list:
        # unpack
        _, access, src_name, src_type, bitwidth, size_depth, hw_name, hw_bitwidth = row
        safe_src_type  = sanitize(src_type)
        # build the “base” prefix
        base = f"{access}_{safe_src_type}_{bitwidth}_{size_depth}_{hw_name}_{hw_bitwidth}"
        
        # bump the counter for this base
        counts[base] = counts.get(base, 0) + 1
        idx = counts[base]

        # build the full new name
        new_name = f"{base}_{prefix}_{idx}_read_reg"
        
        # record it
        name_mapping[src_name + '_read_reg'] = new_name

    return name_mapping

def create_axi_reg_mapping(port_list, prefix="axi_dram"):
    """
    Build a mapping from each port name in port_list to a sequential
    AXI DRAM interface name.

    Args:
        port_list (list of str): List of original port names.
        prefix (str):      Base name for the AXI interfaces.

    Returns:
        dict: A dictionary mapping each port name to prefix_1, prefix_2, …
    """
    if not isinstance(port_list, list):
        raise TypeError(f"Expected list, got {type(port_list).__name__}")
    mapping = {}
    for idx, port_name in enumerate(port_list, start=1):
        if not isinstance(port_name, str):
            raise ValueError(f"Port name at index {idx-1} is not a string: {port_name!r}")
        mapping[port_name] = f"{prefix}_{idx}_read"
    return mapping

def parse_axi_interface_info(xml_path):
    """
    Parse the given XML file and return a list of:
      [id, access_type, src_name, src_type,
       src_bitwidth, src_size_or_depth,
       hw_name (for hw_usage="data"),
       hw_bitwidth (for hw_usage="data")]
    """
    tree = ET.parse(xml_path)
    root = tree.getroot()
    kernel = root.find('kernel')
    args    = kernel.find('args')

    rows = []
    for arg in args.findall('arg'):
        # grab the arg attributes
        arg_id     = arg.get('id')
        access     = arg.get('access_type')
        src_name   = arg.get('src_name')
        src_type   = arg.get('src_type')
        bitwidth   = arg.get('src_bitwidth')
        size_depth = arg.get('src_size_or_depth')

        # find the <hw> element whose hw_usage="data"
        hw_data = next(
            (hw for hw in arg.findall('hw') if hw.get('hw_usage') == 'data'),
            None
        )
        if hw_data is None:
            # skip args without a data interface
            continue

        hw_name     = hw_data.get('hw_name')
        hw_bitwidth = hw_data.get('hw_bitwidth')

        rows.append([
            arg_id,
            access,
            src_name,
            src_type,
            bitwidth,
            size_depth,
            hw_name,
            hw_bitwidth
        ])

    return rows

def get_related_ops(fsm_info_list, buffer_name):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_full = []
    related_cycle = []
    related_pos    = []

    related_input = []
    related_full_input = []
    related_cycle_input = []
    related_pos_input    = []

    related_output = []
    related_full_output = []
    related_cycle_output = []
    related_pos_output    = []
    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            if len(op) >= 5:
                input_list = op[1]
                output_list = op[2]
                input_bram  = op[3]
                output_bram = op[4]
                all_list = op[9]
                if buffer_name in input_bram or buffer_name in output_bram:
                    related_full.append(op[0])
                    related_cycle.append(cycle)
                    if op[0] not in related:
                        related.append(op[0])
                    related_pos.append(all_list.index(buffer_name))

                if buffer_name in input_bram:
                    related_full_input.append(op[0])
                    related_cycle_input.append(cycle)
                    if op[0] not in related_input:
                        related_input.append(op[0])
                    related_pos_input.append(all_list.index(buffer_name))

                if buffer_name in output_bram:
                    related_full_output.append(op[0])
                    related_cycle_output.append(cycle)
                    if op[0] not in related_output:
                        related_output.append(op[0])
                    related_pos_output.append(all_list.index(buffer_name))
    #print("the value of related_full_input is:", related_full_input)
    return related, related_full, related_cycle, related_input, related_full_input, related_cycle_input, related_output, related_full_output, related_cycle_output, related_pos, related_pos_input, related_pos_output



def get_related_ops_condition(fsm_info_list, buffer_name, branch_condition_mapping_choices):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_full = []
    related_cycle = []
    related_pos    = []

    related_input = []
    related_full_input = []
    related_cycle_input = []
    related_pos_input    = []

    related_output = []
    related_full_output = []
    related_cycle_output = []
    related_pos_output    = []
    
    #print("the value of branch_condition_mapping_choices.keys() is:", branch_condition_mapping_choices)
    #print("the value of branch_condition_mapping_choices.values() is:", branch_condition_mapping_choices)
    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            if len(op) >= 5:
                input_list = op[1]
                output_list = op[2]
                input_bram  = op[3]
                output_bram = op[4]
                all_list = op[9]
                branch_condition = op[11]
                #print("the value of first match:", branch_condition == branch_condition_mapping_choices)
                if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
                    if buffer_name in input_bram or buffer_name in output_bram:
                        related_full.append(op[0])
                        related_cycle.append(cycle)
                        if op[0] not in related:
                            related.append(op[0])
                        related_pos.append(all_list.index(buffer_name))
                elif branch_condition in branch_condition_mapping_choices:
                    if buffer_name in input_bram or buffer_name in output_bram:
                        related_full.append(op[0])
                        related_cycle.append(cycle)
                        if op[0] not in related:
                            related.append(op[0])
                        related_pos.append(all_list.index(buffer_name))    

                if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
                    if buffer_name in input_bram:
                        related_full_input.append(op[0])
                        related_cycle_input.append(cycle)
                        if op[0] not in related_input:
                            related_input.append(op[0])
                        related_pos_input.append(all_list.index(buffer_name))
                elif branch_condition in branch_condition_mapping_choices:
                    if buffer_name in input_bram:
                        related_full_input.append(op[0])
                        related_cycle_input.append(cycle)
                        if op[0] not in related_input:
                            related_input.append(op[0])
                        related_pos_input.append(all_list.index(buffer_name))

                if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':                
                    if buffer_name in output_bram:
                        related_full_output.append(op[0])
                        related_cycle_output.append(cycle)
                        if op[0] not in related_output:
                            related_output.append(op[0])
                        related_pos_output.append(all_list.index(buffer_name))
                elif branch_condition in branch_condition_mapping_choices:
                    if buffer_name in output_bram:
                        related_full_output.append(op[0])
                        related_cycle_output.append(cycle)
                        if op[0] not in related_output:
                            related_output.append(op[0])
                        related_pos_output.append(all_list.index(buffer_name))
    #print("the value of related_full_input is:", related_full_input)
    return related, related_full, related_cycle, related_input, related_full_input, related_cycle_input, related_output, related_full_output, related_cycle_output, related_pos, related_pos_input, related_pos_output



def get_related_ops_interface_condition(fsm_info_list, interface_name, branch_condition_mapping_choices):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_full = []
    related_cycle = []
    related_pos    = []

    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            if len(op) >= 5:
                input_list = op[1]
                output_list = op[2]
                interface_list = op[10]
                all_list = op[9]
                branch_condition = op[11]
                if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
                    if interface_name in interface_list:
                        related_full.append(op[0])
                        related_cycle.append(cycle)
                        if op[0] not in related:
                            related.append(op[0])
                        related_pos.append(all_list.index(interface_name))
                elif branch_condition in branch_condition_mapping_choices:
                    if interface_name in interface_list:
                        related_full.append(op[0])
                        related_cycle.append(cycle)
                        if op[0] not in related:
                            related.append(op[0])
                        related_pos.append(all_list.index(interface_name))
    return related, related_full, related_cycle, related_pos


def get_related_ops_interface(fsm_info_list, interface_name):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_full = []
    related_cycle = []
    related_pos    = []

    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            if len(op) >= 5:
                input_list = op[1]
                output_list = op[2]
                interface_list = op[10]
                all_list = op[9]
                if interface_name in interface_list:
                    related_full.append(op[0])
                    related_cycle.append(cycle)
                    if op[0] not in related:
                        related.append(op[0])
                    related_pos.append(all_list.index(interface_name))
    return related, related_full, related_cycle, related_pos


def find_upstream_match(start_node: str,
                        xml_file_path: Path,
                        all_list: List[str],
                        depth: int = 2,
                        visited: Optional[Set[str]] = None) -> Optional[str]:
    """
    Walk ≤ `depth` hops upstream from *start_node* and return
    the first node also present in *all_list*.

    Depth rules:
        depth = 0 → only test *start_node*
        depth = 1 → test *start_node* + its direct sources
        depth = 2 → also test “sources of sources”   (default)
    """
    if visited is None:
        visited = set()

    if start_node in visited:          # avoid cycles
        return None
    visited.add(start_node)

    if start_node in all_list:         # hit
        return start_node

    if depth == 0:                     # search budget used up
        return None

    # recurse one hop up
    for src in get_condition_reg_source_nodes(xml_file_path, start_node):
        match = find_upstream_match(src,
                                    xml_file_path,
                                    all_list,
                                    depth - 1,
                                    visited)
        if match is not None:
            return match
    return None

def get_related_ops_condition_reg(fsm_info_list, condition_reg_name, xml_file_path):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_full = []
    related_cycle = []
    related_pos    = []

    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            if len(op) >= 5:
                input_list = op[1]
                output_list = op[2]
                interface_list = op[10]
                all_list = op[9]
                match = find_upstream_match(condition_reg_name, xml_file_path, all_list)
                if match is not None:                      # we found a valid upstream node
                    related_full.append(op[0])
                    related_cycle.append(cycle)
                    related_pos.append(all_list.index(match))
                # if condition_reg_name in all_list:
                #     related_full.append(op[0])
                #     related_cycle.append(cycle)
                #     related_pos.append(all_list.index(condition_reg_name))
                # else:
                #     condition_reg_source_node_list = get_condition_reg_source_nodes(xml_file_path, condition_reg_name)
                #     for source_node in condition_reg_source_node_list:
                #         if source_node in all_list:
                #             related_full.append(op[0])
                #             related_cycle.append(cycle)
                #             related_pos.append(all_list.index(source_node))
    return related_full, related_cycle, related_pos


def generate_AXI_interface_condition(FSM_info_list, axi_interface_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, branch_condition_mapping_choices, program_index):
    interface_related_list, interface_related_full_list, interface_related_cycle_list, interface_related_pos_list = get_related_ops_interface_condition(FSM_info_list, axi_interface_name, branch_condition_mapping_choices)
    port_interface_name_list = []

    for i in range (len(interface_related_full_list)):
        port_name = get_func_call_port_name(interface_related_full_list[i], interface_related_pos_list[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_interface_name_list.append(port_name)

    full_port_instance_name_list = []
    full_port_instance_name_list_full = []

    full_port_instance_name_func_call_list = []
    full_port_instance_name_func_call_list_full = []

    for i in range(len(interface_related_full_list)):
        func_call = interface_related_full_list[i]
        port_name = port_interface_name_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_m_axi_' + port_name
        if full_name not in full_port_instance_name_list:
            full_port_instance_name_list.append(full_name)
        full_port_instance_name_list_full.append(full_name)
        if key not in full_port_instance_name_func_call_list:
            full_port_instance_name_func_call_list.append(key + '_m_axi_' + port_name) 
        full_port_instance_name_func_call_list_full.append(key + '_m_axi_' + port_name)   

    return full_port_instance_name_func_call_list


def generate_AXI_interface(FSM_info_list, axi_interface_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, program_index):
    interface_related_list, interface_related_full_list, interface_related_cycle_list, interface_related_pos_list = get_related_ops_interface(FSM_info_list, axi_interface_name)
    port_interface_name_list = []

    for i in range (len(interface_related_full_list)):
        port_name = get_func_call_port_name(interface_related_full_list[i], interface_related_pos_list[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_interface_name_list.append(port_name)

    full_port_instance_name_list = []
    full_port_instance_name_list_full = []

    full_port_instance_name_func_call_list = []
    full_port_instance_name_func_call_list_full = []

    for i in range(len(interface_related_full_list)):
        func_call = interface_related_full_list[i]
        port_name = port_interface_name_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_m_axi_' + port_name
        if full_name not in full_port_instance_name_list:
            full_port_instance_name_list.append(full_name)
        full_port_instance_name_list_full.append(full_name)
        if key not in full_port_instance_name_func_call_list:
            full_port_instance_name_func_call_list.append(key + '_m_axi_' + port_name) 
        full_port_instance_name_func_call_list_full.append(key + '_m_axi_' + port_name)   

    sel_signal_instance_length = (len(full_port_instance_name_list)).bit_length()
    sel_signal_instance_max = pow(2, sel_signal_instance_length) - 1
    sel_signal_instance_status = [sel_signal_instance_max] * (len(result) + 1)

    for i in range (len(full_port_instance_name_list_full)):
        current_cycle = interface_related_cycle_list[i]
        current_port = full_port_instance_name_list_full[i]
        current_port_index = full_port_instance_name_list_full.index(current_port)
        sel_signal_instance_status[int(current_cycle)] = current_port_index

    instance_binary_list = [format(n, f'0{sel_signal_instance_length}b') for n in sel_signal_instance_status]
    instance_binary_bits = [bit 
                for num in sel_signal_instance_status 
                for bit in format(num, f'0{sel_signal_instance_length}b')]
    return full_port_instance_name_list, sel_signal_instance_length, sel_signal_instance_status, full_port_instance_name_func_call_list


def generate_BRAM_ce_address_condition(FSM_info_list, bram_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, branch_condition_mapping_choices, program_index):
    #print("the value of bram_name is:", bram_name)
    buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_list, bram_name, branch_condition_mapping_choices)
    #pprint(FSM_info_list)
    port_name_input_list = []
    port_name_output_list = []
    #print("the value of bram_name is:", bram_name)
    # print("the value of buffer_related_R_op_list_full is:", buffer_related_R_op_list_full)
    for i in range (len(buffer_related_R_op_list_full)):
        # print("the value of HLS path is:", HLS_project_solution_path_program_list)
        # print("the value of buffer_related_R_op_list_full is:", buffer_related_R_op_list_full[i])
        # print("the value of related_pos_input is:", related_pos_input[i])
        port_name = get_func_call_port_name(buffer_related_R_op_list_full[i], related_pos_input[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        #print("the value of port name is:", port_name)
        port_name_input_list.append(port_name)
    
    #print("the value of port_name_input_list is:", port_name_input_list)
    # print("the value of buffer_related_W_op_list_full is:", buffer_related_W_op_list_full)
    for i in range (len(buffer_related_W_op_list_full)):
        port_name = get_func_call_port_name(buffer_related_W_op_list_full[i], related_pos_output[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_name_output_list.append(port_name)

    full_port_name_input_list = []
    full_port_name_output_list = []
    full_port_name_input_func_call_list = []
    full_port_name_output_func_call_list = []
    full_port_name_list = []
    full_port_name_func_call_list = []

    for i in range(len(buffer_related_R_op_list_full)):
        func_call = buffer_related_R_op_list_full[i]
        port_name = port_name_input_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + port_name
        full_port_name_input_list.append(full_name)
        full_port_name_input_func_call_list.append(key + '_' + port_name)

    for i in range(len(buffer_related_W_op_list_full)):
        func_call = buffer_related_W_op_list_full[i]
        port_name = port_name_output_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + port_name
        full_port_name_output_list.append(full_name)
        full_port_name_output_func_call_list.append(key + '_' + port_name)

    for name in full_port_name_output_list + full_port_name_input_list:
        if name not in full_port_name_list:
            full_port_name_list.append(name)
    #print("the value of full_port_name_input_func_call_list is:", full_port_name_input_func_call_list)
    #print("the value of full_port_name_output_func_call_list is:", full_port_name_output_func_call_list)
    for name in full_port_name_input_func_call_list + full_port_name_output_func_call_list:
        if name not in full_port_name_func_call_list:
            full_port_name_func_call_list.append(name)
    
    return full_port_name_input_func_call_list, full_port_name_output_func_call_list


# full_port_name_func_call_list is useful
def generate_BRAM_ce_address(FSM_info_list, bram_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, program_index):
    #print("the value of bram_name is:", bram_name)
    buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops(FSM_info_list, bram_name)
    #pprint(FSM_info_list)
    port_name_input_list = []
    port_name_output_list = []
    #print("the value of bram_name is:", bram_name)
    # print("the value of buffer_related_R_op_list_full is:", buffer_related_R_op_list_full)
    for i in range (len(buffer_related_R_op_list_full)):
        # print("the value of HLS path is:", HLS_project_solution_path_program_list)
        # print("the value of buffer_related_R_op_list_full is:", buffer_related_R_op_list_full[i])
        # print("the value of related_pos_input is:", related_pos_input[i])
        port_name = get_func_call_port_name(buffer_related_R_op_list_full[i], related_pos_input[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        #print("the value of port name is:", port_name)
        port_name_input_list.append(port_name)
    
    #print("the value of port_name_input_list is:", port_name_input_list)
    # print("the value of buffer_related_W_op_list_full is:", buffer_related_W_op_list_full)
    for i in range (len(buffer_related_W_op_list_full)):
        #print("the value of func_call_name is:", func_call_name)
        #print("the value of func_call_program_index is:", func_call_program_index)
        #print("the value of buffer_related_W_op_list_full is:", buffer_related_W_op_list_full[i])
        port_name = get_func_call_port_name(buffer_related_W_op_list_full[i], related_pos_output[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_name_output_list.append(port_name)

    full_port_name_input_list = []
    full_port_name_output_list = []
    full_port_name_input_func_call_list = []
    full_port_name_output_func_call_list = []
    full_port_name_list = []
    full_port_name_func_call_list = []
    for i in range(len(buffer_related_R_op_list_full)):
        func_call = buffer_related_R_op_list_full[i]
        port_name = port_name_input_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        # print("the value of key is:", key)
        # print("the value of names is:", names)
        # print("the value of instance map is:", instance_map)
        full_name = names[0] + '_' + port_name
        full_port_name_input_list.append(full_name)
        full_port_name_input_func_call_list.append(key + '_' + port_name)

    for i in range(len(buffer_related_W_op_list_full)):
        func_call = buffer_related_W_op_list_full[i]
        port_name = port_name_output_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + port_name
        full_port_name_output_list.append(full_name)
        full_port_name_output_func_call_list.append(key + '_' + port_name)

    for name in full_port_name_output_list + full_port_name_input_list:
        if name not in full_port_name_list:
            full_port_name_list.append(name)
    #print("the value of full_port_name_input_func_call_list is:", full_port_name_input_func_call_list)
    #print("the value of full_port_name_output_func_call_list is:", full_port_name_output_func_call_list)
    for name in full_port_name_input_func_call_list + full_port_name_output_func_call_list:
        if name not in full_port_name_func_call_list:
            full_port_name_func_call_list.append(name)

    sel_signal_length = (len(full_port_name_list)).bit_length()
    sel_signal_max = pow(2, sel_signal_length) - 1
    sel_signal_status = [sel_signal_max] * (len(result) + 1)

    for i in range (len(full_port_name_input_list)):
        current_cycle = buffer_related_R_op_list_cycle[i]
        current_port = full_port_name_input_list[i]
        current_port_index = full_port_name_list.index(current_port)
        sel_signal_status[int(current_cycle)] = current_port_index

    for i in range (len(full_port_name_output_list)):
        current_cycle = buffer_related_W_op_list_cycle[i]
        current_port = full_port_name_output_list[i]
        current_port_index = full_port_name_list.index(current_port)
        sel_signal_status[int(current_cycle)] = current_port_index

    binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_status]
    binary_bits = [bit 
                for num in sel_signal_status 
                for bit in format(num, f'0{sel_signal_length}b')]
    
    return full_port_name_list, sel_signal_length, sel_signal_status, full_port_name_func_call_list, full_port_name_input_func_call_list, full_port_name_output_func_call_list


def generate_BRAM_we_d0_condition(FSM_info_list, bram_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, branch_condition_mapping_choices, program_index):
    buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_list, bram_name, branch_condition_mapping_choices)

    port_name_input_list = []
    port_name_output_list = []

    
    for i in range (len(buffer_related_W_op_list_full)):
        port_name = get_func_call_port_name(buffer_related_W_op_list_full[i], related_pos_output[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_name_output_list.append(port_name)


    full_port_name_input_list = []
    full_port_name_output_list = []
    full_port_name_input_func_call_list = []
    full_port_name_output_func_call_list = []
    full_port_name_list = []
    full_port_name_func_call_list = []


    for i in range(len(buffer_related_W_op_list_full)):
        func_call = buffer_related_W_op_list_full[i]
        port_name = port_name_output_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + port_name
        full_port_name_output_list.append(full_name)
        full_port_name_output_func_call_list.append(key + '_' + port_name)


    for name in full_port_name_output_list:
        if name not in full_port_name_list:
            full_port_name_list.append(name)

    for name in full_port_name_output_func_call_list:
        if name not in full_port_name_func_call_list:
            full_port_name_func_call_list.append(name)
    
    return full_port_name_output_func_call_list


def generate_BRAM_we_d0(FSM_info_list, bram_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, program_index):
    buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops(FSM_info_list, bram_name)

    port_name_input_list = []
    port_name_output_list = []

    
    for i in range (len(buffer_related_W_op_list_full)):
        port_name = get_func_call_port_name(buffer_related_W_op_list_full[i], related_pos_output[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        port_name_output_list.append(port_name)


    full_port_name_input_list = []
    full_port_name_output_list = []
    full_port_name_input_func_call_list = []
    full_port_name_output_func_call_list = []
    full_port_name_list = []
    full_port_name_func_call_list = []


    for i in range(len(buffer_related_W_op_list_full)):
        func_call = buffer_related_W_op_list_full[i]
        port_name = port_name_output_list[i]
        key = "top_" + func_call
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + port_name
        full_port_name_output_list.append(full_name)
        full_port_name_output_func_call_list.append(key + '_' + port_name)


    for name in full_port_name_output_list:
        if name not in full_port_name_list:
            full_port_name_list.append(name)

    for name in full_port_name_output_func_call_list:
        if name not in full_port_name_func_call_list:
            full_port_name_func_call_list.append(name)

    sel_signal_length = (len(full_port_name_list)).bit_length()
    sel_signal_max = pow(2, sel_signal_length) - 1
    sel_signal_status = [sel_signal_max] * (len(result) + 1)


    for i in range (len(full_port_name_output_list)):
        current_cycle = buffer_related_W_op_list_cycle[i]
        current_port = full_port_name_output_list[i]
        current_port_index = full_port_name_list.index(current_port)
        sel_signal_status[int(current_cycle)] = current_port_index

    binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_status]
    binary_bits = [bit 
                for num in sel_signal_status 
                for bit in format(num, f'0{sel_signal_length}b')]
    
    return full_port_name_list, sel_signal_length, sel_signal_status, full_port_name_func_call_list, full_port_name_output_func_call_list

# def get_ops_related_axi_reg(fsm_info_list, ops_name):
#     """
#     Returns a list of unique operation names in the FSM that either
#     read from (input BRAM) or write to (output BRAM) the specified buffer.
#     """
#     related = []
#     related_pos = []
#     related_cycle = []

#     for cycle, ops in fsm_info_list:
#         #print("the value of cycle is:", cycle)
        
#         for op in ops:
#             #print("the value of op is:", op)
#             # op[3] is the input_bram list, op[4] is the output_bram list
#             op_name = op[0]
#             if ops_name == op_name:
#                 related_cycle.append(cycle)
#                 if len(op) >= 5:
#                     input_list = op[1]
#                     output_list = op[2]
#                     axi_reg_list = op[7]
#                     all_list = op[9]
#                     related.append(axi_reg_list)
#                     related_pos_list_temp = []
#                     for i in range (len(axi_reg_list)):
#                         related_pos_list_temp.append(all_list.index(axi_reg_list[i]))
#                     related_pos.append(related_pos_list_temp)
#     return related, related_cycle, related_pos

def get_ops_related_axi_reg(fsm_info_list, ops_name):
    """
    Walk the FSM info looking for the operation named `ops_name`.
    For every match, return:
        • related ........ list of the axi_reg_list itself (one entry per match)
        • related_cycle .. cycle numbers where the op occurs
        • related_pos .... list of lists, with the position(s) of each axi_reg
                           inside the corresponding all_list.
                           **If the same axi_reg appears multiple times,
                           each position is unique.**
    """
    related = []
    related_pos = []
    related_cycle = []

    for cycle, ops in fsm_info_list:
        for op in ops:
            op_name = op[0]
            if op_name != ops_name:
                continue

            related_cycle.append(cycle)

            # unpack lists (op[7] = axi_reg_list, op[9] = all_list)
            axi_reg_list = op[7]
            all_list     = op[9]

            related.append(axi_reg_list)

            # Build a map: reg → list of *all* indices where it appears in all_list
            index_map = {}
            for idx, val in enumerate(all_list):
                index_map.setdefault(val, []).append(idx)

            # For each reg, pop the next unused index so duplicates stay unique
            pos_list = []
            for reg in axi_reg_list:
                try:
                    pos = index_map[reg].pop(0)    # first unused occurrence
                except (KeyError, IndexError):
                    raise ValueError(
                        f"Register '{reg}' not found (or no unused occurrence left) "
                        "in all_list"
                    )
                pos_list.append(pos)

            related_pos.append(pos_list)

    return related, related_cycle, related_pos



# def get_ops_related_axi_reg_condition(fsm_info_list, ops_name, branch_condition_mapping_choices):
#     """
#     Returns a list of unique operation names in the FSM that either
#     read from (input BRAM) or write to (output BRAM) the specified buffer.
#     """
#     related = []
#     related_pos = []
#     related_cycle = []

#     for cycle, ops in fsm_info_list:
#         #print("the value of cycle is:", cycle)
        
#         for op in ops:
#             #print("the value of op is:", op)
#             # op[3] is the input_bram list, op[4] is the output_bram list
#             op_name = op[0]
#             if ops_name == op_name:
#                 if len(op) >= 5:
#                     input_list = op[1]
#                     output_list = op[2]
#                     axi_reg_list = op[7]
#                     all_list = op[9]
#                     branch_condition = op[11]
#                     if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
#                         related.append(axi_reg_list)
#                         related_cycle.append(cycle)
#                         related_pos_list_temp = []
#                         for i in range (len(axi_reg_list)):
#                             related_pos_list_temp.append(all_list.index(axi_reg_list[i]))
#                         related_pos.append(related_pos_list_temp)
#                     elif branch_condition in branch_condition_mapping_choices:
#                         related.append(axi_reg_list)
#                         related_cycle.append(cycle)
#                         related_pos_list_temp = []
#                         for i in range (len(axi_reg_list)):
#                             related_pos_list_temp.append(all_list.index(axi_reg_list[i]))
#                         related_pos.append(related_pos_list_temp)
                        
#     return related, related_cycle, related_pos

def get_ops_related_axi_reg_condition(
    fsm_info_list, ops_name, branch_condition_mapping_choices
):
    """
    For every operation named `ops_name`, return:
        • related ........ list of the axi_reg_list (per matched op)
        • related_cycle .. cycle numbers where it occurs
        • related_pos .... list of lists, giving a UNIQUE position for each
                           axi_reg inside the corresponding all_list.
                           Duplicate names always map to different indices.
    A match is counted only if:
        – branch_condition is ('NULL', 'NULL')   OR
        – branch_condition appears in branch_condition_mapping_choices
    """
    related       = []
    related_cycle = []
    related_pos   = []

    for cycle, ops in fsm_info_list:
        for op in ops:
            if op[0] != ops_name:
                continue

            # unpack fields we need
            axi_reg_list    = op[7]
            all_list        = op[9]
            branch_condition = op[11]

            # check condition
            if not (
                (branch_condition[0] == "NULL" and branch_condition[1] == "NULL")
                or branch_condition in branch_condition_mapping_choices
            ):
                continue

            # record cycle + axi_reg_list
            related_cycle.append(cycle)
            related.append(axi_reg_list)

            # Build a reg → [indices...] map for ALL occurrences
            index_map = {}
            for idx, val in enumerate(all_list):
                index_map.setdefault(val, []).append(idx)

            # Pop the next unused index for each reg to avoid repeats
            pos_list = []
            for reg in axi_reg_list:
                try:
                    pos = index_map[reg].pop(0)
                except (KeyError, IndexError):
                    raise ValueError(
                        f"No unused occurrence of register '{reg}' found in all_list"
                    )
                pos_list.append(pos)

            related_pos.append(pos_list)

    return related, related_cycle, related_pos


# def build_ram_to_buffers(bram_info_list, buf_names_list):
#     """
#     Build a dict mapping each BRAM name → sorted list of its buffer names.

#     bram_info_list : list of programs
#         Each program is itself a list containing *one* list of BRAM entries:
#           [[ [bram_entry, …], ],  … ]
#     buf_names_list : list of programs
#         Each program is a flat list of buffer-name lists:
#           [ [buf1, buf2, …], [bufA, …], … ]
#     """
#     ram_to_buffers = defaultdict(set)

#     for prog_bram_group, prog_buf_group in zip(bram_info_list, buf_names_list):
#         # prog_bram_group == [[entry1, entry2, …]]
#         bram_entries = prog_bram_group[0]              # drop that extra layer
#         # prog_buf_group == [ [bufs for entry1], [bufs for entry2], … ]

#         for bram_entry, buf_list in zip(bram_entries, prog_buf_group):
#             ram_name = bram_entry[0]                   # e.g. 'ram_1p_32_10_1_U'
#             for buf in buf_list:
#                 ram_to_buffers[ram_name].add(buf)

#     # turn each set into a sorted list
#     return {ram: sorted(bufs) for ram, bufs in ram_to_buffers.items()}
# def build_ram_to_buffers(bram_info_list, buf_names_list):
#     """
#     Build a dict mapping each BRAM name → sorted list of its buffer names.

#     bram_info_list : list of programs
#         Each program is a list of groups; each group is a list of BRAM‐entry lists:
#             program = [ group1, group2, … ]
#             group = [ bram_entry1, bram_entry2, … ]
#             bram_entry = [name, width, depth, addr_width]

#     buf_names_list : list of programs
#         Each program is a list of groups; each group is a list of buffer names:
#             program = [ [bufs_for_group1], [bufs_for_group2], … ]
#     """
#     ram_to_buffers = defaultdict(set)

#     # iterate over programs
#     for prog_bram_groups, prog_buf_groups in zip(bram_info_list, buf_names_list):
#         # each program has N groups
#         for group_bram_entries, buf_list in zip(prog_bram_groups, prog_buf_groups):
#             # group_bram_entries is a list of one or more bram_entry lists
#             for bram_entry in group_bram_entries:
#                 ram_name = bram_entry[0]  # e.g. 'ram_1p_32_10_1_U'
#                 # add every buffer in this group to that ram_name
#                 for buf in buf_list:
#                     ram_to_buffers[ram_name].add(buf)

#     # sort and return
#     return {ram: sorted(bufs) for ram, bufs in ram_to_buffers.items()}
#def generate_AXI

# def build_ram_to_buffers(bram_info_list, buf_names_list):
#     """
#     Build a dict mapping each BRAM name → sorted list of its buffer names.

#     bram_info_list : list of programs
#         Each program is a list of groups; each group is a list of BRAM entries:
#             program = [ group1, group2, … ]
#             groupX = [ bram_entry1, bram_entry2, … ]
#             bram_entry = [name, width, depth, addr_width]

#     buf_names_list : list of programs
#         Each program is a list of groups; each group is a list of buffer names:
#             program = [ [bufs_for_group1], [bufs_for_group2], … ]
#     """
#     ram_to_buffers = defaultdict(set)

#     for prog_bram_groups, prog_buf_groups in zip(bram_info_list, buf_names_list):
#         # If there's exactly one BRAM-group but its length matches buf_groups,
#         # treat it as a flat list of entries, one per buffer group.
#         if len(prog_bram_groups) == 1 and len(prog_bram_groups[0]) == len(prog_buf_groups):
#             bram_entries = prog_bram_groups[0]
#             for bram_entry, buf_list in zip(bram_entries, prog_buf_groups):
#                 ram_name = bram_entry[0]
#                 for buf in buf_list:
#                     ram_to_buffers[ram_name].add(buf)

#         # Otherwise assume one BRAM-group per buffer group
#         elif len(prog_bram_groups) == len(prog_buf_groups):
#             for bram_entries_group, buf_list in zip(prog_bram_groups, prog_buf_groups):
#                 for bram_entry in bram_entries_group:
#                     ram_name = bram_entry[0]
#                     for buf in buf_list:
#                         ram_to_buffers[ram_name].add(buf)
#         else:
#             raise ValueError(
#                 f"Mismatch: {len(prog_bram_groups)} BRAM groups vs "
#                 f"{len(prog_buf_groups)} buffer groups in one program"
#             )

#     # Convert each set of buffers into a sorted list
#     return {ram: sorted(bufs) for ram, bufs in ram_to_buffers.items()}

# def build_ram_to_buffers(bram_name_programs, full_port_programs):
#     """
#     bram_name_programs: list of [bram_name, ...] per program
#     full_port_programs: list of [ [port, ...] per bram ] per program

#     Returns: { bram_name: [sorted unique ports] }
#     """
#     mapping = defaultdict(set)

#     for bram_names, port_groups in zip(bram_name_programs, full_port_programs):
#         for bram, ports in zip(bram_names, port_groups):
#             # flatten one level: if an element is a list, extend it; otherwise use it directly
#             flat = []
#             for p in ports:
#                 if isinstance(p, list):
#                     flat.extend(p)
#                 else:
#                     flat.append(p)
#             mapping[bram].update(flat)

#     # turn sets into sorted lists
#     return { bram: sorted(ports) for bram, ports in mapping.items() }

# def build_ram_to_buffers(bram_name_mapped_program_list, full_port_list):
#     """
#     Build a mapping from each BRAM instance name to the unique ports
#     connected to it across multiple programs.

#     Args:
#         bram_name_mapped_program_list: List of lists of BRAM names.
#         full_port_list:            List of lists of port‐name lists (one sublist per BRAM).

#     Returns:
#         dict: { bram_name: [sorted, unique port names] }
#     """
#     mapping = defaultdict(set)

#     # iterate over each program
#     for bram_names, port_groups in zip(bram_name_mapped_program_list, full_port_list):
#         # for each BRAM in that program, add all its ports
#         for bram, ports in zip(bram_names, port_groups):
#             mapping[bram].update(ports)

#     # turn each set into a sorted list for deterministic ordering
#     return { bram: sorted(ports) for bram, ports in mapping.items() }


def build_ram_to_buffers(
    bram_name_mapped_program_list: List[List[str]],
    full_port_list: List[List[List[str]]]
) -> Dict[str, List[str]]:
    """
    Map each BRAM instance to the ports connected to it, preserving
    the original encounter order of the port names.

    Args
    ----
    bram_name_mapped_program_list : List[List[str]]
        Outer list = programs, inner list = BRAM names in that program.

    full_port_list : List[List[List[str]]]
        Parallel structure.  For each BRAM in a program, a list of its ports.

    Returns
    -------
    Dict[str, List[str]]
        { bram_name : [port0, port1, ...] } – order preserved, no duplicates.
    """
    if len(bram_name_mapped_program_list) != len(full_port_list):
        raise ValueError("Outer lengths differ between BRAM and port lists")

    mapping: "OrderedDict[str, List[str]]" = OrderedDict()   # keep BRAM key order
    seen_ports: Dict[str, set] = defaultdict(set)            # de‑dupe helper

    for bram_names, port_groups in zip(bram_name_mapped_program_list, full_port_list):
        if len(bram_names) != len(port_groups):
            raise ValueError("Inner lengths differ between BRAM list and port list")

        for bram, ports in zip(bram_names, port_groups):
            if bram not in mapping:
                mapping[bram] = []

            for port in ports:
                if port not in seen_ports[bram]:
                    mapping[bram].append(port)
                    seen_ports[bram].add(port)

    return mapping  # both key order and value order preserved


def generate_AXI_reg_condition(FSM_info_list, axi_reg_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, branch_condition_mapping_choices, program_index):
    axi_reg_related_list, axi_reg_related_cycle_list, axi_reg_related_pos_list = get_ops_related_axi_reg_condition(FSM_info_list, axi_reg_name, branch_condition_mapping_choices)
    
    unique_axi_reg_related_pos = list({num for pair in axi_reg_related_pos_list for num in pair})

    full_func_call_name_list = []
    full_func_call_name_func_call_list = []
    for i in range (len(unique_axi_reg_related_pos)):
        func_call_port_name = get_func_call_port_name(axi_reg_name, unique_axi_reg_related_pos[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        key = "top_" + axi_reg_name
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + func_call_port_name
        full_func_call_name_list.append(full_name)
        full_func_call_name_func_call_list.append(key + '_' + func_call_port_name)
    
    unique_axi_reg_related_cycle_list = [[] for i in range (len(unique_axi_reg_related_pos))]
    related_axi_reg_name_list = [[] for i in range (len(unique_axi_reg_related_pos))]

    for i in range (len(unique_axi_reg_related_pos)):
        unique_related_pos = unique_axi_reg_related_pos[i]
        for j in range (len(axi_reg_related_pos_list)):
            if unique_related_pos in axi_reg_related_pos_list[j]:
                unique_axi_reg_related_cycle_list[i].append(axi_reg_related_cycle_list[j])
                unique_related_pos_index = axi_reg_related_pos_list[j].index(unique_related_pos)
                related_axi_reg_name_list[i].append(axi_reg_related_list[j][int(unique_related_pos_index)])

    full_axi_reg_name_list = [[] for i in range (len(related_axi_reg_name_list))]
    for i in range (len(related_axi_reg_name_list)):
        for reg_name in related_axi_reg_name_list[i]:
            if reg_name + '_reg' not in full_axi_reg_name_list[i]:
                full_axi_reg_name_list[i].append(reg_name + '_reg')   

    return full_func_call_name_func_call_list




def generate_AXI_reg(FSM_info_list, axi_reg_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, program_index):
    #print("the value of axi_reg_name is:", axi_reg_name)
    
    axi_reg_related_list, axi_reg_related_cycle_list, axi_reg_related_pos_list = get_ops_related_axi_reg(FSM_info_list, axi_reg_name)
    # print("the value of axi_reg_related list is:", axi_reg_related_list)
    # print("the value of axi_reg_related_pos_list is:", axi_reg_related_pos_list)
    unique_axi_reg_related_pos = list({num for pair in axi_reg_related_pos_list for num in pair})
    #print("the value of unique_axi_reg_related_pos is:", unique_axi_reg_related_pos)

    full_func_call_name_list = []
    full_func_call_name_func_call_list = []
    for i in range (len(unique_axi_reg_related_pos)):
        func_call_port_name = get_func_call_port_name(axi_reg_name, unique_axi_reg_related_pos[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        key = "top_" + axi_reg_name
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + func_call_port_name
        full_func_call_name_list.append(full_name)
        full_func_call_name_func_call_list.append(key + '_' + func_call_port_name)
    
    unique_axi_reg_related_cycle_list = [[] for i in range (len(unique_axi_reg_related_pos))]
    related_axi_reg_name_list = [[] for i in range (len(unique_axi_reg_related_pos))]

    for i in range (len(unique_axi_reg_related_pos)):
        unique_related_pos = unique_axi_reg_related_pos[i]
        for j in range (len(axi_reg_related_pos_list)):
            if unique_related_pos in axi_reg_related_pos_list[j]:
                unique_axi_reg_related_cycle_list[i].append(axi_reg_related_cycle_list[j])
                unique_related_pos_index = axi_reg_related_pos_list[j].index(unique_related_pos)
                related_axi_reg_name_list[i].append(axi_reg_related_list[j][int(unique_related_pos_index)])

    full_axi_reg_name_list = [[] for i in range (len(related_axi_reg_name_list))]
    for i in range (len(related_axi_reg_name_list)):
        for reg_name in related_axi_reg_name_list[i]:
            if reg_name + '_reg' not in full_axi_reg_name_list[i]:
                full_axi_reg_name_list[i].append(reg_name + '_reg')   

    sel_signal_axi_reg_length = []
    sel_signal_axi_reg_max = []
    sel_signal_axi_reg_status = []
    for i in range (len(full_axi_reg_name_list)):
        sel_signal_axi_reg_length.append((len(full_axi_reg_name_list[i])).bit_length())
        sel_signal_axi_reg_max.append(pow(2, sel_signal_axi_reg_length[i]) - 1)
        sel_signal_axi_reg_status.append([sel_signal_axi_reg_max[i]] * (len(result) + 1))

    for i in range (len(related_axi_reg_name_list)):
        for j in range (len(related_axi_reg_name_list[i])):
            current_cycle = unique_axi_reg_related_cycle_list[i][j]
            current_port = related_axi_reg_name_list[i][j] + '_reg'
            current_port_index = full_axi_reg_name_list[i].index(current_port)
            sel_signal_axi_reg_status[i][int(current_cycle)] = current_port_index

    return full_axi_reg_name_list, sel_signal_axi_reg_length, sel_signal_axi_reg_status, full_func_call_name_list, full_func_call_name_func_call_list





def build_axi_to_funcs(port_list_program, func_call_list_program):
    """
    Build a mapping from each AXI interface port name → sortglobal_maped list of function calls.

    Parameters
    ----------
    port_list_program : list of list of str
        Each element is a “program”s list of port names, e.g.
          [['INPUT_r'], ['INPUT_r'], ['INPUT_r']]
    func_call_list_program : list of list of list of str
        Each element is a “program”s list of function-call lists, aligned to ports, e.g.
          [[['top_load']], [['top_load']], [['top_load']]]

    Returns
    -------
    dict
        { port_name: [sorted unique function names] }
    """
    mapping = defaultdict(set)

    # iterate over each program
    for ports, func_groups in zip(port_list_program, func_call_list_program):
        # align each port to its corresponding list of functions
        for port, funcs in zip(ports, func_groups):
            mapping[port].update(funcs)

    # convert sets to sorted lists
    return {port: sorted(funcs) for port, funcs in mapping.items()}

# def remap_buffers(buffer_list, func_to_inst):
#     """
#     Given a list of names like 'top_func_A_input_buffer' or
#     'top_load_input_buffer', replace the 'top_*' prefix with the
#     corresponding 'grp_*_fu_*' from func_to_inst, preserving the suffix.
#     """
#     remapped = []
#     for name in buffer_list:
#         for func_key, inst_name in func_to_inst.items():
#             if name.startswith(func_key):
#                 suffix = name[len(func_key):]  # e.g. "_input_buffer" or "_input_buffer_2"
#                 new_name = inst_name + suffix
#                 if new_name not in remapped:
#                     remapped.append(new_name)
#                 break
#     return remapped

def map_axi_regs_to_new_list(
    full_axi_reg_name_program_list: List[List[List[List[str]]]],
    axi_reg_mapping_program_list: List[Dict[str, str]],
) -> List[List[List[List[str]]]]:
    """
    Replace each register name inside `full_axi_reg_name_program_list`
    with the mapped name from the *per‑program* dictionary in
    `axi_reg_mapping_program_list`.

    The two outer lists (program level) must be the same length.
    """
    if len(full_axi_reg_name_program_list) != len(axi_reg_mapping_program_list):
        raise ValueError("The program counts do not match")

    mapped_programs: List[List[List[List[str]]]] = []
    for prog_idx, program in enumerate(full_axi_reg_name_program_list):
        mapping = axi_reg_mapping_program_list[prog_idx]

        # Rebuild the four‑level structure with mapped names
        mapped_program = [
            [
                [mapping[reg] for reg in reg_list]
                for reg_list in group
            ]
            for group in program
        ]
        mapped_programs.append(mapped_program)

    return mapped_programs


# def build_global_func_to_reg_map(
#     axi_reg_nested: List[List[List[List[str]]]],
#     func_call_nested: List[List[List[str]]]
# ) -> Dict[str, List[str]]:
#     """
#     Combine *all* programs into ONE dict:
#         { func_call_name : [unique, sorted reg names] }

#     The structures must align program‑by‑program and group‑by‑group
#     so that each function‑name entry corresponds positionally to its
#     list of register names.
#     """
#     if len(axi_reg_nested) != len(func_call_nested):
#         raise ValueError("Outer lengths differ between AXI‑reg and func‑call lists")

#     global_map: Dict[str, set] = defaultdict(set)

#     # iterate across every program, every group, every aligned entry
#     for reg_groups, func_groups in zip(axi_reg_nested, func_call_nested):
#         if len(reg_groups) != len(func_groups):
#             raise ValueError("Group counts differ between regs and funcs")

#         for reg_group, func_group in zip(reg_groups, func_groups):
#             if len(reg_group) != len(func_group):
#                 raise ValueError("Aligned entry counts differ inside a group")

#             for regs, func_name in zip(reg_group, func_group):
#                 global_map[func_name].update(regs)

#     # convert each set → sorted list
#     return {func: sorted(regs) for func, regs in global_map.items()}

def build_global_func_to_reg_map(
    axi_reg_nested: List[List[List[List[str]]]],
    func_call_nested: List[List[List[str]]]
) -> Dict[str, List[str]]:
    """
    Build a global {func_call_name: [reg0, reg1, ...]} map.

    * The register list preserves the original encounter order.
    * Each register name appears only once per function.
    * The two input structures must align program‑by‑program and group‑by‑group.
    """
    if len(axi_reg_nested) != len(func_call_nested):
        raise ValueError("Outer lengths differ between AXI‑reg and func‑call lists")

    # OrderedDict so that *first* time we meet a function, it stays in that position
    global_map: "OrderedDict[str, List[str]]" = OrderedDict()
    # Track which regs we've already added for each function
    seen: Dict[str, set] = defaultdict(set)

    for reg_groups, func_groups in zip(axi_reg_nested, func_call_nested):
        if len(reg_groups) != len(func_groups):
            raise ValueError("Group counts differ between regs and funcs")

        for reg_group, func_group in zip(reg_groups, func_groups):
            if len(reg_group) != len(func_group):
                raise ValueError("Aligned entry counts differ inside a group")

            for regs, func_name in zip(reg_group, func_group):
                # ensure key order reflects first appearance of the function name
                if func_name not in global_map:
                    global_map[func_name] = []

                for reg in regs:
                    if reg not in seen[func_name]:
                        global_map[func_name].append(reg)
                        seen[func_name].add(reg)

    return global_map  # key order + value order are both preserved


def get_ops_related_bram_q0(fsm_info_list, ops_name):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_pos = []
    related_cycle = []

    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            op_name = op[0]
            if ops_name == op_name:
                related_cycle.append(cycle)
                if len(op) >= 5:
                    input_list = op[1]
                    output_list = op[2]
                    input_bram_list = op[3]
                    all_list = op[9]
                    related.append(input_bram_list)
                    related_pos_list_temp = []
                    for i in range (len(input_bram_list)):
                        related_pos_list_temp.append(all_list.index(input_bram_list[i]))
                    related_pos.append(related_pos_list_temp)
    return related, related_cycle, related_pos


def get_ops_related_bram_q0_condition(fsm_info_list, ops_name, branch_condition_mapping_choices):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_pos = []
    related_cycle = []

    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            op_name = op[0]
            if ops_name == op_name:
                if len(op) >= 5:
                    input_list = op[1]
                    output_list = op[2]
                    input_bram_list = op[3]
                    all_list = op[9]
                    branch_condition = op[11]
                    if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
                        related_cycle.append(cycle)
                        related.append(input_bram_list)
                        related_pos_list_temp = []
                        for i in range (len(input_bram_list)):
                            related_pos_list_temp.append(all_list.index(input_bram_list[i]))
                        related_pos.append(related_pos_list_temp)
                    elif branch_condition in branch_condition_mapping_choices:
                        related_cycle.append(cycle)
                        related.append(input_bram_list)
                        related_pos_list_temp = []
                        for i in range (len(input_bram_list)):
                            related_pos_list_temp.append(all_list.index(input_bram_list[i]))
                        related_pos.append(related_pos_list_temp)
                        
    return related, related_cycle, related_pos

def generate_bram_q0_condition(FSM_info_list, ops_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, branch_condition_mapping_choices, program_index):

    bram_q0_related_list, bram_q0_related_cycle_list, bram_q0_related_pos_list = get_ops_related_bram_q0_condition(FSM_info_list, ops_name, branch_condition_mapping_choices)
    
    unique_bram_q0_related_pos = list({num for pair in bram_q0_related_pos_list for num in pair})

    full_func_call_name_list = []
    full_func_call_name_func_call_list = []
    for i in range (len(unique_bram_q0_related_pos)):
        func_call_port_name = get_func_call_port_name(ops_name, unique_bram_q0_related_pos[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        key = "top_" + ops_name
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + func_call_port_name
        full_func_call_name_list.append(full_name)
        full_func_call_name_func_call_list.append(key + '_' + func_call_port_name)

    unique_bram_q0_related_cycle_list = [[] for i in range (len(unique_bram_q0_related_pos))]
    related_bram_q0_name_list = [[] for i in range (len(unique_bram_q0_related_pos))]
    for i in range (len(unique_bram_q0_related_pos)):
        unique_related_pos = unique_bram_q0_related_pos[i]
        for j in range (len(bram_q0_related_pos_list)):
            if unique_related_pos in bram_q0_related_pos_list[j]:
                unique_bram_q0_related_cycle_list[i].append(bram_q0_related_cycle_list[j])
                unique_related_pos_index = bram_q0_related_pos_list[j].index(unique_related_pos)
                related_bram_q0_name_list[i].append(bram_q0_related_list[j][int(unique_related_pos_index)])

    full_bram_q0_name_list = [[] for i in range (len(related_bram_q0_name_list))]
    for i in range (len(related_bram_q0_name_list)):
        for reg_name in related_bram_q0_name_list[i]:
            if reg_name not in full_bram_q0_name_list[i]:
                full_bram_q0_name_list[i].append(reg_name)   

    return full_func_call_name_func_call_list


def generate_bram_q0(FSM_info_list, ops_name, func_call_name, func_call_program_index, HLS_project_solution_path_program_list, program_index):

    bram_q0_related_list, bram_q0_related_cycle_list, bram_q0_related_pos_list = get_ops_related_bram_q0(FSM_info_list, ops_name)
    
    unique_bram_q0_related_pos = list({num for pair in bram_q0_related_pos_list for num in pair})

    full_func_call_name_list = []
    full_func_call_name_func_call_list = []
    for i in range (len(unique_bram_q0_related_pos)):
        func_call_port_name = get_func_call_port_name(ops_name, unique_bram_q0_related_pos[i], func_call_name, func_call_program_index, HLS_project_solution_path_program_list)
        key = "top_" + ops_name
        names = instance_map_program_list[int(program_index)].get(key, [])
        full_name = names[0] + '_' + func_call_port_name
        full_func_call_name_list.append(full_name)
        full_func_call_name_func_call_list.append(key + '_' + func_call_port_name)

    unique_bram_q0_related_cycle_list = [[] for i in range (len(unique_bram_q0_related_pos))]
    related_bram_q0_name_list = [[] for i in range (len(unique_bram_q0_related_pos))]
    for i in range (len(unique_bram_q0_related_pos)):
        unique_related_pos = unique_bram_q0_related_pos[i]
        for j in range (len(bram_q0_related_pos_list)):
            if unique_related_pos in bram_q0_related_pos_list[j]:
                unique_bram_q0_related_cycle_list[i].append(bram_q0_related_cycle_list[j])
                unique_related_pos_index = bram_q0_related_pos_list[j].index(unique_related_pos)
                related_bram_q0_name_list[i].append(bram_q0_related_list[j][int(unique_related_pos_index)])

    full_bram_q0_name_list = [[] for i in range (len(related_bram_q0_name_list))]
    for i in range (len(related_bram_q0_name_list)):
        for reg_name in related_bram_q0_name_list[i]:
            if reg_name not in full_bram_q0_name_list[i]:
                full_bram_q0_name_list[i].append(reg_name)   

    sel_signal_bram_q0_length = []
    sel_signal_bram_q0_max = []
    sel_signal_bram_q0_status = []
    for i in range (len(full_bram_q0_name_list)):
        sel_signal_bram_q0_length.append((len(full_bram_q0_name_list[i])).bit_length())
        sel_signal_bram_q0_max.append(pow(2, sel_signal_bram_q0_length[i]) - 1)
        sel_signal_bram_q0_status.append([sel_signal_bram_q0_max[i]] * (len(result) + 1))

    for i in range (len(related_bram_q0_name_list)):
        for j in range (len(related_bram_q0_name_list[i])):
            current_cycle = unique_bram_q0_related_cycle_list[i][j]
            current_port = related_bram_q0_name_list[i][j]
            current_port_index = full_bram_q0_name_list[i].index(current_port)
            sel_signal_bram_q0_status[i][int(current_cycle)] = current_port_index 

    return full_bram_q0_name_list, sel_signal_bram_q0_length, sel_signal_bram_q0_status, full_func_call_name_list, full_func_call_name_func_call_list


def print_linked_list(head):
    current = head
    counter = 0
    while current:
        print(current.value, end=" -> ")
        if (current.value == '10'):
            counter = counter + 1
        if (counter > 2):
           external_condition = '1' 
        current = current.next
    print("None")


def get_ops_related_cycle(fsm_info_list, ops_name):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_pos = []
    related_cycle = []


    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            op_name = op[0]
            if ops_name == op_name:
                related_cycle.append(cycle)
    return related_cycle

def get_ops_related_cycle_condition(fsm_info_list, ops_name, branch_condition_mapping_choices):
    """
    Returns a list of unique operation names in the FSM that either
    read from (input BRAM) or write to (output BRAM) the specified buffer.
    """
    related = []
    related_pos = []
    related_cycle = []


    for cycle, ops in fsm_info_list:
        #print("the value of cycle is:", cycle)
        
        for op in ops:
            #print("the value of op is:", op)
            # op[3] is the input_bram list, op[4] is the output_bram list
            op_name = op[0]
            branch_condition = op[11]
            if ops_name == op_name:
                if branch_condition[0] == 'NULL' and branch_condition[1] == 'NULL':
                    related_cycle.append(cycle)
                elif branch_condition in branch_condition_mapping_choices: 
                    related_cycle.append(cycle)
    return related_cycle

def list_length(head: ListNode) -> int:
    count = 0
    curr = head
    while curr is not None:
        count += 1
        curr = curr.next
    return count

def get_func_call_port_type(function_call, HLS_project_solution_path):
    
    xml_file = HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml'
    tree = parse_xml_safe(xml_file)
    root = tree.getroot()
    # tree = ET.parse(HLS_project_solution_path + '.autopilot/db/' + function_call + '.adb.xml')  # replace with your actual XML filename
    # root = tree.getroot()
    port_type_list = []
    port_direction_list = []
    for port in root.findall('.//port'):
        port_type = port.get('iftype')
        port_direction = port.get('dir')
        port_type_list.append(port_type)
        port_direction_list.append(port_direction)
    return port_type_list, port_direction_list

# ------------------------------------------------------------
#  Builder: FSM → tree of linked-list segments
# ------------------------------------------------------------
# def build_ll_tree(transitions, branch_condition_mapping):
#     """
#     Returns the root SegmentNode of a tree whose nodes contain:
#       • a linked-list segment that ends *before* any branch-point, and
#       • one child per outgoing branch, each annotated with its condition.
#     """
#     from collections import defaultdict

#     # Build adjacency: state → list of outgoing transitions
#     adj = defaultdict(list)
#     for t in transitions:
#         adj[t["from"]].append(t)

#     # Recursive depth-first builder
#     def dfs(start_state):
#         head  = ListNode(start_state)   # begin new segment
#         curr  = head
#         prev  = None                    # node before curr
#         state = start_state

#         while True:
#             outs = adj.get(state, [])
#             if not outs:                # leaf
#                 return SegmentNode(head)

#             # Detect branch transitions at this state
#             branch_outs = [tr for tr in outs
#                            if tr["literal_name"] in branch_condition_mapping]

#             if branch_outs:             # split here
#                 # 1. optional prefix (everything *before* this branch-state)
#                 prefix_node = None
#                 if prev is not None:
#                     prev.next = None     # detach branch node from prefix
#                     prefix_node = SegmentNode(head)

#                 # 2. one child per outgoing branch
#                 children = []
#                 for tr in branch_outs:
#                     branch_head       = ListNode(state)
#                     sub_tree          = dfs(tr["to"])
#                     branch_head.next  = sub_tree.head
#                     branch_node       = SegmentNode(
#                         branch_head,
#                         cond=(tr["literal_name"], tr["literal_val"])
#                     )
#                     branch_node.children = sub_tree.children
#                     children.append(branch_node)

#                 # 3. return appropriate root
#                 if prefix_node is None:      # branch at very first state
#                     synthetic_root = SegmentNode(None)
#                     synthetic_root.children = children
#                     return synthetic_root
#                 else:
#                     prefix_node.children = children
#                     return prefix_node

#             # -- linear step ----------------------------------------------
#             tr         = outs[0]             # deterministic choice
#             next_state = tr["to"]
#             new_node   = ListNode(next_state)
#             curr.next  = new_node
#             prev, curr, state = curr, new_node, next_state

#     # Kick off from the first transition’s "from" state
#     return dfs(transitions[0]["from"])

def build_ll_tree(transitions):
    """
    Returns the root SegmentNode of a tree whose nodes contain:
      • a linked-list segment that ends *before* any branch-point, and
      • one child per outgoing branch, each annotated with its condition.
    """
    from collections import defaultdict

    # 1) Build branch_condition_mapping from transitions
    branch_condition_mapping = {}
    for t in transitions:
        name = t.get('literal_name')
        val  = t.get('literal_val')
        if name is not None:
            branch_condition_mapping.setdefault(name, []).append(val)

    # 2) Build adjacency: state → list of outgoing transitions
    adj = defaultdict(list)
    for t in transitions:
        adj[t["from"]].append(t)

    # 3) Recursive depth-first builder
    def dfs(start_state):
        head  = ListNode(start_state)
        curr  = head
        prev  = None
        state = start_state

        while True:
            outs = adj.get(state, [])
            if not outs:
                return SegmentNode(head)

            # detect branch transitions at this state
            branch_outs = [tr for tr in outs
                           if tr["literal_name"] in branch_condition_mapping]

            if branch_outs:
                # optional prefix up to the branch
                prefix_node = None
                if prev is not None:
                    prev.next = None
                    prefix_node = SegmentNode(head)

                # one child per branch
                children = []
                for tr in branch_outs:
                    branch_head      = ListNode(state)
                    sub_tree         = dfs(tr["to"])
                    branch_head.next = sub_tree.head
                    branch_node      = SegmentNode(
                        branch_head,
                        cond=(tr["literal_name"], tr["literal_val"])
                    )
                    branch_node.children = sub_tree.children
                    children.append(branch_node)

                # attach children either under a synthetic root or under the prefix
                if prefix_node is None:
                    synthetic_root = SegmentNode(None)
                    synthetic_root.children = children
                    return synthetic_root
                else:
                    prefix_node.children = children
                    return prefix_node

            # linear step
            tr         = outs[0]
            next_state = tr["to"]
            new_node   = ListNode(next_state)
            curr.next  = new_node
            prev, curr, state = curr, new_node, next_state

    # start from the very first transition’s "from" state
    return dfs(transitions[0]["from"])

# def build_ll_tree(transitions):
#     """
#     Returns a tuple (root, branch_ends) where:
#       • root is the root SegmentNode of the tree (as before), and
#       • branch_ends is a list of ListNode objects, one per branch,
#         corresponding to the last node in that branch’s linked‐list segment.
#     """
#     from collections import defaultdict

#     # 1) Build branch_condition_mapping internally
#     branch_condition_mapping = {}
#     for t in transitions:
#         name = t.get('literal_name')
#         val  = t.get('literal_val')
#         if name is not None:
#             branch_condition_mapping.setdefault(name, []).append(val)

#     # 2) Build adjacency: state → list of outgoing transitions
#     adj = defaultdict(list)
#     for t in transitions:
#         adj[t["from"]].append(t)

#     # 3) Recursive DF builder (unchanged)
#     def dfs(start_state):
#         head  = ListNode(start_state)
#         curr  = head
#         prev  = None
#         state = start_state

#         while True:
#             outs = adj.get(state, [])
#             if not outs:
#                 return SegmentNode(head)

#             branch_outs = [tr for tr in outs
#                            if tr["literal_name"] in branch_condition_mapping]

#             if branch_outs:
#                 prefix_node = None
#                 if prev is not None:
#                     prev.next = None
#                     prefix_node = SegmentNode(head)

#                 children = []
#                 for tr in branch_outs:
#                     branch_head      = ListNode(state)
#                     sub_tree         = dfs(tr["to"])
#                     branch_head.next = sub_tree.head
#                     branch_node      = SegmentNode(
#                         branch_head,
#                         cond=(tr["literal_name"], tr["literal_val"])
#                     )
#                     branch_node.children = sub_tree.children
#                     children.append(branch_node)

#                 if prefix_node is None:
#                     synthetic_root = SegmentNode(None)
#                     synthetic_root.children = children
#                     return synthetic_root
#                 else:
#                     prefix_node.children = children
#                     return prefix_node

#             # linear step
#             tr         = outs[0]
#             next_state = tr["to"]
#             new_node   = ListNode(next_state)
#             curr.next  = new_node
#             prev, curr, state = curr, new_node, next_state

#     # build the tree
#     root = dfs(transitions[0]["from"])

#     # 4) Collect the tail ListNode of every branch SegmentNode
#     branch_ends = []
#     def collect_branch_ends(node):
#         if node.cond is not None and node.head is not None:
#             # walk to the end of this branch’s linked list
#             tail = node.head
#             while tail.next:
#                 tail = tail.next
#             branch_ends.append(tail)
#         for ch in node.children:
#             collect_branch_ends(ch)

#     collect_branch_ends(root)
#     return root, branch_ends


# ------------------------------------------------------------
#  Helpers
# ------------------------------------------------------------
def _ll_to_str(head):
    vals = []
    while head:
        vals.append(str(head.val))
        head = head.next
    return " -> ".join(vals) if vals else "(ε)"


def print_ll_tree(node, indent=0):
    """Pretty-print the tree of segments (for debugging / demo)."""
    if node.head:
        print(" " * indent + _ll_to_str(node.head))
    for ch in node.children:
        print_ll_tree(ch, indent + 2)


def collect_nodes(node, out=None):
    """Return a flat list containing *all* SegmentNode objects (pre-order)."""
    if out is None:
        out = []
    out.append(node)
    for ch in node.children:
        collect_nodes(ch, out)
    return out


def collect_leaf_paths(node, path_cond=None, out=None):
    """
    Returns list of tuples: (leaf_segment_node, [cond1, cond2, …])
    Each cond is (literal_name, literal_val) along the path.
    """
    if path_cond is None:
        path_cond = []
    if out is None:
        out = []

    new_path = path_cond + ([node.cond] if node.cond else [])

    if not node.children:            # leaf
        out.append((node, new_path))
    else:
        for ch in node.children:
            collect_leaf_paths(ch, new_path, out)
    return out


# def generate_branch_choices(branch_condition_mapping):
#     """
#     Given a dict mapping each branch‐literal to its list of possible values,
#     return a list of all possible choice‐tuples, where each choice‐tuple is
#     itself a tuple of (branch_name, value) pairs.
#     """
#     # pull out the branch names in a fixed order
#     keys = list(branch_condition_mapping.keys())
#     # pull out the lists of possible values in the same order
#     value_lists = [branch_condition_mapping[k] for k in keys]
    
#     # Cartesian product over all value‐lists
#     combos = product(*value_lists)
    
#     # for each combination, zip back with the keys and make a tuple of pairs
#     return [tuple(zip(keys, combo)) for combo in combos]

# def generate_branch_choices(branch_condition_mapping):
#     """
#     Given a dict mapping each branch‐literal to its list of possible values,
#     return a list of all possible choice‐lists, where each choice‐list is
#     itself a list of (branch_name, value) pairs.
#     """
#     # 1. Fix an ordering of the branch names
#     keys = list(branch_condition_mapping.keys())
#     # 2. Pull out the lists of possible values in the same order
#     value_lists = [branch_condition_mapping[k] for k in keys]
#     # 3. Cartesian‐product over the value‐lists
#     combos = product(*value_lists)
#     # 4. For each combination, zip back with the keys and build a list of pairs
#     return [
#         [ (k, v) for k, v in zip(keys, combo) ]
#         for combo in combos
#     ]

def generate_branch_choices(branch_condition_mapping):
    """
    Given a dict mapping branch names to lists of possible values,
    return a flat list of (branch_name, value) pairs.
    """
    return [
        (branch, value)
        for branch, values in branch_condition_mapping.items()
        for value in values
    ]
    
def collect_heads(node):
    """Return a list of all .head values in the subtree rooted at node."""
    heads = []
    if node.head is not None:
        heads.append(node.head)
    for ch in node.children:
        heads.extend(collect_heads(ch))
    return heads


# def bfs_heads_by_layer(root):
#     """
#     Perform a breadth-first traversal of the SegmentNode tree,
#     collecting each node.head into a 2-D list of layers.
#     If root.head is None (a synthetic root), we start from its children.
#     """
#     # If root.head is None, skip the synthetic root and start from its children
#     start_nodes = root.children if root.head is None else [root]
#     queue = deque(start_nodes)
#     layers = []

#     while queue:
#         level_size = len(queue)
#         current_heads = []
#         for _ in range(level_size):
#             node = queue.popleft()
#             # collect the ListNode head
#             current_heads.append(node.head)
#             # enqueue children for next layer
#             queue.extend(node.children)
#         layers.append(current_heads)

#     return layers

# def bfs_heads_and_conditions_by_layer(root):
#     """
#     Perform a breadth-first traversal of the SegmentNode tree,
#     collecting each node's (ListNode head, cond) into a 2-D list of layers.
#     """
#     # If root.head is None (a synthetic root), start from its children
#     start_nodes = root.children if root.head is None else [root]
#     queue = deque(start_nodes)
#     layers = []

#     while queue:
#         level_size = len(queue)
#         current_layer = []
#         for _ in range(level_size):
#             node = queue.popleft()
#             # collect the ListNode head and its condition
#             current_layer.append((node.head, node.cond))
#             # enqueue children for the next layer
#             queue.extend(node.children)
#         layers.append(current_layer)

#     return layers

# def bfs_heads_conds_paths_by_layer(root):
#     """
#     Breadth-first traversal of the SegmentNode tree.
#     Returns a list of layers, where each layer is a list of tuples:
#       (node.head, node.cond, path)
#     `path` is the list of all cond values encountered from the root down to this node.
#     """
#     # Decide where to start: skip a synthetic root if its head is None
#     start_nodes = root.children if root.head is None else [root]

#     # Initialize the queue with (node, path_to_node)
#     queue = deque()
#     for node in start_nodes:
#         # For the very first nodes, the path includes their own cond (if any)
#         initial_path = [node.cond] if node.cond is not None else []
#         queue.append((node, initial_path))

#     layers = []
#     while queue:
#         level_size = len(queue)
#         current_layer = []
#         for _ in range(level_size):
#             node, path = queue.popleft()
#             # Record this node’s head, its own cond, and the path so far
#             current_layer.append((node.head, node.cond, path))
#             # Enqueue children, extending the path by each child’s cond
#             for child in node.children:
#                 child_path = path.copy()
#                 if child.cond is not None:
#                     child_path.append(child.cond)
#                 queue.append((child, child_path))
#         layers.append(current_layer)

#     return layers

# def bfs_heads_conds_paths_by_layer_and_ends(root):
#     """
#     Breadth‐first traversal of the SegmentNode tree.
#     Returns a tuple (layers, branch_ends) where:
#       • layers is a list of layers, each a list of tuples
#         (node.head, node.cond, path)
#         `path` is the list of all cond values from the root down to this node.
#       • branch_ends is a list of tuples
#         (tail_node, node.cond, path) for every leaf segment node
#         (i.e. nodes with no children), where tail_node is the last ListNode
#         in that node’s linked‐list, and path is the full cond history.
#     """
#     # Decide where to start: skip a synthetic root if its head is None
#     start_nodes = root.children if root.head is None else [root]

#     # Initialize the queue with (node, path_to_node)
#     queue = deque()
#     for node in start_nodes:
#         initial_path = [node.cond] if node.cond is not None else []
#         queue.append((node, initial_path))

#     layers = []
#     branch_ends = []

#     while queue:
#         level_size = len(queue)
#         current_layer = []
#         for _ in range(level_size):
#             node, path = queue.popleft()

#             # Record this node’s head, its own cond, and the path so far
#             current_layer.append((node.head, node.cond, path))

#             # If this node is a leaf, record its tail and path
#             if not node.children:
#                 # walk to the end of this node’s linked list
#                 tail = node.head
#                 while tail and tail.next:
#                     tail = tail.next
#                 branch_ends.append((tail, node.cond, path))

#             # Enqueue children, extending the path by each child’s cond
#             for child in node.children:
#                 child_path = path.copy()
#                 if child.cond is not None:
#                     child_path.append(child.cond)
#                 queue.append((child, child_path))

#         layers.append(current_layer)

#     return layers, branch_ends

def bfs_heads_conds_paths_by_layer(root):
    """
    Breadth-first traversal of the SegmentNode tree.
    Returns a tuple (layers, branch_ends, branch_starts) where:

      • layers is a list of layers, each a list of tuples
        (node.head, node.cond, path)
        `path` is the list of all cond values from the root down to this node.

      • branch_ends is a list of tuples
        (tail_node, node.cond, path) for every leaf SegmentNode
        (i.e. nodes with no children), where `tail_node` is the last ListNode
        in that node’s linked-list, and `path` is the full cond history.

      • branch_starts is a list of tuples
        (start_node, node.cond, path) for every leaf SegmentNode,
        where `start_node` is the head of the final segment (the last turning point),
        and `cond`/`path` describe the condition on that branch and its full history.
    """
    # decide where to start: skip a synthetic root if its head is None
    start_nodes = root.children if root.head is None else [root]

    # queue entries are (node, path_to_node)
    queue = deque()
    for node in start_nodes:
        initial_path = [node.cond] if node.cond is not None else []
        queue.append((node, initial_path))

    layers = []
    branch_ends = []
    branch_starts = []

    while queue:
        level_size = len(queue)
        current_layer = []
        for _ in range(level_size):
            node, path = queue.popleft()

            # record this node’s head, its own cond, and the path so far
            current_layer.append((node.head, node.cond, path))

            # if this node is a leaf, record both its end and its start info
            if not node.children:
                # 1) end: walk to the end of this node’s linked list
                tail = node.head
                while tail and tail.next:
                    tail = tail.next
                branch_ends.append((tail, node.cond, path))

                # 2) start: the head of this final segment is the turning point
                branch_starts.append((node.head, node.cond, path))

            # enqueue children, extending the path by each child’s cond
            for child in node.children:
                child_path = path.copy()
                if child.cond is not None:
                    child_path.append(child.cond)
                queue.append((child, child_path))

        layers.append(current_layer)

    return layers, branch_ends, branch_starts


def parse_args():
    parser = argparse.ArgumentParser(
        description="Load HLS solution directories from a text file"
    )
    parser.add_argument(
        'list_file',
        help='Path to a TXT file containing one HLS solution directory per line'
    )
    parser.add_argument(
        'bram_json',
        help='Path to the JSON file (e.g. BRAM_name.json) containing BRAM name mappings'
    )
    parser.add_argument(
        'axi_interface_mapping_json',
        help='Path to the JSON file containing AXI interface mappings'
    )
    return parser.parse_args()


JSON_file_path = './configuration_final_generate/'
generated_inst_path = './configuration_inst_generate/'
program_tree_path = './program_tree/'
config_JSON_file_path = './configuration_JSON/'
os.makedirs(JSON_file_path, exist_ok=True)
os.makedirs(generated_inst_path, exist_ok=True)
os.makedirs(program_tree_path, exist_ok=True)
os.makedirs(config_JSON_file_path, exist_ok=True)

args = parse_args()
    # 1) check the list file exists
if not os.path.isfile(args.list_file):
    sys.exit(f"Error: list file {args.list_file!r} not found")

# 2) read & clean each non-empty line
with open(args.list_file, 'r') as f:
    HLS_project_solution_path_program_list = [
        line.strip() for line in f
        if line.strip()
    ]

# 3) (optional) verify each path is a directory, warn if not
for p in HLS_project_solution_path_program_list:
    if not os.path.isdir(p):
        print(f"Warning: {p!r} does not exist or is not a directory", file=sys.stderr)
        # os.makedirs(p)  # ← uncomment to auto-create missing dirs

# 4) now you can use HLS_project_solution_path_program_list as usual
print("Loaded paths:")
for p in HLS_project_solution_path_program_list:
    print("  ", p)

storage_info_program_list = []
BRAM_name_program_list = []
BRAM_name_1p_program_list = []
BRAM_name_2p_program_list = []
adapter_info_program_list = []
interface_name_program_list = []
port_info_program_list = []
axi_interface_port_input_program_list = []
axi_interface_port_output_program_list = []
port_control_name_program_list = []
original_port_control_name_program_list = []
transitions_program_list = []
head_program_list = []
function_call_in_out_info_program_list = []
FSM_info_program_list = []
bram_info_program_list = []
name_mapping_program_list = []
axi_io_interface_information_program_list = []
axi_port_mapping_program_list = []
axi_reg_mapping_program_list = []
original_port_control_name_list_mapping_program_list = []
result_program_list = []

op_program_list = []
op_program_list_full = []
instance_call_program_list = []
func_call_program_list = []
func_call_key_program_list = []

full_port_name_list_bram_ce_address_program_list = []
full_port_name_list_bram_ce_address_program_func_call_list = []
full_port_name_list_bram_ce_address_program_input_func_call_list = []
full_port_name_list_bram_ce_address_program_output_func_call_list = []
full_port_name_list_bram_ce_address_program_input_func_call_branch_list = []
full_port_name_list_bram_ce_address_program_output_func_call_branch_list = []
full_port_name_list_bram_ce_address_program_output_func_call_list = []
sel_signal_length_bram_ce_address_program_list = []
sel_signal_status_bram_ce_address_program_list = []

full_port_name_list_bram_we_d0_program_list = []
full_port_name_list_bram_we_d0_program_func_call_list = []
full_port_name_list_bram_we_d0_program_output_func_call_list = []
full_port_name_list_bram_we_d0_program_output_func_call_branch_list = []
sel_signal_length_bram_we_d0_program_list = []
sel_signal_status_bram_we_d0_program_list = []

full_port_axi_interface_name_input_program_list = [] 
full_port_axi_interface_name_input_func_call_program_list = [] 
full_port_axi_interface_name_input_func_call_program_branch_list = [] 
sel_signal_axi_interface_length_input_program_list = [] 
sel_signal_axi_interface_status_input_program_list = []

full_port_axi_interface_name_output_program_list = [] 
full_port_axi_interface_name_output_func_call_program_list = [] 
full_port_axi_interface_name_output_func_call_program_branch_list = [] 
sel_signal_axi_interface_length_output_program_list = [] 
sel_signal_axi_interface_status_output_program_list = []

branch_condition_mapping_choices_program_list = []

root_program_list = []
layers_program_list = []
start_point_program_list = []
all_nodes_head_values_program_list = []

instance_map_program_list = []

for i in range (len(HLS_project_solution_path_program_list)):
    HLS_project_solution_path = HLS_project_solution_path_program_list[i]
    tree = ET.parse(HLS_project_solution_path + '.autopilot/db/design.bindinfo.xml')  # replace with your actual XML filename
    root = tree.getroot()
    storage_info = []
    for node in root.findall('.//BindNode[@BINDTYPE="storage"]'):
        optype = node.get('OPTYPE')
        rtlname = node.get('RTLNAME')
        variable = node.get('VARIABLE')
        storagesize = node.get('STORAGESIZE').split()

        size1, size2, size3 = storagesize if len(storagesize) == 3 else (None, None, None)

        storage_info.append([optype, rtlname, variable, size1, size2, size3])
    storage_info_program_list.append(storage_info)
    BRAM_name_list = []
    BRAM_name_1p_list = []
    BRAM_name_2p_list = []
    #print("the value of storage info is:", storage_info)
    for i in range (len(storage_info)):
        if (storage_info[i][0] == "ram_1p") or (storage_info[i][0] == "ram_2p") or (storage_info[i][0] == "ram_s2p") or (storage_info[i][0] == "ram_t2p"):
            BRAM_name_list.append(storage_info[i][2])
            if "1p" in storage_info[i][0]:
                BRAM_name_1p_list.append(storage_info[i][2])   
            if "2p" in storage_info[i][0]:
                BRAM_name_2p_list.append(storage_info[i][2])
    BRAM_name_program_list.append(BRAM_name_list) 
    BRAM_name_1p_program_list.append(BRAM_name_1p_list)
    BRAM_name_2p_program_list.append(BRAM_name_2p_list)

    adapter_info = []
    for node in root.findall('.//BindNode[@BINDTYPE="adapter"]'):
        rtlname = node.get('RTLNAME')
        bundlename = node.get('BUNDLEDNAME')
        storagesubtype = node.get('STORAGESUBTYPE')
        adapter_info.append([rtlname, bundlename, storagesubtype])
    adapter_info_program_list.append(adapter_info)

    interface_name_list = []
    for i in range (len(adapter_info)):
        if adapter_info[i][2] == 'm_axi':
            interface_name_list.append(adapter_info[i][1])
    interface_name_program_list.append(interface_name_list)

    tree = ET.parse(HLS_project_solution_path + '.autopilot/db/top.adb.xml')
    root = tree.getroot()
    port_info = []
    # Now you can navigate through the XML tree
    for port in root.findall('.//port'):
        port_id = port.get('id')
        port_name = port.get('name')
        port_dir = port.get('dir')
        
        core_elem = port.find('core')
        core_val = core_elem.text if core_elem is not None else 'NULL'
        
        stg_elem = port.find('StgValue/ssdm')
        stg_name = stg_elem.get('name') if stg_elem is not None else 'NULL'

        if_type = port.get('iftype')
        
        port_info.append([port_id, port_name, port_dir, core_val, stg_name, if_type])
    port_info_program_list.append(port_info)

    axi_interface_port_input_list = []
    axi_interface_port_output_list = []
    for i in range (len(port_info)):
        if (port_info[i][5] == '4'):
            if (port_info[i][2] == '0'):
                axi_interface_port_input_list.append(port_info[i][1])
            if (port_info[i][2] == '1'):
                axi_interface_port_output_list.append(port_info[i][1])
    axi_interface_port_input_program_list.append(axi_interface_port_input_list)
    axi_interface_port_output_program_list.append(axi_interface_port_output_list)

    port_control_name_list = []
    original_port_control_name_list = []
    for i in range (len(port_info)):
        if port_info[i][5] == '0':
            port_control_name_list.append(port_info[i][1] + '_read')

    for i in range (len(port_info)):
        if port_info[i][5] == '0':
            original_port_control_name_list.append(port_info[i][1])
    port_control_name_program_list.append(port_control_name_list)
    original_port_control_name_program_list.append(original_port_control_name_list)

    tree = ET.parse(HLS_project_solution_path + '.autopilot/db/top.adb.xml')
    root = tree.getroot()
    # Initialize a list to store the transitions information
    transitions = []

    # Loop through each <trans> element found in the <trans_list>
    for trans in root.find("trans_list").findall("trans"):
        # Extract the 'id', 'from', and 'to' attributes from the <trans> element
        trans_id = trans.attrib.get("id")
        trans_from = trans.attrib.get("from")
        trans_to = trans.attrib.get("to")
        
        # Try to find the <literal> tag inside the nested structure.
        literal_elem = trans.find(".//literal")
        if literal_elem is not None:
            literal_name = literal_elem.attrib.get("name")
            literal_val = literal_elem.attrib.get("val")
        else:
            literal_name = None
            literal_val = None
        
        # Append the collected information as a dictionary in the list
        transitions.append({
            "id": trans_id,
            "from": trans_from,
            "to": trans_to,
            "literal_name": literal_name,
            "literal_val": literal_val
        })

    transitions_program_list.append(transitions)
    # branch_condition_mapping = {}
    # for t in transitions:
    #     name = t['literal_name']
    #     val  = t['literal_val']
    #     if name is not None:
    #         branch_condition_mapping.setdefault(name, []).append(val)
    # print("the value of branch_condition_mapping is:", branch_condition_mapping)
    # branch_condition_mapping_choices = generate_branch_choices(branch_condition_mapping)
    # branch_condition_mapping_choices_program_list.append(branch_condition_mapping_choices)
    #print("the value of branch_condition_mapping choices are:", branch_condition_mapping_choices)
    #print("the value of branch_condition_mapping_choices_program_list are:", branch_condition_mapping_choices_program_list)
    print("the value of transitions_program_list is:", transitions)
    #root = build_ll_tree(transitions, branch_condition_mapping)
    root = build_ll_tree(transitions)
    root_program_list.append(root)
    # 1. Pretty-print the structure
    print("Tree of linked-list segments:")
    print_ll_tree(root)

    
    #layers = bfs_heads_conds_paths_by_layer(root)
    layers, branch_ends, start_point = bfs_heads_conds_paths_by_layer(root)
    # If you want just the integer values of each ListNode:
    print("the value of layers_program_list is:")
    layers_program_list.append(layers)
    print("the BFS result of the tree is:")
    print(layers)
    
    print("the value of branch ends are:")
    print(branch_ends)
    
    print("the value of branch starts are:")
    print(start_point)
    start_point_program_list.append(start_point)
    branch_condition_mapping_choices = []
    for m in range (len(branch_ends)):
        branch_condition_mapping_choices.append(branch_ends[m][2])        
    print("the value of branch_condition_mapping_choices is:", branch_condition_mapping_choices)
    branch_condition_mapping_choices_program_list.append(branch_condition_mapping_choices)
    
    # 2. Collect *all* SegmentNodes
    all_nodes = collect_nodes(root)
    print("\nAll SegmentNodes:", all_nodes)
    all_nodes_head_values = [node.head.val for node in all_nodes if node.head is not None]
    all_nodes_head_values_program_list.append(all_nodes_head_values)
    # 3. Collect leaf segments + required conditions
    leaves = collect_leaf_paths(root)
    print("the values of the leaves are:",leaves)
    print("\nLeaf paths with selection conditions:")
    for leaf, conds in leaves:
        seg = _ll_to_str(leaf.head)
        cond_str = " ∧ ".join(f"{n}:{v}" for n, v in conds) or "(root)"
        print(f"  {seg}   ←  {cond_str}")
    
    head_program_list.append(root)

    result = parse_state_list(tree)
    
    result_program_list.append(result)
    final_info, final_condition_info = extract_instruction_info(result)
    
    filtered_final_info, filtered_final_info_condition = filter_final_info(final_info, final_condition_info)
    # print("the value of final info is:", filtered_final_info)
    # print("the value of final condition info is:", filtered_final_info_condition)

    function_call_in_out_info_list = get_in_out_direction(filtered_final_info, HLS_project_solution_path)
    function_call_in_out_info_program_list.append(function_call_in_out_info_list)
    #pprint(function_call_in_out_info_list)
    FSM_info_list = []

    for i in range (len(filtered_final_info)):
        sub_FSM_info_list = []
        sub_FSM_info_list.append(i+1)
        if len(filtered_final_info[i]) > 0:
            func_call_info_list_summary = []
            for j in range (len(filtered_final_info[i])):
                func_call_info_list = []
                func_call_info_list.append(filtered_final_info[i][j][0])
                input_list = []
                output_list = []
                bram_input_list = []
                bram_output_list = []
                interface_input_list = []
                interface_output_list = []
                interface_list = []
                port_control_input_list = []
                port_control_output_list = []
                all_list = []
                for k in range (len(function_call_in_out_info_list[i][j])):
                    #print("the current value of i j is:", i, j)
                    all_list.append(filtered_final_info[i][j][k+1])
                    if function_call_in_out_info_list[i][j][k][2] == '0' or function_call_in_out_info_list[i][j][k][2] == '2':
                        input_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in BRAM_name_list:
                            bram_input_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in interface_name_list:
                            interface_input_list.append(filtered_final_info[i][j][k+1])
                            interface_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in port_control_name_list:
                            port_control_input_list.append(filtered_final_info[i][j][k+1])
                    if function_call_in_out_info_list[i][j][k][2] == '1' or function_call_in_out_info_list[i][j][k][2] == '2':
                        output_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in BRAM_name_list:
                            bram_output_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in interface_name_list:
                            interface_output_list.append(filtered_final_info[i][j][k+1])
                            interface_list.append(filtered_final_info[i][j][k+1])
                        if filtered_final_info[i][j][k+1] in port_control_name_list:
                            port_control_output_list.append(filtered_final_info[i][j][k+1]) 

                func_call_info_list.append(input_list)
                func_call_info_list.append(output_list)
                func_call_info_list.append(bram_input_list)
                func_call_info_list.append(bram_output_list)
                func_call_info_list.append(interface_input_list)
                func_call_info_list.append(interface_output_list)
                func_call_info_list.append(port_control_input_list)
                func_call_info_list.append(port_control_output_list)
                func_call_info_list.append(all_list)
                func_call_info_list.append(interface_list)
                func_call_info_list.append(filtered_final_info_condition[i][j])
                func_call_info_list_summary.append(func_call_info_list)
            sub_FSM_info_list.append(func_call_info_list_summary)
        else:
            sub_FSM_info_list.append([])
        FSM_info_list.append(sub_FSM_info_list)
    
    FSM_info_program_list.append(FSM_info_list)

    groups = OrderedDict()
    
    for entry in storage_info:
        name = entry[0]
        if '1p' in name:
            entry[0] = 'ram_1p'
        elif '2p' in name:
            entry[0] = 'ram_2p'
    
    for entry in storage_info:
        bram_type, _, orig_name, bitwidth, addressrange, *_ = entry
        key = (bram_type, bitwidth, addressrange)
        groups.setdefault(key, []).append(entry)

    # 2) Build the 3D list and name mapping
    bram_info_list = []
    name_mapping   = {}

    for (bram_type, bitwidth, addressrange), entries in groups.items():
        sublist = []
        for idx, entry in enumerate(entries, start=1):
            _, _, orig_name, bw_str, ar_str, *_ = entry
            datawidth     = int(bw_str)
            addressrange  = int(ar_str)
            addresswidth  = (addressrange - 1).bit_length()
            new_name      = f"{bram_type}_{datawidth}_{addressrange}_{idx}_U"

            # append to the 3D list
            sublist.append([new_name, datawidth, addressrange, addresswidth])
            # record mapping from original buffer name to new_name
            name_mapping[orig_name] = new_name

        bram_info_list.append(sublist)

    bram_info_program_list.append(bram_info_list)
    name_mapping_program_list.append(name_mapping)
    
    # print("the value of bram_info_program_list is:", bram_info_program_list)
    # print("the value of name_mapping_program_list is:", name_mapping_program_list)

    axi_io_interface_xml_file = HLS_project_solution_path + "/.autopilot/db/top-io-fe.xml"
    axi_io_interface_information_list = parse_axi_interface_info(axi_io_interface_xml_file)
    for row in axi_io_interface_information_list:
        row[3] = row[3].replace('*', '')
    axi_io_interface_information_program_list.append(axi_io_interface_information_list)

    axi_port_mapping = build_axi_mapping(axi_io_interface_information_list, prefix="axi_dram")
    axi_reg_mapping = build_axi_reg_mapping(axi_io_interface_information_list, prefix="axi_dram")
    
    print("the value of axi_port_mapping is:", axi_port_mapping)
    print("the value of original port control name list is:", original_port_control_name_list)

    original_port_control_name_list_mapping = []
    for i in range (len(original_port_control_name_list)):
        if original_port_control_name_list[i] in axi_port_mapping.keys():
            original_port_control_name_list_mapping.append(axi_port_mapping[original_port_control_name_list[i]]) 

    axi_port_mapping_program_list.append(axi_port_mapping)
    axi_reg_mapping_program_list.append(axi_reg_mapping)
    original_port_control_name_list_mapping_program_list.append(original_port_control_name_list_mapping) 


    files = [HLS_project_solution_path + "syn/verilog/top.v"]  # your Verilog sources
    instance_map = build_instance_map(files)
    
    instance_map_program_list.append(instance_map)

    op_list = []
    op_list_full = []
    for cycle, ops in FSM_info_list:
        for op in ops:
            op_list_full.append(op[0])
            if op[0] not in op_list:
                op_list.append(op[0])
    
    op_program_list.append(op_list)
    op_program_list_full.append(op_list_full)

    
    initial_state = 0
    end_state = 2
    start_state = 1
    #load_inst_state = 3
    
    
    instance_call_list = []
    func_call_list = []
    func_call_key_list = []
    for i in range(len(op_list)):
        func_call = op_list[i]
        func_call_list.append(func_call)
        key = "top_" + func_call
        func_call_key_list.append(key)
        names = instance_map.get(key, [])
        full_name = names[0]
        instance_call_list.append(full_name)

    instance_call_program_list.append(instance_call_list)
    func_call_program_list.append(func_call_list)
    func_call_key_program_list.append(func_call_key_list)

# def group_bram_instances(
#     all_bram_lists: List[List[str]],
#     bram_name_program_list: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     all_bram_lists:  For each program p, a list of BRAM “base” names, e.g.
#         [
#           ['BRAM_image_input', 'BRAM_conv_weight', 'BRAM_conv_bias', 'BRAM_buffer_1'],
#           ['BRAM_image_input', 'BRAM_conv_weight', 'BRAM_conv_bias', 'BRAM_buffer_1', 'BRAM_buffer_2'],
#           ...
#         ]

#     bram_name_program_list: For each program p, a flat list of instance‐names, e.g.
#         [
#           ['BRAM_image_input_0', 'BRAM_image_input_1', ..., 'BRAM_conv_weight_3_3', 'BRAM_buffer_1_0', ...],
#           ['BRAM_image_input_0', 'BRAM_image_input_1', ..., 'BRAM_buffer_2_3'],
#           ...
#         ]

#     Returns: a List (over programs) of “program‐groups.”  Each “program‐groups” is itself a list of groups,
#     where each group is a list of instance‐names that share the same <base> (and same leading “module” prefix).

#     Implementation details:
#       1. We sort the bases by descending length so that, e.g., "BRAM_buffer_12" is tested before "BRAM_buffer_1".
#       2. For each instance‐name, we find the first (longest) base whose pattern matches.
#          We use a regex of the form:
#              r"^(.+?)_<base>(?:_|$)"
#          which captures everything up to "_<base>" as the “module” and ensures we only match if
#          the instance actually has “_<base>” (possibly followed by more "_digits").
#       3. We bucket each instance under its matched “base → module” pair.
#       4. Finally, we re‐emit those buckets in the **original** base‐order, flattening over modules.
#     """
#     all_grouped: List[List[List[str]]] = []

#     for bases, instances in zip(all_bram_lists, bram_name_program_list):
#         # 1) Prepare an empty OrderedDict for each base, to collect “module → [instances]”
#         buckets = { base: OrderedDict() for base in bases }

#         # 2) Sort bases by descending length so longer names get priority
#         sorted_bases = sorted(bases, key=lambda b: len(b), reverse=True)

#         # 3) For each instance, find the first base it matches:
#         for inst in instances:
#             for base in sorted_bases:
#                 # regex: ^(module_name)_<base>(?:_|$)
#                 #  - (. +?)  lazily captures everything before “_base”
#                 #  - (?:_|$) ensures either “_<more>” or “end‐of‐string”
#                 pattern = re.compile(rf"^(.+?)_{re.escape(base)}(?:_|$)")
#                 m = pattern.match(inst)
#                 if not m:
#                     continue

#                 module = m.group(1)
#                 # bucket under (base → module)
#                 if module not in buckets[base]:
#                     buckets[base][module] = []
#                 buckets[base][module].append(inst)
#                 break
#             # if no base matched, we simply ignore that inst

#         # 4) Now collect groups in the original base‐order, flattening over modules
#         prog_groups: List[List[str]] = []
#         for base in bases:
#             for module, names in buckets[base].items():
#                 prog_groups.append(names)

#         all_grouped.append(prog_groups)

#     return all_grouped


# def group_bram_instances(
#     all_bram_list: List[List[str]],
#     bram_name_program_list: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     all_bram_list: List of base names per program, e.g.
#         [['BRAM_image_input', 'BRAM_conv_weight', ...], ...]
#     bram_name_program_list: List of instance names per program, e.g.
#         [['BRAM_image_input', 'BRAM_image_input_0', ...], ...]
#     Returns a 3-level list where
#         grouped[p][i] = all instances in program p matching base all_bram_list[p][i]
#     """
#     grouped = []
#     for bases, instances in zip(all_bram_list, bram_name_program_list):
#         prog_groups = []
#         for base in bases:
#             # match "base" exactly or "base_<suffix>"
#             pattern = re.compile(rf'^{re.escape(base)}($|_)')
#             matches = [name for name in instances if pattern.match(name)]
#             prog_groups.append(matches)
#         grouped.append(prog_groups)
#     return grouped


# def group_bram_instances(
#     all_bram_list: List[List[str]],
#     bram_name_program_list: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     Groups BRAM instance names per-program.

#     A symbol is considered to belong to a base name if it matches
#         base            – an exact match, OR
#         base_<digits>   – a numeric suffix (e.g. _0, _1 …)

#     Bases that have **no** matching instances are skipped, so no empty
#     sub-lists appear in the result.
#     """
#     grouped: List[List[List[str]]] = []

#     for bases, instances in zip(all_bram_list, bram_name_program_list):
#         prog_groups: List[List[str]] = []
#         for base in bases:
#             pattern = re.compile(rf'^{re.escape(base)}(?:_\d+)?$')
#             matches = [name for name in instances if pattern.match(name)]
#             if matches:                   # ← skip empty buckets
#                 prog_groups.append(matches)
#         grouped.append(prog_groups)

#     return grouped


def group_bram_instances(
    all_bram_list: List[List[str]],
    bram_name_program_list: List[List[str]]
) -> List[List[List[str]]]:
    """
    Groups BRAM instance names per-program, allowing multiple numeric suffixes.
    """
    grouped: List[List[List[str]]] = []

    for bases, instances in zip(all_bram_list, bram_name_program_list):
        prog_groups: List[List[str]] = []
        for base in bases:
            # allow one or more _<digits> segments
            pattern = re.compile(rf'^{re.escape(base)}(?:_\d+)*$')
            matches = [name for name in instances if pattern.match(name)]
            if matches:
                prog_groups.append(matches)
        grouped.append(prog_groups)

    return grouped



# def group_bram_instances(all_bram_list, bram_name_program_list):
#     """
#     all_bram_list: List[List[str]]
#         e.g. [
#             ['BRAM_image_input', 'BRAM_conv_weight', ...],
#             [...]
#         ]
#     bram_name_program_list: List[List[str]]
#         e.g. [
#             ['BRAM_image_input_0', 'BRAM_image_input_1', ..., 'BRAM_conv_weight_0_0', ...],
#             [...]
#         ]
#     Returns: List[List[List[str]]]
#         grouped[prog_idx][base_idx] = list of instances for that base
#     """
#     grouped = []
#     for bases, instances in zip(all_bram_list, bram_name_program_list):
#         prog_groups = []
#         for base in bases:
#             # collect all instance names that start with "<base>_"
#             prog_groups.append(
#                 [name for name in instances if name.startswith(f"{base}_")]
#             )
#         grouped.append(prog_groups)
#     return grouped


################### Load the HLS C Program BRAM name #####################
with open(args.bram_json, "r") as f:
    data = json.load(f)
program_lists = data
for prog_name, bram_list in data.items():
    # this will create variables P1_list, P2_list, … in the global namespace
    globals()[f"{prog_name}_list"] = bram_list
all_bram_lists = list(data.values())
#print("the value of all_bram_list is:", all_bram_lists)
#print("the value of BRAM name program list is:", BRAM_name_program_list)
unroll_grouped_BRAM_name_program_list = group_bram_instances(all_bram_lists, BRAM_name_program_list)
print("the value of all bram lists is:", all_bram_lists)
print("the value of BRAM_name_program_list is:", BRAM_name_program_list)
print("the value of unroll_grouped_BRAM_name_program_list is:", unroll_grouped_BRAM_name_program_list)

########### Merge Step 1: Merge the BRAM buffer mapping #############
global_BRAM_def = { val for d in name_mapping_program_list for val in d.values() }
########### Merge Step 1: End #############

########### Merge Step 2: Merge the BRAM buffer mapping #############
global_axi_port_def = { val for d in axi_port_mapping_program_list for val in d.values() }
global_axi_reg_def = { val for d in axi_reg_mapping_program_list for val in d.values() }
########### Merge Step 2: End #############


# flatten three levels of nesting into one list of entries
BRAM_info_flattened = list(chain.from_iterable(
                chain.from_iterable(
                    bram_info_program_list
                )
            ))

# use a set of tuples to dedupe, then convert back to list of lists
bram_info_unique_list = [list(tup) for tup in {tuple(entry) for entry in BRAM_info_flattened}]

#print("the value of bram_info_unique_list is:", bram_info_unique_list)

bram_modules_1p = []
bram_modules_2p = []

for instance_name, datawidth, addressrange, addresswidth in bram_info_unique_list:
    # Choose module_name based on port type
    if "ram_1p" in instance_name:
        module_name = "top_input_buffer_RAM_AUTO_1R1W"
        bram_modules_1p.append({
            "module_name":   module_name,
            "instance_name": instance_name,
            "DataWidth":     datawidth,
            "AddressRange":  addressrange,
            "AddressWidth":  addresswidth
        })
    elif "ram_2p" in instance_name:
        module_name = "top_input_buffer_RAM_AUTO_2R2W"
        bram_modules_2p.append({
            "module_name":   module_name,
            "instance_name": instance_name,
            "DataWidth":     datawidth,
            "AddressRange":  addressrange,
            "AddressWidth":  addresswidth
        })

# Build configs
config_1p = {"BRAM_modules": bram_modules_1p}
config_2p = {"BRAM_modules": bram_modules_2p}

# Write JSON files
if bram_modules_1p:
    with open(os.path.join(JSON_file_path, "BRAM_module_1p.json"), "w") as f1:
        json.dump(config_1p, f1, indent=4)
if bram_modules_2p:
    with open(os.path.join(JSON_file_path, "BRAM_module_2p.json"), "w") as f2:
        json.dump(config_2p, f2, indent=4)

# print("the value of storage info program list:", storage_info_program_list)
# print("the value of bram_info_program_list is:", bram_info_program_list)

#pprint(FSM_info_program_list)
# bram_modules = []
# for group in bram_info_unique_list:
#     new_name, datawidth, addressrange, addresswidth = group
#     module_name = f"top_input_buffer_RAM_AUTO_1R1W"
#     bram_modules.append({
#         "module_name":   module_name,
#         "instance_name": new_name,
#         "DataWidth":     datawidth,
#         "AddressRange":  addressrange,
#         "AddressWidth":  addresswidth
#     })

# config = {
#     "BRAM_modules":      bram_modules
# }

# with open(JSON_file_path + "BRAM_module.json", "w") as f:
#     json.dump(config, f, indent=4)

merged_instance_call_program_list = []
merged_instance_call_program_realted_index_list = []
seen_keys = set()

program_index = 0
for instances, keys in zip(instance_call_program_list, func_call_key_program_list):
    for inst, key in zip(instances, keys):
        if key not in seen_keys:
            merged_instance_call_program_list.append(inst)
            merged_instance_call_program_realted_index_list.append(program_index)
            seen_keys.add(key)
    program_index = program_index + 1

merged_func_call_key_program_list = []
seen = set()

for sublist in func_call_key_program_list:
    for key in sublist:
        if key not in seen:
            merged_func_call_key_program_list.append(key)
            seen.add(key)

# print("merged instance call:",instance_call_program_list)
# print("merged instance call:",func_call_key_program_list)
# print("merged instance call:",merged_instance_call_program_realted_index_list)
# print("merged_instance_call_program_list is:",merged_instance_call_program_list)
# print("merged_func_call_key_program_list is:",merged_func_call_key_program_list)
scheduled_states_program_list = []
current_state = -1
for i in range (len(merged_instance_call_program_list)):
    current_state = current_state + 1
    while (current_state == initial_state or current_state == end_state or current_state == start_state):
        current_state = current_state + 1
    scheduled_states_program_list.append(current_state)

func_call_key_program_index_list = []
for i in range (len(func_call_key_program_list)):
    func_call_key_index_list = []
    for j in range (len(func_call_key_program_list[i])):
        index = merged_func_call_key_program_list.index(func_call_key_program_list[i][j])
        func_call_key_index_list.append(scheduled_states_program_list[int(index)])
    func_call_key_program_index_list.append(func_call_key_index_list)

# print("the value of func call key program index list is:", func_call_key_program_index_list)    
# print("the value of func call key program list is:", func_call_key_program_list)
# print("the value of merged func call program list is:", merged_func_call_key_program_list)
# print("the value of merged instance call program list is:", merged_instance_call_program_list)
# print("the value of instance call program list is:", instance_call_program_list)

def extract_func_call_interface(
    solution_paths: List[str],
    func_call_keys: List[str],
    func_call_prog_indices: List[int]
) -> List[List[str]]:
    """
    For each func_call_keys[i]:
      1. Look up its program index func_call_prog_indices[i]
      2. Pick the solution path at that index
      3. Under <solution>/.autopilot/db, open <func_name>.verbose.rpt.xml
         (where func_name is func_call_keys[i] with "top_" stripped)
      4. Parse the XML and extract all the <column name="..."> attributes
         under the Interface → Summary table.
    Returns a list of lists of port-names aligned with func_call_keys.
    """
    interfaces_per_call = []

    for key, prog_idx in zip(func_call_keys, func_call_prog_indices):
        sol_path = solution_paths[prog_idx]
        # strip "top_" prefix if present
        func_name = key[len("top_"):] if key.startswith("top_") else key

        xml_path = os.path.join(sol_path, ".autopilot", "db", f"{func_name}.verbose.rpt.xml")
        if not os.path.isfile(xml_path):
            raise FileNotFoundError(f"Could not find XML report at {xml_path}")

        tree = ET.parse(xml_path)
        root = tree.getroot()

        # find the <section name="Interface">
        iface_sec = root.find('.//section[@name="Interface"]')
        if iface_sec is None:
            raise ValueError(f"No Interface section in {xml_path}")

        # under that, find <item name="Summary"> → <table> → all <column> tags
        summary = iface_sec.find('.//item[@name="Summary"]/table')
        if summary is None:
            raise ValueError(f"No Summary table in Interface section of {xml_path}")

        ports = [col.attrib["name"] for col in summary.findall(".//column")]
        interfaces_per_call.append(ports)

    return interfaces_per_call

func_call_interface_name_list = extract_func_call_interface(
    HLS_project_solution_path_program_list,
    merged_func_call_key_program_list,
    merged_instance_call_program_realted_index_list
)

#print("the value of func_call_interface_name_list is:", func_call_interface_name_list)

modules = [
    {"name": name, "fsm_index": idx}
    for name, idx in zip(merged_instance_call_program_list, scheduled_states_program_list)
]
output = {"modules": modules}
with open(JSON_file_path + "FU_start_reg.json", "w") as f:
    json.dump(output, f, indent=2)

modules = [
    {"name": name}
    for name in merged_instance_call_program_list
]
output = {"modules": modules}
with open(JSON_file_path + "ap_done_trigger.json", "w") as f:
    json.dump(output, f, indent=2)

current_instruction_length = 0
total_states_need = len(merged_func_call_key_program_list) + 3
current_instruction_length = current_instruction_length + total_states_need

#print("the value of name mapping program list is:", name_mapping_program_list)

def map_grouped_to_BRAM_module(grouped, name_mapping_program_list):
    """
    grouped: List[List[List[str]]]
        grouped[i][j] is a list of instance-names for program i, base j
    name_mapping_program_list: List[Dict[str,str]]
        name_mapping_program_list[i] maps each instance-name → mapped RAM name for program i
    Returns: List[List[List[str]]]
        same shape as grouped, but with each instance replaced by its mapped RAM name
    """
    mapped = []
    for prog_groups, mapping in zip(grouped, name_mapping_program_list):
        prog_mapped = []
        for group in prog_groups:
            # look up each instance in the mapping dict
            prog_mapped.append([ mapping[inst] for inst in group ])
        mapped.append(prog_mapped)
    return mapped

unroll_grouped_BRAM_name_program_mapped_list = map_grouped_to_BRAM_module(unroll_grouped_BRAM_name_program_list, name_mapping_program_list)
#print("the value of unroll_grouped_BRAM_name_program_mapped_list is:", unroll_grouped_BRAM_name_program_mapped_list)
print("the value of unroll_grouped_BRAM_name_program_list is:")
print(unroll_grouped_BRAM_name_program_list)
print("the value of name mapping program list is:")
print(name_mapping_program_list)

def merge_two_groups(
    grpA: List[List[Any]],
    grpB: List[List[Any]]
) -> List[List[Any]]:
    """
    Merge two group-lists grpA and grpB:
      - For each pair (a, b), if they intersect, carve out inter = a ∩ b,
        append inter as a new group, and remove inter from both a and b.
      - After processing all pairs, any remaining elements in a or b
        become their own groups.
    Returns a new list of groups (lists).
    """
    # turn each sublist into a mutable set
    setsA = [set(g) for g in grpA]
    setsB = [set(g) for g in grpB]
    # copies we’ll subtract from
    remA = [s.copy() for s in setsA]
    remB = [s.copy() for s in setsB]
    merged = []

    # carve out intersections
    for i, sA in enumerate(setsA):
        for j, sB in enumerate(setsB):
            inter = remA[i] & remB[j]
            if inter:
                merged.append(inter)
                remA[i] -= inter
                remB[j] -= inter

    # whatever’s left becomes its own group
    for s in remA + remB:
        if s:
            merged.append(s)

    # back to lists
    return [list(s) for s in merged]

def merge_grouped_unrolled_BRAM(
    programs: List[List[List[Any]]]
) -> List[List[Any]]:
    """
    programs: a list of program-groupings. Each program-grouping is
      itself a list of groups (each group is a list of items).
    Returns one merged list of groups.
    """
    if not programs:
        return []
    merged = programs[0]
    for prog in programs[1:]:
        merged = merge_two_groups(merged, prog)
    return merged

def merge_grouped_unrolled_BRAM_q0(
    programs: List[List[List[Any]]]
) -> List[List[Any]]:
    """
    programs: a list of program-groupings. Each program-grouping is
      itself a list of groups (each group is a list of items).
    Returns one merged list of groups.
    """
    if not programs:
        return []
    merged = programs[0]
    for prog in programs[1:]:
        merged = merge_two_groups(merged, prog)
    return merged

def find_bram_group_index(merged_list, bram_name):
    """
    merged_list: List[List[str]] — your merged_grouped_unrolled_BRAM_list
    bram_name:   str         — the name you’re looking for
    Returns the index of the sub-list that contains bram_name, or -1 if not found.
    """
    for idx, group in enumerate(merged_list):
        if bram_name in group:
            return idx
    return -1

def find_bram_q0_group_index(merged_list, bram_name):
    """
    merged_list: List[List[str]] — your merged_grouped_unrolled_BRAM_list
    bram_name:   str         — the name you’re looking for
    Returns the index of the sub-list that contains bram_name, or -1 if not found.
    """
    for idx, group in enumerate(merged_list):
        if bram_name in group:
            return idx
    return -1

merged_grouped_unrolled_BRAM_list = merge_grouped_unrolled_BRAM(unroll_grouped_BRAM_name_program_mapped_list)
# print("the value of unroll_grouped_BRAM_name_program_mapped_list is:", unroll_grouped_BRAM_name_program_mapped_list)
# print("the value of merged_grouped_unrolled_BRAM_list is:", merged_grouped_unrolled_BRAM_list)
# print("the value of unroll_grouped_BRAM_name_program_mapped_list is:")
# print(unroll_grouped_BRAM_name_program_mapped_list)

func_call_name_to_instance_call_name = dict(zip(merged_func_call_key_program_list,
                        merged_instance_call_program_list))
# pprint(bram_info_program_list)
# pprint(full_port_name_list_bram_ce_address_program_func_call_list)
#print("the value of func_call_name_to_instance_call_name is:", func_call_name_to_instance_call_name)

merged_func_call_bram_port_name_list = []
for i in range (len(merged_func_call_key_program_list)):
    function_call = merged_func_call_key_program_list[i]
    short_func_call = function_call.removeprefix("top_")
    func_call_program_index = merged_instance_call_program_realted_index_list[i]
    func_call_bram_port_name_list = get_func_call_bram_port_name(short_func_call, func_call_program_index, HLS_project_solution_path_program_list)
    merged_func_call_bram_port_name_list.append(func_call_bram_port_name_list)
#print("the value of merged_func_call_bram_port_name_list is:", merged_func_call_bram_port_name_list)

def get_bram_port_counts(verilog_file, module_name):
    """
    Parse `verilog_file`, find module `module_name`, and count how many
    address ports each BRAM has by inspecting its interface (input/output) declarations.
    Returns a dict: { 'BRAM_name': num_ports, … }
    """
    ast, _ = parse([verilog_file])
    # pyverilog builds a Source → Description → ModuleDef hierarchy
    for source in ast.children():
        for module in source.children():
            if isinstance(module, ModuleDef) and module.name == module_name:
                counts = defaultdict(set)
                # module.items contains Decl nodes
                for item in module.items:
                    if isinstance(item, Decl):
                        for decl in item.list:
                            if isinstance(decl, (Input, Output, Inout)):
                                m = re.match(r'(\w+)_address(\d+)$', decl.name)
                                if m:
                                    bram = m.group(1)             # e.g. "BRAM_buffer_1"
                                    idx  = int(m.group(2))        # e.g. 0 or 1
                                    counts[bram].add(idx)
                # convert sets {0,1}->{2}, {0}->{1}, etc.
                return { bram: max(idxs) + 1 for bram, idxs in counts.items() }
    # not found or no ports
    return {}


#HLS_project_solution_path
all_counts = []
for i in range (len(merged_func_call_key_program_list)):
    verilog_file = HLS_project_solution_path_program_list[int(merged_instance_call_program_realted_index_list[i])] + 'impl/verilog/' + merged_func_call_key_program_list[i] + '.v'
    counts = get_bram_port_counts(verilog_file, merged_func_call_key_program_list[i])
    all_counts.append(counts)
#print("the value of all_count is:", all_counts)

#print("the value of FSM info program list is:")
#pprint(FSM_info_program_list[0])
with open("fsm_info_output.txt", "w") as f:
    # write the header line
    f.write("the value of FSM info program list is:\n")
    # pretty‑print the first element into the file
    pprint.pprint(FSM_info_program_list[0], stream=f)

#print("the value of branch_condition_mapping_choices_program_list is:", branch_condition_mapping_choices_program_list)


##################### Generate BRAM address ce sel signal #################
print("the value of BRAM name program list is:", BRAM_name_program_list)
print("the value of BRAM name 1p program list is:", BRAM_name_1p_program_list)
print("the value of BRAM name 2p program list is:", BRAM_name_2p_program_list)
for i in range (len(HLS_project_solution_path_program_list)):
    full_port_name_list_bram_ce_address_list = []
    full_port_name_list_bram_ce_address_func_call_list = []
    full_port_name_list_bram_ce_address_input_func_call_list = []
    full_port_name_list_bram_ce_address_output_func_call_list = []
    sel_signal_length_bram_ce_address_list = []
    sel_signal_status_bram_ce_address_list = []
    for j in range (len(BRAM_name_program_list[i])):
        full_port_name_list_bram_ce_address, sel_signal_length_bram_ce_address, sel_signal_status_bram_ce_address, full_port_name_list_bram_ce_address_func_call, full_port_name_list_bram_ce_address_input_func_call, full_port_name_list_bram_ce_address_output_func_call = generate_BRAM_ce_address(FSM_info_program_list[i], BRAM_name_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_port_name_list_bram_ce_address_list.append(full_port_name_list_bram_ce_address)
        sel_signal_length_bram_ce_address_list.append(sel_signal_length_bram_ce_address)
        sel_signal_status_bram_ce_address_list.append(sel_signal_status_bram_ce_address)
        full_port_name_list_bram_ce_address_func_call_list.append(full_port_name_list_bram_ce_address_func_call)
        full_port_name_list_bram_ce_address_input_func_call_list.append(full_port_name_list_bram_ce_address_input_func_call)
        full_port_name_list_bram_ce_address_output_func_call_list.append(full_port_name_list_bram_ce_address_output_func_call)

    full_port_name_list_bram_ce_address_program_func_call_list.append(full_port_name_list_bram_ce_address_func_call_list)
    full_port_name_list_bram_ce_address_program_input_func_call_list.append(full_port_name_list_bram_ce_address_input_func_call_list)
    full_port_name_list_bram_ce_address_program_output_func_call_list.append(full_port_name_list_bram_ce_address_output_func_call_list)
    full_port_name_list_bram_ce_address_program_list.append(full_port_name_list_bram_ce_address_list)
    sel_signal_length_bram_ce_address_program_list.append(sel_signal_length_bram_ce_address_list)
    sel_signal_status_bram_ce_address_program_list.append(sel_signal_status_bram_ce_address_list)


for i in range (len(HLS_project_solution_path_program_list)):
    full_port_name_list_bram_ce_address_input_func_call_branch_list_temp = []
    full_port_name_list_bram_ce_address_output_func_call_branch_list_temp = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        full_port_name_list_bram_ce_address_input_func_call_branch_list = []
        full_port_name_list_bram_ce_address_output_func_call_branch_list = []
        for j in range (len(BRAM_name_program_list[i])):
            full_port_name_list_bram_ce_address_input_func_call, full_port_name_list_bram_ce_address_output_func_call = generate_BRAM_ce_address_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][m], i)
            full_port_name_list_bram_ce_address_input_func_call_branch_list.append(full_port_name_list_bram_ce_address_input_func_call)
            full_port_name_list_bram_ce_address_output_func_call_branch_list.append(full_port_name_list_bram_ce_address_output_func_call)
        full_port_name_list_bram_ce_address_input_func_call_branch_list_temp.append(full_port_name_list_bram_ce_address_input_func_call_branch_list)
        full_port_name_list_bram_ce_address_output_func_call_branch_list_temp.append(full_port_name_list_bram_ce_address_output_func_call_branch_list)
    full_port_name_list_bram_ce_address_program_input_func_call_branch_list.append(full_port_name_list_bram_ce_address_input_func_call_branch_list_temp)
    full_port_name_list_bram_ce_address_program_output_func_call_branch_list.append(full_port_name_list_bram_ce_address_output_func_call_branch_list_temp)
    
            
            
               

# print("the value of full_port_name_list_bram_ce_address_program_func_call_list is:", full_port_name_list_bram_ce_address_program_func_call_list)
# #print("the value of fsm info program list is:")
# print("the value of bram_info_program_list is:", bram_info_program_list)
print("the value of BRAM name program list is:", BRAM_name_program_list)
print("the value of name mapping program list:", name_mapping_program_list)
BRAM_name_mapped_program_list = [
    [mapping[name] for name in names]
    for names, mapping in zip(BRAM_name_program_list, name_mapping_program_list)
]
# print("the value of BRAM_name_mapped_program_list is:", BRAM_name_mapped_program_list)
#print("the value of full_port_name_list_bram_ce_address_program_func_call_list is:", full_port_name_list_bram_ce_address_program_func_call_list)
#print("the value of BRAM_name_mapped_program_list is:", BRAM_name_mapped_program_list)
bram_address_ce_func_mapping = build_ram_to_buffers(BRAM_name_mapped_program_list, full_port_name_list_bram_ce_address_program_func_call_list)

# print("the value of BRAM_name_mapped_program_list is:", BRAM_name_mapped_program_list)
# print("the value of full_port_name_list_bram_ce_address_program_func_call_list is:", full_port_name_list_bram_ce_address_program_func_call_list)
# print("the value of bram_address_ce_func_mapping is:", bram_address_ce_func_mapping)
#print("the value of bram_address_ce_func_mapping is:")
#pprint(bram_address_ce_func_mapping)

func_instance_dict = dict(zip(
    merged_func_call_key_program_list,
    merged_instance_call_program_list,
))

# bram_address_ce_instance_mapping = {
#     ram: remap_buffers(buffers, func_instance_dict)
#     for ram, buffers in bram_address_ce_func_mapping.items()
# }

bram_name_list, bram_address_ce_func_mapping_list = map(list, zip(*bram_address_ce_func_mapping.items()))
# print("the value of merged_func_call_key_program_list is:", merged_func_call_key_program_list)
# print("the value of bram_name_list is:", bram_name_list)
# print("the value of bram_address_ce_func_mapping_list:", bram_address_ce_func_mapping_list)

# connected_bram_port_type_list = []
# for mapping_pair in bram_address_ce_func_mapping_list:
#     connected_bram_port_type_list_temp = []
#     for full_name in mapping_pair:
#         # split on the first "_BRAM_"
#         func_call, port_suffix = full_name.split('_BRAM_', 1)
#         port_name = 'BRAM_' + port_suffix
        
#         # find its index in the merged list
#         try:
#             idx = merged_func_call_key_program_list.index(func_call)
#         except ValueError:
#             idx = None  # not found
        
#         port_type = all_counts[idx][port_name]
#         connected_bram_port_type_list_temp.append(port_type)
#     connected_bram_port_type_list.append(connected_bram_port_type_list_temp)
# print("the value of connected_bram_port type is:", connected_bram_port_type_list)
func_idx = {name: i for i, name in enumerate(merged_func_call_key_program_list)}

connected_bram_port_type_list = []

print("the value of bram_address_ce_func_mapping_list is:", bram_address_ce_func_mapping_list)
print("the value of the merged_func_call_key_program_list is:", merged_func_call_key_program_list)

sorted_funcs = sorted(merged_func_call_key_program_list, key=len, reverse=True)

connected_bram_port_type_list = []
for mapping_pair in bram_address_ce_func_mapping_list:
    temp_types = []
    for full_name in mapping_pair:
        # 1) pick the longest func_call whose "<func_call>_" is a prefix of full_name
        func_call = next(
            (f for f in sorted_funcs 
             if full_name.startswith(f + "_")),
            None
        )
        if func_call is None:
            raise ValueError(f"No matching function prefix for '{full_name}'")

        # 2) strip off "<func_call>_" to get the suffix
        port_suffix = full_name[len(func_call) + 1:]

        # 3) lookup in your counts
        idx       = func_idx[func_call]
        port_dict = all_counts[idx]

        # 4) resolve BRAM_… vs raw suffix
        if port_suffix in port_dict:
            port_type = port_dict[port_suffix]
        elif f"BRAM_{port_suffix}" in port_dict:
            port_type = port_dict[f"BRAM_{port_suffix}"]
        else:
            raise KeyError(
                f"Port '{port_suffix}' not found for function '{func_call}'"
            )

        temp_types.append(port_type)

    connected_bram_port_type_list.append(temp_types)


# for mapping_pair in bram_address_ce_func_mapping_list:
#     temp_types = []
#     for full_name in mapping_pair:
#         # 1) Find which func_call in the merged list is a prefix of full_name
#         func_call = next(
#             (f for f in merged_func_call_key_program_list 
#              if full_name.startswith(f + "_")), 
#             None
#         )
#         print("the value of func_call is:", func_call)
#         if func_call is None:
#             raise ValueError(f"No matching function prefix for '{full_name}'")

#         # 2) Extract the port suffix (everything after "func_call_")
#         port_suffix = full_name[len(func_call) + 1:]  

#         # 3) Look up the index and then the port type in all_counts
#         idx = func_idx[func_call]
#         port_dict = all_counts[idx]
#         #print("the value of port_dict is:", port_dict)
        
#         # 4) Try both the raw suffix and with "BRAM_" prefix if needed
#         if port_suffix in port_dict:
#             port_type = port_dict[port_suffix]
#         elif f"BRAM_{port_suffix}" in port_dict:
#             port_type = port_dict[f"BRAM_{port_suffix}"]
#         else:
#             raise KeyError(
#                 f"Port '{port_suffix}' not found for function '{func_call}'"
#             )

#         temp_types.append(port_type)

#     connected_bram_port_type_list.append(temp_types)
      
bram_name_2p_list = []
bram_address_ce_func_mapping_2p_list = []
for i in range (len(bram_name_list)):
    if "2p" in bram_name_list[i]:
        bram_name_2p_list.append(bram_name_list[i])
        bram_address_ce_func_mapping_2p_list_temp = []
        for j in range (len(bram_address_ce_func_mapping_list[i])):
            if connected_bram_port_type_list[i][j] == 2:
                bram_address_ce_func_mapping_2p_list_temp.append(bram_address_ce_func_mapping_list[i][j])
        bram_address_ce_func_mapping_2p_list.append(bram_address_ce_func_mapping_2p_list_temp)    
#print("the value of bram_name_2p_list is:", bram_name_2p_list)
#print("the value of bram_address_ce_func_mapping_2p_list is:", bram_address_ce_func_mapping_2p_list)

#print("the value of bram_name_list is:", bram_name_list)
sel_signal_length_bram_ce_address_list = []
for i in range (len(bram_name_list)):
    sel_signal_length = (len(bram_address_ce_func_mapping_list[i])).bit_length()
    sel_signal_length_bram_ce_address_list.append(sel_signal_length)
    
sel_signal_length_bram_ce_address_2p_list = []
for i in range (len(bram_name_2p_list)):
    sel_signal_length = (len(bram_address_ce_func_mapping_2p_list[i])).bit_length()
    sel_signal_length_bram_ce_address_2p_list.append(sel_signal_length)
    
# print("the value of bram_name_2p_list is:")
# print(bram_name_2p_list)
# print("the value of bram_address_ce_func_mapping_2p_list is:")
# print(bram_address_ce_func_mapping_2p_list)
# print("the value of sel_signal_length_bram_ce_address_2p_list is:")
# print(sel_signal_length_bram_ce_address_2p_list)

sel_signal_status_bram_ce_address_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_ce_address_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_ce_address_list = []
        for j in range (len(bram_name_list)):
            sel_signal_max = pow(2, sel_signal_length_bram_ce_address_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_ce_address_list.append(sel_signal_status)
        sel_signal_status_bram_ce_address_branch_list.append(sel_signal_status_bram_ce_address_list)
    sel_signal_status_bram_ce_address_program_list.append(sel_signal_status_bram_ce_address_branch_list)

#print("the value of sel_signal_status_bram_ce_address_program_list is:")
#pprint(sel_signal_status_bram_ce_address_program_list)


sel_signal_status_bram_ce_address_program_2p_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_ce_address_2p_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_ce_address_2p_list = []
        for j in range (len(bram_name_2p_list)):
            sel_signal_max = pow(2, sel_signal_length_bram_ce_address_2p_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_ce_address_2p_list.append(sel_signal_status)
        sel_signal_status_bram_ce_address_2p_branch_list.append(sel_signal_status_bram_ce_address_2p_list)
    sel_signal_status_bram_ce_address_program_2p_list.append(sel_signal_status_bram_ce_address_2p_branch_list)

# print("the value of BRAM_name_program_list is:", BRAM_name_program_list)
# print("the value of BRAM_name_2p_program_list is:", BRAM_name_2p_program_list)


for i in range (len(BRAM_name_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(BRAM_name_program_list[i])):
            BRAM_name = BRAM_name_program_list[i][j]
            mapped_BRAM_name = name_mapping_program_list[i][BRAM_name]
            mapped_BRAM_name_index = bram_name_list.index(mapped_BRAM_name)
            buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], branch_condition_mapping_choices_program_list[i][m])
            for k in range (len(buffer_related_R_op_list_cycle)):
                current_cycle = buffer_related_R_op_list_cycle[k]
                current_port = full_port_name_list_bram_ce_address_program_input_func_call_branch_list[i][m][j][k]
                current_port_index = bram_address_ce_func_mapping_list[int(mapped_BRAM_name_index)].index(current_port) 
                sel_signal_status_bram_ce_address_program_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index
            for k in range (len(buffer_related_W_op_list_cycle)):
                current_cycle = buffer_related_W_op_list_cycle[k]
                current_port = full_port_name_list_bram_ce_address_program_output_func_call_branch_list[i][m][j][k]
                current_port_index = bram_address_ce_func_mapping_list[int(mapped_BRAM_name_index)].index(current_port) 
                sel_signal_status_bram_ce_address_program_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index
# print("the value of sel_signal_status_bram_ce_address_program_list is:")
# pprint(sel_signal_status_bram_ce_address_program_list)
for i in range (len(BRAM_name_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(BRAM_name_program_list[i])):
            BRAM_name = BRAM_name_program_list[i][j]
            mapped_BRAM_name = name_mapping_program_list[i][BRAM_name]
            if "2p" in mapped_BRAM_name:
                mapped_BRAM_name_index = bram_name_2p_list.index(mapped_BRAM_name) 
                buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], branch_condition_mapping_choices_program_list[i][m])
                for k in range (len(buffer_related_R_op_list_cycle)):
                    current_cycle = buffer_related_R_op_list_cycle[k] 
                    current_port = full_port_name_list_bram_ce_address_program_input_func_call_branch_list[i][m][j][k]
                    if current_port in bram_address_ce_func_mapping_2p_list[int(mapped_BRAM_name_index)]:
                        current_port_index = bram_address_ce_func_mapping_2p_list[int(mapped_BRAM_name_index)].index(current_port) 
                        sel_signal_status_bram_ce_address_program_2p_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index 
                for k in range (len(buffer_related_W_op_list_cycle)):
                    current_cycle = buffer_related_W_op_list_cycle[k]
                    current_port = full_port_name_list_bram_ce_address_program_output_func_call_branch_list[i][m][j][k]
                    if current_port in bram_address_ce_func_mapping_2p_list[int(mapped_BRAM_name_index)]:
                        current_port_index = bram_address_ce_func_mapping_2p_list[int(mapped_BRAM_name_index)].index(current_port) 
                        sel_signal_status_bram_ce_address_program_2p_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index     

#print("the value of sel_signal_status_bram_ce_address_program_2p_list is:", sel_signal_status_bram_ce_address_program_2p_list)
# print("the value of sel_signal_status_bram_ce_address_program_list is:")
# pprint(sel_signal_status_bram_ce_address_program_list)


FSM_state_allocation_bram_ce_address_unroll_grouped = []
cur = current_instruction_length

#print("the value of merged_grouped_unrolled_BRAM_list is:", merged_grouped_unrolled_BRAM_list)
#print("the value of bram_name_list is:", bram_name_list)
for i in range (len(merged_grouped_unrolled_BRAM_list)):
    selected_bram_name = merged_grouped_unrolled_BRAM_list[i][0]  
    selected_bram_index = bram_name_list.index(selected_bram_name) 
    width = sel_signal_length_bram_ce_address_list[int(selected_bram_index)]
    high = cur + width - 1
    low  = cur
    if width == 0:
        FSM_state_allocation_bram_ce_address_unroll_grouped.append("")
    elif width == 1:
        FSM_state_allocation_bram_ce_address_unroll_grouped.append(f"{low}")
    else:
        FSM_state_allocation_bram_ce_address_unroll_grouped.append(f"{high}:{low}")
    cur = high + 1

FSM_state_allocation_bram_ce_address_unroll_grouped_2p = []
for i in range (len(merged_grouped_unrolled_BRAM_list)):
    selected_bram_name = merged_grouped_unrolled_BRAM_list[i][0]
    if "2p" in selected_bram_name: 
        selected_bram_index = bram_name_2p_list.index(selected_bram_name) 
        width = sel_signal_length_bram_ce_address_2p_list[int(selected_bram_index)]
        high = cur + width - 1
        low  = cur
        if width == 0:
            FSM_state_allocation_bram_ce_address_unroll_grouped_2p.append("")
        elif width == 1:
            FSM_state_allocation_bram_ce_address_unroll_grouped_2p.append(f"{low}")
        else:
            FSM_state_allocation_bram_ce_address_unroll_grouped_2p.append(f"{high}:{low}")
        cur = high + 1
    else:
        FSM_state_allocation_bram_ce_address_unroll_grouped_2p.append("")
        
# print("the value of merged_grouped_unrolled_BRAM_list is:")
# print(merged_grouped_unrolled_BRAM_list)
# print("the value of FSM_state_allocation_bram_ce_address_unroll_grouped_2p is:")
# print(FSM_state_allocation_bram_ce_address_unroll_grouped_2p)
# FSM_state_allocation_bram_ce_address = []
# cur = current_instruction_length
# for width in sel_signal_length_bram_ce_address_list:
#     bram_name = bram_name_list[i]
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_ce_address.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_ce_address.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_ce_address.append(f"{high}:{low}")
#     cur = high + 1
print("the value of merged_grouped_unrolled_BRAM_list is:", merged_grouped_unrolled_BRAM_list)
FSM_state_allocation_bram_ce_address = []
for i in range (len(sel_signal_length_bram_ce_address_list)):
    bram_name = bram_name_list[i]
    bram_name_group_index = find_bram_group_index(merged_grouped_unrolled_BRAM_list, bram_name)
    width = sel_signal_length_bram_ce_address_list[i]
    #print("the value of bram_name is:", bram_name)
    #print("the value of bram_name_group_index is:", bram_name_group_index)
    if width == 0:
        FSM_state_allocation_bram_ce_address.append("")
    elif width == 1:
        FSM_state_allocation_bram_ce_address.append(FSM_state_allocation_bram_ce_address_unroll_grouped[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_ce_address.append(FSM_state_allocation_bram_ce_address_unroll_grouped[int(bram_name_group_index)])
    
    
# FSM_state_allocation_bram_ce_address_2p = []
# for width in sel_signal_length_bram_ce_address_2p_list:
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_ce_address_2p.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_ce_address_2p.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_ce_address_2p.append(f"{high}:{low}")
#     cur = high + 1
print("the value of bram_name_2p_list is:")
print(bram_name_2p_list)
print("the value of merged_grouped_unrolled_BRAM_list is:")
print(merged_grouped_unrolled_BRAM_list)
FSM_state_allocation_bram_ce_address_2p = []
for i in range (len(sel_signal_length_bram_ce_address_2p_list)):
    bram_name = bram_name_2p_list[i]
    bram_name_group_index = find_bram_group_index(merged_grouped_unrolled_BRAM_list, bram_name)
    print("the value of bram_name_group_index is", bram_name_group_index)
    width = sel_signal_length_bram_ce_address_2p_list[i]
    if width == 0:
        FSM_state_allocation_bram_ce_address_2p.append("")
    elif width == 1:
        FSM_state_allocation_bram_ce_address_2p.append(FSM_state_allocation_bram_ce_address_unroll_grouped_2p[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_ce_address_2p.append(FSM_state_allocation_bram_ce_address_unroll_grouped_2p[int(bram_name_group_index)])

def remap_func_call_name(s: str) -> str:
    # sort func_names by length so that the longest match is tried first
    for func_name in sorted(func_call_name_to_instance_call_name, key=len, reverse=True):
        prefix = func_name + "_"
        if s.startswith(prefix):
            inst_name = func_call_name_to_instance_call_name[func_name]
            return s.replace(prefix, inst_name + "_", 1)
    return s

remapped_bram_address_ce_func_mapping_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in bram_address_ce_func_mapping_list
]

remapped_bram_address_ce_func_mapping_2p_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in bram_address_ce_func_mapping_2p_list
]

#print("the value of remapped_bram_address_ce_func_mapping_list is:", remapped_bram_address_ce_func_mapping_list)

buffers = []
for name, ports, fsm in zip(bram_name_list[0:], 
                            remapped_bram_address_ce_func_mapping_list[0:], 
                            FSM_state_allocation_bram_ce_address[0:]):
        case_mappings = [{"func_name": func} for func in ports]
        if not case_mappings:
            continue
        entry = {
            "input_buffer_name": name,
            "case_mappings": [{"func_name": func} for func in ports],
            "fsm_state_range": fsm
        }
        buffers.append(entry)
data = {"buffers": buffers}

with open(JSON_file_path + "BRAM_address_ce_1p.json", "w") as f:
    json.dump(data, f, indent=4)

buffers = []
for name, ports, fsm in zip(bram_name_2p_list[0:], 
                            remapped_bram_address_ce_func_mapping_2p_list[0:], 
                            FSM_state_allocation_bram_ce_address_2p[0:]):
        case_mappings = [{"func_name": func} for func in ports]
        if not case_mappings:
            continue
        entry = {
            "input_buffer_name": name,
            "case_mappings": [{"func_name": func} for func in ports],
            "fsm_state_range": fsm
        }
        buffers.append(entry)
data = {"buffers": buffers}

if bram_name_2p_list:
    with open(JSON_file_path + "BRAM_address_ce_2p.json", "w") as f:
        json.dump(data, f, indent=4)
# buffers = []
# for name, ports, fsm in zip(bram_name_list[0:], 
#                             remapped_bram_address_ce_func_mapping_list[0:], 
#                             FSM_state_allocation_bram_ce_address[0:]):
#     if "2p" in name:
#         entry = {
#             "input_buffer_name": name,
#             "case_mappings": [{"func_name": func} for func in ports],
#             "fsm_state_range": fsm
#         }
#         buffers.append(entry)
# data = {"buffers": buffers}

# with open(JSON_file_path + "BRAM_address_ce_1p.json", "w") as f:
#     json.dump(data, f, indent=4)

# wrap and dump to file
# print("the value of bram_name_list is:", bram_name_list)
# print("the value of bram_address_ce_func_mapping_list is:", bram_address_ce_func_mapping_list)
# print("the value of merged func call program list is:", merged_func_call_key_program_list)
# print("the value of merged instance call program list is:", merged_instance_call_program_list)



#sel_signal_length_bram_ce_address_sum = sum(sel_signal_length_bram_ce_address_list) + sum(sel_signal_length_bram_ce_address_2p_list)
#current_instruction_length = current_instruction_length + sel_signal_length_bram_ce_address_sum
current_instruction_length = cur
print("the value of current_instruction_length is:", current_instruction_length)

##################### Finish Generate BRAM address ce sel signal #################
print("the merged_func_call_key_program_list", merged_func_call_key_program_list)
print("")
##################### Generate BRAM we d0 sel signal #################

for i in range (len(HLS_project_solution_path_program_list)):
    full_port_name_list_bram_we_d0_list = []
    full_port_name_list_bram_we_d0_func_call_list = []
    full_port_name_list_bram_we_d0_input_func_call_list = []
    full_port_name_list_bram_we_d0_output_func_call_list = []
    sel_signal_length_bram_we_d0_list = []
    sel_signal_status_bram_we_d0_list = []
    for j in range (len(BRAM_name_program_list[i])):
        full_port_name_list_bram_we_d0, sel_signal_length_bram_we_d0, sel_signal_status_bram_we_d0, full_port_name_list_bram_we_d0_func_call, full_port_name_list_bram_we_d0_output_func_call = generate_BRAM_we_d0(FSM_info_program_list[i], BRAM_name_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_port_name_list_bram_we_d0_list.append(full_port_name_list_bram_we_d0)
        sel_signal_length_bram_we_d0_list.append(sel_signal_length_bram_we_d0)
        sel_signal_status_bram_we_d0_list.append(sel_signal_status_bram_we_d0)
        full_port_name_list_bram_we_d0_func_call_list.append(full_port_name_list_bram_we_d0_func_call)
        full_port_name_list_bram_we_d0_output_func_call_list.append(full_port_name_list_bram_we_d0_output_func_call)

    full_port_name_list_bram_we_d0_program_func_call_list.append(full_port_name_list_bram_we_d0_func_call_list)
    full_port_name_list_bram_we_d0_program_output_func_call_list.append(full_port_name_list_bram_we_d0_output_func_call_list)
    full_port_name_list_bram_we_d0_program_list.append(full_port_name_list_bram_we_d0_list)
    sel_signal_length_bram_we_d0_program_list.append(sel_signal_length_bram_we_d0_list)
    sel_signal_status_bram_we_d0_program_list.append(sel_signal_status_bram_we_d0_list)


for i in range (len(HLS_project_solution_path_program_list)):
    full_port_name_list_bram_we_d0_output_func_call_branch_list_temp = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        full_port_name_list_bram_we_d0_output_func_call_list = [] 
        for j in range (len(BRAM_name_program_list[i])):
            full_port_name_list_bram_we_d0_output_func_call = generate_BRAM_we_d0_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][m], i)
            full_port_name_list_bram_we_d0_output_func_call_list.append(full_port_name_list_bram_we_d0_output_func_call)
        full_port_name_list_bram_we_d0_output_func_call_branch_list_temp.append(full_port_name_list_bram_we_d0_output_func_call_list)
    full_port_name_list_bram_we_d0_program_output_func_call_branch_list.append(full_port_name_list_bram_we_d0_output_func_call_branch_list_temp)
    
               


bram_we_d0_func_mapping = build_ram_to_buffers(BRAM_name_mapped_program_list, full_port_name_list_bram_we_d0_program_func_call_list)


print("the value of bram_we_d0_func_mapping is:", bram_we_d0_func_mapping)

func_instance_dict = dict(zip(
    merged_func_call_key_program_list,
    merged_instance_call_program_list,
))

# bram_we_d0_instance_mapping = {
#     ram: remap_buffers(buffers, func_instance_dict)
#     for ram, buffers in bram_we_d0_func_mapping.items()
# }

bram_name_list_we_d0, bram_we_d0_func_mapping_list = map(list, zip(*bram_we_d0_func_mapping.items()))

print("the value of bram_name_list is:", bram_name_list_we_d0)

func_idx = {name: i for i, name in enumerate(merged_func_call_key_program_list)}
connected_bram_port_type_we_d0_list = []

sorted_funcs = sorted(merged_func_call_key_program_list, key=len, reverse=True)

for mapping_pair in bram_we_d0_func_mapping_list:
    temp_types = []
    for full_name in mapping_pair:
        # 1) Find which func_call in the merged list is a prefix of full_name
        func_call = next(
            (f for f in sorted_funcs 
             if full_name.startswith(f + "_")), 
            None
        )
        if func_call is None:
            raise ValueError(f"No matching function prefix for '{full_name}'")

        # 2) Extract the port suffix (everything after "func_call_")
        port_suffix = full_name[len(func_call) + 1:]  

        # 3) Look up the index and then the port type in all_counts
        idx = func_idx[func_call]
        port_dict = all_counts[idx]

        # 4) Try both the raw suffix and with "BRAM_" prefix if needed
        if port_suffix in port_dict:
            port_type = port_dict[port_suffix]
        elif f"BRAM_{port_suffix}" in port_dict:
            port_type = port_dict[f"BRAM_{port_suffix}"]
        else:
            raise KeyError(
                f"Port '{port_suffix}' not found for function '{func_call}'"
            )

        temp_types.append(port_type)

    connected_bram_port_type_we_d0_list.append(temp_types)
# connected_bram_port_type_we_d0_list = []
# for mapping_pair in bram_we_d0_func_mapping_list:
#     connected_bram_port_type_we_d0_list_temp = []
#     for full_name in mapping_pair:
#         # split on the first "_BRAM_"
#         func_call, port_suffix = full_name.split('_BRAM_', 1)
#         port_name = 'BRAM_' + port_suffix
        
#         # find its index in the merged list
#         try:
#             idx = merged_func_call_key_program_list.index(func_call)
#         except ValueError:
#             idx = None  # not found
        
#         port_type = all_counts[idx][port_name]
#         connected_bram_port_type_we_d0_list_temp.append(port_type)
#     connected_bram_port_type_we_d0_list.append(connected_bram_port_type_we_d0_list_temp)
# print("the value of connected_bram_port we d0 type is:", connected_bram_port_type_we_d0_list)

bram_name_2p_list_we_d0 = []
bram_we_d0_func_mapping_2p_list = []
for i in range (len(bram_name_list_we_d0)):
    if "2p" in bram_name_list_we_d0[i]:
        bram_name_2p_list_we_d0.append(bram_name_list_we_d0[i])
        bram_we_d0_func_mapping_2p_list_temp = []
        for j in range (len(bram_we_d0_func_mapping_list[i])):
            if connected_bram_port_type_we_d0_list[i][j] == 2:
                bram_we_d0_func_mapping_2p_list_temp.append(bram_we_d0_func_mapping_list[i][j])
        bram_we_d0_func_mapping_2p_list.append(bram_we_d0_func_mapping_2p_list_temp)    
print("the value of bram_name_2p_list is:", bram_name_2p_list_we_d0)
print("the value of bram_address_ce_func_mapping_2p_list is:", bram_we_d0_func_mapping_2p_list)


def filter_bram_we_d0_2p_mappings(
    bram_we_d0_func_mapping_list: List[List[str]],
    func_call_keys: List[str],
    sorted_funcs: List[str],
    interfaces: List[List[str]]
) -> List[List[str]]:
    """
    For each group in bram_we_d0_func_mapping_list (a list of lists of
    'top_{func}_{BRAM_base}' strings), keep only those entries where
    the corresponding interface list contains either
    '<BRAM_base>_we1' or '<BRAM_base>_d1' (i.e. suffix-only lookup).
    
    Returns a new list of the same shape (outer and inner lengths preserved).
    """
    filtered = []
    for group in bram_we_d0_func_mapping_list:
        new_group = []
        for full_name in group:
            # 1) identify which func_call_key this belongs to
            key = next((k for k in sorted_funcs if full_name.startswith(k + "_")), None)
            if key is None:
                continue
            idx = func_call_keys.index(key)
            iface = interfaces[idx]
            
            # 2) strip off the "top_{func}_" prefix to get just the BRAM suffix
            suffix = full_name[len(key) + 1:]   # e.g. "BRAM_buffer_1_0"
            
            # 3) build the port names to look for
            we1 = f"{suffix}_we1"
            d1  = f"{suffix}_d1"
            
            # 4) keep the original full_name if either port exists in iface
            if we1 in iface and d1 in iface:
                new_group.append(full_name)
        
        # preserve empty groups as well
        filtered.append(new_group)
    return filtered


def filter_bram_we_d0_1p_mappings(
    bram_we_d0_func_mapping_list: List[List[str]],
    func_call_keys: List[str],
    sorted_funcs: List[str],
    interfaces: List[List[str]]
) -> List[List[str]]:
    """
    For each group in bram_we_d0_func_mapping_list (a list of lists of
    'top_{func}_{BRAM_base}' strings), keep only those entries where
    the corresponding interface list contains either
    '<BRAM_base>_we1' or '<BRAM_base>_d1' (i.e. suffix-only lookup).
    
    Returns a new list of the same shape (outer and inner lengths preserved).
    """
    filtered = []
    for group in bram_we_d0_func_mapping_list:
        new_group = []
        for full_name in group:
            # 1) identify which func_call_key this belongs to
            key = next((k for k in sorted_funcs if full_name.startswith(k + "_")), None)
            if key is None:
                continue
            idx = func_call_keys.index(key)
            iface = interfaces[idx]
            
            # 2) strip off the "top_{func}_" prefix to get just the BRAM suffix
            suffix = full_name[len(key) + 1:]   # e.g. "BRAM_buffer_1_0"
            
            # 3) build the port names to look for
            we1 = f"{suffix}_we0"
            d1  = f"{suffix}_d0"
            
            # 4) keep the original full_name if either port exists in iface
            if we1 in iface and d1 in iface:
                new_group.append(full_name)
        
        # preserve empty groups as well
        filtered.append(new_group)
    return filtered

filtered_bram_we_d0_func_mapping_1p_list = filter_bram_we_d0_1p_mappings(
    bram_we_d0_func_mapping_list,
    merged_func_call_key_program_list,
    sorted_funcs,
    func_call_interface_name_list
)

filtered_bram_we_d0_func_mapping_2p_list = filter_bram_we_d0_2p_mappings(
    bram_we_d0_func_mapping_2p_list,
    merged_func_call_key_program_list,
    sorted_funcs,
    func_call_interface_name_list
)
#print("the value of filtered_bram_we_d0_func_mapping_2p_list is:", filtered_bram_we_d0_func_mapping_2p_list)
bram_we_d0_func_mapping_list = filtered_bram_we_d0_func_mapping_1p_list
bram_we_d0_func_mapping_2p_list = filtered_bram_we_d0_func_mapping_2p_list

sel_signal_length_bram_we_d0_list = []
for i in range (len(bram_name_list_we_d0)):
    sel_signal_length = (len(bram_we_d0_func_mapping_list[i])).bit_length()
    sel_signal_length_bram_we_d0_list.append(sel_signal_length)
    
sel_signal_length_bram_we_d0_2p_list = []
for i in range (len(bram_name_2p_list_we_d0)):
    sel_signal_length = (len(bram_we_d0_func_mapping_2p_list[i])).bit_length()
    sel_signal_length_bram_we_d0_2p_list.append(sel_signal_length)

#print("the value of bram_name_2p_list_we_d0 is:", bram_name_2p_list_we_d0)
#print("the value of bram_we_d0_func_mapping_list is:", bram_we_d0_func_mapping_2p_list)


sel_signal_status_bram_we_d0_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_we_d0_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_we_d0_list = []
        for j in range (len(bram_name_list_we_d0)):
            sel_signal_max = pow(2, sel_signal_length_bram_we_d0_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_we_d0_list.append(sel_signal_status)
        sel_signal_status_bram_we_d0_branch_list.append(sel_signal_status_bram_we_d0_list)
    sel_signal_status_bram_we_d0_program_list.append(sel_signal_status_bram_we_d0_branch_list)
    
sel_signal_status_bram_we_d0_program_2p_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_we_d0_2p_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_we_d0_2p_list = []
        for j in range (len(bram_name_2p_list_we_d0)):
                sel_signal_max = pow(2, sel_signal_length_bram_we_d0_2p_list[j]) - 1
                sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
                sel_signal_status_bram_we_d0_2p_list.append(sel_signal_status)
        sel_signal_status_bram_we_d0_2p_branch_list.append(sel_signal_status_bram_we_d0_2p_list)
    sel_signal_status_bram_we_d0_program_2p_list.append(sel_signal_status_bram_we_d0_2p_branch_list)    
    

print("the value of bram_we_d0_func_mapping_list is:", bram_we_d0_func_mapping_list)
for i in range (len(BRAM_name_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(BRAM_name_program_list[i])):
            BRAM_name = BRAM_name_program_list[i][j]
            mapped_BRAM_name = name_mapping_program_list[i][BRAM_name]
            mapped_BRAM_name_index = bram_name_list_we_d0.index(mapped_BRAM_name)
            buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], branch_condition_mapping_choices_program_list[i][m])
            for k in range (len(buffer_related_W_op_list_cycle)):
                current_cycle = buffer_related_W_op_list_cycle[k]
                current_port = full_port_name_list_bram_we_d0_program_output_func_call_branch_list[i][m][j][k]
                current_port_index = bram_we_d0_func_mapping_list[int(mapped_BRAM_name_index)].index(current_port) 
                sel_signal_status_bram_we_d0_program_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index

#print("the value of sel_signal_status_bram_we_d0_program_list is:")
#pprint(sel_signal_status_bram_we_d0_program_list)

          
for i in range (len(BRAM_name_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(BRAM_name_program_list[i])):
            BRAM_name = BRAM_name_program_list[i][j]
            mapped_BRAM_name = name_mapping_program_list[i][BRAM_name]
            if "2p" in mapped_BRAM_name:
                mapped_BRAM_name_index = bram_name_2p_list_we_d0.index(mapped_BRAM_name) 
                buffer_related_RW_op_list, buffer_related_RW_op_list_full, buffer_related_RW_op_list_cycle, buffer_related_R_op_list, buffer_related_R_op_list_full, buffer_related_R_op_list_cycle, buffer_related_W_op_list, buffer_related_W_op_list_full, buffer_related_W_op_list_cycle, related_pos, related_pos_input, related_pos_output = get_related_ops_condition(FSM_info_program_list[i], BRAM_name_program_list[i][j], branch_condition_mapping_choices_program_list[i][m])
                for k in range (len(buffer_related_W_op_list_cycle)):
                    current_cycle = buffer_related_W_op_list_cycle[k]
                    current_port = full_port_name_list_bram_we_d0_program_output_func_call_branch_list[i][m][j][k]
                    if current_port in bram_we_d0_func_mapping_2p_list[int(mapped_BRAM_name_index)]:
                        current_port_index = bram_we_d0_func_mapping_2p_list[int(mapped_BRAM_name_index)].index(current_port) 
                        sel_signal_status_bram_we_d0_program_2p_list[i][m][int(mapped_BRAM_name_index)][int(current_cycle)] = current_port_index     


FSM_state_allocation_bram_we_d0_unroll_grouped = []
cur = current_instruction_length
for i in range (len(merged_grouped_unrolled_BRAM_list)):
    selected_bram_name = merged_grouped_unrolled_BRAM_list[i][0]  
    selected_bram_index = bram_name_list_we_d0.index(selected_bram_name) 
    width = sel_signal_length_bram_we_d0_list[int(selected_bram_index)]
    high = cur + width - 1
    low  = cur
    if width == 0:
        FSM_state_allocation_bram_we_d0_unroll_grouped.append("")
    elif width == 1:
        FSM_state_allocation_bram_we_d0_unroll_grouped.append(f"{low}")
    else:
        FSM_state_allocation_bram_we_d0_unroll_grouped.append(f"{high}:{low}")
    cur = high + 1

FSM_state_allocation_bram_we_d0_unroll_grouped_2p = []
for i in range (len(merged_grouped_unrolled_BRAM_list)):
    selected_bram_name = merged_grouped_unrolled_BRAM_list[i][0]
    if "2p" in selected_bram_name: 
        selected_bram_index = bram_name_2p_list_we_d0.index(selected_bram_name) 
        width = sel_signal_length_bram_we_d0_2p_list[int(selected_bram_index)]
        high = cur + width - 1
        low  = cur
        if width == 0:
            FSM_state_allocation_bram_we_d0_unroll_grouped_2p.append("")
        elif width == 1:
            FSM_state_allocation_bram_we_d0_unroll_grouped_2p.append(f"{low}")
        else:
            FSM_state_allocation_bram_we_d0_unroll_grouped_2p.append(f"{high}:{low}")
        cur = high + 1
    else:
        FSM_state_allocation_bram_we_d0_unroll_grouped_2p.append("")


FSM_state_allocation_bram_we_d0 = []
for i in range (len(sel_signal_length_bram_we_d0_list)):
    bram_name = bram_name_list_we_d0[i]
    bram_name_group_index = find_bram_group_index(merged_grouped_unrolled_BRAM_list, bram_name)
    width = sel_signal_length_bram_we_d0_list[i]
    if width == 0:
        FSM_state_allocation_bram_we_d0.append("")
    elif width == 1:
        FSM_state_allocation_bram_we_d0.append(FSM_state_allocation_bram_we_d0_unroll_grouped[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_we_d0.append(FSM_state_allocation_bram_we_d0_unroll_grouped[int(bram_name_group_index)])

FSM_state_allocation_bram_we_d0_2p = []
for i in range (len(sel_signal_length_bram_we_d0_2p_list)):
    bram_name = bram_name_2p_list_we_d0[i]
    bram_name_group_index = find_bram_group_index(merged_grouped_unrolled_BRAM_list, bram_name)
    width = sel_signal_length_bram_we_d0_2p_list[i]
    if width == 0:
        FSM_state_allocation_bram_we_d0_2p.append("")
    elif width == 1:
        FSM_state_allocation_bram_we_d0_2p.append(FSM_state_allocation_bram_we_d0_unroll_grouped_2p[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_we_d0_2p.append(FSM_state_allocation_bram_we_d0_unroll_grouped_2p[int(bram_name_group_index)])
# FSM_state_allocation_bram_we_d0 = []
# cur = current_instruction_length
# for width in sel_signal_length_bram_we_d0_list:
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_we_d0.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_we_d0.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_we_d0.append(f"{high}:{low}")
#     cur = high + 1
    
# FSM_state_allocation_bram_we_d0_2p = []
# for width in sel_signal_length_bram_we_d0_2p_list:
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_we_d0_2p.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_we_d0_2p.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_we_d0_2p.append(f"{high}:{low}")
#     cur = high + 1

remapped_bram_we_d0_func_mapping_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in bram_we_d0_func_mapping_list
]

remapped_bram_we_d0_func_mapping_2p_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in bram_we_d0_func_mapping_2p_list
]

buffers = []

for name, ports, fsm in zip(bram_name_list_we_d0[0:], 
                            remapped_bram_we_d0_func_mapping_list[0:], 
                            FSM_state_allocation_bram_we_d0[0:]):
    case_mappings = [{"func_name": func} for func in ports]
    if not case_mappings:
        continue
    entry = {
        "input_buffer_name": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}

with open(JSON_file_path + "BRAM_we_d0_1p.json", "w") as f:
    json.dump(data, f, indent=4)
    
    
# buffers = []
# for name, ports, fsm in zip(bram_name_2p_list[0:], 
#                             remapped_bram_we_d0_func_mapping_2p_list[0:], 
#                             FSM_state_allocation_bram_we_d0_2p[0:]):
#         entry = {
#             "input_buffer_name": name,
#             "case_mappings": [{"func_name": func} for func in ports],
#             "fsm_state_range": fsm
#         }
#         buffers.append(entry)
# data = {"buffers": buffers}

# with open(JSON_file_path + "BRAM_we_d0_2p.json", "w") as f:
#     json.dump(data, f, indent=4)
buffers = []
for name, ports, fsm in zip(
        bram_name_2p_list_we_d0,
        remapped_bram_we_d0_func_mapping_2p_list,
        FSM_state_allocation_bram_we_d0_2p
    ):
    # build your mappings
    case_mappings = [{"func_name": func} for func in ports]
    # if no mappings, skip this buffer
    if not case_mappings:
        continue

    entry = {
        "input_buffer_name": name,
        "case_mappings": case_mappings,
        "fsm_state_range": fsm
    }
    buffers.append(entry)

data = {"buffers": buffers}
if bram_name_2p_list_we_d0:
    with open(JSON_file_path + "BRAM_we_d0_2p.json", "w") as f:
        json.dump(data, f, indent=4)
# sel_signal_length_bram_we_d0_sum = sum(sel_signal_length_bram_we_d0_list) + sum(sel_signal_length_bram_we_d0_2p_list)
# current_instruction_length = current_instruction_length + sel_signal_length_bram_we_d0_sum
current_instruction_length = cur
##################### Finish Generate BRAM we d0 sel signal #################

##################### Generate AXI interface input output #################

for i in range (len(HLS_project_solution_path_program_list)):
    full_port_axi_interface_name_input_list = [] 
    full_port_axi_interface_name_input_func_call_list = []
    sel_signal_axi_interface_length_input_list = [] 
    sel_signal_axi_interface_status_input_list = []
    for j in range (len(axi_interface_port_input_program_list[i])):
        full_port_axi_interface_name, sel_signal_axi_interface_length, sel_signal_axi_interface_status, full_port_axi_interface_func_call_name = generate_AXI_interface(FSM_info_program_list[i], axi_interface_port_input_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_port_axi_interface_name_input_list.append(full_port_axi_interface_name)
        full_port_axi_interface_name_input_func_call_list.append(full_port_axi_interface_func_call_name)
        sel_signal_axi_interface_length_input_list.append(sel_signal_axi_interface_length)
        sel_signal_axi_interface_status_input_list.append(sel_signal_axi_interface_status)

    full_port_axi_interface_name_input_program_list.append(full_port_axi_interface_name_input_list) 
    full_port_axi_interface_name_input_func_call_program_list.append(full_port_axi_interface_name_input_func_call_list) 
    sel_signal_axi_interface_length_input_program_list.append(sel_signal_axi_interface_length_input_list) 
    sel_signal_axi_interface_status_input_program_list.append(sel_signal_axi_interface_status_input_list)
    
for i in range (len(HLS_project_solution_path_program_list)):     
    full_port_axi_interface_name_input_func_call_program_branch_list_temp = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        full_port_axi_interface_name_input_func_call_list = []
        for j in range (len(axi_interface_port_input_program_list[i])):
            full_port_axi_interface_func_call_name = generate_AXI_interface_condition(FSM_info_program_list[i], axi_interface_port_input_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][m], i)
            full_port_axi_interface_name_input_func_call_list.append(full_port_axi_interface_func_call_name)
        full_port_axi_interface_name_input_func_call_program_branch_list_temp.append(full_port_axi_interface_name_input_func_call_list)
    full_port_axi_interface_name_input_func_call_program_branch_list.append(full_port_axi_interface_name_input_func_call_program_branch_list_temp)
                
        
for i in range (len(HLS_project_solution_path_program_list)):
    full_port_axi_interface_name_output_list = []
    full_port_axi_interface_name_output_func_call_list = []  
    sel_signal_axi_interface_length_output_list = [] 
    sel_signal_axi_interface_status_output_list = []
    for j in range (len(axi_interface_port_output_program_list[i])):
        full_port_axi_interface_name, sel_signal_axi_interface_length, sel_signal_axi_interface_status, full_port_axi_interface_func_call_name = generate_AXI_interface(FSM_info_program_list[i], axi_interface_port_output_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_port_axi_interface_name_output_list.append(full_port_axi_interface_name)
        full_port_axi_interface_name_output_func_call_list.append(full_port_axi_interface_func_call_name)
        sel_signal_axi_interface_length_output_list.append(sel_signal_axi_interface_length)
        sel_signal_axi_interface_status_output_list.append(sel_signal_axi_interface_status)

    full_port_axi_interface_name_output_program_list.append(full_port_axi_interface_name_output_list) 
    full_port_axi_interface_name_output_func_call_program_list.append(full_port_axi_interface_name_output_func_call_list) 
    sel_signal_axi_interface_length_output_program_list.append(sel_signal_axi_interface_length_output_list)
    sel_signal_axi_interface_status_output_program_list.append(sel_signal_axi_interface_status_output_list)
    
    
for i in range (len(HLS_project_solution_path_program_list)): 
    full_port_axi_interface_name_output_func_call_program_branch_list_temp = [] 
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        full_port_axi_interface_name_output_func_call_list = [] 
        for j in range (len(axi_interface_port_output_program_list[i])):
            full_port_axi_interface_func_call_name = generate_AXI_interface_condition(FSM_info_program_list[i], axi_interface_port_output_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][m], i)
            full_port_axi_interface_name_output_func_call_list.append(full_port_axi_interface_func_call_name)
        full_port_axi_interface_name_output_func_call_program_branch_list_temp.append(full_port_axi_interface_name_output_func_call_list)
    full_port_axi_interface_name_output_func_call_program_branch_list.append(full_port_axi_interface_name_output_func_call_program_branch_list_temp)
               
       

axi_interface_input_mapping = build_axi_to_funcs(
    axi_interface_port_input_program_list,
    full_port_axi_interface_name_input_func_call_program_list
)
axi_interface_output_mapping = build_axi_to_funcs(
    axi_interface_port_output_program_list,
    full_port_axi_interface_name_output_func_call_program_list
)

func_instance_dict = dict(zip(
    merged_func_call_key_program_list,
    merged_instance_call_program_list,
))

axi_interface_input_name_list, axi_interface_input_mapping_list = map(list, zip(*axi_interface_input_mapping.items()))
axi_interface_output_name_list, axi_interface_output_mapping_list = map(list, zip(*axi_interface_output_mapping.items()))

sel_signal_length_axi_interface_input_list = []
for i in range (len(axi_interface_input_name_list)):
    sel_signal_length = (len(axi_interface_input_mapping_list[i])).bit_length()
    sel_signal_length_axi_interface_input_list.append(sel_signal_length)

sel_signal_status_axi_interface_input_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_axi_interface_input_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_axi_interface_input_list = []
        for j in range (len(axi_interface_input_name_list)):
            sel_signal_max = pow(2, sel_signal_length_axi_interface_input_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_axi_interface_input_list.append(sel_signal_status)
        sel_signal_status_bram_axi_interface_input_branch_list.append(sel_signal_status_bram_axi_interface_input_list)
    sel_signal_status_axi_interface_input_program_list.append(sel_signal_status_bram_axi_interface_input_branch_list)


for i in range (len(axi_interface_port_input_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(axi_interface_port_input_program_list[i])):
            axi_interface_name = axi_interface_port_input_program_list[i][j]
            axi_interface_name_index = axi_interface_input_name_list.index(axi_interface_name)
            interface_related_list, interface_related_full_list, interface_related_cycle_list, interface_related_pos_list = get_related_ops_interface_condition(FSM_info_program_list[i], axi_interface_name, branch_condition_mapping_choices_program_list[i][m])
            for k in range (len(interface_related_cycle_list)):
                current_cycle = interface_related_cycle_list[k]
                current_port = full_port_axi_interface_name_input_func_call_program_branch_list[i][m][j][k]
                current_port_index = axi_interface_input_mapping_list[int(axi_interface_name_index)].index(current_port) 
                sel_signal_status_axi_interface_input_program_list[i][m][int(axi_interface_name_index)][int(current_cycle)] = current_port_index


sel_signal_length_axi_interface_output_list = []
for i in range (len(axi_interface_output_name_list)):
    sel_signal_length = (len(axi_interface_output_mapping_list[i])).bit_length()
    sel_signal_length_axi_interface_output_list.append(sel_signal_length)

sel_signal_status_axi_interface_output_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_axi_interface_output_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_axi_interface_output_list = []
        for j in range (len(axi_interface_output_name_list)):
            sel_signal_max = pow(2, sel_signal_length_axi_interface_output_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_axi_interface_output_list.append(sel_signal_status)
        sel_signal_status_bram_axi_interface_output_branch_list.append(sel_signal_status_bram_axi_interface_output_list)
    sel_signal_status_axi_interface_output_program_list.append(sel_signal_status_bram_axi_interface_output_branch_list)

for i in range (len(axi_interface_port_output_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(axi_interface_port_output_program_list[i])):
            axi_interface_name = axi_interface_port_output_program_list[i][j]
            axi_interface_name_index = axi_interface_output_name_list.index(axi_interface_name)
            interface_related_list, interface_related_full_list, interface_related_cycle_list, interface_related_pos_list = get_related_ops_interface_condition(FSM_info_program_list[i], axi_interface_name, branch_condition_mapping_choices_program_list[i][m])
            for k in range (len(interface_related_cycle_list)):
                current_cycle = interface_related_cycle_list[k]
                current_port = full_port_axi_interface_name_output_func_call_program_branch_list[i][m][j][k]
                current_port_index = axi_interface_output_mapping_list[int(axi_interface_name_index)].index(current_port) 
                sel_signal_status_axi_interface_output_program_list[i][m][int(axi_interface_name_index)][int(current_cycle)] = current_port_index


FSM_state_allocation_axi_interface_input = []
cur = current_instruction_length
for width in sel_signal_length_axi_interface_input_list:
    high = cur + width - 1
    low  = cur
    if width == 0:
        FSM_state_allocation_axi_interface_input.append("")
    elif width == 1:
        FSM_state_allocation_axi_interface_input.append(f"{low}")
    else:
        FSM_state_allocation_axi_interface_input.append(f"{high}:{low}")
    cur = high + 1

sel_signal_length_axi_interface_input_sum = sum(sel_signal_length_axi_interface_input_list)
current_instruction_length = current_instruction_length + sel_signal_length_axi_interface_input_sum

FSM_state_allocation_axi_interface_output = []
cur = current_instruction_length
for width in sel_signal_length_axi_interface_output_list:
    high = cur + width - 1
    low  = cur
    if width == 0:
        FSM_state_allocation_axi_interface_output.append("")
    elif width == 1:
        FSM_state_allocation_axi_interface_output.append(f"{low}")
    else:
        FSM_state_allocation_axi_interface_output.append(f"{high}:{low}")
    cur = high + 1
sel_signal_length_axi_interface_output_sum = sum(sel_signal_length_axi_interface_output_list)
current_instruction_length = current_instruction_length + sel_signal_length_axi_interface_output_sum

remapped_axi_interface_input_mapping_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in axi_interface_input_mapping_list
]
buffers = []
for name, ports, fsm in zip(axi_interface_input_name_list[0:], 
                            remapped_axi_interface_input_mapping_list[0:], 
                            FSM_state_allocation_axi_interface_input[0:]):
    entry = {
        "input_AXI_name": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}

with open(JSON_file_path + "AXI_interface_input.json", "w") as f:
    json.dump(data, f, indent=4)


remapped_axi_interface_output_mapping_list = [
    [remap_func_call_name(elem) for elem in sublist]
    for sublist in axi_interface_output_mapping_list
]
buffers = []
for name, ports, fsm in zip(axi_interface_output_name_list[0:], 
                            remapped_axi_interface_output_mapping_list[0:], 
                            FSM_state_allocation_axi_interface_output[0:]):
    entry = {
        "output_AXI_name": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}

with open(JSON_file_path + "AXI_interface_output.json", "w") as f:
    json.dump(data, f, indent=4)

##################### Finish Generate AXI interface input output #################

##################### Generate AXI interface reg #################

full_axi_reg_name_program_list = []
sel_signal_axi_reg_length_program_list = []
sel_signal_axi_reg_status_program_list = []
full_func_call_name_program_list = []
full_func_call_name_func_call_program_list = []

for i in range (len(HLS_project_solution_path_program_list)):
    full_axi_reg_name_list = []
    sel_signal_axi_reg_length_list = []
    sel_signal_axi_reg_status_list = []
    full_func_call_name_list = []
    full_func_call_name_func_call_list = []

    for j in range (len(op_program_list[i])):
        full_axi_reg_name, sel_signal_axi_reg_length, sel_signal_axi_reg_status, full_func_call_name, full_func_call_func_call_name = generate_AXI_reg(FSM_info_program_list[i], op_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_axi_reg_name_list.append(full_axi_reg_name)
        sel_signal_axi_reg_length_list.append(sel_signal_axi_reg_length)
        sel_signal_axi_reg_status_list.append(sel_signal_axi_reg_status)
        full_func_call_name_list.append(full_func_call_name)
        full_func_call_name_func_call_list.append(full_func_call_func_call_name)

    full_axi_reg_name_program_list.append(full_axi_reg_name_list)
    sel_signal_axi_reg_length_program_list.append(sel_signal_axi_reg_length_list)
    sel_signal_axi_reg_status_program_list.append(sel_signal_axi_reg_status_list)
    full_func_call_name_program_list.append(full_func_call_name_list)
    full_func_call_name_func_call_program_list.append(full_func_call_name_func_call_list)

#pprint(full_axi_reg_name_program_list)
#print("the value of axi_reg_mapping_program_list is:", axi_reg_mapping_program_list)
#print("the value of FSM info program list is:", FSM_info_program_list[0])
full_axi_reg_name_mapped_program_list = map_axi_regs_to_new_list(
    full_axi_reg_name_program_list,
    axi_reg_mapping_program_list
)
print("the value of full_axi_reg_name_mapped_program_list is:", full_axi_reg_name_mapped_program_list[0])
print("the value of full_func_call_name_func_call_program_list is:", full_func_call_name_func_call_program_list[0])
axi_reg_name_map = build_global_func_to_reg_map(
    full_axi_reg_name_mapped_program_list,
    full_func_call_name_func_call_program_list
)

axi_reg_name_list, axi_reg_name_mapping_list = map(list, zip(*axi_reg_name_map.items()))
#print("the value of axi_reg_name_map is:", axi_reg_name_map)
#print("the value of axi_reg_name_list is:", axi_reg_name_list)
#print("the value of axi_reg_name_mapping_list is:", axi_reg_name_mapping_list)

#print("the value of the axi_reg_name_mapping_list is:", axi_reg_name_mapping_list )
#print("the value of the axi_reg_name_list is:", axi_reg_name_list)
# print("the value of the full_axi_reg_name_mapped_program_list is:", full_axi_reg_name_mapped_program_list)
# print("the value of full_func_call_name_func_call_program_list is:", full_func_call_name_func_call_program_list)
# print("the value of axi_reg_name_list is:", axi_reg_name_list)
#print("the value of axi_reg_mapping_program_list is:", axi_reg_mapping_program_list)


sel_signal_length_axi_reg_list = []
for i in range (len(axi_reg_name_list)):
    sel_signal_length = (len(axi_reg_name_mapping_list[i])).bit_length()
    sel_signal_length_axi_reg_list.append(sel_signal_length)

sel_signal_status_axi_reg_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_axi_reg_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_axi_reg_list = []
        for j in range (len(axi_reg_name_list)):
            sel_signal_max = pow(2, sel_signal_length_axi_reg_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_axi_reg_list.append(sel_signal_status)
        sel_signal_status_axi_reg_branch_list.append(sel_signal_status_axi_reg_list)
    sel_signal_status_axi_reg_program_list.append(sel_signal_status_axi_reg_branch_list)

for i in range (len(op_program_list)):
    for u in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(op_program_list[i])):
            full_func_call_func_call_name = generate_AXI_reg_condition(FSM_info_program_list[i], op_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][u], i)
            #print("the value of full_func_call_func_call_name is:", full_func_call_func_call_name)
            axi_reg_related_list, axi_reg_related_cycle_list, axi_reg_related_pos_list = get_ops_related_axi_reg_condition(FSM_info_program_list[i], op_program_list[i][j], branch_condition_mapping_choices_program_list[i][u])

            unique_axi_reg_related_pos = list({num for pair in axi_reg_related_pos_list for num in pair})
            unique_axi_reg_related_cycle_list = [[] for n in range (len(unique_axi_reg_related_pos))]
            related_axi_reg_name_list = [[] for n in range (len(unique_axi_reg_related_pos))]

            for k in range (len(unique_axi_reg_related_pos)):
                unique_related_pos = unique_axi_reg_related_pos[k]
                for m in range (len(axi_reg_related_pos_list)):
                    if unique_related_pos in axi_reg_related_pos_list[m]:
                        unique_axi_reg_related_cycle_list[k].append(axi_reg_related_cycle_list[m])
                        unique_related_pos_index = axi_reg_related_pos_list[m].index(unique_related_pos)
                        related_axi_reg_name_list[k].append(axi_reg_related_list[m][int(unique_related_pos_index)])

            full_axi_reg_name_list = [[] for n in range (len(related_axi_reg_name_list))]
            for z in range (len(related_axi_reg_name_list)):
                for reg_name in related_axi_reg_name_list[z]:
                    if reg_name + '_reg' not in full_axi_reg_name_list[z]:
                        full_axi_reg_name_list[z].append(reg_name + '_reg') 
            for p in range (len(related_axi_reg_name_list)):
                corresponding_func_call_func_call_name = full_func_call_func_call_name[p]
                corresponding_func_call_func_call_name_index = axi_reg_name_list.index(corresponding_func_call_func_call_name)
                for q in range (len(related_axi_reg_name_list[p])):
                    current_cycle = unique_axi_reg_related_cycle_list[p][q]
                    current_port = related_axi_reg_name_list[p][q] + '_reg'
                    current_port_name_mapped = axi_reg_mapping_program_list[i][current_port]
                    current_port_index = axi_reg_name_mapping_list[int(corresponding_func_call_func_call_name_index)].index(current_port_name_mapped)
                    sel_signal_status_axi_reg_program_list[i][u][int(corresponding_func_call_func_call_name_index)][int(current_cycle)] = current_port_index

#pprint(sel_signal_status_axi_reg_program_list[0])
FSM_state_allocation_axi_reg = []
cur = current_instruction_length
for width in sel_signal_length_axi_reg_list:
    high = cur + width - 1
    low  = cur
    if width == 0:
        FSM_state_allocation_axi_reg.append("")
    elif width == 1:
        FSM_state_allocation_axi_reg.append(f"{low}")
    else:
        FSM_state_allocation_axi_reg.append(f"{high}:{low}")
    cur = high + 1

sel_signal_length_axi_reg_sum = sum(sel_signal_length_axi_reg_list)
current_instruction_length = current_instruction_length + sel_signal_length_axi_reg_sum

#print("the value of merged func call key program list is:", merged_func_call_key_program_list)

# def remap_axi_name(name: str) -> str:
#     for func in merged_func_call_key_program_list:
#         prefix = func + "_"
#         if name.startswith(prefix):
#             return name.replace(prefix, func_call_name_to_instance_call_name[func] + "_", 1)
#     return name

def remap_axi_name(name: str) -> str:
    # try longest func names first so "conv_3x3_second" beats "conv_3x3"
    for func in sorted(func_call_name_to_instance_call_name.keys(), key=len, reverse=True):
        prefix = func + "_"
        if name.startswith(prefix):
            inst = func_call_name_to_instance_call_name[func]
            return name.replace(prefix, inst + "_", 1)
    return name

remapped_axi_reg_name_list = [remap_axi_name(n) for n in axi_reg_name_list]

buffers = []
for name, ports, fsm in zip(remapped_axi_reg_name_list[0:], 
                            axi_reg_name_mapping_list[0:], 
                            FSM_state_allocation_axi_reg[0:]):
    entry = {
        "input_AXI_reg": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}

with open(JSON_file_path + "AXI_interface_reg.json", "w") as f:
    json.dump(data, f, indent=4)

##################### Finish Generate AXI interface reg ################# 

##################### Generate BRAM q0  ################# 

full_bram_q0_name_program_list = []
sel_signal_bram_q0_length_program_list = []
sel_signal_bram_q0_status_program_list = []
full_func_call_bram_q0_name_program_list = []
full_func_call_bram_q0_name_func_call_program_list = []


for i in range (len(HLS_project_solution_path_program_list)):
    full_bram_q0_name_list = []
    sel_signal_bram_q0_length_list = []
    sel_signal_bram_q0_status_list = []
    full_func_call_bram_q0_name_list = []
    full_func_call_bram_q0_name_func_call_list = []
    for j in range (len(op_program_list[i])):
        full_bram_q0_name, sel_signal_bram_q0_length, sel_signal_bram_q0_status, full_func_call_bram_q0_name, full_func_call_bram_q0_name_func_call = generate_bram_q0(FSM_info_program_list[i], op_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, i)
        full_bram_q0_name_list.append(full_bram_q0_name)
        sel_signal_bram_q0_length_list.append(sel_signal_bram_q0_length)
        sel_signal_bram_q0_status_list.append(sel_signal_bram_q0_status)
        full_func_call_name_list.append(full_func_call_bram_q0_name)
        full_func_call_bram_q0_name_func_call_list.append(full_func_call_bram_q0_name_func_call)

    full_bram_q0_name_program_list.append(full_bram_q0_name_list)
    sel_signal_bram_q0_length_program_list.append(sel_signal_bram_q0_length_list)
    sel_signal_bram_q0_status_program_list.append(sel_signal_bram_q0_status_list)
    full_func_call_bram_q0_name_program_list.append(full_func_call_name_list)
    full_func_call_bram_q0_name_func_call_program_list.append(full_func_call_bram_q0_name_func_call_list)


bram_q0_name_mapped_program_list = map_axi_regs_to_new_list(
    full_bram_q0_name_program_list,
    name_mapping_program_list
)

bram_q0_name_map = build_global_func_to_reg_map(
    bram_q0_name_mapped_program_list,
    full_func_call_bram_q0_name_func_call_program_list
)

# print("the value of bram_q0_name_mapped_program_list is:", bram_q0_name_mapped_program_list)
# print("the value of full_func_call_bram_q0_name_func_call", full_func_call_bram_q0_name_func_call_program_list)
# print("the value of bram_q0_name_map is:", bram_q0_name_map)


def flatten_bram_q0_list(nested_lists):
    """
    nested_lists: List[List[List[Any]]]
      e.g. [
             [ [a, b], [c], … ],   # program 1
             [ [x, y, z], [u], … ], # program 2
           ]
    returns List[List[Any]] where each inner list is fully flattened per program
    """
    return [ list(chain.from_iterable(prog)) for prog in nested_lists ]

# def group_bram_q0_instances(
#     all_bram_list: List[List[str]],
#     flattened_q0_lists: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     all_bram_list: For each program, a list of BRAM “base” names, e.g.
#         [
#           ['input_buffer', 'input_buffer_2', ...],
#           ['input_buffer', 'input_buffer_2', ...],
#           ...
#         ]

#     flattened_q0_lists: For each program, a flat list of “module-prefixed” instance-names such as
#         ['top_func_A_input_buffer', 'top_func_A_input_buffer_2', 'top_func_B_input_buffer_3', ...].

#     Returns: for each program i, a flat list of groups.  Each group is all inst-names that share
#     the same <module> + <base> prefix.  

#     Matching rules:
#       • If `base` ends in “_digits” (e.g. “input_buffer_2” or “buffer_3_1”), then match any instance
#         whose name starts with “<module>_<base>” (and may have more “_<digits>…” after it).
#       • If `base` does NOT end in “_digits” (e.g. “input_buffer”), then only match exactly
#         “<module>_input_buffer” (no extra “_2” suffix).
#     """
#     all_grouped: List[List[List[str]]] = []

#     for bases, insts in zip(all_bram_list, flattened_q0_lists):
#         prog_groups: List[List[str]] = []

#         for base in bases:
#             # 1) Detect whether `base` already has a “_<digits>” suffix:
#             if re.search(r"_\d+$", base):
#                 # base ends in _digits → allow matches like "<module>_<base>" or "<module>_<base>_..."
#                 pattern = re.compile(rf"^(.+?)_{re.escape(base)}(?:_|$)")
#             else:
#                 # base has NO trailing digits → match only exactly "<module>_<base>" (no extra suffix)
#                 pattern = re.compile(rf"^(.+?)_{re.escape(base)}$")

#             # 2) Group by “<module>_<base>” prefix (module = group(1))
#             by_mod = OrderedDict()
#             for name in insts:
#                 m = pattern.match(name)
#                 if not m:
#                     continue
#                 module = m.group(1)
#                 key = f"{module}_{base}"
#                 by_mod.setdefault(key, []).append(name)

#             # 3) Append each “<module>_<base>” bucket to prog_groups
#             prog_groups.extend(by_mod.values())

#         all_grouped.append(prog_groups)

#     return all_grouped


# def group_bram_q0_instances(
#     all_bram_list: List[List[str]],
#     flattened_q0_lists: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     all_bram_list: List of programs, each a list of BRAM base names, e.g.
#         [
#           ['BRAM_image_input', 'BRAM_conv_weight', ...],  # prog0
#           ['BRAM_image_input', 'BRAM_conv_weight', ..., 'BRAM_buffer_2'],  # prog1
#           ...
#         ]
#     flattened_q0_lists: parallel list of programs, each a flat list of 
#         names like 'top_conv2d_BRAM_conv_weight_2_3', 'top_store_BRAM_buffer_1_0', ...
#     Returns: for each program i, a flat list of groups. Each group is all
#         signals sharing the same module+BRAM_base prefix.
#     """
#     all_grouped = []
#     for bases, insts in zip(all_bram_list, flattened_q0_lists):
#         prog_groups = []
#         for base in bases:
#             # regex matches "<module>_<base>" at start, with optional "_suffix"
#             pattern = re.compile(rf'^(.+?)_{re.escape(base)}(?:_|$)')
#             by_mod = OrderedDict()
#             for name in insts:
#                 m = pattern.match(name)
#                 if not m:
#                     continue
#                 module = m.group(1)
#                 key = f"{module}_{base}"
#                 by_mod.setdefault(key, []).append(name)
#             # extend with each module+base group
#             prog_groups.extend(by_mod.values())
#         all_grouped.append(prog_groups)
#     return all_grouped


def group_bram_q0_instances(
    all_bram_list: List[List[str]],
    flattened_q0_lists: List[List[str]]
) -> List[List[List[str]]]:
    """
    Groups Q0 signal names by <module>_<BRAM base>.  A name is included in a
    base-group only if the part that follows the base is empty or consists
    solely of numeric underscore chunks ( _12, _0_3 …).
    """
    all_grouped: List[List[List[str]]] = []

    for bases, insts in zip(all_bram_list, flattened_q0_lists):
        prog_groups: List[List[str]] = []

        for base in bases:
            # allow:  ..._<base>            or ..._<base>_<digits>[_<digits>]*
            pattern = re.compile(rf'^(.+?)_{re.escape(base)}(?:_\d+)*$')

            by_mod = OrderedDict()
            for name in insts:
                m = pattern.match(name)
                if not m:
                    continue
                module = m.group(1)
                by_mod.setdefault(f"{module}_{base}", []).append(name)

            prog_groups.extend(by_mod.values())

        all_grouped.append(prog_groups)

    return all_grouped




# def group_bram_q0_instances(
#     all_bram_list: List[List[str]],
#     flattened_q0_lists: List[List[str]]
# ) -> List[List[List[str]]]:
#     """
#     all_bram_list: List of programs, each a list of BRAM base names, e.g.
#         [
#           ['BRAM_image_input', 'BRAM_conv_weight', ...],  # prog0
#           ['BRAM_image_input', 'BRAM_conv_weight', ..., 'BRAM_buffer_2'],  # prog1
#           ...
#         ]
#     flattened_q0_lists: parallel list of programs, each a flat list of 
#         names like 'top_conv2d_BRAM_conv_weight_2_3', 'top_store_BRAM_buffer_1_0', ...
#     Returns: for each program i, a flat list of groups. Each group is all
#         signals sharing the same module+BRAM_base prefix.
#     """
#     all_grouped = []
#     for bases, insts in zip(all_bram_list, flattened_q0_lists):
#         prog_groups = []
#         for base in bases:
#             token = f"_{base}_"
#             # pick out every instance matching that base
#             matches = [name for name in insts if token in name]
#             if not matches:
#                 continue
#             # group those by module prefix
#             # (OrderedDict preserves the first‐seen module order)
#             by_mod = OrderedDict()
#             for name in matches:
#                 module = name.split(token, 1)[0]
#                 key = f"{module}_{base}"
#                 by_mod.setdefault(key, []).append(name)
#             # each module+base becomes one sublist
#             prog_groups.extend(by_mod.values())
#         all_grouped.append(prog_groups)
#     return all_grouped

def map_bram_q0_group_instance_call(
    unroll_grouped: List[List[List[str]]],
    func_call_keys: List[str],
    sorted_funcs: List[str],
    instance_calls: List[str]
) -> List[List[List[str]]]:
    """
    For each program’s groups of BRAM-q0 names, replace the module prefix
    (e.g. 'top_conv2d') with the corresponding instance call
    (e.g. 'grp_conv2d_fu_213'), preserving the '_BRAM_…' suffix.

    unroll_grouped[i][j][k] is the k-th name in the j-th group of program i.
    func_call_keys[m] is the module prefix to match (e.g. 'top_conv2d').
    instance_calls[m] is its replacement prefix (e.g. 'grp_conv2d_fu_213').

    Returns a new structure of the same shape with each string remapped.
    """
    remapped_all = []
    for prog_groups in unroll_grouped:
        remapped_prog = []
        for group in prog_groups:
            remapped_group = []
            for name in group:
                # find which func_call_key this name starts with
                match = next((key for key in func_call_keys if name.startswith(key)), None)
                if match is None:
                    raise ValueError(f"No matching func_call_key for '{name}'")
                idx = func_call_keys.index(match)
                inst_call = instance_calls[idx]
                suffix = name[len(match):]  # e.g. '_BRAM_image_input_0'
                remapped_group.append(f"{inst_call}{suffix}")
            remapped_prog.append(remapped_group)
        remapped_all.append(remapped_prog)
    return remapped_all

def find_ungrouped_bram_q0(
    all_bram_list: List[List[str]],
    flattened_q0_lists: List[List[str]]
) -> List[List[str]]:
    """
    Returns a parallel list: for each program i, the q0 names that were
    *not* captured by any module+BRAM_base group.
    """
    grouped = group_bram_q0_instances(all_bram_list, flattened_q0_lists)

    ungrouped_all = []
    for insts, prog_groups in zip(flattened_q0_lists, grouped):
        # flatten all grouped names into a set for quick lookup
        grouped_names = {name for grp in prog_groups for name in grp}
        # keep only those that never appeared in any group
        ungrouped = [name for name in insts if name not in grouped_names]
        ungrouped_all.append(ungrouped)

    return ungrouped_all


def _module_prefix(port: str) -> str:
    """
    Strip trailing numeric suffixes:
      'top_conv_3x3_input_0'        -> 'top_conv_3x3_input'
      'top_conv_1x1_kernel_2_3_0_0' -> 'top_conv_1x1_kernel'
      'top_store_input_3'           -> 'top_store_input'
    """
    tokens = port.split('_')
    prefix_tokens = []
    for tok in tokens:
        if tok.isdigit():          # first token that is digits only ⇒ stop
            break
        prefix_tokens.append(tok)
    return '_'.join(prefix_tokens)

def group_ungrouped_bram_q0_ports(
    program_lists: List[List[str]]
) -> List[List[List[str]]]:
    """
    Parameters
    ----------
    program_lists : every element is the flat list of q0 port names
                    for one 'program'

    Returns
    -------
    List of programs → list of groups → grouped port names
    """
    grouped_all_programs: List[List[List[str]]] = []

    for port_list in program_lists:
        by_prefix: Dict[str, List[str]] = OrderedDict()
        for port in port_list:
            prefix = _module_prefix(port)
            by_prefix.setdefault(prefix, []).append(port)
        grouped_all_programs.append(list(by_prefix.values()))

    return grouped_all_programs


print("the value of full_func_call_bram_q0_name_func_call_program_list is:")
print(full_func_call_bram_q0_name_func_call_program_list)

flattened_bram_q0_name_list = flatten_bram_q0_list(full_func_call_bram_q0_name_func_call_program_list)

print("the value of flattened_bram_q0_name_list is:")
print(flattened_bram_q0_name_list)
print("the value of all_bram_lists is:")
print(all_bram_lists)

ungrouped_BRAM_q0_name_program_list = find_ungrouped_bram_q0(all_bram_lists, flattened_bram_q0_name_list)
#print("ungrouped_BRAM_q0_name_program_list:", ungrouped_BRAM_q0_name_program_list)

grouped_ungrouped_BRAM_q0_ports = group_ungrouped_bram_q0_ports(ungrouped_BRAM_q0_name_program_list)
#print("grouped_ungrouped_BRAM_q0_ports:", grouped_ungrouped_BRAM_q0_ports)

unroll_grouped_BRAM_q0_name_program_list = group_bram_q0_instances(all_bram_lists, flattened_bram_q0_name_list)

unroll_grouped_BRAM_q0_name_program_list = deepcopy(unroll_grouped_BRAM_q0_name_program_list)
# -----------------------------------------------------------------

# Extend each program’s group list with the extra groups
for prog_groups, extra_groups in zip(
        unroll_grouped_BRAM_q0_name_program_list,
        grouped_ungrouped_BRAM_q0_ports):
    prog_groups.extend(extra_groups)

#print("the value of unroll_grouped_BRAM_q0_name_program_list is:")
#print(unroll_grouped_BRAM_q0_name_program_list)

#print("the value of all_bram_lists is:", all_bram_lists)
#print("the value of flattened_bram_q0_name_list is:", flattened_bram_q0_name_list)

sorted_funcs = sorted(merged_func_call_key_program_list, key=len, reverse=True)
unroll_grouped_BRAM_q0_name_program_mapped_list = map_bram_q0_group_instance_call(unroll_grouped_BRAM_q0_name_program_list,merged_func_call_key_program_list,sorted_funcs, merged_instance_call_program_list)
merged_grouped_unrolled_BRAM_q0_list = merge_grouped_unrolled_BRAM_q0(unroll_grouped_BRAM_q0_name_program_list)
#print("the value of merged_grouped_unrolled_BRAM_q0_list is:", merged_grouped_unrolled_BRAM_q0_list)

#print("the value of bram_q0_name_map is:")
#print(bram_q0_name_map)

bram_q0_name_list, bram_q0_name_mapping_list = map(list, zip(*bram_q0_name_map.items()))
func_idx = {name: i for i, name in enumerate(merged_func_call_key_program_list)}

#print("the value of bram_q0_name_list is:", bram_q0_name_list)

connected_bram_q0_type_list = []

sorted_funcs = sorted(merged_func_call_key_program_list, key=len, reverse=True)

for full_name in bram_q0_name_list:
    # 1) find which func_call in our merged list is the prefix of full_name
    func_call = next(
        (f for f in sorted_funcs
         if full_name.startswith(f + "_")),
        None
    )
    if func_call is None:
        raise ValueError(f"No matching function prefix found for '{full_name}'")

    # 2) chop off "<func_call>_" to get the port key
    port_key = full_name[len(func_call) + 1:]

    # 3) grab that function's port‐type dict
    idx = func_idx[func_call]
    port_dict = all_counts[idx]

    # 4) look up the suffix directly in the dict
    try:
        port_type = port_dict[port_key]
    except KeyError:
        raise KeyError(f"Port '{port_key}' not found in all_counts[{idx}] for function '{func_call}'")

    connected_bram_q0_type_list.append(port_type)
# connected_bram_q0_type_list = []

# for full_name in bram_q0_name_list:
#     # split on the first "_BRAM_"
#     func_call, port_suffix = full_name.split('_BRAM_', 1)
#     port_name = 'BRAM_' + port_suffix
    
#     # find its index in the merged list
#     try:
#         idx = merged_func_call_key_program_list.index(func_call)
#     except ValueError:
#         idx = None  # not found
    
#     port_type = all_counts[idx][port_name]
#     connected_bram_q0_type_list.append(port_type)

# print("the value of connected_bram_q0_type_list is:", connected_bram_q0_type_list)
# print("the value of bram_q0_name_list is:", bram_q0_name_list)
# print("the value of bram_q0_name_mapping_list is:", bram_q0_name_mapping_list)
 
bram_q0_name_list_updated = []
bram_q0_name_mapping_list_updated = [] 
bram_q1_name_list_updated = []
bram_q1_name_mapping_list_updated = [] 

bram_q1_name_list_updated_temp = []
bram_q1_name_mapping_list_updated_temp = [] 

#print("the value of bram q0 name mapping list is:", bram_q0_name_mapping_list)
print("the value of bram_q0_name_list is:", bram_q0_name_list)
print("the value of func_call_interface_name_list is:", func_call_interface_name_list)



# def check_bram_q1_connections(filename, target_module_type, bram_list):
#     """
#     Parses a Verilog file and checks if specific BRAM '_q1' ports are connected 
#     to a decimal zero literal (ending in 'd0), ignoring the bitwidth.
#     """
    
#     # 1. Parse the Verilog file into an AST
#     try:
#         ast, _ = parse([filename])
#     except Exception as e:
#         print(f"Error parsing {filename}: {e}")
#         return [False] * len(bram_list)

#     # 2. Traverse AST to find the specific module instantiation
#     port_connections = {}
#     found_instance = False

#     def visit(node):
#         nonlocal found_instance
#         if isinstance(node, Instance) and node.module == target_module_type:
#             found_instance = True
#             for port in node.portlist:
#                 if isinstance(port, PortArg):
#                     arg = port.argname
#                     # Extract string value
#                     if isinstance(arg, IntConst):
#                         val = f"{arg.value}"
#                     else:
#                         val = str(arg)
#                     port_connections[port.portname] = val
#             return

#         if not found_instance:
#             for child in node.children():
#                 visit(child)

#     visit(ast)

#     if not found_instance:
#         print(f"Warning: Instance '{target_module_type}' not found in {filename}.")
#         return [False] * len(bram_list)

#     # 3. Check connections
#     results = []
#     prefix = target_module_type + '_'

#     for full_bram_name in bram_list:
#         # Normalize name: 'top_dataflow_region_BRAM_input_buffer_0' -> 'BRAM_input_buffer_0'
#         if full_bram_name.startswith(prefix):
#             base_name = full_bram_name[len(prefix):]
#         else:
#             base_name = full_bram_name
            
#         target_port = base_name + '_q1'
        
#         is_match = False
#         if target_port in port_connections:
#             val = port_connections[target_port].strip()
#             # MODIFIED LOGIC: Check if it ends with 'd0 (ignoring the bitwidth prefix)
#             if val.endswith("'d0"):
#                 is_match = True
                
#         results.append(is_match)
            
#     return results


def check_bram_q1_connections(filename_list, target_module_list, bram_list):
    """
    Parses a list of Verilog files and checks if specific BRAM '_q1' ports are connected 
    to a decimal zero literal (ending in 'd0), using a corresponding list
    of target module names to locate the correct instance for each BRAM.
    """
    
    # 1. Parse the Verilog files into a single AST
    # parse() expects a list of filenames
    try:
        ast, _ = parse(filename_list)
    except Exception as e:
        print(f"Error parsing files {filename_list}: {e}")
        return [False] * len(bram_list)

    # 2. Identify unique target modules we need to find
    # We use a dictionary to store the port connections for each unique module type found.
    # Key: Module Name (str), Value: Port Dictionary (dict) or None
    unique_targets = set(target_module_list)
    module_port_maps = {name: None for name in unique_targets if name is not None}

    # 3. Traverse AST to find the specific module instantiations
    def visit(node):
        # Check if this node is an instance of one of our target modules
        # and if we haven't already found/mapped it.
        if isinstance(node, Instance) and node.module in module_port_maps:
            if module_port_maps[node.module] is None:
                current_ports = {}
                for port in node.portlist:
                    if isinstance(port, PortArg):
                        arg = port.argname
                        # Extract string value
                        if isinstance(arg, IntConst):
                            val = f"{arg.value}"
                        else:
                            val = str(arg)
                        current_ports[port.portname] = val
                
                # Save the map for this module type
                module_port_maps[node.module] = current_ports

        # Continue traversing
        for child in node.children():
            visit(child)

    visit(ast)

    # 4. Check connections using the paired lists
    results = []
    
    for full_bram_name, target_module in zip(bram_list, target_module_list):
        # Safety check if module name extraction failed (None) or module wasn't found in Verilog
        if target_module is None or module_port_maps.get(target_module) is None:
            results.append(False)
            continue
            
        port_connections = module_port_maps[target_module]
        prefix = target_module + '_'

        # Normalize name: 'top_dataflow_region_BRAM_input_buffer_0' -> 'BRAM_input_buffer_0'
        if full_bram_name.startswith(prefix):
            base_name = full_bram_name[len(prefix):]
        else:
            base_name = full_bram_name
            
        target_port = base_name + '_q1'
        
        is_match = False
        if target_port in port_connections:
            val = port_connections[target_port].strip()
            # Check if it ends with 'd0 (ignoring the bitwidth prefix)
            if val.endswith("'d0"):
                is_match = True
                
        results.append(is_match)
            
    return results



for i in range (len(bram_q0_name_list)):
    
    full_name = bram_q0_name_list[i]
    key = next((k for k in sorted_funcs if full_name.startswith(k + "_")), None)
    if key is None:
        continue
    idx = merged_func_call_key_program_list.index(key)
    iface = func_call_interface_name_list[idx]
    
    # 2) strip off the "top_{func}_" prefix to get just the BRAM suffix
    suffix = full_name[len(key) + 1:]   # e.g. "BRAM_buffer_1_0"
    
    # 3) build the port names to look for
    q0 = f"{suffix}_q0"
    q1 = f"{suffix}_q1"
    
    # 4) keep the original full_name if either port exists in iface
    if q1 in iface:
        bram_q1_name_list_updated.append(bram_q0_name_list[i])
        bram_q1_name_mapping_list_updated.append(bram_q0_name_mapping_list[i]) 
    if q0 in iface:
        bram_q0_name_list_updated.append(bram_q0_name_list[i])
        bram_q0_name_mapping_list_updated.append(bram_q0_name_mapping_list[i]) 

print("the value of func_call_key_program_list is:", func_call_key_program_list)
print("the value of merged_func_call_key_program_list is:", merged_func_call_key_program_list)

extracted_bram_q1_module_names = []

for bram_name in bram_q1_name_list_updated:
    # Check if the BRAM name starts with any of the module names
    for module in merged_func_call_key_program_list:
        if bram_name.startswith(module):
            extracted_bram_q1_module_names.append(module)
            break
print("the value of extracted_bram_q1_module_names is:", extracted_bram_q1_module_names)

result_bram_q1_indices = []

for name in extracted_bram_q1_module_names:
    found_index = None
    for i, sublist in enumerate(func_call_key_program_list):
        if name in sublist:
            found_index = i
            break  # Stop after the first encounter
    result_bram_q1_indices.append(found_index)

print("the value of result_bram_q1_indices is:", result_bram_q1_indices)

verilog_file_path_list = []
for i in range(len(result_bram_q1_indices)):
    index = result_bram_q1_indices[i]
    verilog_file_path_list.append(HLS_project_solution_path_program_list[index] + '/impl/verilog/top.v')

#verilog_file_path = HLS_project_solution_path_program_list[0] + '/impl/verilog/top.v'
bram_q1_name_list_is_zero_list = check_bram_q1_connections(verilog_file_path_list, extracted_bram_q1_module_names, bram_q1_name_list_updated)
# for i in range (len(bram_q1_name_list_is_zero_list)):
#     if bram_q1_name_list_is_zero_list[i] == False:
#         bram_q1_name_list_updated.append(bram_q1_name_list_updated_temp[i])
#         bram_q1_name_mapping_list_updated.append(bram_q1_name_mapping_list_updated_temp[i])
#     else:
# print("the value of bram_q1_name_list_is_zero_list is:", bram_q1_name_list_is_zero_list)
# print("the value of bram_q1_name_list_updated is:", bram_q1_name_list_updated)    
# print("the value of bram_q1_name_mapping_list_updated is:", bram_q1_name_mapping_list_updated)
# print("the value of bram_q0_name_list_updated is:", bram_q0_name_list_updated)
# print("the value of bram_q0_name_mapping_list_updated is:", bram_q0_name_mapping_list_updated)
# print("the value of bram_q0_name_list_updated:", bram_q0_name_list_updated)           
# print("the value of bram_q1_name_list_updated", bram_q1_name_list_updated)
# print("the value of bram_q0_name_list is:", bram_q0_name_list)
# print("the value of bram_q1_name_list is:", bram_q1_name_list)
# print("the value of func_call_interface_name_list is:", func_call_interface_name_list)        
# bram_q1_name_mapping_list = [] 
# for i in range (len(bram_q0_name_list)):
#     if connected_bram_q0_type_list[i] == 2:
#         bram_q1_name_mapping_list.append(bram_q0_name_mapping_list[i])   

sel_signal_length_bram_q0_list = []
for i in range (len(bram_q0_name_list_updated)):
    sel_signal_length = (len(bram_q0_name_mapping_list_updated[i])).bit_length()
    sel_signal_length_bram_q0_list.append(sel_signal_length)

print("the value of bram_q0_name_mapping_list_updated is:")
print(bram_q0_name_mapping_list_updated)

print("the value of sel_signal_length_bram_q0_list is:")
print(sel_signal_length_bram_q0_list)
    
sel_signal_length_bram_q1_list = []
for i in range (len(bram_q1_name_list_updated)):
    sel_signal_length = (len(bram_q1_name_mapping_list_updated[i])).bit_length()
    sel_signal_length_bram_q1_list.append(sel_signal_length)

sel_signal_status_bram_q0_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_q0_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_q0_list = []
        for j in range (len(bram_q0_name_list_updated)):
            sel_signal_max = pow(2, sel_signal_length_bram_q0_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_q0_list.append(sel_signal_status)
        sel_signal_status_bram_q0_branch_list.append(sel_signal_status_bram_q0_list)
    sel_signal_status_bram_q0_program_list.append(sel_signal_status_bram_q0_branch_list)

sel_signal_status_bram_q1_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sel_signal_status_bram_q1_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        sel_signal_status_bram_q1_list = []
        for j in range (len(bram_q1_name_list_updated)):
            sel_signal_max = pow(2, sel_signal_length_bram_q1_list[j]) - 1
            sel_signal_status = [sel_signal_max] * (len(FSM_info_program_list[i]) + 1)
            sel_signal_status_bram_q1_list.append(sel_signal_status)
        sel_signal_status_bram_q1_branch_list.append(sel_signal_status_bram_q1_list)
    sel_signal_status_bram_q1_program_list.append(sel_signal_status_bram_q1_branch_list)
    
#pprint(name_mapping_program_list)

for i in range (len(op_program_list)):
    for u in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(op_program_list[i])):
            full_func_call_func_call_name = generate_bram_q0_condition(FSM_info_program_list[i], op_program_list[i][j], merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, HLS_project_solution_path_program_list, branch_condition_mapping_choices_program_list[i][u], i)
            bram_q0_related_list, bram_q0_related_cycle_list, bram_q0_related_pos_list = get_ops_related_bram_q0_condition(FSM_info_program_list[i], op_program_list[i][j], branch_condition_mapping_choices_program_list[i][u])
            #print("the full_bram_q0_name is:", full_bram_q0_name)
            unique_bram_q0_related_pos = list({num for pair in bram_q0_related_pos_list for num in pair})
            unique_bram_q0_related_cycle_list = [[] for n in range (len(unique_bram_q0_related_pos))]
            related_bram_q0_name_list = [[] for n in range (len(unique_bram_q0_related_pos))]
            
            #print("the unique_bram_q0_related_pos is:", unique_bram_q0_related_pos)

            for k in range (len(unique_bram_q0_related_pos)):
                unique_related_pos = unique_bram_q0_related_pos[k]
                for m in range (len(bram_q0_related_pos_list)):
                    if unique_related_pos in bram_q0_related_pos_list[m]:
                        unique_bram_q0_related_cycle_list[k].append(bram_q0_related_cycle_list[m])
                        unique_related_pos_index = bram_q0_related_pos_list[m].index(unique_related_pos)
                        related_bram_q0_name_list[k].append(bram_q0_related_list[m][int(unique_related_pos_index)])
            #print("the related_bram_q0_name_list is:", related_bram_q0_name_list)

            full_bram_q0_name_list = [[] for n in range (len(related_bram_q0_name_list))]
            for z in range (len(related_bram_q0_name_list)):
                for reg_name in related_bram_q0_name_list[z]:
                    if reg_name not in full_bram_q0_name_list[z]:
                        full_bram_q0_name_list[z].append(reg_name) 
                        
            #print("the full_bram_q0_name_list is:", full_bram_q0_name_list)
            for p in range (len(related_bram_q0_name_list)):
                corresponding_func_call_func_call_name = full_func_call_func_call_name[p]
                #print("the value of corresponding func call is:", corresponding_func_call_func_call_name)
                if corresponding_func_call_func_call_name in bram_q0_name_list_updated:
                    corresponding_func_call_func_call_name_index = bram_q0_name_list_updated.index(corresponding_func_call_func_call_name)
                    for q in range (len(related_bram_q0_name_list[p])):
                        current_cycle = unique_bram_q0_related_cycle_list[p][q]
                        current_port = related_bram_q0_name_list[p][q]
                        current_port_name_mapped = name_mapping_program_list[i][current_port]
                        current_port_index = bram_q0_name_mapping_list_updated[int(corresponding_func_call_func_call_name_index)].index(current_port_name_mapped)
                        sel_signal_status_bram_q0_program_list[i][u][int(corresponding_func_call_func_call_name_index)][int(current_cycle)] = current_port_index
            
            for p in range (len(related_bram_q0_name_list)):
                corresponding_func_call_func_call_name = full_func_call_func_call_name[p]
                if corresponding_func_call_func_call_name in bram_q1_name_list_updated:
                    corresponding_func_call_func_call_name_index_2nd_port = bram_q1_name_list_updated.index(corresponding_func_call_func_call_name)
                    for q in range (len(related_bram_q0_name_list[p])):
                        current_cycle = unique_bram_q0_related_cycle_list[p][q]
                        current_port = related_bram_q0_name_list[p][q]
                        current_port_name_mapped = name_mapping_program_list[i][current_port]
                        #print("the value of current_port_name_mapped for 2nd port is:", current_port_name_mapped)
                        current_port_index = bram_q1_name_mapping_list_updated[int(corresponding_func_call_func_call_name_index_2nd_port)].index(current_port_name_mapped)
                        sel_signal_status_bram_q1_program_list[i][u][int(corresponding_func_call_func_call_name_index_2nd_port)][int(current_cycle)] = current_port_index
          
        # for p in range (len(related_bram_q0_name_list)):
        #     corresponding_func_call_func_call_name = full_func_call_func_call_name[p]
        #     #print("the value of corresponding func call is:", corresponding_func_call_func_call_name)
        #     corresponding_func_call_func_call_name_index = bram_q0_name_list_updated.index(corresponding_func_call_func_call_name)
        #     corresponding_func_call_func_call_bram_type = connected_bram_q0_type_list[int(corresponding_func_call_func_call_name_index)]
        #     if corresponding_func_call_func_call_bram_type == 2:
        #         corresponding_func_call_func_call_name_index_2nd_port = bram_q1_name_list_updated.index(corresponding_func_call_func_call_name)
        #         for q in range (len(related_bram_q0_name_list[p])):
        #             current_cycle = unique_bram_q0_related_cycle_list[p][q]
        #             current_port = related_bram_q0_name_list[p][q]
        #             current_port_name_mapped = name_mapping_program_list[i][current_port]
        #             #print("the value of current_port_name_mapped for 2nd port is:", current_port_name_mapped)
        #             current_port_index = bram_q1_name_mapping_list_updated[int(corresponding_func_call_func_call_name_index_2nd_port)].index(current_port_name_mapped)
        #             sel_signal_status_bram_q1_program_list[i][int(corresponding_func_call_func_call_name_index_2nd_port)][int(current_cycle)] = current_port_index
print("the value of erged_grouped_unrolled_BRAM_q0_list is:")
print(merged_grouped_unrolled_BRAM_q0_list)
print("the value of bram_q0_name_list_updated is:")
print(bram_q0_name_list_updated)
FSM_state_allocation_bram_q0_unroll_grouped = []
cur = current_instruction_length
for i in range (len(merged_grouped_unrolled_BRAM_q0_list)):
    selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[i][0] 
    if selected_bram_q0_name in bram_q0_name_list_updated:
        selected_bram_index = bram_q0_name_list_updated.index(selected_bram_q0_name) 
        width = sel_signal_length_bram_q0_list[int(selected_bram_index)]
        high = cur + width - 1
        low  = cur
        if width == 0:
            FSM_state_allocation_bram_q0_unroll_grouped.append("")
        elif width == 1:
            FSM_state_allocation_bram_q0_unroll_grouped.append(f"{low}")
        else:
            FSM_state_allocation_bram_q0_unroll_grouped.append(f"{high}:{low}")
        cur = high + 1
    else:
        FSM_state_allocation_bram_q0_unroll_grouped.append("")

FSM_state_allocation_bram_q1_unroll_grouped = []
for i in range (len(merged_grouped_unrolled_BRAM_q0_list)):
    selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[i][0] 
    if selected_bram_q0_name in bram_q1_name_list_updated:
        selected_bram_index = bram_q1_name_list_updated.index(selected_bram_q0_name) 
        width = sel_signal_length_bram_q1_list[int(selected_bram_index)]
        high = cur + width - 1
        low  = cur
        if width == 0:
            FSM_state_allocation_bram_q1_unroll_grouped.append("")
        elif width == 1:
            FSM_state_allocation_bram_q1_unroll_grouped.append(f"{low}")
        else:
            FSM_state_allocation_bram_q1_unroll_grouped.append(f"{high}:{low}")
        cur = high + 1
    else:
        FSM_state_allocation_bram_q1_unroll_grouped.append("")

# FSM_state_allocation_bram_q1_unroll_grouped = []
# for i in range (len(merged_grouped_unrolled_BRAM_q0_list)):
#     selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[i][0] 
#     selected_bram_q0_index = bram_q0_name_list_updated.index(selected_bram_q0_name)
#     bram_q0_type = connected_bram_q0_type_list[int(selected_bram_q0_index)] 
#     if bram_q0_type == 2: 
#         selected_bram_index = bram_q1_name_list_updated.index(selected_bram_q0_name) 
#         width = sel_signal_length_bram_q1_list[int(selected_bram_index)]
#         high = cur + width - 1
#         low  = cur
#         if width == 0:
#             FSM_state_allocation_bram_q1_unroll_grouped.append("")
#         elif width == 1:
#             FSM_state_allocation_bram_q1_unroll_grouped.append(f"{low}")
#         else:
#             FSM_state_allocation_bram_q1_unroll_grouped.append(f"{high}:{low}")
#         cur = high + 1
#     else:
#         FSM_state_allocation_bram_q1_unroll_grouped.append("")

FSM_state_allocation_bram_q0 = []
for i in range (len(sel_signal_length_bram_q0_list)):
    bram_q0_name = bram_q0_name_list_updated[i]
    bram_name_group_index = find_bram_q0_group_index(merged_grouped_unrolled_BRAM_q0_list, bram_q0_name)
    width = sel_signal_length_bram_q0_list[i]
    if width == 0:
        FSM_state_allocation_bram_q0.append("")
    elif width == 1:
        FSM_state_allocation_bram_q0.append(FSM_state_allocation_bram_q0_unroll_grouped[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_q0.append(FSM_state_allocation_bram_q0_unroll_grouped[int(bram_name_group_index)])

FSM_state_allocation_bram_q1 = []
for i in range (len(sel_signal_length_bram_q1_list)):
    bram_q1_name = bram_q1_name_list_updated[i]
    bram_name_group_index = find_bram_q0_group_index(merged_grouped_unrolled_BRAM_q0_list, bram_q1_name)
    width = sel_signal_length_bram_q1_list[i]
    if width == 0:
        FSM_state_allocation_bram_q1.append("")
    elif width == 1:
        FSM_state_allocation_bram_q1.append(FSM_state_allocation_bram_q1_unroll_grouped[int(bram_name_group_index)])
    else:
        FSM_state_allocation_bram_q1.append(FSM_state_allocation_bram_q1_unroll_grouped[int(bram_name_group_index)])
# FSM_state_allocation_bram_q0 = []
# cur = current_instruction_length
# for width in sel_signal_length_bram_q0_list:
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_q0.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_q0.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_q0.append(f"{high}:{low}")
#     cur = high + 1
    
# FSM_state_allocation_bram_q1 = []
# for width in sel_signal_length_bram_q1_list:
#     high = cur + width - 1
#     low  = cur
#     if width == 0:
#         FSM_state_allocation_bram_q1.append("")
#     elif width == 1:
#         FSM_state_allocation_bram_q1.append(f"{low}")
#     else:
#         FSM_state_allocation_bram_q1.append(f"{high}:{low}")
#     cur = high + 1

# sel_signal_length_bram_q0_sum = sum(sel_signal_length_bram_q0_list) + sum(sel_signal_length_bram_q1_list)
# current_instruction_length = current_instruction_length + sel_signal_length_bram_q0_sum
current_instruction_length = cur

remapped_bram_q0_name_list = [remap_axi_name(n) for n in bram_q0_name_list_updated]
remapped_bram_q1_name_list = [remap_axi_name(n) for n in bram_q1_name_list_updated]
buffers = []
for name, ports, fsm in zip(remapped_bram_q0_name_list[0:], 
                            bram_q0_name_mapping_list_updated[0:], 
                            FSM_state_allocation_bram_q0[0:]):
    case_mappings = [{"func_name": func} for func in ports]
    if not case_mappings:
        continue
    entry = {
        "input_buffer_name": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}

with open(JSON_file_path + "BRAM_q0.json", "w") as f:
    json.dump(data, f, indent=4)

bram_q1_name_mapping_list_updated_final = [[] for _ in range (len(bram_q1_name_list_updated))]
    
for i in range (len(bram_q1_name_list_is_zero_list)):
    if bram_q1_name_list_is_zero_list[i] == False:
        for func in bram_q1_name_mapping_list_updated[i]:
            bram_q1_name_mapping_list_updated_final[i].append(func)
    else:
            bram_q1_name_mapping_list_updated_final[i].append("'d0")
    
    
buffers = []
for name, ports, fsm in zip(remapped_bram_q1_name_list[0:], 
                            bram_q1_name_mapping_list_updated_final[0:], 
                            FSM_state_allocation_bram_q1[0:]):
    case_mappings = [{"func_name": func} for func in ports]
    if not case_mappings:
        continue
    entry = {
        "input_buffer_name": name,
        "case_mappings": [{"func_name": func} for func in ports],
        "fsm_state_range": fsm
    }
    buffers.append(entry)

# wrap and dump to file
data = {"buffers": buffers}
if remapped_bram_q1_name_list:
    with open(JSON_file_path + "BRAM_q1.json", "w") as f:
        json.dump(data, f, indent=4)

##################### Finish Generate BRAM q0  ################# 

#################### Start to generate the instructions ####################
print("the value of scheduled states program list is:", scheduled_states_program_list)

ops_related_cycle_program_list = []

for i in range (len(op_program_list)):
    ops_related_cycle_branch_list = []
    for k in range (len(branch_condition_mapping_choices_program_list[i])):
        ops_related_cycle_list = []
        for j in range (len(op_program_list[i])):
            related_cycle = get_ops_related_cycle_condition(FSM_info_program_list[i], op_program_list[i][j], branch_condition_mapping_choices_program_list[i][k])    
            ops_related_cycle_list.append(related_cycle)
        ops_related_cycle_branch_list.append(ops_related_cycle_list)
    ops_related_cycle_program_list.append(ops_related_cycle_branch_list)

print("the value of ops_related_cycle_program_list is:", ops_related_cycle_program_list)
print("the value of func_call key program index list is:", func_call_key_program_index_list)
all_tree_node_head_program_list = []
for i in range (len(root_program_list)):
    all_tree_node_head = collect_heads(root_program_list[i])
    all_tree_node_head_program_list.append(all_tree_node_head)
print("the value of all_tree_node_head is:", all_tree_node_head_program_list)

FSM_state_list_count_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    FSM_state_list_count_program_branch_list = []
    for j in range (len(all_tree_node_head_program_list[i])):
        FSM_state_list_count = list_length(all_tree_node_head_program_list[i][j])
        FSM_state_list_count_program_branch_list.append(FSM_state_list_count)
    FSM_state_list_count_program_list.append(FSM_state_list_count_program_branch_list)
#print("the value of FSM_state_list_count_program_list is:", FSM_state_list_count_program_list)

# whole_func_call_binary_program_list = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     whole_func_call_binary_list = [
#         ['0'] * total_states_need
#         for _ in range(len(FSM_info_program_list[i]) + 1)
#     ]
#     whole_func_call_binary_program_list.append(whole_func_call_binary_list)
whole_func_call_binary_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    whole_func_call_binary_program_segment_list = []
    for j in range (len(branch_condition_mapping_choices_program_list[i])):
        whole_func_call_binary_list = [
            ['0'] * total_states_need
            for _ in range(len(FSM_info_program_list[i]) + 1)
        ]
        whole_func_call_binary_program_segment_list.append(whole_func_call_binary_list)
    whole_func_call_binary_program_list.append(whole_func_call_binary_program_segment_list)


for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(ops_related_cycle_program_list[i][m])):
            for k in range (len(ops_related_cycle_program_list[i][m][j])):
                related_cycle = ops_related_cycle_program_list[i][m][j][k]
                scheduled_states = func_call_key_program_index_list[i][j]
                whole_func_call_binary_program_list[i][m][int(related_cycle)][int(scheduled_states)] = '1'  
# print("the value of whole_func_call_binary_program_list is:")
# pprint(whole_func_call_binary_program_list)

# final_whole_func_call_binary_program_list = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     final_whole_func_call_binary_list = []
#     curr = head_program_list[i]
#     count = 0
#     while curr is not None:
#         related_cycle = curr.value
#         final_whole_func_call_binary_list.append(whole_func_call_binary_program_list[i][int(related_cycle)])
#         count += 1
#         curr = curr.next
#     final_whole_func_call_binary_program_list.append(final_whole_func_call_binary_list)

# final_whole_func_call_binary_shrinked_program_list = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     final_whole_func_call_binary_shrinked_list = []
#     for j in range (1, len(final_whole_func_call_binary_program_list[i]), 2):
#         final_whole_func_call_binary_shrinked_list.append(final_whole_func_call_binary_program_list[i][j])
#     final_whole_func_call_binary_shrinked_program_list.append(final_whole_func_call_binary_shrinked_list)
    
# end_state_binary = ['0'] * total_states_need
# end_state_binary[end_state] = '1'
# for i in range (len(final_whole_func_call_binary_shrinked_program_list)):
#     final_whole_func_call_binary_shrinked_program_list[i].append(end_state_binary) 

# final_whole_func_call_binary_shrinked_program_list_reversed = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     final_whole_func_call_binary_shrinked_list_reversed = []
#     for sub in final_whole_func_call_binary_shrinked_program_list[i]:
#         copy = sub[:]           # make a shallow copy
#         copy.reverse()          # now this in‑place reverses the copy
#         final_whole_func_call_binary_shrinked_list_reversed.append(copy)
#     final_whole_func_call_binary_shrinked_program_list_reversed.append(final_whole_func_call_binary_shrinked_list_reversed)

MUX_states_need = current_instruction_length - total_states_need   

MUX_sel_singal_binary_program_list = []

for i in range (len(HLS_project_solution_path_program_list)):
    MUX_sel_singal_binary_branch_list = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        MUX_sel_singal_binary_list = [[] for _ in range(len(FSM_info_program_list[i]) + 1)]
        MUX_sel_singal_binary_branch_list.append(MUX_sel_singal_binary_list)
    MUX_sel_singal_binary_program_list.append(MUX_sel_singal_binary_branch_list)

#print("the value of MUX_sel_singal_binary_program_list is:", MUX_sel_singal_binary_program_list)


# for i in range (len(merged_grouped_unrolled_BRAM_list)):
#     selected_bram_name = merged_grouped_unrolled_BRAM_list[i][0]  
#     selected_bram_index = bram_name_list.index(selected_bram_name) 
#     width = sel_signal_length_bram_ce_address_list[int(selected_bram_index)]
for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_list)):
            selected_bram_name = merged_grouped_unrolled_BRAM_list[j][0]  
            selected_bram_index = bram_name_list.index(selected_bram_name) 
            sel_signal_length = sel_signal_length_bram_ce_address_list[int(selected_bram_index)]
            sel_signal_bram_ce_address_status = sel_signal_status_bram_ce_address_program_list[i][m][int(selected_bram_index)]
            sel_signal_bram_ce_address_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_ce_address_status]
            for k in range (len(sel_signal_bram_ce_address_binary_list)):
                MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_ce_address_binary_list[k])

            
for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_list)):
            selected_bram_name = merged_grouped_unrolled_BRAM_list[j][0] 
            if "2p" in selected_bram_name:
                selected_bram_index = bram_name_2p_list.index(selected_bram_name)
                sel_signal_length = sel_signal_length_bram_ce_address_2p_list[int(selected_bram_index)]
                sel_signal_bram_ce_address_status = sel_signal_status_bram_ce_address_program_2p_list[i][m][int(selected_bram_index)] 
                sel_signal_bram_ce_address_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_ce_address_status] 
                for k in range (len(sel_signal_bram_ce_address_binary_list)):
                    MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_ce_address_binary_list[k])  
#print("the value of MUX_sel_singal_binary_program_list is:", MUX_sel_singal_binary_program_list)
# for i in range (len(HLS_project_solution_path_program_list)):
#     for j in range (len(sel_signal_length_bram_ce_address_list)):
#         sel_signal_length = sel_signal_length_bram_ce_address_list[j]
#         sel_signal_bram_ce_address_status = sel_signal_status_bram_ce_address_program_list[i][j]
#         sel_signal_bram_ce_address_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_ce_address_status]
#         for k in range (len(sel_signal_bram_ce_address_binary_list)):
#             MUX_sel_singal_binary_program_list[i][k].append(sel_signal_bram_ce_address_binary_list[k])


for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_list)):
            selected_bram_name = merged_grouped_unrolled_BRAM_list[j][0]
            selected_bram_index = bram_name_list_we_d0.index(selected_bram_name) 
            sel_signal_length = sel_signal_length_bram_we_d0_list[int(selected_bram_index)]
            if sel_signal_length == 0:
                continue
            else: 
                sel_signal_bram_we_d0_status = sel_signal_status_bram_we_d0_program_list[i][m][int(selected_bram_index)]
                sel_signal_bram_we_d0_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_we_d0_status]
                for k in range (len(sel_signal_bram_we_d0_binary_list)):
                    MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_we_d0_binary_list[k])
        
for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_list)):
            selected_bram_name = merged_grouped_unrolled_BRAM_list[j][0]
            if "2p" in selected_bram_name:
                selected_bram_index = bram_name_2p_list_we_d0.index(selected_bram_name) 
                sel_signal_length = sel_signal_length_bram_we_d0_2p_list[int(selected_bram_index)] 
                if sel_signal_length == 0:
                    continue
                else:
                    sel_signal_bram_we_d0_status = sel_signal_status_bram_we_d0_program_2p_list[i][m][int(selected_bram_index)]
                    sel_signal_bram_we_d0_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_we_d0_status]
                    for k in range (len(sel_signal_bram_we_d0_binary_list)):
                        MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_we_d0_binary_list[k]) 
              
# for i in range (len(HLS_project_solution_path_program_list)):
#     for j in range (len(sel_signal_length_bram_we_d0_list)):
#         sel_signal_length = sel_signal_length_bram_we_d0_list[j]
#         sel_signal_bram_we_d0_status = sel_signal_status_bram_we_d0_program_list[i][j]
#         sel_signal_bram_we_d0_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_we_d0_status]
#         for k in range (len(sel_signal_bram_we_d0_binary_list)):
#             MUX_sel_singal_binary_program_list[i][k].append(sel_signal_bram_we_d0_binary_list[k])

for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(sel_signal_length_axi_interface_input_list)):
            sel_signal_length = sel_signal_length_axi_interface_input_list[j]
            sel_signal_axi_interface_input_status = sel_signal_status_axi_interface_input_program_list[i][m][j]
            sel_signal_axi_interface_input_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_axi_interface_input_status]
            for k in range (len(sel_signal_axi_interface_input_binary_list)):
                MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_axi_interface_input_binary_list[k])

for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(sel_signal_length_axi_interface_output_list)):
            sel_signal_length = sel_signal_length_axi_interface_output_list[j]
            sel_signal_axi_interface_output_status = sel_signal_status_axi_interface_output_program_list[i][m][j]
            sel_signal_axi_interface_output_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_axi_interface_output_status]
            for k in range (len(sel_signal_axi_interface_output_binary_list)):
                MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_axi_interface_output_binary_list[k])

for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(sel_signal_length_axi_reg_list)):
            sel_signal_length = sel_signal_length_axi_reg_list[j]
            sel_signal_axi_reg_status = sel_signal_status_axi_reg_program_list[i][m][j]
            sel_signal_axi_reg_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_axi_reg_status]
            for k in range (len(sel_signal_axi_reg_binary_list)):
                MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_axi_reg_binary_list[k])

for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_q0_list)):
            selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[j][0]
            if selected_bram_q0_name in bram_q0_name_list_updated:
                selected_bram_index = bram_q0_name_list_updated.index(selected_bram_q0_name)
                sel_signal_length = sel_signal_length_bram_q0_list[int(selected_bram_index)]
                sel_signal_bram_q0_status = sel_signal_status_bram_q0_program_list[i][m][int(selected_bram_index)]
                sel_signal_bram_q0_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_q0_status]
                for k in range (len(sel_signal_bram_q0_binary_list)):
                    MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_q0_binary_list[k])

for i in range (len(HLS_project_solution_path_program_list)):
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        for j in range (len(merged_grouped_unrolled_BRAM_q0_list)):
            selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[j][0] 
            if selected_bram_q0_name in bram_q1_name_list_updated:   
                selected_bram_q1_index = bram_q1_name_list_updated.index(selected_bram_q0_name)
                sel_signal_length = sel_signal_length_bram_q1_list[int(selected_bram_q1_index)]
                sel_signal_bram_q1_status = sel_signal_status_bram_q1_program_list[i][m][int(selected_bram_q1_index)]
                sel_signal_bram_q1_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_q1_status]
                for k in range (len(sel_signal_bram_q1_binary_list)):
                    MUX_sel_singal_binary_program_list[i][m][k].append(sel_signal_bram_q1_binary_list[k])


# for i in range (len(HLS_project_solution_path_program_list)):
#     for j in range (len(merged_grouped_unrolled_BRAM_q0_list)):
#         selected_bram_q0_name = merged_grouped_unrolled_BRAM_q0_list[j][0] 
#         selected_bram_q0_index = bram_q0_name_list_updated.index(selected_bram_q0_name)
#         bram_q0_type = connected_bram_q0_type_list[int(selected_bram_q0_index)]
#         if bram_q0_type == 2:   
#             selected_bram_q1_index = bram_q1_name_list.index(selected_bram_q0_name)
#             sel_signal_length = sel_signal_length_bram_q1_list[int(selected_bram_q1_index)]
#             sel_signal_bram_q1_status = sel_signal_status_bram_q1_program_list[i][int(selected_bram_q1_index)]
#             sel_signal_bram_q1_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_q1_status]
#             for k in range (len(sel_signal_bram_q1_binary_list)):
#                 MUX_sel_singal_binary_program_list[i][k].append(sel_signal_bram_q1_binary_list[k])
            
                
#print("the MUX_sel_singal_binary_program_list is:", MUX_sel_singal_binary_program_list)        
# for i in range (len(HLS_project_solution_path_program_list)):
#     for j in range (len(sel_signal_length_bram_q0_list)):
#         sel_signal_length = sel_signal_length_bram_q0_list[j]
#         sel_signal_bram_q0_status = sel_signal_status_bram_q0_program_list[i][j]
#         sel_signal_bram_q0_binary_list = [format(n, f'0{sel_signal_length}b') for n in sel_signal_bram_q0_status]
#         for k in range (len(sel_signal_bram_q0_binary_list)):
#             MUX_sel_singal_binary_program_list[i][k].append(sel_signal_bram_q0_binary_list[k])

final_whole_func_call_binary_shrinked_program_list_reversed = []
for i in range (len(HLS_project_solution_path_program_list)):
    final_whole_func_call_binary_shrinked_list_reversed_branch = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        final_whole_func_call_binary_shrinked_list_reversed = []
        for sub in whole_func_call_binary_program_list[i][m]:
            copy = sub[:]           # make a shallow copy
            copy.reverse()          # now this in‑place reverses the copy
            final_whole_func_call_binary_shrinked_list_reversed.append(copy)
        final_whole_func_call_binary_shrinked_list_reversed_branch.append(final_whole_func_call_binary_shrinked_list_reversed)
    final_whole_func_call_binary_shrinked_program_list_reversed.append(final_whole_func_call_binary_shrinked_list_reversed_branch)

MUX_sel_signal_binary_program_list_reversed = []
for i in range (len(HLS_project_solution_path_program_list)):
    MUX_sel_signal_binary_list_reversed_branch = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        MUX_sel_signal_binary_list_reversed = []
        for sub in MUX_sel_singal_binary_program_list[i][m]:
            copy = sub[:]           # make a shallow copy
            copy.reverse()          # now this in‑place reverses the copy
            MUX_sel_signal_binary_list_reversed.append(copy)
        MUX_sel_signal_binary_list_reversed_branch.append(MUX_sel_signal_binary_list_reversed)
    MUX_sel_signal_binary_program_list_reversed.append(MUX_sel_signal_binary_list_reversed_branch)
    
    

expanded_MUX_sel_signal_binary_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    expanded_MUX_sel_signal_binary_program_branch_list = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        expanded_MUX_sel_signal_binary_list = [
            [bit for elem in sub for bit in elem]
            for sub in MUX_sel_signal_binary_program_list_reversed[i][m]
        ]
        expanded_MUX_sel_signal_binary_program_branch_list.append(expanded_MUX_sel_signal_binary_list)
    expanded_MUX_sel_signal_binary_program_list.append(expanded_MUX_sel_signal_binary_program_branch_list)

# expanded_MUX_sel_signal_binary_program_list_shrinked = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     expanded_MUX_sel_signal_binary_list_shrinked = []
#     for j in range (2, len(expanded_MUX_sel_signal_binary_program_list[i]), 2):
#         expanded_MUX_sel_signal_binary_list_shrinked.append(expanded_MUX_sel_signal_binary_program_list[i][j])
#     expanded_MUX_sel_signal_binary_program_list_shrinked.append(expanded_MUX_sel_signal_binary_list_shrinked)

func_call_binary_program_list = []
end_state_binary = ['0'] * total_states_need
end_state_binary[end_state] = '1'

end_state_mux_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    end_state_mux = ['1'] * len(expanded_MUX_sel_signal_binary_program_list[i][0][0])
    end_state_mux_program_list.append(end_state_mux)
    
final_whole_end_inst_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    final_whole_end_inst_list = end_state_binary + end_state_mux_program_list[i]
    final_whole_end_inst_program_list.append(final_whole_end_inst_list)
    

final_whole_end_inst_program_reversed_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    sub = final_whole_end_inst_program_list[i] 
    copy = sub[:] 
    copy.reverse() 
    final_whole_end_inst_program_reversed_list.append(copy)   
    

combined_inst_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    combined_inst_program_branch_list = []
    for m in range (len(branch_condition_mapping_choices_program_list[i])):
        combined_inst_list = [
            mux_sub + func_sub
            for mux_sub, func_sub in zip(
                expanded_MUX_sel_signal_binary_program_list[i][m],
                final_whole_func_call_binary_shrinked_program_list_reversed[i][m]
            )
        ]
        combined_inst_program_branch_list.append(combined_inst_list)
    combined_inst_program_list.append(combined_inst_program_branch_list)

def extract_heads_and_vals(layers):
    """
    Given `layers` as returned by bfs_heads_conds_paths_by_layer(root),
    returns a parallel structure of the same shape where each tuple
    (head, cond, path) is replaced by (head, vals), and
    `vals` is the list of .val down that head-linked-list.
    """
    result = []
    for layer in layers:
        layer_info = []
        for head, cond, path in layer:
            # walk the linked list starting at head
            vals = []
            node = head
            while node is not None:
                vals.append(node.val)
                node = node.next
            layer_info.append((head, vals))
        result.append(layer_info)
    return result
    
print("the values of layer program list is:")   
print(layers_program_list)
with open(program_tree_path + 'program_tree_list.pkl', 'wb') as f:
    # Use highest protocol for efficiency
    pickle.dump(layers_program_list, f, protocol=pickle.HIGHEST_PROTOCOL)


head_and_vals_program_list = []  
for i in range (len(layers_program_list)):  
    head_and_vals = extract_heads_and_vals(layers_program_list[i])
    head_and_vals_program_list.append(head_and_vals) 
print("the values of head and vals is:")   
print(head_and_vals_program_list)    
print("the value of branch_condition_mapping_choices_program_list is:")   
print(branch_condition_mapping_choices_program_list) 

branch_condition_selection_choice_program_list = []
branch_condition_selection_reg_name_program_list = []
branch_condition_selection_program_list = []
for i in range (len(layers_program_list)): #program
    branch_condition_selection_choice_layer_list = []
    branch_condition_selection_reg_name_layer_list = []
    branch_condition_selection_layer_list = []
    for j in range (len(layers_program_list[i])): # Layer
        branch_condition_selection_choice_node_list = []
        branch_condition_selection_reg_name_node_list = []
        branch_condition_selection_node_list = []
        for k in range (len(layers_program_list[i][j])): #Node in a Layer 
            related_condition = layers_program_list[i][j][k][1]
            if related_condition is not None:
                condition_reg_name = related_condition[0]
                condition_reg_choice = related_condition[1]
                branch_condition_selection_node_list.append(condition_reg_choice)
                if "icmp" in condition_reg_name:
                    if condition_reg_choice == '0':
                        condition_reg_choice = '1'
                    elif condition_reg_choice == '1':
                        condition_reg_choice = '0'
                    condition_result = f"{j}_{condition_reg_choice}"
                else:
                    condition_result = f"{j}_{condition_reg_choice}"
                branch_condition_selection_choice_node_list.append(condition_result)
                branch_condition_selection_reg_name_node_list.append(condition_reg_name)
        branch_condition_selection_choice_layer_list.append(branch_condition_selection_choice_node_list)
        branch_condition_selection_reg_name_layer_list.append(branch_condition_selection_reg_name_node_list)
        branch_condition_selection_layer_list.append(branch_condition_selection_node_list)
    branch_condition_selection_choice_program_list.append(branch_condition_selection_choice_layer_list)
    branch_condition_selection_reg_name_program_list.append(branch_condition_selection_reg_name_layer_list)
    branch_condition_selection_program_list.append(branch_condition_selection_layer_list)

def _flatten_to_strings(x):
    """Recursively yield only string scalars from arbitrarily nested lists/tuples."""
    if isinstance(x, (list, tuple)):
        for y in x:
            yield from _flatten_to_strings(y)
    elif x is None:
        return
    else:
        yield str(x)

def build_choice_to_reg_mapping(
    branch_condition_selection_choice_program_list,
    branch_condition_selection_reg_name_program_list,
    branch_condition_selection_program_list,
) -> Dict[str, Dict[str, str]]:
    """
    Key = choice (e.g., '1_1', '1_0')
    Value = { reg_name: selection }, with duplicates removed (first occurrence kept).
    """
    choices = list(_flatten_to_strings(branch_condition_selection_choice_program_list))
    regs    = list(_flatten_to_strings(branch_condition_selection_reg_name_program_list))
    sels    = list(_flatten_to_strings(branch_condition_selection_program_list))

    if not (len(choices) == len(regs) == len(sels)):
        raise ValueError(
            f"Length mismatch: choices={len(choices)}, regs={len(regs)}, sels={len(sels)}"
        )

    out = defaultdict(OrderedDict)  # keep insertion order; first occurrence wins
    for c, r, s in zip(choices, regs, sels):
        if r not in out[c]:          # skip duplicates of the same reg under the same choice
            out[c][r] = s

    # Convert OrderedDicts to plain dicts
    return {c: dict(d) for c, d in out.items()}

choice_to_reg_mapping = build_choice_to_reg_mapping(branch_condition_selection_choice_program_list, branch_condition_selection_reg_name_program_list, branch_condition_selection_program_list)
print("the value of choice_to_reg_mapping is:")
print(choice_to_reg_mapping)
            
    
def find_sublist_indices(choices_list, branch_list):
    """
    Return a list of indices i for which `branch_list` appears as a contiguous
    sub‐list of `choices_list[i]`.
    """
    indices = []
    blen = len(branch_list)
    for idx, lst in enumerate(choices_list):
        # only check if lst is at least as long as branch_list
        if blen == 0:
            # empty branch_list is a sublist of everything
            indices.append(idx)
            continue
        for start in range(len(lst) - blen + 1):
            if lst[start:start+blen] == branch_list:
                indices.append(idx)
                break
    return indices

selected_combined_inst_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    selected_combined_inst_program_list_temp1 = []
    for j in range (len(head_and_vals_program_list[i])): # Layer
        selected_combined_inst_program_list_temp2 = []
        for k in range (len(head_and_vals_program_list[i][j])): #Node in a Layer 
            selected_combined_inst_program_list_temp3 = []
            related_cycle_list = head_and_vals_program_list[i][j][k][1]
            related_branch_condition_list = layers_program_list[i][j][k][2] 
            if related_branch_condition_list is None:
                for m in range (len(related_cycle_list)):
                    related_cycle = int(related_cycle_list[m])
                    selected_combined_inst_program_list_temp3.append(combined_inst_program_list[i][0][related_cycle]) 
            else:
                related_condition_mapping_choices_list = branch_condition_mapping_choices_program_list[i]
                matched_indicies = find_sublist_indices(
                        related_condition_mapping_choices_list,
                        related_branch_condition_list
                    )
                for m in range (len(related_cycle_list)):
                    related_cycle = int(related_cycle_list[m])
                    selected_combined_inst_program_list_temp3.append(combined_inst_program_list[i][int(matched_indicies[0])][related_cycle]) 
            selected_combined_inst_program_list_temp2.append(selected_combined_inst_program_list_temp3)  
        selected_combined_inst_program_list_temp1.append(selected_combined_inst_program_list_temp2) 
    selected_combined_inst_program_list.append(selected_combined_inst_program_list_temp1)   
                    
selected_combined_inst_program_shrinked_list = []
for i in range (len(selected_combined_inst_program_list)):
    selected_combined_inst_program_shrinked_list_temp1 = []
    for j in range (len(selected_combined_inst_program_list[i])):
        selected_combined_inst_program_shrinked_list_temp2 = []
        if (j == 0):  # means the root node 
            for k in range (len(selected_combined_inst_program_list[i][j])):
                selected_combined_inst_program_shrinked_list_temp3 = []
                for m in range (1, len(selected_combined_inst_program_list[i][j][k]), 2):
                    selected_combined_inst_program_shrinked_list_temp3.append(selected_combined_inst_program_list[i][j][k][m]) 
                selected_combined_inst_program_shrinked_list_temp2.append(selected_combined_inst_program_shrinked_list_temp3)
        else:
            for k in range (len(selected_combined_inst_program_list[i][j])):
                selected_combined_inst_program_shrinked_list_temp3 = []
                for m in range (0, len(selected_combined_inst_program_list[i][j][k]) - 1, 2): 
                    selected_combined_inst_program_shrinked_list_temp3.append(selected_combined_inst_program_list[i][j][k][m])
                selected_combined_inst_program_shrinked_list_temp2.append(selected_combined_inst_program_shrinked_list_temp3) 
        selected_combined_inst_program_shrinked_list_temp1.append(selected_combined_inst_program_shrinked_list_temp2)
    selected_combined_inst_program_shrinked_list.append(selected_combined_inst_program_shrinked_list_temp1)
            
for i in range (len(selected_combined_inst_program_list)):
    for j in range (len(selected_combined_inst_program_list[i])):
        for k in range (len(selected_combined_inst_program_list[i][j])):
            node_info = layers_program_list[i][j][k]
            if node_info in start_point_program_list[i]:
                selected_combined_inst_program_shrinked_list[i][j][k].append(final_whole_end_inst_program_reversed_list[i])
                
def list_shape(lst):
    """
    Recursively walk into the first element of each level of nested lists
    to collect the length at each dimension. Stops if it encounters a
    non-list or an empty list.
    """
    shape = []
    while isinstance(lst, list):
        shape.append(len(lst))
        if not lst:
            break
        lst = lst[0]
    return tuple(shape)    
# print("the value of combined_inst_program_list is:")
# print(list_shape(combined_inst_program_list))

# print("the value of selected_combined_inst_program_list is:")                 
# print(list_shape(selected_combined_inst_program_list[0][0]))
# print("the value of selected_combined_inst_program_list is:")                 
# print(list_shape(selected_combined_inst_program_list[0][1][1]))

# print("the value of selected_combined_inst_program_shrinked_list is:")                 
# print(list_shape(selected_combined_inst_program_shrinked_list[0][0][0]))

# print("the value of end_state_mux_program_list is:") 
# print(list_shape(end_state_mux_program_list))

# print("the value of the start_point_program_list is:")
# print(start_point_program_list)

inst_length_list = []
for i in range (len(selected_combined_inst_program_list)):
    for j in range (len(selected_combined_inst_program_list[i])):
        for k in range (len(selected_combined_inst_program_list[i][j])):
            for m in range (len(selected_combined_inst_program_list[i][j][k])):
                inst_length_list.append(len(selected_combined_inst_program_list[i][j][k][m]))
                
# inst_length_list = []
# for sub in combined_inst_program_list[i]:
#     inst_length_list.append(len(sub))
max_inst_length = max(inst_length_list)
inst_length = 1 << (max_inst_length - 1).bit_length()
#print("the value of inst_length is:", max_inst_length)
#inst_length = 128

if inst_length < 16:
    inst_length = 16

if inst_length > 1024:
    raise ValueError(f"Instruction length {inst_length} exceeds maximum supported value of 1024")
# inst_length = 64

padded_program_list = []
for i in range (len(selected_combined_inst_program_shrinked_list)):
    padded_program_list_temp1 = []
    for j in range (len(selected_combined_inst_program_shrinked_list[i])):
        padded_program_list_temp2 = []
        for k in range (len(selected_combined_inst_program_shrinked_list[i][j])):
            padded_program_list_temp3 = []
            for m in range (len(selected_combined_inst_program_shrinked_list[i][j][k])):
                sub = selected_combined_inst_program_shrinked_list[i][j][k][m]
                pad_size = inst_length - len(sub)
                if pad_size > 0:
                    new_sub = ['0'] * pad_size + sub
                else:
                    new_sub = sub
                padded_program_list_temp3.append(new_sub)
            padded_program_list_temp2.append(padded_program_list_temp3)
        padded_program_list_temp1.append(padded_program_list_temp2)
    padded_program_list.append(padded_program_list_temp1)
                
# padded_program_list = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     padded_list = []
#     for sub in combined_inst_program_list[i]:
#         pad_size = inst_length - len(sub)
#         if pad_size > 0:
#             # insert pad_size zeros at front
#             new_sub = ['0'] * pad_size + sub
#         else:
#             # already long enough (or too long), leave as-is
#             new_sub = sub
#         padded_list.append(new_sub)
#     padded_program_list.append(padded_list)

combined_inst_program_list_final = padded_program_list
merged_program_inst_list = []
for i in range (len(combined_inst_program_list_final)):
    merged_program_inst_list_temp1 = []
    for j in range (len(combined_inst_program_list_final[i])):   
        merged_program_inst_list_temp2 = [] 
        for k in range (len(combined_inst_program_list_final[i][j])):
            merged_program_inst_list_temp3 = []  
            for m in range (len(combined_inst_program_list_final[i][j][k])): 
                merged_inst = ''.join(combined_inst_program_list_final[i][j][k][m])
                merged_program_inst_list_temp3.append(merged_inst)
            merged_program_inst_list_temp2.append(merged_program_inst_list_temp3)
        merged_program_inst_list_temp1.append(merged_program_inst_list_temp2)
    merged_program_inst_list.append(merged_program_inst_list_temp1)
  
print("the value of combined_inst_program_list_final is:")  
print(combined_inst_program_list_final[0][0][0][0])   
                  
print("the value of merged_program_inst_list is:")  
print(merged_program_inst_list[0][0][0][0])  
# merged_program_inst_list = []
# for i in range (len(HLS_project_solution_path_program_list)):
#     merged_inst = [''.join(sub) for sub in combined_inst_program_list_final[i]]
#     merged_program_inst_list.append(merged_inst)

inst_reg_name_list = []
for i in range (len(merged_program_inst_list)):
    for j in range (len(merged_program_inst_list[i])):
        for k in range (len(merged_program_inst_list[i][j])):
            filename = generated_inst_path + f"generated_instructions_{i}_{j}_{k}.txt" 
            #inst_reg_name_list.append(f"inst_array_{i}_{j}_{k}")
            #inst_reg_name_list.append(f"n_inst_{i}_{j}_{k}")
            with open(filename, "w") as f:
                for instruction in merged_program_inst_list[i][j][k]:
                    f.write(instruction + "\n")
            print(f"Wrote {len(merged_program_inst_list[i][j][k])} instructions to {filename}")
            
for i in range (len(merged_program_inst_list)):
    for j in range (len(merged_program_inst_list[i])):
        for k in range (len(merged_program_inst_list[i][j])):
            inst_reg_name = f"inst_array_{j}_{k}"
            inst_num_name = f"n_inst_{j}_{k}" 
            if inst_reg_name not in inst_reg_name_list:
                inst_reg_name_list.append(inst_reg_name)  
                inst_reg_name_list.append(inst_num_name)         
            
inst_segment_length_list = [[] for i in range (len(merged_program_inst_list))]
for i in range (len(merged_program_inst_list)):
    for j in range (len(merged_program_inst_list[i])):
        for k in range (len(merged_program_inst_list[i][j])):
            inst_segment_length_list[i].append(len(merged_program_inst_list[i][j][k]))

          
max_inst_num_list = [
    max(x for x in col if x is not None)
    for col in zip_longest(*inst_segment_length_list, fillvalue=None)
]

print("the value of max_inst_num_list is:", max_inst_num_list)
print("the value of inst_reg_name_list is:", inst_reg_name_list)
print("the value of inst_segment_length_list is:", inst_segment_length_list)
# for idx, merged_inst in enumerate(merged_program_inst_list, start=1):
#     filename = generated_inst_path + f"generated_instructions_{idx}.txt"
#     with open(filename, "w") as f:
#         for instruction in merged_inst:
#             f.write(instruction + "\n")
#     print(f"Wrote {len(merged_inst)} instructions to {filename}")

    
#################### Finish generate the instructions ####################

###### Start generate the FSM related json file ########

#inst_length = 64
start_date = initial_state
end_state = end_state
prepare_start_state = start_state

init_state_binary_list = ['1'] * inst_length
counter = 0
for i in range (inst_length - 1, inst_length - 1 - total_states_need, -1):
    if (counter != initial_state):
        init_state_binary_list[i] = '0'
    counter = counter + 1
init_state_binary = ''.join(init_state_binary_list)
func_call_inst_length = total_states_need

# load_inst_binary_list = ['1'] * inst_length
# counter = 0
# for i in range (inst_length - 1, inst_length - 1 - total_states_need, -1):
#     if (counter != load_inst_state):
#         load_inst_binary_list[i] = '0'
#     counter = counter + 1
# load_inst_state_binary = ''.join(load_inst_binary_list)

load_inst_instance_name = 'grp_load_inst_fu_92'

prepare_start_state_binary_list = ['1'] * inst_length
counter = 0
for i in range (inst_length - 1, inst_length - 1 - total_states_need, -1):
    if (counter != start_state):
        prepare_start_state_binary_list[i] = '0'
    counter = counter + 1
prepare_start_state_binary = ''.join(prepare_start_state_binary_list)
inst_range = f"{func_call_inst_length - 1}:0"
load_inst_range = f"{func_call_inst_length - 1}:0"


data = {
        "substitutions": {
            "inst_length": inst_length
        }
    }
with open(JSON_file_path + "top_interface_stream_definition.json", "w") as f:
    json.dump(data, f, indent=2)
    

ready = [
    {"name": name, "index": idx}
    for name, idx in zip(merged_instance_call_program_list, scheduled_states_program_list)
]
# sort by the index field
ready.sort(key=lambda d: d["index"])

# subs = {
#     "inst_length": inst_length,
#     "init_state_binary": init_state_binary,
#     "func_call_inst_length": total_states_need,
#     "start_state": initial_state,
#     "load_inst_state_binary": load_inst_state_binary,
#     "load_inst_state": load_inst_state,
#     "load_inst_instance_name": load_inst_instance_name,
#     "prepare_start_state_binary": prepare_start_state_binary,
#     "end_state": end_state,
#     "prepare_start_state": prepare_start_state,
#     "ready_signals": ready,
#     "inst_range": inst_range,
#     "load_inst_range": load_inst_range
# }

subs = {
    "inst_length": inst_length,
    "init_state_binary": init_state_binary,
    "func_call_inst_length": total_states_need,
    "start_state": initial_state,
    "prepare_start_state_binary": prepare_start_state_binary,
    "end_state": end_state,
    "prepare_start_state": prepare_start_state,
    "ready_signals": ready,
    "inst_range": inst_range,
    "load_inst_range": load_inst_range
}

data = {"substitutions": subs}

# === 5) Write to JSON file ===
with open(JSON_file_path + "flexible_fsm_state_transit_logic.json", "w") as fp:
    json.dump(data, fp, indent=2)

###### Finish generate the FSM related json file ########

######### Start Generate initialization JSON ##########

func_call_num = total_states_need
func_call_init_state = init_state_binary[-func_call_num:]
init_state = start_date
end_state = end_state

merged_axi_reg_name_mapping_list = list(OrderedDict.fromkeys(
    name.rsplit('_read_reg', 1)[0]
    for sublist in axi_reg_name_mapping_list
    for name in sublist
))


modules = [{"name": name} for name in merged_instance_call_program_list]
reg_names = [{"name": name} for name in merged_axi_reg_name_mapping_list]
    

subs = {
    "func_call_num": func_call_num,
    "func_call_init_state": func_call_init_state,
    "init_state": init_state,
    "end_state": end_state,
    "modules": modules,
    "reg_names": reg_names,
    "inst_length": inst_length
}

data = {"substitutions": subs}
with open(JSON_file_path + "initialize_block.json", "w") as fp:
    json.dump(data, fp, indent=2)

######### Finish Generate initialization JSON ##########

######### Generate top module interface JSON ##########

interface_names = [{"name": name} for name in interface_name_list]
subs = {
    "axi_interfaces": interface_names
}

data = {"substitutions": subs}
with open(JSON_file_path + "top_interface_port.json", "w") as fp:
    json.dump(data, fp, indent=2)

######### Finish Generate top module interface JSON ##########

############### Generate module call JSON file ######################

print(func_call_program_list)
top_func_call_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    top_func_call_list = []
    for j in range (len(func_call_program_list[i])):
        top_func_call_list.append("top_" + func_call_program_list[i][j])
    top_func_call_program_list.append(top_func_call_list)

func_call_port_type_program_list = []
func_call_port_direction_program_list = []

merged_func_call_key_program_list_stripped = [s.removeprefix("top_") for s in merged_func_call_key_program_list]

func_call_port_type_list = []
func_call_port_direction_list = []
for i in range (len(merged_func_call_key_program_list_stripped)):
    HLS_project_path = HLS_project_solution_path_program_list[int(merged_instance_call_program_realted_index_list[i])]
    port_type_list, port_direction_list = get_func_call_port_type(merged_func_call_key_program_list_stripped[i], HLS_project_path)
    func_call_port_type_list.append(port_type_list)
    func_call_port_direction_list.append(port_direction_list)


func_call_list_compute_no_dram_list = []
instance_call_list_compute_no_dram_list = []
merged_instance_call_program_realted_index_no_dram_list = []
for i in range (len(func_call_port_type_list)):
    if '4' not in func_call_port_type_list[i]:
        func_call_list_compute_no_dram_list.append(merged_func_call_key_program_list_stripped[i]) 
        instance_call_list_compute_no_dram_list.append(merged_instance_call_program_list[i])
        merged_instance_call_program_realted_index_no_dram_list.append(merged_instance_call_program_realted_index_list[i])

print(func_call_list_compute_no_dram_list)
print(instance_call_list_compute_no_dram_list)

top_func_call_list_compute_no_dram_list = []
full_call_verilog_path_compute_no_dram_list = []
for i in range (len(func_call_list_compute_no_dram_list)):
    HLS_project_path = HLS_project_solution_path_program_list[int(merged_instance_call_program_realted_index_no_dram_list[i])]
    top_func_call_list_compute_no_dram_list.append("top_" + func_call_list_compute_no_dram_list[i])
    full_call_verilog_path_compute_no_dram_list.append(HLS_project_path + 'impl/verilog/' + "top_" + func_call_list_compute_no_dram_list[i] + '.v')  

print(full_call_verilog_path_compute_no_dram_list) 

modules_to_parse = []
for vf, tm, inst in zip(full_call_verilog_path_compute_no_dram_list, top_func_call_list_compute_no_dram_list, instance_call_list_compute_no_dram_list):
    modules_to_parse.append({
        "verilog_file": vf,
        "target_module_name": tm,
        "instance_name": inst
    })

# wrap it in your top‐level object
output = { "modules_to_parse": modules_to_parse }

# write it out
with open(JSON_file_path + "module_block.json", "w") as f:
    json.dump(output, f, indent=2)

func_call_list_compute_dram_list = []
instance_call_list_compute_dram_list = []
port_direction_list_compute_dram_list = []
merged_instance_call_program_realted_index_compute_dram_list = []
print("the value of func_call port type list is:",func_call_list)

for i in range (len(func_call_port_type_list)):
    if '4' in func_call_port_type_list[i]:
        func_call_list_compute_dram_list.append(merged_func_call_key_program_list_stripped[i]) 
        instance_call_list_compute_dram_list.append(merged_instance_call_program_list[i])
        merged_instance_call_program_realted_index_compute_dram_list.append(merged_instance_call_program_realted_index_list[i])
        port_direction_list_compute_dram_list_temp = []
        for j in range (len(func_call_port_type_list[i])):
            if func_call_port_type_list[i][j] == '4':
                port_direction_list_compute_dram_list_temp.append(func_call_port_direction_list[i][j])
        port_direction_list_compute_dram_list.append(port_direction_list_compute_dram_list_temp)
        
print(func_call_list_compute_dram_list)
print(instance_call_list_compute_dram_list)
print(port_direction_list_compute_dram_list)


top_func_call_list_compute_dram_list_input = []
full_call_verilog_path_compute_dram_list_input = []
instance_call_list_compute_dram_list_input = []
top_func_call_list_compute_dram_list_output = []
full_call_verilog_path_compute_dram_list_output = []
instance_call_list_compute_dram_list_output = []
for i in range (len(func_call_list_compute_dram_list)):
    HLS_project_path = HLS_project_solution_path_program_list[int(merged_instance_call_program_realted_index_compute_dram_list[i])]
    if (port_direction_list_compute_dram_list[i][0] == '0'):
        top_func_call_list_compute_dram_list_input.append("top_" + func_call_list_compute_dram_list[i])
        full_call_verilog_path_compute_dram_list_input.append(HLS_project_path + 'impl/verilog/' + "top_" + func_call_list_compute_dram_list[i] + '.v') 
        instance_call_list_compute_dram_list_input.append(instance_call_list_compute_dram_list[i])
    if (port_direction_list_compute_dram_list[i][0] == '1'): 
        top_func_call_list_compute_dram_list_output.append("top_" + func_call_list_compute_dram_list[i])
        full_call_verilog_path_compute_dram_list_output.append(HLS_project_path + 'impl/verilog/' + "top_" + func_call_list_compute_dram_list[i] + '.v')  
        instance_call_list_compute_dram_list_output.append(instance_call_list_compute_dram_list[i]) 


modules_to_parse = []
for vf, tm, inst in zip(full_call_verilog_path_compute_dram_list_input, top_func_call_list_compute_dram_list_input, instance_call_list_compute_dram_list_input):
    modules_to_parse.append({
        "verilog_file": vf,
        "target_module_name": tm,
        "instance_name": inst
    })

# wrap it in your top‐level object
output = { "modules_to_parse": modules_to_parse }

# write it out
with open(JSON_file_path + "module_block_axi_new_input.json", "w") as f:
    json.dump(output, f, indent=2)  

modules_to_parse = []
for vf, tm, inst in zip(full_call_verilog_path_compute_dram_list_output, top_func_call_list_compute_dram_list_output, instance_call_list_compute_dram_list_output):
    modules_to_parse.append({
        "verilog_file": vf,
        "target_module_name": tm,
        "instance_name": inst
    })

# wrap it in your top‐level object
output = { "modules_to_parse": modules_to_parse }

# write it out
with open(JSON_file_path + "module_block_axi_new_output.json", "w") as f:
    json.dump(output, f, indent=2)   

############### Finish Generate module call JSON file ######################

############### Generate AXI master JSON file ######################

interface_info_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    HLS_project_solution_path = HLS_project_solution_path_program_list[i]
    tree = ET.parse(HLS_project_solution_path + '.autopilot/db/design.bindinfo.xml')  # replace with your actual XML filename
    root = tree.getroot()

    interface_info = []

    for node in root.findall('.//BindNode[@BINDTYPE="interface"]'):
        optype = node.get('OPTYPE')
        rtlname = node.get('RTLNAME')
        variable = node.get('VARIABLE')
        storagesize = node.get('STORAGESIZE').split()

        # Ensure storagesize has exactly three elements
        size1, size2, size3 = storagesize if len(storagesize) == 3 else (None, None, None)

        interface_info.append([optype, rtlname, variable, size1, size2, size3])

    interface_info_program_list.append(interface_info)

module_in_out_direction_dict_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    module_in_out_direction_dict = {
        entry[1]: entry[2]
        for entry in port_info_program_list[i]
        if entry[-1] == '4'
    }
    module_in_out_direction_dict_program_list.append(module_in_out_direction_dict)


with open(args.axi_interface_mapping_json, "r") as f:
    data = json.load(f)
mappings = data["mappings"]   

interface_input_info_program_list = []
interface_output_info_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    interface_input_info = []
    interface_output_info = []
    for j in range (len(interface_info_program_list[i])):
        port_direction = module_in_out_direction_dict_program_list[i][interface_info_program_list[i][j][2]]
        if port_direction == '0':
            interface_input_info.append(interface_info_program_list[i][j]) 
        if port_direction == '1':
            interface_output_info.append(interface_info_program_list[i][j])  
    interface_input_info_program_list.append(interface_input_info) 
    interface_output_info_program_list.append(interface_output_info)


module_name_input_program_list = []
module_bitwidth_input_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    module_name_input_list = []
    module_bitwidth_input_list = []
    for j in range (len(interface_input_info_program_list[i])):
        module_name_input_list.append("top_" + interface_input_info_program_list[i][j][2] + "_m_axi")
        module_bitwidth_input_list.append(interface_input_info_program_list[i][j][3])
    module_name_input_program_list.append(module_name_input_list)
    module_bitwidth_input_program_list.append(module_bitwidth_input_list)

module_name_output_program_list = []
module_bitwidth_output_program_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    module_name_output_list = []
    module_bitwidth_output_list = []
    for j in range (len(interface_output_info_program_list[i])):
        module_name_output_list.append("top_" + interface_output_info_program_list[i][j][2] + "_m_axi")
        module_bitwidth_output_list.append(interface_output_info_program_list[i][j][3])
    module_name_output_program_list.append(module_name_output_list)
    module_bitwidth_output_program_list.append(module_bitwidth_output_list)

ARADDR_input_list = []
ARLEN_input_list = []

AWADDR_output_list = []
AWLEN_output_list = []
WDATA_output_list = []
WSTRB_output_list = []

# seen = set()
# merged_module_name_input_program_list = []
# for sublist in module_name_input_program_list:
#     for entry in sublist:
#         tup = tuple(entry)
#         if tup not in seen:
#             seen.add(tup)
#             merged_module_name_input_program_list.append(entry)
seen = set()
merged_module_name_input_program_list = []
merged_module_name_input_program_index_list = []  # will hold tuples of (sublist_index, entry_index)
for i, sublist in enumerate(module_name_input_program_list):
    for j, entry in enumerate(sublist):
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_module_name_input_program_list.append(entry)
            merged_module_name_input_program_index_list.append(i)

seen = set()
merged_module_name_output_program_list = []
merged_module_name_output_program_index_list = []
for i, sublist in enumerate(module_name_output_program_list):
    for j, entry in enumerate(sublist):
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_module_name_output_program_list.append(entry)
            merged_module_name_output_program_index_list.append(i)

seen = set()
merged_module_bitwidth_input_program_list = []
for sublist in module_bitwidth_input_program_list:
    for entry in sublist:
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_module_bitwidth_input_program_list.append(entry)

seen = set()
merged_module_bitwidth_output_program_list = []
for sublist in module_bitwidth_output_program_list:
    for entry in sublist:
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_module_bitwidth_output_program_list.append(entry)

seen = set()
merged_interface_input_info_program_list = []
for sublist in interface_input_info_program_list:
    for entry in sublist:
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_interface_input_info_program_list.append(entry)

seen = set()
merged_interface_output_info_program_list = []
for sublist in interface_output_info_program_list:
    for entry in sublist:
        tup = tuple(entry)
        if tup not in seen:
            seen.add(tup)
            merged_interface_output_info_program_list.append(entry)

print("the value of mapping table is:", mappings)

input_connect_module_list = []
output_connect_module_list = []
for i in range (len(merged_interface_input_info_program_list)):
    axi_interface_related_module_list = mappings[merged_interface_input_info_program_list[i][2]]
    for j in range (len(axi_interface_related_module_list)):
        axi_interface_related_module = axi_interface_related_module_list[j]
        axi_interface_related_module_name = 'top_' + axi_interface_related_module
        index = merged_func_call_key_program_list.index(axi_interface_related_module_name)
        connect_instance = merged_instance_call_program_list[int(index)]
        input_connect_module_list.append(connect_instance)

for i in range (len(merged_interface_output_info_program_list)):
    axi_interface_related_module_list = mappings[merged_interface_output_info_program_list[i][2]]
    for j in range (len(axi_interface_related_module_list)):
        axi_interface_related_module = axi_interface_related_module_list[j]
        axi_interface_related_module_name = 'top_' + axi_interface_related_module
        index = merged_func_call_key_program_list.index(axi_interface_related_module_name)
        connect_instance = merged_instance_call_program_list[int(index)]
        output_connect_module_list.append(connect_instance)

for i in range (len(merged_interface_input_info_program_list)):
    ARADDR_input_list.append(input_connect_module_list[i] + "_m_axi_" + merged_interface_input_info_program_list[i][2] + "_ARADDR")
    ARLEN_input_list.append(input_connect_module_list[i] + "_m_axi_" + merged_interface_input_info_program_list[i][2] + "_ARLEN")

for i in range (len(merged_interface_output_info_program_list)):
    AWADDR_output_list.append(output_connect_module_list[i] + "_m_axi_" + merged_interface_output_info_program_list[i][2] + "_AWADDR")
    AWLEN_output_list.append(output_connect_module_list[i] + "_m_axi_" + merged_interface_output_info_program_list[i][2] + "_AWLEN")
    WDATA_output_list.append(output_connect_module_list[i] + "_m_axi_" + merged_interface_output_info_program_list[i][2] + "_WDATA")
    WSTRB_output_list.append(output_connect_module_list[i] + "_m_axi_" + merged_interface_output_info_program_list[i][2] + "_WSTRB")


contexts = []
for module_name, bw_str, ARADDR_name, ARLEN_name in zip(merged_module_name_input_program_list, merged_module_bitwidth_input_program_list, ARADDR_input_list, ARLEN_input_list):
    bw = int(bw_str)
    wstrb_width = bw // 8

    ctx = {
        "module_name": module_name,
        "CONSERVATIVE": 1,
        "USER_MAXREQS": 7,
        "MAX_READ_BURST_LENGTH": 16,
        "MAX_WRITE_BURST_LENGTH": 16,
        "CH0_USER_RFIFONUM_WIDTH": 9,
        "CH0_USER_DW": bw,
        "CH0_USER_AW": 64,
        "NUM_READ_OUTSTANDING": 16,
        "NUM_WRITE_OUTSTANDING": 0,
        "C_M_AXI_ID_WIDTH": 1,
        "C_M_AXI_ADDR_WIDTH": 64,
        "C_M_AXI_DATA_WIDTH": bw,
        "C_M_AXI_AWUSER_WIDTH": 1,
        "C_M_AXI_ARUSER_WIDTH": 1,
        "C_M_AXI_WUSER_WIDTH": 1,
        "C_M_AXI_RUSER_WIDTH": 1,
        "C_M_AXI_BUSER_WIDTH": 1,
        "C_M_AXI_USER_VALUE": 0,
        "C_M_AXI_PROT_VALUE": 0,
        "C_M_AXI_CACHE_VALUE": 3,
        "AWVALID": "1'b0",
        "AWADDR": "64'd0",
        "AWLEN": "32'd0",
        "WVALID": "1'b0",
        "WDATA": f"{bw}'d0",
        "WSTRB": f"{wstrb_width}'d0",
        "BREADY": "1'b0",
        "ARADDR": f"{ARADDR_name}",
        "ARLEN":  f"{ARLEN_name}"
    }

    contexts.append(ctx)

output = {"contexts": contexts}

with open(JSON_file_path + "axi_control_master_input.json", "w") as f:
    json.dump(output, f, indent=2)

contexts = []
for module_name, bw_str, AWADDR_name, AWLEN_name, WDATA_name, WSTRB_name in zip(merged_module_name_output_program_list, merged_module_bitwidth_output_program_list, AWADDR_output_list, AWLEN_output_list, WDATA_output_list, WSTRB_output_list):
    bw = int(bw_str)
    wstrb_width = bw // 8

    ctx = {
      "module_name"            : module_name,
      "CONSERVATIVE"           : 1,
      "USER_MAXREQS"           : 4,
      "MAX_READ_BURST_LENGTH"  : 16,
      "MAX_WRITE_BURST_LENGTH" : 16,
      "CH0_USER_RFIFONUM_WIDTH": 9,
      "CH0_USER_DW"            : bw,
      "CH0_USER_AW"            : 64,
      "NUM_READ_OUTSTANDING"   : 0,
      "NUM_WRITE_OUTSTANDING"  : 16,
      "C_M_AXI_ID_WIDTH"       : 1,
      "C_M_AXI_ADDR_WIDTH"     : 64,
      "C_M_AXI_DATA_WIDTH"     : bw,
      "C_M_AXI_AWUSER_WIDTH"   : 1,
      "C_M_AXI_ARUSER_WIDTH"   : 1,
      "C_M_AXI_WUSER_WIDTH"    : 1,
      "C_M_AXI_RUSER_WIDTH"    : 1,
      "C_M_AXI_BUSER_WIDTH"    : 1,
      "C_M_AXI_USER_VALUE"     : 0,
      "C_M_AXI_PROT_VALUE"     : 0,
      "C_M_AXI_CACHE_VALUE"    : 3,
      "ARVALID"                : "1'b0",
      "ARADDR"                 : "64'd0",
      "ARLEN"                  : "32'd0",
      "RREADY"                 : "1'b0",
      "AWADDR"                 : f"{AWADDR_name}",
      "AWLEN"                  : f"{AWLEN_name}",
      "WDATA"                  : f"{WDATA_name}",
      "WSTRB"                  : f"{WSTRB_name}"
    }

    contexts.append(ctx)

output = {"contexts": contexts}

with open(JSON_file_path + "axi_control_master_output.json", "w") as f:
    json.dump(output, f, indent=2)

############### Finish Generate AXI master JSON file ######################



################## Generate S_AXI_Control JSON #################

top_control_s_axi_config_path = './configuration_top_control_s_axi/'

os.makedirs(top_control_s_axi_config_path, exist_ok=True)
#inst_reg_name_list = ["inst_array", "n_inst"]


with open(args.axi_interface_mapping_json, "r") as f:
    mapping = json.load(f)

axi_interface_mapping_keys = set(mapping["mappings"].keys())

def extract_axi_interface(full_name, mapping_keys):
    parts = full_name.split("_")
    
    # try two-token windows first (e.g. "INPUT_r")
    for i in range(len(parts) - 1):
        cand2 = f"{parts[i]}_{parts[i+1]}"
        if cand2 in mapping_keys:
            return cand2
    
    # then single tokens (e.g. "control", or "INPUT2", "OUTPUT_r", etc.)
    for p in parts:
        if p in mapping_keys or p == "control":
            return p
    
    # nothing matched?
    raise ValueError(f"no interface name found in '{full_name}'")

# axi_interface_names_list = []
# for full_name in merged_axi_reg_name_mapping_list:
#     parts = full_name.split('_')
#     # the interface always starts at parts[4]
#     iface = parts[4]
#     # if the next part isn't purely numeric, include it (e.g. 'r')
#     if not parts[5].isdigit():
#         iface = f"{iface}_{parts[5]}"
#     axi_interface_names_list.append(iface)
axi_interface_names_list = [extract_axi_interface(name, axi_interface_mapping_keys)
                            for name in merged_axi_reg_name_mapping_list]
axi_interface_rw_list = [name.split('_', 1)[0] for name in merged_axi_reg_name_mapping_list]
axi_interface_names_list_final = merged_axi_reg_name_mapping_list + inst_reg_name_list
#axi_interface_names_list_final = merged_axi_reg_name_mapping_list
axi_interface_rw_list_final = axi_interface_rw_list


axi_interface_names_type_list = []
for i in range (len(axi_interface_names_list)):
    if axi_interface_names_list[i] == 'control':
        axi_interface_names_type_list.append(1) 
    else:
        axi_interface_names_type_list.append(0)   



dram_array_index = 0
dram_reg_index = 0
mapped_axi_interface_names_list = []
for t in axi_interface_names_type_list:
    if t == 0:
        dram_array_index += 1
        mapped_axi_interface_names_list.append(f"dram_array_{dram_array_index}")
    elif t == 1:
        dram_reg_index += 1
        mapped_axi_interface_names_list.append(f"dram_reg_{dram_reg_index}")
    else:
        # whatever you want to do for unexpected types
        mapped_axi_interface_names_list.append(None)

for i in range (len(inst_reg_name_list)):
    inst_reg_name = inst_reg_name_list[i]
    if 'inst_array' in inst_reg_name:
        axi_interface_names_type_list.append(0) # append inst_array
    if 'n_inst' in inst_reg_name:
        axi_interface_names_type_list.append(1) # append n_inst
# axi_interface_names_type_list.append(0) # append inst_array
# axi_interface_names_type_list.append(1) # append n_inst

mapped_axi_interface_names_list_final = mapped_axi_interface_names_list + inst_reg_name_list
#mapped_axi_interface_names_list_final = mapped_axi_interface_names_list


def reorder_axi_lists(mapped, types, names, rw_direction):
    """
    Reorder three parallel lists so that:
      1) 'dram_array_<N>' entries come first in ascending N
      2) 'inst_array' entries next
      3) 'dram_reg_<N>' entries next in ascending N
      4) 'n_inst' entries last

    Args:
      mapped (List[str]): e.g. ['dram_array_1', 'dram_reg_1', 'inst_array', ...]
      types  (List[int]): corresponding type codes
      names  (List[str]): corresponding full register names

    Returns:
      Tuple of three lists reordered in the new sequence.
    """
    # collect indices by category
    dram_array_idx = [i for i, v in enumerate(mapped) if v.startswith('dram_array_')]
    dram_array_idx.sort(key=lambda i: int(mapped[i].split('_')[-1]))

    inst_idx = [i for i, v in enumerate(mapped) if 'inst_array' in v]

    dram_reg_idx = [i for i, v in enumerate(mapped) if v.startswith('dram_reg_')]
    dram_reg_idx.sort(key=lambda i: int(mapped[i].split('_')[-1]))

    n_inst_idx = [i for i, v in enumerate(mapped) if 'n_inst' in v]

    # combine in desired order
    new_order = dram_array_idx + inst_idx + dram_reg_idx + n_inst_idx
    
    print("the value of new_order is:", new_order)

    # apply to all three lists
    mapped_reordered = [mapped[i] for i in new_order]
    types_reordered  = [types[i]  for i in new_order]
    names_reordered  = [names[i]  for i in new_order]
    rw_direction_reordered = [rw_direction[i]  for i in new_order]

    return mapped_reordered, types_reordered, names_reordered, rw_direction_reordered

def extract_unique_non_none(nested):
    """
    Recursively walks an arbitrarily-nested list/tuple structure,
    flattens it, and returns a list of unique, non-None elements
    in the order they’re first encountered.
    """
    seen = set()
    unique = []

    def visit(item):
        if isinstance(item, Iterable) and not isinstance(item, (str, bytes)):
            for sub in item:
                visit(sub)
        else:
            if item is not None and item not in seen:
                seen.add(item)
                unique.append(item)

    visit(nested)
    return unique


print("the value of mapped_axi_interface_names_list_final is:")
print(mapped_axi_interface_names_list_final)
print("the value of axi_interface_names_type_list is:")
print(axi_interface_names_type_list)
print("the value of axi_interface_names_list_final is:")
print(axi_interface_names_list_final)
print("the value of axi_interface_rw_list_final is:")
print(axi_interface_rw_list_final)
for i in range (len(inst_reg_name_list)):
    axi_interface_rw_list_final.append('r')
    
mapped_axi_interface_names_list_final_reorder, axi_interface_names_type_list_reorder, axi_interface_names_list_final_reorder, axi_interface_rw_list_final_reorder = reorder_axi_lists(mapped_axi_interface_names_list_final, axi_interface_names_type_list, axi_interface_names_list_final, axi_interface_rw_list_final)
print("the value of mapped_axi_interface_names_list_final_reorder is:")
print(mapped_axi_interface_names_list_final_reorder)
print("the value of axi_interface_names_type_list_reorder is:")
print(axi_interface_names_type_list_reorder)
print("the value of axi_interface_names_list_final_reorder is:")
print(axi_interface_names_list_final_reorder)
print("the value of axi_interface_rw_list_final_reorder is:")
print(axi_interface_rw_list_final_reorder)



condition_reg_program_list = []
for i in range (len(transitions_program_list)):
    condition_reg_list = []
    for j in range (len(transitions_program_list[i])):
        condition_reg_name = transitions_program_list[i][j]['literal_name']
        condition_reg_list.append(condition_reg_name)
    condition_reg_program_list.append(condition_reg_list)


unique_condition_reg_list = extract_unique_non_none(condition_reg_program_list)   
unique_condition_reg_axi_interface_names_list = []
unique_condition_reg_axi_interface_names_type_list = []
unique_condition_reg_axi_interface_rw_list = []
for i in range (len(unique_condition_reg_list)):
    unique_condition_reg_axi_interface_names_list.append(unique_condition_reg_list[i]) 
    unique_condition_reg_axi_interface_names_type_list.append(1)
    unique_condition_reg_axi_interface_rw_list.append("w")  

# axi_interface_names_list_final_reorder = axi_interface_names_list_final_reorder + unique_condition_reg_axi_interface_names_list         
# mapped_axi_interface_names_list_final_reorder =  mapped_axi_interface_names_list_final_reorder + unique_condition_reg_axi_interface_names_list
# axi_interface_names_type_list_reorder =  axi_interface_names_type_list_reorder + unique_condition_reg_axi_interface_names_type_list
# axi_interface_rw_list_final_reorder = axi_interface_rw_list_final_reorder + unique_condition_reg_axi_interface_rw_list

axi_interface_names_list_final_reorder = axi_interface_names_list_final_reorder        
mapped_axi_interface_names_list_final_reorder =  mapped_axi_interface_names_list_final_reorder
axi_interface_names_type_list_reorder =  axi_interface_names_type_list_reorder
axi_interface_rw_list_final_reorder = axi_interface_rw_list_final_reorder

base_address_offset = '0x10'
offset = int(base_address_offset, 16)
addresses_offset_list = [base_address_offset]
for t in axi_interface_names_type_list_reorder[:-1]:
    if t == 0:
        offset += 12
    else:
        offset += 8
    addresses_offset_list.append(hex(offset))

# now handle the “last” t to compute max_offset
last_t = axi_interface_names_type_list_reorder[-1]
if last_t == 0:
    max_offset = offset + 8
else:
    max_offset = offset + 4
    
# print("the value of axi_interface_names_type_list_reorder is:")
# print(axi_interface_names_type_list_reorder)
# print("the value of offset is:", hex(offset))
# print("the value of max offset is:", hex(max_offset))

user_regs_gen = []
C_S_AXI_ADDR_WIDTH = max_offset.bit_length()
C_S_AXI_DATA_WIDTH = 32
ADDR_BITS = max_offset.bit_length()


for name, base, t, rw_info in zip(
    mapped_axi_interface_names_list_final_reorder,
    addresses_offset_list,
    axi_interface_names_type_list_reorder,
    axi_interface_rw_list_final_reorder
):
    type_str = 'array' if t == 0 else 'reg'
    width = 64 if t == 0 else 32
    user_regs_gen.append({
        "name": name,
        "base": base,
        "type": type_str,
        "width": width,
        "rw_info": rw_info
    })

# Final configuration dictionary
config = {
    "C_S_AXI_ADDR_WIDTH": C_S_AXI_ADDR_WIDTH,
    "C_S_AXI_DATA_WIDTH": C_S_AXI_DATA_WIDTH,
    "ADDR_BITS": ADDR_BITS,
    "user_regs": user_regs_gen
}

# Write to JSON file
with open(top_control_s_axi_config_path + 'top_control_s_axi_config.json', 'w') as f:
    json.dump(config, f, indent=4)

################## Finish Generate S_AXI_Control JSON #################
def remove_substring_from_list(strings, substring, only_prefix=False, only_suffix=False):
    """
    Return a new list where `substring` has been removed from each element of `strings`.
    
    - If only_prefix=True, only remove `substring` when it appears at the start.
    - If only_suffix=True, only remove `substring` when it appears at the end.
    - If both only_prefix and only_suffix are False, remove *all* occurrences.
    """
    out = []
    L = len(substring)
    for s in strings:
        if only_prefix and s.startswith(substring):
            out.append(s[L:])
        elif only_suffix and s.endswith(substring):
            out.append(s[:-L])
        else:
            out.append(s.replace(substring, ''))
    return out

print("the value of unique_condition_reg_list is:")
print(unique_condition_reg_list)
unique_condition_reg_origin_name_list = remove_substring_from_list(unique_condition_reg_list, '_load')

print("the value of unique_condition_reg_origin_name_list is:")
print(unique_condition_reg_origin_name_list)


with open(JSON_file_path + "condition_reg_definition.json", "w") as f:
    json.dump({"regs": unique_condition_reg_origin_name_list}, f, indent=4)

print("the value of condition_reg_program_list is:")
print(condition_reg_program_list)
unique_condition_reg_program_index_list = []

for condition_reg_name in unique_condition_reg_list:
    for i in range (len(condition_reg_program_list)):
        if condition_reg_name in condition_reg_program_list[i]:
            unique_condition_reg_program_index_list.append(i) 
            break  
print("the value of unique_condition_reg_program_index_list is:")    
print(unique_condition_reg_program_index_list)


def get_condition_reg_source_nodes(xml_file: str , dst_name: str) -> list[str]:
    """
    Parse an XML <dataflows> document and collect the `from` node names
    whose `to` attribute equals `dst_name`.

    Parameters
    ----------
    xml_file : str | Path
        Path to the XML file.
    dst_name : str
        The destination node name to search for (e.g., "icmp_ln365").

    Returns
    -------
    List[str]
        A list of source node names (duplicates removed, order preserved).
    """
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Collect sources while preserving first-seen order and uniqueness
    seen, sources = set(), []
    for df in root.findall(".//dataflow[@to='%s']" % dst_name):
        src = df.get("from")
        if src not in seen:
            seen.add(src)
            sources.append(src)
    return sources

condition_reg_related_ops_list = []
condition_reg_related_ops_list_2 = []
condition_reg_related_position_list = []
condition_reg_chosen_program_index_list = []
for i in range (len(unique_condition_reg_origin_name_list)):
    chosen_program_index = unique_condition_reg_program_index_list[i]
    xml_file_path = HLS_project_solution_path_program_list[int(chosen_program_index)] + '.autopilot/db/top.adb.xml'
    
    #print("the value of condition_reg_source_node_list is:")
    #print(condition_reg_source_node_list)
    condition_reg_related_ops, condition_reg_related_ops_cycle, condition_reg_related_position = get_related_ops_condition_reg(FSM_info_program_list[int(chosen_program_index)], unique_condition_reg_origin_name_list[i], xml_file_path)
    condition_reg_related_ops_list.append("top_" + condition_reg_related_ops[0])
    condition_reg_related_ops_list_2.append(condition_reg_related_ops[0])
    condition_reg_related_position_list.append(condition_reg_related_position[0])
    condition_reg_chosen_program_index_list.append(chosen_program_index)
print("the value of condition_reg_related_ops_list is:")
print(condition_reg_related_ops_list)
print("the value of condition_reg_related_position_list is:")
print(condition_reg_related_position_list)

condition_reg_related_module_list = []
for i in range (len(condition_reg_related_ops_list)):
    related_module_name = func_call_name_to_instance_call_name[condition_reg_related_ops_list[i]]
    condition_reg_related_module_list.append(related_module_name)  
    
print("the value of condition_reg_related_ops_list is:")   
print(condition_reg_related_ops_list) 
print("the value of condition_reg_related_module_list is:")
print(condition_reg_related_module_list)

print(condition_reg_related_position_list)
print(condition_reg_related_ops_list_2)
print(condition_reg_chosen_program_index_list)

condition_reg_func_call_port_name_list = []
for i in range (len(condition_reg_related_ops_list)):
    func_call_port_name = get_func_call_port_name_condition_reg(condition_reg_related_ops_list_2[i], condition_reg_related_position_list[i], condition_reg_chosen_program_index_list[i], HLS_project_solution_path_program_list)
    condition_reg_func_call_port_name_list.append(func_call_port_name)

print("the value of condition_reg_func_call_port_name_list is:")
print(condition_reg_func_call_port_name_list)

# list_a = ['aaaa']
# list_b = ['bbbb']
# list_c = ['cccc']

# unique_condition_reg_list = unique_condition_reg_list + list_a
# condition_reg_func_call_port_name_list = condition_reg_func_call_port_name_list + list_b
# condition_reg_related_module_list = condition_reg_related_module_list + list_c
load_inst_module_name_list = []
for i in range (len(unique_condition_reg_list)):
    load_inst_module_name_list.append(load_inst_instance_name)
data = [
    {
        "unique_condition_reg": u,
        "func_call_port_name": p,
        "related_module": m,
        "load_inst_module": n
    }
    for u, p, m, n in zip(
        unique_condition_reg_list,
        condition_reg_func_call_port_name_list,
        condition_reg_related_module_list,
        load_inst_module_name_list
    )
]

# Write out to JSON
with open(JSON_file_path + "condition_reg.json", "w") as f:
    json.dump(data, f, indent=2)

def build_condition_reg_mapping_table(unique_condition_reg_list):
    """
    Build a mapping table for each register name.

    If "icmp" is in the register name → {0:1, 1:0}
    else                             → {0:0, 1:1}
    """
    mapping_table = {}
    for reg_name in unique_condition_reg_list:
        mapping_table[reg_name] = {0: 1, 1: 0} if "icmp" in reg_name else {0: 0, 1: 1}
    return mapping_table


condition_reg_value_mapping_table = build_condition_reg_mapping_table(unique_condition_reg_list)
with open("./program_tree/condition_reg_val_mapping_table.json", "w") as f:
    json.dump(condition_reg_value_mapping_table, f, indent=4)

######### Generate S AXI control module ######################
#pprint(axi_reg_mapping_program_list)
def strip_suffix(s, suffix="_read_reg"):
    return s[:-len(suffix)] if s.endswith(suffix) else s

# Use OrderedDict keys to dedupe while preserving order
keys_od = OrderedDict()
values_od = OrderedDict()

for mapping in axi_reg_mapping_program_list:
    for k, v in mapping.items():
        clean_k = strip_suffix(k)
        clean_v = strip_suffix(v)
        keys_od.setdefault(clean_k, None)
        values_od.setdefault(clean_v, None)

merged_reg_name_list = list(keys_od.keys())
merged_reg_name_mapping_list = list(values_od.keys())
output_dict = {
    "ctx": [
        {
            "C_S_AXI_CONTROL_DATA_WIDTH": C_S_AXI_DATA_WIDTH,
            "C_S_AXI_CONTROL_ADDR_WIDTH": C_S_AXI_ADDR_WIDTH,
            "C_S_AXI_CONTROL_WSTRB_WIDTH": 4
        }
    ],
    "signal_names": mapped_axi_interface_names_list_final_reorder,
    "signal_names_original": axi_interface_names_list_final_reorder,
    "signal_names_type": axi_interface_names_type_list_reorder,
    "signal_rw": axi_interface_rw_list_final_reorder
}

print("the value of mapped_axi_interface_names_list_final_reorder is:")
print(mapped_axi_interface_names_list_final_reorder)

print("the value of axi_interface_names_list_final_reorder is:")
print(axi_interface_names_list_final_reorder)

# Write to JSON file
with open(JSON_file_path + "s_axi_control_module.json", "w") as f:
    json.dump(output_dict, f, indent=2)

######### Finish Generate S AXI control module ######################


############ Generate HLS function port to arch port mapping ##########
# build lookup: interface name -> dram_array name
dram_map = dict(zip(
    axi_interface_names_list_final_reorder,
    mapped_axi_interface_names_list_final_reorder
))

# regenerate the mapping table without "_read_reg"
new_axi_reg_mapping = []
for prog in axi_reg_mapping_program_list:
    new_map = {}
    for full_key, full_reg in prog.items():
        # strip suffix from the key
        key = full_key.rsplit('_read_reg', 1)[0]
        # strip suffix from the register/interface name
        iface = full_reg.rsplit('_read_reg', 1)[0]
        # look up its dram_array
        dram_name = dram_map.get(iface)
        # assign the two‑element list
        new_map[key] = [iface, dram_name]
    new_axi_reg_mapping.append(new_map)

for idx, mapping in enumerate(new_axi_reg_mapping, start=1):
    filename = f"./program_tree/mapping_table_{idx}.json"
    with open(filename, "w") as f:
        json.dump(mapping, f, indent=4)
    
############ Finish Generate HLS function port to arch port mapping ##########


merged_program_inst_length_list = []
for i in range (len(merged_program_inst_list)):
    merged_program_inst_length_list.append(len(merged_program_inst_list[i]))
inst_length_max = max(merged_program_inst_length_list)
#inst_length_max = 20
inst_num_bits = (inst_length_max - 1).bit_length() 
############# Generate load inst related JSON file #######################

inst_JSON_file_path = './inst_configuration_final_generate/'

os.makedirs(inst_JSON_file_path, exist_ok=True)

module_name = "top_load_inst"
instance_name = "grp_load_inst_fu_92"
fifo_depth = 1

if fifo_depth == 1:
    fifo_depth_binary = 1
else:
    fifo_depth_binary = (fifo_depth - 1).bit_length()
    

interface_name = 'top_INPUT2_m_axi'
ARADDR_name = "grp_load_inst_fu_92_m_axi_INPUT2_ARADDR"
ARLEN_name = "grp_load_inst_fu_92_m_axi_INPUT2_ARLEN"
input_AXI_name = 'INPUT2'
input_AXI_mapping = 'grp_load_inst_fu_92_m_axi_INPUT2'


modules_to_parse = [
    {
        "verilog_file": "./architecture_design_RTL/top_load_inst.v",
        "target_module_name": module_name,
        "instance_name": instance_name
    }
]

# 2) Wrap it in the outer structure
output = {
    "modules_to_parse": modules_to_parse
}

# 3) Write to JSON file
with open(inst_JSON_file_path + "module_block_axi_new_input_inst.json", "w") as f:
    json.dump(output, f, indent=2)


module_entry = {
        "load_inst_instance_name": instance_name,
        "load_inst_module_name": module_name,
        "inst_length": inst_length,
        "fifo_depth_binary": fifo_depth_binary,
        "fifo_depth": fifo_depth
}

data = {
    "modules_to_parse": [
        module_entry
    ]
}

with open(inst_JSON_file_path + "load_inst_module.json", "w") as f:
    json.dump(data, f, indent=2)
    
# data = {
#         "load_inst_instance_name": instance_name,
#         "initial_state": initial_state
# }

# with open(inst_JSON_file_path + "FU_start_reg_inst.json", "w") as f:
#     json.dump(data, f, indent=2)
    
    
data = {
    "substitutions": {
        "init_state": initial_state,
        "reg_names": [
            {"name": name}
            for name in inst_reg_name_list
        ]
    }
}

# 2) Write it out to a JSON file
with open(inst_JSON_file_path + "initialize_block_inst.json", "w") as f:
    json.dump(data, f, indent=2)


# modules = [
#     { "name": instance_name, "fsm_index": load_inst_state }
# ]

# # 2) Wrap it in the outer structure
# output = {
#     "modules": modules
# }

# # 3) Write to a JSON file
# with open(inst_JSON_file_path + "FU_start_reg_inst.json", "w") as f:
#     json.dump(output, f, indent=2)


# modules = [
#     { "name": load_inst_fifo_U, "fsm_index": load_inst_state }
# ]

# # 2) Wrap it in the outer structure
# output = {
#     "modules": modules
# }

# # 3) Write to a JSON file
# with open(inst_JSON_file_path + "FU_start_reg_inst_fifo.json", "w") as f:
#     json.dump(output, f, indent=2)


# data = {
#     "buffers": [
#         {
#             "input_buffer_name": load_inst_fifo_U,
#             "case_mappings": [
#                 {"func_name": inst_buffer_name}
#             ]
#         }
#     ]
# }

# # 2) Write it out to JSON
# with open(inst_JSON_file_path + "FU_q0_inst.json", "w") as f:
#     json.dump(data, f, indent=2)


# data = {
#     "buffers": [
#         {
#             "input_buffer_name": inst_buffer_name,
#             "case_mappings": [
#                 {
#                     "func_name": load_inst_port_name
#                 }
#             ],
#             "load_inst_state": load_inst_state
#         }
#     ]
# }

# # 2) Write it out to JSON
# with open(inst_JSON_file_path + "BRAM_we_d0_inst.json", "w") as f:
#     json.dump(data, f, indent=2)    


#print("the length of the merged list is:", merged_inst)


# bram_modules = []

# bram_modules.append({
#             "module_name":   BRAM_module_name,
#             "instance_name": BRAM_instance_name,
#             "DataWidth":     inst_length,
#             "AddressRange":  inst_length_max,
#             "AddressWidth":  (inst_length_max - 1).bit_length()
#         })

# 5) Define your inst_fifo_module (fixed names, user‑defined widths)
inst_fifo_datawidth = inst_length # ← change as needed
inst_fifo_depth     = 1   # ← change as needed


if inst_fifo_depth == 1:
    inst_fifo_addrwidth = 1
else:    
    inst_fifo_addrwidth = (inst_fifo_depth - 1).bit_length()

# inst_fifo_module = {
#     "module_name":   inst_fifo_module_name,
#     "instance_name": inst_fifo_instance_name,
#     "DataWidth":     inst_fifo_datawidth,
#     "Depth":         inst_fifo_depth,
#     "AddressWidth":  inst_fifo_addrwidth,
#     "InstAddressWidth": inst_num_bits
# }

# # 6) Define your load_inst_modules (fixed names, user‑defined inst_num)
# #load_inst_num = len(merged_inst)  # ← change as needed
# load_inst_num = inst_length_max
# load_inst_modules = [{
#     "module_name":   load_inst_fifo,
#     "instance_name": load_inst_fifo_U,
#     "inst_num":      f"32'd{load_inst_num}"
# }]

# config = {
#     "BRAM_modules":      bram_modules,
#     "inst_fifo_module":  inst_fifo_module,
#     "load_inst_modules": load_inst_modules
# }

# with open(inst_JSON_file_path + "BRAM_module_inst.json", "w") as f:
#     json.dump(config, f, indent=4)



# data = {
#     "buffers": [
#         {
#             "input_buffer_name": inst_buffer_name,
#             "case_mappings": [
#                 {"func_name": load_inst_port_name},
#                 {"func_name": load_inst_fifo_U}
#             ],
#             "load_inst_state": load_inst_state
#         }
#     ]
# }

# # 2) Write it out to JSON
# with open(inst_JSON_file_path + "BRAM_address_ce_inst.json", "w") as f:
#     json.dump(data, f, indent=2)

input_AXI_reg_list = ["grp_load_inst_fu_92_inst_dram", "grp_load_inst_fu_92_inst_num"]
input_AXI_reg_mapping_list = []
for i in range (len(inst_reg_name_list)):
    input_AXI_reg_mapping_list.append(inst_reg_name_list[i] + "_read_reg")
    
even_case = [{"func_name": v} for idx, v in enumerate(input_AXI_reg_mapping_list) if idx % 2 == 0]
odd_case  = [{"func_name": v} for idx, v in enumerate(input_AXI_reg_mapping_list) if idx % 2 == 1]   

even_case_list = [ v for idx, v in enumerate(input_AXI_reg_mapping_list) if idx % 2 == 0]
odd_case_list = [v for idx, v in enumerate(input_AXI_reg_mapping_list) if idx % 2 == 1]

data = {
    "buffers": [
        {
            "input_AXI_reg": input_AXI_reg_list[0],
        "case_mappings": even_case,
        "load_inst_state": initial_state
    },
    {
        "input_AXI_reg": input_AXI_reg_list[1],
        "case_mappings": odd_case,
        "load_inst_state": initial_state
    }
]
}

print("the value of the even_case is:", even_case_list)

with open(inst_JSON_file_path + "AXI_interface_reg_inst.json", "w") as f:
    json.dump(data, f, indent=2)


def build_regsel_to_index(
    choice_to_reg_mapping: Dict[str, Dict[str, str]],
    even_case: List[str]
) -> Dict[str, Dict[str, int]]:
    """
    Returns: { reg_name: { selection_str: index_in_even_case } }
    Example: {'icmp_ln365': {'0': 2, '1': 1}, ...}
    """
    # Map choice key like "1_0" / "1_1" to its index in even_case
    choice_to_idx: Dict[str, int] = {}
    for idx, name in enumerate(even_case):
        m = re.search(r'(\d+)_(\d+)', name)
        if not m:
            raise ValueError(f"Cannot extract choice key from '{name}'")
        choice_key = f"{m.group(1)}_{m.group(2)}"
        choice_to_idx[choice_key] = idx

    out = defaultdict(dict)
    for choice_key, reg_map in choice_to_reg_mapping.items():
        if choice_key not in choice_to_idx:
            raise KeyError(f"Choice '{choice_key}' not found in even_case")
        idx = choice_to_idx[choice_key]
        for reg_name, sel in reg_map.items():
            out[reg_name][str(sel)] = idx
    return {k: dict(v) for k, v in out.items()}

regsel_to_index_condition_reg_inst_array_name = build_regsel_to_index(choice_to_reg_mapping, even_case_list)
regsel_to_index_condition_reg_inst_num = build_regsel_to_index(choice_to_reg_mapping, odd_case_list)
print("the value of regsel_to_index_condition_reg_inst_array_name is:")
print(regsel_to_index_condition_reg_inst_array_name)
print("the value of regsel_to_index_condition_reg_inst_num is:")
print(regsel_to_index_condition_reg_inst_num)

obj = {"cond_index_map": regsel_to_index_condition_reg_inst_array_name}
with open(inst_JSON_file_path + "AXI_interface_reg_inst_condition.json", "w") as f:
    json.dump(obj, f, indent=2)


bw = inst_length
wstrb_width = bw // 8
contexts = []
ctx = {
    "module_name": interface_name,
    "CONSERVATIVE": 1,
    "USER_MAXREQS": 7,
    "MAX_READ_BURST_LENGTH": 16,
    "MAX_WRITE_BURST_LENGTH": 16,
    "CH0_USER_RFIFONUM_WIDTH": 9,
    "CH0_USER_DW": bw,
    "CH0_USER_AW": 64,
    "NUM_READ_OUTSTANDING": 16,
    "NUM_WRITE_OUTSTANDING": 0,
    "C_M_AXI_ID_WIDTH": 1,
    "C_M_AXI_ADDR_WIDTH": 64,
    "C_M_AXI_DATA_WIDTH": bw,
    "C_M_AXI_AWUSER_WIDTH": 1,
    "C_M_AXI_ARUSER_WIDTH": 1,
    "C_M_AXI_WUSER_WIDTH": 1,
    "C_M_AXI_RUSER_WIDTH": 1,
    "C_M_AXI_BUSER_WIDTH": 1,
    "C_M_AXI_USER_VALUE": 0,
    "C_M_AXI_PROT_VALUE": 0,
    "C_M_AXI_CACHE_VALUE": 3,
    "AWVALID": "1'b0",
    "AWADDR": "64'd0",
    "AWLEN": "32'd0",
    "WVALID": "1'b0",
    "WDATA": f"{bw}'d0",
    "WSTRB": f"{wstrb_width}'d0",
    "BREADY": "1'b0",
    "ARADDR": f"{ARADDR_name}",
    "ARLEN":  f"{ARLEN_name}"
}

contexts.append(ctx)

output = {"contexts": contexts}

with open(inst_JSON_file_path + "axi_control_master_input_inst.json", "w") as f:
    json.dump(output, f, indent=2)

data = {
    "buffers": [
        {
            "input_AXI_name": input_AXI_name,
            "case_mappings": [
                { "func_name": input_AXI_mapping }
            ],
            "load_inst_state": initial_state
        }
    ]
}

# Write to JSON file
with open(inst_JSON_file_path + "AXI_interface_input_inst.json", "w") as f:
    json.dump(data, f, indent=2)


################ Now move the related Verilog module files to a new folder ###############


def parse_verilog_map(solution_path):
    """
    Build a mapping from module name to its Verilog file path under solution_path.
    """
    mapping = {}
    for root, _, files in os.walk(solution_path):
        for fn in files:
            if fn.endswith('.v'):
                module = os.path.splitext(fn)[0]
                mapping[module] = os.path.join(root, fn)
    return mapping

def collect_modules_pyverilog(mapping, top_modules):
    """
    Given a module->file mapping and a list of top-level modules,
    use Pyverilog to recursively discover submodule instantiations.
    """
    needed = set()
    queue = list(top_modules)
    while queue:
        mod = queue.pop(0)
        if mod in needed:
            continue
        needed.add(mod)
        file_path = mapping.get(mod)
        if not file_path:
            continue
        ast, _ = parse([file_path])
        for description in ast.description.definitions:
            if isinstance(description, ModuleDef) and description.name == mod:
                for item in description.items:
                    if isinstance(item, InstanceList):
                        submod = item.module
                        if submod not in needed and submod in mapping:
                            queue.append(submod)
    return needed

def collect_modules_pyverilog_new(mapping, top_modules):
    """
    Given a module->file mapping and a list of top-level modules,
    use Pyverilog to recursively discover submodule instantiations,
    but skip any files that fail to parse.
    """
    needed = set()
    queue = list(top_modules)
    while queue:
        mod = queue.pop(0)
        if mod in needed:
            continue
        path = mapping.get(mod)
        if not path:
            print(f"⚠️  {mod}.v not found, skipping")
            continue

        # Try to parse; skip on error
        try:
            ast, _ = parse([path])
        except ParseError as e:
            print(f"⚠️  Skipping parse of {mod}.v due to: {e}")
            needed.add(mod)
            continue

        needed.add(mod)
        # find its definition
        for desc in ast.description.definitions:
            if isinstance(desc, ModuleDef) and desc.name == mod:
                for item in desc.items:
                    if isinstance(item, InstanceList):
                        submod = item.module
                        if submod not in needed and submod in mapping:
                            queue.append(submod)
                break

    return needed

def collect_and_copy_with_pyverilog(
    hls_solution_paths,
    top_modules,
    module_path_indices,
    dest_dir
):
    """
    For each top-level module, search only in its designated solution path,
    use Pyverilog to find all submodules, and copy all needed .v files to dest_dir.
    """
    # Build verilog maps for each solution path
    verilog_maps = [parse_verilog_map(p) for p in hls_solution_paths]

    all_needed = set()
    module_to_map = {}

    # Discover modules per top-level entry
    for mod, idx in zip(top_modules, module_path_indices):
        mapping = verilog_maps[idx]
        needed = collect_modules_pyverilog_new(mapping, [mod])
        for m in needed:
            all_needed.add(m)
            module_to_map[m] = idx

    # Copy files
    os.makedirs(dest_dir, exist_ok=True)
    for m in all_needed:
        idx = module_to_map[m]
        src = verilog_maps[idx][m]
        dst = os.path.join(dest_dir, os.path.basename(src))
        shutil.copy(src, dst)

    print(f"Copied {len(all_needed)} Verilog files to {dest_dir}")


regex_inst = re.compile(r'^\s*([A-Za-z_]\w*)\s*(?:#\s*\(|\s+)\w+\s*\(', re.MULTILINE)

def find_submodules(mapping, topmods):
    """return a set of all modules reachable from topmods; hybrid parser."""
    needed, queue = set(), list(topmods)

    while queue:
        mod = queue.pop(0)
        if mod in needed:
            continue
        path = mapping.get(mod)
        if not path:
            print(f"⚠️  {mod}.v missing")
            continue

        # ---------- 1) try Pyverilog
        submods = set()
        try:
            ast, _ = parse([path])
            for d in ast.description.definitions:
                if isinstance(d, ModuleDef) and d.name == mod:
                    for item in d.items:
                        if isinstance(item, InstanceList):
                            submods.add(item.module)
        except ParseError as e:
            print(f"⚠️  {mod}.v: Pyverilog error ({e}); using regex fallback")
            # ---------- 2) regex fallback
            text = open(path).read()
            submods.update(regex_inst.findall(text))

        # keep walking
        needed.add(mod)
        for s in submods:
            if s not in needed and s in mapping:
                queue.append(s)

    return needed


def collect_and_copy(hls_paths, top_modules, idx_list, dest, tcl_dest):
    verilog_maps = [{os.path.splitext(f)[0]: os.path.join(r, f)
                     for r,_,fs in os.walk(p) for f in fs if (f.endswith('.v') or f.endswith('.tcl'))}
                    for p in hls_paths]

    all_needed, module_origin = set(), {}

    for mod, idx in zip(top_modules, idx_list):
        mapping  = verilog_maps[idx]
        subgraph = find_submodules(mapping, [mod])
        for m in subgraph:
            all_needed.add(m)
            module_origin[m] = idx

    os.makedirs(dest, exist_ok=True)
    os.makedirs(tcl_dest, exist_ok=True)
    #print("the value of hls path is:", hls_paths)
    for m in all_needed:
        src = verilog_maps[module_origin[m]][m]
        root, ext = os.path.splitext(src)
        #print("the value of the file to be copied is:", m)
        if "ROM_AUTO" in m:
            if ext == ".v":
                shutil.copy(src, os.path.join(dest, f"{m}.v")) 
                print(f"✔  Copied {len(all_needed)} Verilog files to {dest}") 
                src_new = root + ".dat"
                shutil.copy(src_new, os.path.join(dest, f"{m}.dat")) 
                print(f"✔  Copied {src_new} DAT files to {dest}")      
        else:
            if ext == ".v":
                shutil.copy(src, os.path.join(dest, f"{m}.v"))
                print(f"✔  Copied {len(all_needed)} Verilog files to {dest}")
            if ext == ".tcl":
                shutil.copy(src, os.path.join(tcl_dest, f"{m}.tcl"))
                print(f"✔  Copied {len(all_needed)} tcl files to {tcl_dest}")

    
HLS_project_solution_path_program_verilog_file_list = []
for i in range (len(HLS_project_solution_path_program_list)):
    verilog_file_path = HLS_project_solution_path_program_list[i] + 'impl/verilog/'
    HLS_project_solution_path_program_verilog_file_list.append(verilog_file_path)

dest = './architecture_design_RTL/'
tcl_dest = './architecture_design_TCL/'
# collect_and_copy_with_pyverilog(HLS_project_solution_path_program_verilog_file_list, merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, dest)
# collect_and_copy_with_pyverilog(HLS_project_solution_path_program_verilog_file_list, merged_module_name_input_program_list, merged_module_name_input_program_index_list, dest)
# collect_and_copy_with_pyverilog(HLS_project_solution_path_program_verilog_file_list, merged_module_name_output_program_list, merged_module_name_output_program_index_list, dest)

collect_and_copy(HLS_project_solution_path_program_verilog_file_list, merged_func_call_key_program_list, merged_instance_call_program_realted_index_list, dest, tcl_dest)
collect_and_copy(HLS_project_solution_path_program_verilog_file_list, merged_module_name_input_program_list, merged_module_name_input_program_index_list, dest, tcl_dest)
collect_and_copy(HLS_project_solution_path_program_verilog_file_list, merged_module_name_output_program_list, merged_module_name_output_program_index_list, dest, tcl_dest)

#print("the value of HLS_project_solution_path_program_verilog_file_list is:", HLS_project_solution_path_program_verilog_file_list)
#print("the merged_func_call_key_program_list is:", merged_func_call_key_program_list)
#print("the merged_instance_call_program_realted_index_list:", merged_instance_call_program_realted_index_list)

################# Copy the inst related RTL code ###################
src_dir = './RTL_library'
dst_dir = './architecture_design_RTL'
for root, _, files in os.walk(src_dir):
    for fname in files:
        # only process Verilog files
        if not fname.lower().endswith('.v'):
            continue
        
        # if this is the special file and bram_modules_2p is empty, skip it
        if fname == "top_input_buffer_RAM_AUTO_1R1W.v" and not bram_modules_1p:
            print(f"Skipping {fname} because bram_modules_2p is empty")
            continue
        # if this is the special file and bram_modules_2p is empty, skip it
        if fname == "top_input_buffer_RAM_AUTO_2R2W.v" and not bram_modules_2p:
            print(f"Skipping {fname} because bram_modules_2p is empty")
            continue

        src_path = os.path.join(root, fname)
        dst_path = os.path.join(dst_dir, fname)
        shutil.copy2(src_path, dst_path)
        print(f"Copied {src_path} → {dst_path}")
# src_dir = './RTL_library'
# dst_dir = './architecture_design_RTL'

# # Create destination directory if it doesn't exist
# os.makedirs(dst_dir, exist_ok=True)

# # Walk through the source directory
# for root, _, files in os.walk(src_dir):
#     for fname in files:
#         if fname.lower().endswith('.v'):
#             src_path = os.path.join(root, fname)
#             dst_path = os.path.join(dst_dir, fname)
#             shutil.copy2(src_path, dst_path)
#             print(f"Copied {src_path} → {dst_path}")
            
m_axi_interface_list = []
for i in range (len(axi_interface_input_name_list)):
    m_axi_interface_list.append('m_axi_' + axi_interface_input_name_list[i])        
#m_axi_interface_list.append('m_axi_' + input_AXI_name)
for i in range (len(axi_interface_output_name_list)):
    m_axi_interface_list.append('m_axi_' + axi_interface_output_name_list[i])

m_axi_interface_list.append('m_axi_INPUT2')
# merged_program_inst_length_list = []
# for i in range (len(merged_program_inst_list)):
#     merged_program_inst_length_list.append(len(merged_program_inst_list[i]))
# inst_length_max = max(merged_program_inst_length_list)
# inst_num_bits = (inst_length_max - 1).bit_length()    
with open("m_axi_interface.txt", 'w') as f:
    for iface in m_axi_interface_list:
        f.write(f"{iface}\n")
        
with open("inst_length.txt", "w") as f:
    f.write(f"{inst_length}\n")   # write the number plus a newline
        
data = {
    "data_width": inst_length,
    "inst_num_bit_width": inst_num_bits
}

output_path = inst_JSON_file_path + "inst_load_inst.json"
with open(output_path, "w") as f:
    json.dump(data, f, indent=2)
  
print(mapped_axi_interface_names_list_final_reorder) 
print(axi_interface_names_list_final_reorder) 
print(axi_interface_names_type_list_reorder)  
print(axi_interface_rw_list_final_reorder)

axi_interface_name_list = []
for i in range (len(axi_interface_input_name_list)):
    axi_interface_name_list.append(axi_interface_input_name_list[i])        
#m_axi_interface_list.append('m_axi_' + input_AXI_name)
for i in range (len(axi_interface_output_name_list)):
    axi_interface_name_list.append(axi_interface_output_name_list[i])

DRAM_depths = []
counter = 0
for full_name in axi_interface_names_list_final_reorder:
    toks = full_name.split('_')
    found = None
    if 'inst_array' in full_name:
        DRAM_depths.append(max_inst_num_list[counter])
        continue
    if 'n_inst' in full_name:
        DRAM_depths.append(1)
        counter = counter + 1
        continue
    # try each known hw_name
    for hw in axi_interface_name_list:
        hw_toks = hw.split('_')
        # look for the subsequence hw_toks inside toks
        for i in range(len(toks) - len(hw_toks) + 1):
            if toks[i:i+len(hw_toks)] == hw_toks:
                # the token immediately before that subsequence is size_depth
                found = toks[i-1]
                break
        if found is not None:
            break
    DRAM_depths.append(found)

print("the value of axi_interface_names_list_final_reorder is:", axi_interface_names_list_final_reorder)
print("the value of DRAM depth is:", DRAM_depths)
print("the value of axi_interface_rw_list_final_reorder:")
print(axi_interface_rw_list_final_reorder)
print("the value of axi_interface_names_type_list_reorder")
print(axi_interface_names_type_list_reorder)


DRAM_array_name_list = []
DRAM_array_direction_list = []
DRAM_array_depth_list = []
DRAM_array_address_list = []
normal_reg_list = []
normal_reg_address_list = []
control_status_reg_list = []
control_status_reg_dram_address_list = []
control_status_reg_dram_ap_vld_list = []

for i in range (len(axi_interface_rw_list_final_reorder)):
    rw_direction = axi_interface_rw_list_final_reorder[i]
    interface_type = axi_interface_names_type_list_reorder[i]
    if rw_direction == 'w' and interface_type == 1:
        control_status_reg_list.append(mapped_axi_interface_names_list_final_reorder[i])
        control_status_reg_dram_address_list.append(addresses_offset_list[i])
        base_int = int(addresses_offset_list[i], 16)
        vld_int  = base_int + 0x04
        vld_str = hex(vld_int)
        control_status_reg_dram_ap_vld_list.append(vld_str)
    elif rw_direction == 'r' and interface_type == 1:
        normal_reg_list.append(mapped_axi_interface_names_list_final_reorder[i])
        normal_reg_address_list.append(addresses_offset_list[i])
    elif interface_type == 0:
        DRAM_array_name_list.append(mapped_axi_interface_names_list_final_reorder[i])
        DRAM_array_depth_list.append(int(DRAM_depths[i]))
        DRAM_array_address_list.append(addresses_offset_list[i])
        if rw_direction == 'r':
            DRAM_array_direction_list.append('input')
        elif rw_direction == 'w':
            DRAM_array_direction_list.append('output')
            
inst_bits = inst_length  

config = {
    "DRAM_array_name_list":    DRAM_array_name_list,
    "DRAM_array_direction":    DRAM_array_direction_list,
    "DRAM_array_size":         DRAM_array_depth_list,
    "DRAM_array_address_list": DRAM_array_address_list,

    "normal_reg_name_list":    normal_reg_list,
    "normal_reg_address_list": normal_reg_address_list,

    "control_status_reg_list":              control_status_reg_list,
    "control_status_reg_dram_address_list": control_status_reg_dram_address_list,
    "control_status_reg_dram_ap_vld_list":  control_status_reg_dram_ap_vld_list,

    "inst_bits": inst_bits
}

with open(config_JSON_file_path + "config.json", "w") as f:
    json.dump(config, f, indent=2)
   
# print(DRAM_array_name_list) 
# print(DRAM_array_direction_list) 
# print(normal_reg_list)  
# print(control_status_reg_list)    
# print(DRAM_array_depth_list) 
# print(DRAM_array_address_list) 
# print(normal_reg_address_list) 
# print(addresses_offset_list)
# print(control_status_reg_dram_address_list)
# print(control_status_reg_dram_ap_vld_list)
# "signal_names": mapped_axi_interface_names_list_final_reorder,
# "signal_names_original": axi_interface_names_list_final_reorder,
# "signal_names_type": axi_interface_names_type_list_reorder,
# "signal_rw": axi_interface_rw_list_final_reorder


########## Generate inst buffer related JSON file ##########
inst_JSON_file_path = './inst_configuration_final_generate/'

os.makedirs(inst_JSON_file_path, exist_ok=True)

module_name = "top_load_inst"
instance_name = "grp_load_inst_fu_92"
fifo_depth = 1
if fifo_depth == 1:
    fifo_depth_binary = 1
else:
    fifo_depth_binary = (fifo_depth - 1).bit_length()


interface_name = 'top_INPUT2_m_axi'
ARADDR_name = "grp_load_inst_fu_92_m_axi_INPUT2_ARADDR"
ARLEN_name = "grp_load_inst_fu_92_m_axi_INPUT2_ARLEN"
input_AXI_name = 'INPUT2'
input_AXI_mapping = 'grp_load_inst_fu_92_m_axi_INPUT2'


modules_to_parse = [
    {
        "verilog_file": "./architecture_design_RTL/top_load_inst.v",
        "target_module_name": module_name,
        "instance_name": instance_name
    }
]

# 2) Wrap it in the outer structure
output = {
    "modules_to_parse": modules_to_parse
}

# 3) Write to JSON file
with open(inst_JSON_file_path + "module_block_axi_new_input_inst.json", "w") as f:
    json.dump(output, f, indent=2)


module_entry = {
        "load_inst_instance_name": instance_name,
        "load_inst_module_name": module_name,
        "inst_length": inst_length,
        "fifo_depth_binary": fifo_depth_binary,
        "fifo_depth": fifo_depth
}

data = {
    "modules_to_parse": [
        module_entry
    ]
}

with open(inst_JSON_file_path + "load_inst_module.json", "w") as f:
    json.dump(data, f, indent=2)
    
data = {
        "load_inst_instance_name": instance_name,
        "initial_state": initial_state
}

with open(inst_JSON_file_path + "FU_start_reg_inst.json", "w") as f:
    json.dump(data, f, indent=2)
    
data = {
    "load_inst_instance_name": instance_name,
    "initial_state": initial_state,
    "condition_regs": unique_condition_reg_origin_name_list
}

out_file = os.path.join(inst_JSON_file_path, "FU_start_reg_inst_condition.json")
with open(out_file, "w") as f:
    json.dump(data, f, indent=2)
