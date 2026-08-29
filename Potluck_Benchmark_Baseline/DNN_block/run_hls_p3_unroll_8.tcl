# Auto-generated TCL file for HLS
open_project -reset project_DNN_block_p3_unroll_8_baseline

set_top top

add_files  p3_unroll_8.cpp
add_files -tb tb_p3_unroll_8.cpp

add_files -tb ./data_unroll_8/DRAM_image_input.txt
add_files -tb ./data_unroll_8/DRAM_conv_weight_1x1.txt
add_files -tb ./data_unroll_8/DRAM_conv_bias_1x1.txt
add_files -tb ./data_unroll_8/DRAM_conv_weight_3x3.txt
add_files -tb ./data_unroll_8/DRAM_conv_bias_3x3.txt

open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit