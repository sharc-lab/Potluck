# Auto-generated TCL file for HLS
open_project -reset project_moe_layer_p2_unroll_32_baseline

set_top top

add_files  p2_unroll_32.cpp
add_files -tb tb_2_unroll_32.cpp

add_files -tb ./data_unroll_32/DRAM_input.txt
add_files -tb ./data_unroll_32/DRAM_q_weight.txt
add_files -tb ./data_unroll_32/DRAM_k_weight.txt
add_files -tb ./data_unroll_32/DRAM_v_weight.txt
add_files -tb ./data_unroll_32/DRAM_W_g.txt
add_files -tb ./data_unroll_32/DRAM_b_g.txt
add_files -tb ./data_unroll_32/DRAM_ffn_weight_1.txt
add_files -tb ./data_unroll_32/DRAM_ffn_bias_1.txt
add_files -tb ./data_unroll_32/DRAM_ffn_weight_2.txt
add_files -tb ./data_unroll_32/DRAM_ffn_bias_2.txt
add_files -tb ./data_unroll_32/DRAM_ffn_weight_3.txt
add_files -tb ./data_unroll_32/DRAM_ffn_bias_3.txt

open_solution "solution1"

set_part xczu9eg-ffvb1156-2-e

create_clock -period 10 -name default

csim_design

csynth_design

#cosim_design -trace_level all

#export_design -format ip_catalog

exit