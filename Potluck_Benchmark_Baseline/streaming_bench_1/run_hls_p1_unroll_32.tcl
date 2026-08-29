# Auto-generated TCL file for HLS
open_project -reset project_streaming_bench_1_p1_unroll_32_baseline

set_top top

add_files  p1_unroll_32.cpp
add_files -tb tb.cpp

add_files -tb ./data/DRAM_input_1.txt
add_files -tb ./data/DRAM_weight_one_1.txt
add_files -tb ./data/DRAM_weight_two_1.txt

open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

cosim_design -trace_level all

#export_design -format ip_catalog

exit