# Auto-generated TCL file for HLS
open_project -reset project_streaming_bench_2_p2_unroll_16_baseline

set_top top

add_files  p2_unroll_16.cpp
add_files -tb tb_p2.cpp

add_files -tb ./data/DRAM_input_1_16.txt
add_files -tb ./data/DRAM_weight_one_1_16.txt
add_files -tb ./data/DRAM_weight_two_1_16.txt
add_files -tb ./data/DRAM_weight_three_1_16.txt
add_files -tb ./data/DRAM_weight_four_1_16.txt
add_files -tb ./data/DRAM_weight_five_1_16.txt
add_files -tb ./data/DRAM_weight_six_1_16.txt
add_files -tb ./data/DRAM_weight_seven_1_16.txt
add_files -tb ./data/DRAM_weight_ten_1_16.txt


open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

cosim_design -trace_level all

#export_design -format ip_catalog

exit