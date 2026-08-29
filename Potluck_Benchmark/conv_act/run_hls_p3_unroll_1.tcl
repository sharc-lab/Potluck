# Auto-generated TCL file for HLS
open_project -reset project_conv_act_p3_unroll_1

set_top top

add_files  p3_unroll_1.cpp
add_files -tb tb.cpp
add_files -tb top_conv.h

add_files -tb ./data_unroll_1/DRAM_image_input.txt 
add_files -tb ./data_unroll_1/DRAM_conv_weight.txt 
add_files -tb ./data_unroll_1/DRAM_conv_bias.txt 

open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit