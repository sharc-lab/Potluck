# Auto-generated TCL file for HLS
open_project -reset project_top_attention_module_p3_unroll_32_baseline

set_top top

add_files  p3_unroll_32.cpp
add_files -tb tb_p3_unroll_32.cpp

add_files -tb ./data_unroll_32/A0.txt
add_files -tb ./data_unroll_32/A1.txt
add_files -tb ./data_unroll_32/B0.txt
add_files -tb ./data_unroll_32/B1.txt
add_files -tb ./data_unroll_32/AW00.txt
add_files -tb ./data_unroll_32/AW10.txt
add_files -tb ./data_unroll_32/AW01.txt
add_files -tb ./data_unroll_32/AW11.txt
add_files -tb ./data_unroll_32/BW00.txt
add_files -tb ./data_unroll_32/BW10.txt
add_files -tb ./data_unroll_32/BW01.txt
add_files -tb ./data_unroll_32/BW11.txt

add_files -tb ./data_unroll_32/A.txt
add_files -tb ./data_unroll_32/B.txt
add_files -tb ./data_unroll_32/AW.txt
add_files -tb ./data_unroll_32/BW.txt

add_files -tb ./data_unroll_32/A0_T.txt
add_files -tb ./data_unroll_32/A1_T.txt
add_files -tb ./data_unroll_32/AW00_T.txt
add_files -tb ./data_unroll_32/AW10_T.txt
add_files -tb ./data_unroll_32/AW01_T.txt
add_files -tb ./data_unroll_32/AW11_T.txt
add_files -tb ./data_unroll_32/B0_T.txt
add_files -tb ./data_unroll_32/B1_T.txt


open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit