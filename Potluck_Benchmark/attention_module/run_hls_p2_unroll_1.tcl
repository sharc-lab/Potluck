# Auto-generated TCL file for HLS
open_project -reset project_top_attention_module_p2_unroll_1

set_top top

add_files  p2_unroll_1.cpp
add_files -tb tb_p2.cpp

add_files -tb ./data_unroll_1/A0.txt
add_files -tb ./data_unroll_1/A1.txt
add_files -tb ./data_unroll_1/B0.txt
add_files -tb ./data_unroll_1/B1.txt
add_files -tb ./data_unroll_1/AW00.txt
add_files -tb ./data_unroll_1/AW10.txt
add_files -tb ./data_unroll_1/AW01.txt
add_files -tb ./data_unroll_1/AW11.txt
add_files -tb ./data_unroll_1/BW00.txt
add_files -tb ./data_unroll_1/BW10.txt
add_files -tb ./data_unroll_1/BW01.txt
add_files -tb ./data_unroll_1/BW11.txt

add_files -tb ./data_unroll_1/A.txt
add_files -tb ./data_unroll_1/B.txt
add_files -tb ./data_unroll_1/AW.txt
add_files -tb ./data_unroll_1/BW.txt


open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit