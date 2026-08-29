import sys, os
import re
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
from pyverilog.vparser.ast import (
    Port, Ioport, Output, Identifier,
    Assign, Lvalue, Rvalue
)

def mk_io_output(name: str) -> Ioport:
    """
    Build an Ioport node representing
        output <name>;
    """
    # Output(name, width, signed); width=None→1-bit, signed=False
    return Ioport(Output(name, None, False), None)

def add_debug_ports(module):
    # --- 1) Fix the port list (tuple→list→tuple) ---
    ports = list(module.portlist.ports)
    # try to insert right after 'interrupt'
    try:
        idx = next(i for i,p in enumerate(ports)
                   if isinstance(p, Port) and p.name == 'interrupt')
        insert_at = idx + 1
    except StopIteration:
        insert_at = len(ports)
    for pname in ('dbg_ap_start', 'dbg_ap_done'):
        # Port(name, width, direction, porttype)
        ports.insert(insert_at, Port(pname, None, None, None))
        insert_at += 1
    module.portlist.ports = tuple(ports)

    # --- 2) Inject output declarations before the first behavioral stmt ---
    items = list(module.items)
    first_behavior = next(
        (i for i,node in enumerate(items)
         if node.__class__.__name__ not in {'Decl','Ioport'}),
        len(items)
    )
    items[first_behavior:first_behavior] = [
        mk_io_output('dbg_ap_start'),
        mk_io_output('dbg_ap_done')
    ]

    # --- 3) Append continuous assigns just before endmodule ---
    items.extend([
        Assign(Lvalue(Identifier('dbg_ap_start')), Rvalue(Identifier('ap_start'))),
        Assign(Lvalue(Identifier('dbg_ap_done')),  Rvalue(Identifier('ap_done')))
    ])

    module.items = items

def main(vfile: str):
    if not os.path.isfile(vfile):
        sys.exit(f"ERROR: file not found: {vfile}")

    # 1) Parse
    ast, _ = parse([vfile])

    # 2) Patch every module
    for definition in ast.description.definitions:
        if definition.__class__.__name__ == 'ModuleDef':
            add_debug_ports(definition)

    # 3) Generate Verilog text
    verilog = ASTCodeGenerator().visit(ast)

    # 4) Post-process to add missing semicolons on our new outputs
    #    Look for lines exactly "output dbg_ap_start" or "output dbg_ap_done"
    out_lines = []
    for line in verilog.splitlines(keepends=True):
        if re.match(r'^\s*output\s+dbg_ap_start\s*$', line) or \
           re.match(r'^\s*output\s+dbg_ap_done\s*$',  line):
            # add semicolon
            leading = re.match(r'^(\s*)', line).group(1)
            name = line.strip()
            out_lines.append(f"{leading}{name};\n")
        else:
            out_lines.append(line)

    # 5) Overwrite top.v in place
    with open(vfile, 'w') as f:
        f.writelines(out_lines)

    print(f"OK: patched {vfile} in place.")

if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.exit("Usage: python add_dbg_ports.py <top.v>")
    main(sys.argv[1])