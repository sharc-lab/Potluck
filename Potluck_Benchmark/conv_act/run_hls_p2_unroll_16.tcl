# Auto-generated TCL file for HLS
open_project -reset project_conv_act_p2_unroll_16

set_top top

add_files  p2_unroll_16.cpp
add_files -tb tb_unroll_16.cpp
add_files -tb top_conv_unroll_16.h

add_files -tb ./data_unroll_16/DRAM_image_input.txt 
add_files -tb ./data_unroll_16/DRAM_conv_weight.txt 
add_files -tb ./data_unroll_16/DRAM_conv_bias.txt
open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit