# Auto-generated TCL file for HLS
open_project -reset project_conv_act_manual_arch_unroll_1

set_top top

add_files  unroll_1.cpp
#add_files -tb tb.cpp


open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

#csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit