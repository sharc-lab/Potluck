#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/potluck_env.sh"

potluck_parse_common_args "$@"
DEBUG="$POTLUCK_DEBUG"
set -- "${POTLUCK_REMAINING_ARGS[@]}"

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 [--debug] [--conda-env NAME | --conda-prefix PATH] [--conda-sh PATH] [--no-conda] <vivado_proj_root> <HLS_project_solution_path.txt> <BRAM_name.json> <axi_interface_mapping.json>"
  potluck_print_env_options
  exit 1
fi

# 1) Vivado project root
PROJ_ROOT="$1"
# 2) m_axi interface list

LIST_FILE="$2"

BRAM_NAME="$3"

AXI_INTERFACE_MAPPING="$4"

# ---- Activate Python environment ----
potluck_activate_python_env

if $DEBUG; then
  vivado -mode batch  \
        -source package_cycle_counter_IP.tcl \
        -tclargs "./" "$PROJ_ROOT"
echo "✅ Cycle counter packaging complete!"
else
  echo "✅ No need cycle counter!"
fi

# ---- Run your three Python scripts ----
echo ">> extract_info_from_xml_with_merge.py $LIST_FILE $BRAM_NAME $AXI_INTERFACE_MAPPING"
python extract_info_from_xml_with_merge.py \
     "$LIST_FILE" \
     "$BRAM_NAME" \
     "$AXI_INTERFACE_MAPPING"

echo ">> generate_top_control_s_axi.py"
python generate_top_control_s_axi.py

echo ">> top_generation_final.py${DEBUG:+ --debug} --axi-interface-mapping-json $AXI_INTERFACE_MAPPING"
if $DEBUG; then
  python top_generation_final.py --debug --axi-interface-mapping-json "$AXI_INTERFACE_MAPPING"
else
  python top_generation_final.py --axi-interface-mapping-json "$AXI_INTERFACE_MAPPING"
fi

echo "✅ All Python steps done!"

vivado -mode batch  \
       -source package_IP.tcl \
       -tclargs "./architecture_design_RTL/" "$PROJ_ROOT"

echo "✅ RTL packaging complete!"

# ---- Run Vivado to generate the bitstream ----

if $DEBUG; then
  vivado -mode batch  \
       -source generate_bitstream_dram_debug.tcl \
       -tclargs "$PROJ_ROOT" m_axi_interface.txt inst_length.txt
else
  vivado -mode batch  \
        -source generate_bitstream.tcl \
        -tclargs "$PROJ_ROOT" m_axi_interface.txt inst_length.txt
fi

echo "✅ Bitstream generation complete!"

if $DEBUG; then
  python extract_gen_arch_file_debug.py "$PROJ_ROOT"
else
  python extract_gen_arch_file.py "$PROJ_ROOT"
fi

echo "✅ Get the .bit and .hwh!"

python gen_xclbin.py

echo "✅ Get .xclbin!"
