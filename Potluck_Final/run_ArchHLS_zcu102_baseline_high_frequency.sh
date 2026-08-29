#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/potluck_env.sh"

potluck_parse_common_args "$@"
DEBUG="$POTLUCK_DEBUG"
set -- "${POTLUCK_REMAINING_ARGS[@]}"

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 [--debug] [--conda-env NAME | --conda-prefix PATH] [--conda-sh PATH] [--no-conda] <vivado_proj_root> <synthesized_source_file_path>"
  potluck_print_env_options
  exit 1
fi

# 1) Vivado project root
PROJ_ROOT="$1"

SOURCE_PATH="$2"

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

if $DEBUG; then
  python add_baseline_debug_ports.py "$SOURCE_PATH/top.v"
  echo "✅ Added extra port in top.v!"
else
  echo "✅ No need to add extra port!"
fi

vivado -mode batch  \
       -source package_baseline_IP.tcl \
       -tclargs "$SOURCE_PATH" "$PROJ_ROOT"

echo "✅ RTL packaging complete!"

# ---- Run Vivado to generate the bitstream ----
if $DEBUG; then
  vivado -mode batch  \
       -source generate_bitstream_baseline_debug_250_mhz.tcl \
       -tclargs "$PROJ_ROOT" m_axi_interface_baseline.txt 
else
  vivado -mode batch  \
        -source generate_bitstream_baseline.tcl \
        -tclargs "$PROJ_ROOT" m_axi_interface_baseline.txt
fi

echo "✅ Bitstream generation complete!"

if $DEBUG; then
  python extract_gen_arch_file_baseline_debug.py "$PROJ_ROOT"
else
  python extract_gen_arch_file_baseline.py "$PROJ_ROOT"
fi

echo "✅ Get the .bit and .hwh!"

python gen_xclbin.py

echo "✅ Get .xclbin!"
