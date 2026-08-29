# Auto-generated TCL file for HLS
open_project -reset project_top_attention_module_p3_unroll_4

set_top top

add_files  p3_unroll_4.cpp
add_files -tb tb_p3.cpp

add_files -tb ./data_unroll_4/A0.txt
add_files -tb ./data_unroll_4/A1.txt
add_files -tb ./data_unroll_4/B0.txt
add_files -tb ./data_unroll_4/B1.txt
add_files -tb ./data_unroll_4/AW00.txt
add_files -tb ./data_unroll_4/AW10.txt
add_files -tb ./data_unroll_4/AW01.txt
add_files -tb ./data_unroll_4/AW11.txt
add_files -tb ./data_unroll_4/BW00.txt
add_files -tb ./data_unroll_4/BW10.txt
add_files -tb ./data_unroll_4/BW01.txt
add_files -tb ./data_unroll_4/BW11.txt

add_files -tb ./data_unroll_4/A.txt
add_files -tb ./data_unroll_4/B.txt
add_files -tb ./data_unroll_4/AW.txt
add_files -tb ./data_unroll_4/BW.txt

add_files -tb ./data_unroll_4/A0_T.txt
add_files -tb ./data_unroll_4/A1_T.txt
add_files -tb ./data_unroll_4/AW00_T.txt
add_files -tb ./data_unroll_4/AW10_T.txt
add_files -tb ./data_unroll_4/AW01_T.txt
add_files -tb ./data_unroll_4/AW11_T.txt
add_files -tb ./data_unroll_4/B0_T.txt
add_files -tb ./data_unroll_4/B1_T.txt


open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit