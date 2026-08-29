set moduleName conv2d_Pipeline_VITIS_LOOP_121_91
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {conv2d_Pipeline_VITIS_LOOP_121_91}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict BRAM_conv_weight_0_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_0 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_1_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_1 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_2_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_2 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_3_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_3 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_4_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_4 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_5_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_5 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_6_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_6 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_7_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_7 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_8_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_8 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_9_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_9 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_10_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_10 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_11_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_11 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_12_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_12 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_13_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_13 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_14_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_14 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_conv_weight_15_1 { MEM_WIDTH 32 MEM_SIZE 576 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_15 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ zext_ln112 int 3 regular  }
	{ zext_ln113 int 3 regular  }
	{ lshr_ln1 int 2 regular  }
	{ zext_ln114 int 2 regular  }
	{ zext_ln115 int 2 regular  }
	{ sext_ln121_1 int 32 regular  }
	{ BRAM_conv_weight_0_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_0 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_1_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_1 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_2_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_2 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_3_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_3 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_4_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_4 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_5_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_5 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_6_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_6 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_7_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_7 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_8_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_8 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_9_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_9 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_10_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_10 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_11_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_11 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_12_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_12 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_13_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_13 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_14_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_14 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_conv_weight_15_1 int 32 regular {array 144 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_15 int 32 regular {array 100 { 0 1 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln112", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln113", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "lshr_ln1", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln114", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln115", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln121_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "BRAM_conv_weight_0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_3_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_4_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_5_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_6_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_7_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_8_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_9_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_10_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_11_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_12_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_13_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_14_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight_15_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 172
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln112 sc_in sc_lv 3 signal 0 } 
	{ zext_ln113 sc_in sc_lv 3 signal 1 } 
	{ lshr_ln1 sc_in sc_lv 2 signal 2 } 
	{ zext_ln114 sc_in sc_lv 2 signal 3 } 
	{ zext_ln115 sc_in sc_lv 2 signal 4 } 
	{ sext_ln121_1 sc_in sc_lv 32 signal 5 } 
	{ BRAM_conv_weight_0_1_address0 sc_out sc_lv 8 signal 6 } 
	{ BRAM_conv_weight_0_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ BRAM_conv_weight_0_1_q0 sc_in sc_lv 32 signal 6 } 
	{ BRAM_buffer_1_0_address0 sc_out sc_lv 7 signal 7 } 
	{ BRAM_buffer_1_0_ce0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_1_0_we0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_1_0_d0 sc_out sc_lv 32 signal 7 } 
	{ BRAM_buffer_1_0_address1 sc_out sc_lv 7 signal 7 } 
	{ BRAM_buffer_1_0_ce1 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_1_0_q1 sc_in sc_lv 32 signal 7 } 
	{ BRAM_conv_weight_1_1_address0 sc_out sc_lv 8 signal 8 } 
	{ BRAM_conv_weight_1_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ BRAM_conv_weight_1_1_q0 sc_in sc_lv 32 signal 8 } 
	{ BRAM_buffer_1_1_address0 sc_out sc_lv 7 signal 9 } 
	{ BRAM_buffer_1_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_1_1_we0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_1_1_d0 sc_out sc_lv 32 signal 9 } 
	{ BRAM_buffer_1_1_address1 sc_out sc_lv 7 signal 9 } 
	{ BRAM_buffer_1_1_ce1 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_1_1_q1 sc_in sc_lv 32 signal 9 } 
	{ BRAM_conv_weight_2_1_address0 sc_out sc_lv 8 signal 10 } 
	{ BRAM_conv_weight_2_1_ce0 sc_out sc_logic 1 signal 10 } 
	{ BRAM_conv_weight_2_1_q0 sc_in sc_lv 32 signal 10 } 
	{ BRAM_buffer_1_2_address0 sc_out sc_lv 7 signal 11 } 
	{ BRAM_buffer_1_2_ce0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_1_2_we0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_1_2_d0 sc_out sc_lv 32 signal 11 } 
	{ BRAM_buffer_1_2_address1 sc_out sc_lv 7 signal 11 } 
	{ BRAM_buffer_1_2_ce1 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_1_2_q1 sc_in sc_lv 32 signal 11 } 
	{ BRAM_conv_weight_3_1_address0 sc_out sc_lv 8 signal 12 } 
	{ BRAM_conv_weight_3_1_ce0 sc_out sc_logic 1 signal 12 } 
	{ BRAM_conv_weight_3_1_q0 sc_in sc_lv 32 signal 12 } 
	{ BRAM_buffer_1_3_address0 sc_out sc_lv 7 signal 13 } 
	{ BRAM_buffer_1_3_ce0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_1_3_we0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_1_3_d0 sc_out sc_lv 32 signal 13 } 
	{ BRAM_buffer_1_3_address1 sc_out sc_lv 7 signal 13 } 
	{ BRAM_buffer_1_3_ce1 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_1_3_q1 sc_in sc_lv 32 signal 13 } 
	{ BRAM_conv_weight_4_1_address0 sc_out sc_lv 8 signal 14 } 
	{ BRAM_conv_weight_4_1_ce0 sc_out sc_logic 1 signal 14 } 
	{ BRAM_conv_weight_4_1_q0 sc_in sc_lv 32 signal 14 } 
	{ BRAM_buffer_1_4_address0 sc_out sc_lv 7 signal 15 } 
	{ BRAM_buffer_1_4_ce0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_1_4_we0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_1_4_d0 sc_out sc_lv 32 signal 15 } 
	{ BRAM_buffer_1_4_address1 sc_out sc_lv 7 signal 15 } 
	{ BRAM_buffer_1_4_ce1 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_1_4_q1 sc_in sc_lv 32 signal 15 } 
	{ BRAM_conv_weight_5_1_address0 sc_out sc_lv 8 signal 16 } 
	{ BRAM_conv_weight_5_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ BRAM_conv_weight_5_1_q0 sc_in sc_lv 32 signal 16 } 
	{ BRAM_buffer_1_5_address0 sc_out sc_lv 7 signal 17 } 
	{ BRAM_buffer_1_5_ce0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_1_5_we0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_1_5_d0 sc_out sc_lv 32 signal 17 } 
	{ BRAM_buffer_1_5_address1 sc_out sc_lv 7 signal 17 } 
	{ BRAM_buffer_1_5_ce1 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_1_5_q1 sc_in sc_lv 32 signal 17 } 
	{ BRAM_conv_weight_6_1_address0 sc_out sc_lv 8 signal 18 } 
	{ BRAM_conv_weight_6_1_ce0 sc_out sc_logic 1 signal 18 } 
	{ BRAM_conv_weight_6_1_q0 sc_in sc_lv 32 signal 18 } 
	{ BRAM_buffer_1_6_address0 sc_out sc_lv 7 signal 19 } 
	{ BRAM_buffer_1_6_ce0 sc_out sc_logic 1 signal 19 } 
	{ BRAM_buffer_1_6_we0 sc_out sc_logic 1 signal 19 } 
	{ BRAM_buffer_1_6_d0 sc_out sc_lv 32 signal 19 } 
	{ BRAM_buffer_1_6_address1 sc_out sc_lv 7 signal 19 } 
	{ BRAM_buffer_1_6_ce1 sc_out sc_logic 1 signal 19 } 
	{ BRAM_buffer_1_6_q1 sc_in sc_lv 32 signal 19 } 
	{ BRAM_conv_weight_7_1_address0 sc_out sc_lv 8 signal 20 } 
	{ BRAM_conv_weight_7_1_ce0 sc_out sc_logic 1 signal 20 } 
	{ BRAM_conv_weight_7_1_q0 sc_in sc_lv 32 signal 20 } 
	{ BRAM_buffer_1_7_address0 sc_out sc_lv 7 signal 21 } 
	{ BRAM_buffer_1_7_ce0 sc_out sc_logic 1 signal 21 } 
	{ BRAM_buffer_1_7_we0 sc_out sc_logic 1 signal 21 } 
	{ BRAM_buffer_1_7_d0 sc_out sc_lv 32 signal 21 } 
	{ BRAM_buffer_1_7_address1 sc_out sc_lv 7 signal 21 } 
	{ BRAM_buffer_1_7_ce1 sc_out sc_logic 1 signal 21 } 
	{ BRAM_buffer_1_7_q1 sc_in sc_lv 32 signal 21 } 
	{ BRAM_conv_weight_8_1_address0 sc_out sc_lv 8 signal 22 } 
	{ BRAM_conv_weight_8_1_ce0 sc_out sc_logic 1 signal 22 } 
	{ BRAM_conv_weight_8_1_q0 sc_in sc_lv 32 signal 22 } 
	{ BRAM_buffer_1_8_address0 sc_out sc_lv 7 signal 23 } 
	{ BRAM_buffer_1_8_ce0 sc_out sc_logic 1 signal 23 } 
	{ BRAM_buffer_1_8_we0 sc_out sc_logic 1 signal 23 } 
	{ BRAM_buffer_1_8_d0 sc_out sc_lv 32 signal 23 } 
	{ BRAM_buffer_1_8_address1 sc_out sc_lv 7 signal 23 } 
	{ BRAM_buffer_1_8_ce1 sc_out sc_logic 1 signal 23 } 
	{ BRAM_buffer_1_8_q1 sc_in sc_lv 32 signal 23 } 
	{ BRAM_conv_weight_9_1_address0 sc_out sc_lv 8 signal 24 } 
	{ BRAM_conv_weight_9_1_ce0 sc_out sc_logic 1 signal 24 } 
	{ BRAM_conv_weight_9_1_q0 sc_in sc_lv 32 signal 24 } 
	{ BRAM_buffer_1_9_address0 sc_out sc_lv 7 signal 25 } 
	{ BRAM_buffer_1_9_ce0 sc_out sc_logic 1 signal 25 } 
	{ BRAM_buffer_1_9_we0 sc_out sc_logic 1 signal 25 } 
	{ BRAM_buffer_1_9_d0 sc_out sc_lv 32 signal 25 } 
	{ BRAM_buffer_1_9_address1 sc_out sc_lv 7 signal 25 } 
	{ BRAM_buffer_1_9_ce1 sc_out sc_logic 1 signal 25 } 
	{ BRAM_buffer_1_9_q1 sc_in sc_lv 32 signal 25 } 
	{ BRAM_conv_weight_10_1_address0 sc_out sc_lv 8 signal 26 } 
	{ BRAM_conv_weight_10_1_ce0 sc_out sc_logic 1 signal 26 } 
	{ BRAM_conv_weight_10_1_q0 sc_in sc_lv 32 signal 26 } 
	{ BRAM_buffer_1_10_address0 sc_out sc_lv 7 signal 27 } 
	{ BRAM_buffer_1_10_ce0 sc_out sc_logic 1 signal 27 } 
	{ BRAM_buffer_1_10_we0 sc_out sc_logic 1 signal 27 } 
	{ BRAM_buffer_1_10_d0 sc_out sc_lv 32 signal 27 } 
	{ BRAM_buffer_1_10_address1 sc_out sc_lv 7 signal 27 } 
	{ BRAM_buffer_1_10_ce1 sc_out sc_logic 1 signal 27 } 
	{ BRAM_buffer_1_10_q1 sc_in sc_lv 32 signal 27 } 
	{ BRAM_conv_weight_11_1_address0 sc_out sc_lv 8 signal 28 } 
	{ BRAM_conv_weight_11_1_ce0 sc_out sc_logic 1 signal 28 } 
	{ BRAM_conv_weight_11_1_q0 sc_in sc_lv 32 signal 28 } 
	{ BRAM_buffer_1_11_address0 sc_out sc_lv 7 signal 29 } 
	{ BRAM_buffer_1_11_ce0 sc_out sc_logic 1 signal 29 } 
	{ BRAM_buffer_1_11_we0 sc_out sc_logic 1 signal 29 } 
	{ BRAM_buffer_1_11_d0 sc_out sc_lv 32 signal 29 } 
	{ BRAM_buffer_1_11_address1 sc_out sc_lv 7 signal 29 } 
	{ BRAM_buffer_1_11_ce1 sc_out sc_logic 1 signal 29 } 
	{ BRAM_buffer_1_11_q1 sc_in sc_lv 32 signal 29 } 
	{ BRAM_conv_weight_12_1_address0 sc_out sc_lv 8 signal 30 } 
	{ BRAM_conv_weight_12_1_ce0 sc_out sc_logic 1 signal 30 } 
	{ BRAM_conv_weight_12_1_q0 sc_in sc_lv 32 signal 30 } 
	{ BRAM_buffer_1_12_address0 sc_out sc_lv 7 signal 31 } 
	{ BRAM_buffer_1_12_ce0 sc_out sc_logic 1 signal 31 } 
	{ BRAM_buffer_1_12_we0 sc_out sc_logic 1 signal 31 } 
	{ BRAM_buffer_1_12_d0 sc_out sc_lv 32 signal 31 } 
	{ BRAM_buffer_1_12_address1 sc_out sc_lv 7 signal 31 } 
	{ BRAM_buffer_1_12_ce1 sc_out sc_logic 1 signal 31 } 
	{ BRAM_buffer_1_12_q1 sc_in sc_lv 32 signal 31 } 
	{ BRAM_conv_weight_13_1_address0 sc_out sc_lv 8 signal 32 } 
	{ BRAM_conv_weight_13_1_ce0 sc_out sc_logic 1 signal 32 } 
	{ BRAM_conv_weight_13_1_q0 sc_in sc_lv 32 signal 32 } 
	{ BRAM_buffer_1_13_address0 sc_out sc_lv 7 signal 33 } 
	{ BRAM_buffer_1_13_ce0 sc_out sc_logic 1 signal 33 } 
	{ BRAM_buffer_1_13_we0 sc_out sc_logic 1 signal 33 } 
	{ BRAM_buffer_1_13_d0 sc_out sc_lv 32 signal 33 } 
	{ BRAM_buffer_1_13_address1 sc_out sc_lv 7 signal 33 } 
	{ BRAM_buffer_1_13_ce1 sc_out sc_logic 1 signal 33 } 
	{ BRAM_buffer_1_13_q1 sc_in sc_lv 32 signal 33 } 
	{ BRAM_conv_weight_14_1_address0 sc_out sc_lv 8 signal 34 } 
	{ BRAM_conv_weight_14_1_ce0 sc_out sc_logic 1 signal 34 } 
	{ BRAM_conv_weight_14_1_q0 sc_in sc_lv 32 signal 34 } 
	{ BRAM_buffer_1_14_address0 sc_out sc_lv 7 signal 35 } 
	{ BRAM_buffer_1_14_ce0 sc_out sc_logic 1 signal 35 } 
	{ BRAM_buffer_1_14_we0 sc_out sc_logic 1 signal 35 } 
	{ BRAM_buffer_1_14_d0 sc_out sc_lv 32 signal 35 } 
	{ BRAM_buffer_1_14_address1 sc_out sc_lv 7 signal 35 } 
	{ BRAM_buffer_1_14_ce1 sc_out sc_logic 1 signal 35 } 
	{ BRAM_buffer_1_14_q1 sc_in sc_lv 32 signal 35 } 
	{ BRAM_conv_weight_15_1_address0 sc_out sc_lv 8 signal 36 } 
	{ BRAM_conv_weight_15_1_ce0 sc_out sc_logic 1 signal 36 } 
	{ BRAM_conv_weight_15_1_q0 sc_in sc_lv 32 signal 36 } 
	{ BRAM_buffer_1_15_address0 sc_out sc_lv 7 signal 37 } 
	{ BRAM_buffer_1_15_ce0 sc_out sc_logic 1 signal 37 } 
	{ BRAM_buffer_1_15_we0 sc_out sc_logic 1 signal 37 } 
	{ BRAM_buffer_1_15_d0 sc_out sc_lv 32 signal 37 } 
	{ BRAM_buffer_1_15_address1 sc_out sc_lv 7 signal 37 } 
	{ BRAM_buffer_1_15_ce1 sc_out sc_logic 1 signal 37 } 
	{ BRAM_buffer_1_15_q1 sc_in sc_lv 32 signal 37 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln112", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln112", "role": "default" }} , 
 	{ "name": "zext_ln113", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln113", "role": "default" }} , 
 	{ "name": "lshr_ln1", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "lshr_ln1", "role": "default" }} , 
 	{ "name": "zext_ln114", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "zext_ln114", "role": "default" }} , 
 	{ "name": "zext_ln115", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "zext_ln115", "role": "default" }} , 
 	{ "name": "sext_ln121_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln121_1", "role": "default" }} , 
 	{ "name": "BRAM_conv_weight_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_0_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_0_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_0_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_1_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_1_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_1_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_2_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_2_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_2_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_3_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_3_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_3_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_3_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_3_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_3_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_4_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_4_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_4_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_4_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_4_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_4_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_5_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_5_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_5_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_5_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_5_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_5_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_5_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_6_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_6_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_6_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_6_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_6_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_6_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_6_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_7_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_7_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_7_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_7_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_7_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_7_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_7_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_8_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_8_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_8_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_8_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_8_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_8_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_8_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_9_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_9_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_9_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_9_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_9_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_9_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_9_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_10_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_10_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_10_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_10_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_10_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_10_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_10_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_11_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_11_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_11_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_11_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_11_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_11_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_11_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_12_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_12_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_12_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_12_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_12_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_12_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_12_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_13_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_13_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_13_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_13_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_13_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_13_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_13_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_14_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_14_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_14_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_14_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_14_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_14_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_14_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "q1" }} , 
 	{ "name": "BRAM_conv_weight_15_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_conv_weight_15_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_15_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight_15_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_15_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight_15_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_15_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "q1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_91",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln112", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln113", "Type" : "None", "Direction" : "I"},
			{"Name" : "lshr_ln1", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln114", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln115", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln121_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U676", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U677", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U678", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U679", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U680", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U681", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U682", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U683", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U684", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U685", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U686", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U687", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U688", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U689", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U690", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_54_1_1_U691", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv2d_Pipeline_VITIS_LOOP_121_91 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln112 { ap_none {  { zext_ln112 in_data 0 3 } } }
	zext_ln113 { ap_none {  { zext_ln113 in_data 0 3 } } }
	lshr_ln1 { ap_none {  { lshr_ln1 in_data 0 2 } } }
	zext_ln114 { ap_none {  { zext_ln114 in_data 0 2 } } }
	zext_ln115 { ap_none {  { zext_ln115 in_data 0 2 } } }
	sext_ln121_1 { ap_none {  { sext_ln121_1 in_data 0 32 } } }
	BRAM_conv_weight_0_1 { ap_memory {  { BRAM_conv_weight_0_1_address0 mem_address 1 8 }  { BRAM_conv_weight_0_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_0_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_0 { ap_memory {  { BRAM_buffer_1_0_address0 mem_address 1 7 }  { BRAM_buffer_1_0_ce0 mem_ce 1 1 }  { BRAM_buffer_1_0_we0 mem_we 1 1 }  { BRAM_buffer_1_0_d0 mem_din 1 32 }  { BRAM_buffer_1_0_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_0_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_0_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_1_1 { ap_memory {  { BRAM_conv_weight_1_1_address0 mem_address 1 8 }  { BRAM_conv_weight_1_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_1_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_1 { ap_memory {  { BRAM_buffer_1_1_address0 mem_address 1 7 }  { BRAM_buffer_1_1_ce0 mem_ce 1 1 }  { BRAM_buffer_1_1_we0 mem_we 1 1 }  { BRAM_buffer_1_1_d0 mem_din 1 32 }  { BRAM_buffer_1_1_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_1_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_1_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_2_1 { ap_memory {  { BRAM_conv_weight_2_1_address0 mem_address 1 8 }  { BRAM_conv_weight_2_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_2_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_2 { ap_memory {  { BRAM_buffer_1_2_address0 mem_address 1 7 }  { BRAM_buffer_1_2_ce0 mem_ce 1 1 }  { BRAM_buffer_1_2_we0 mem_we 1 1 }  { BRAM_buffer_1_2_d0 mem_din 1 32 }  { BRAM_buffer_1_2_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_2_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_2_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_3_1 { ap_memory {  { BRAM_conv_weight_3_1_address0 mem_address 1 8 }  { BRAM_conv_weight_3_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_3_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_3 { ap_memory {  { BRAM_buffer_1_3_address0 mem_address 1 7 }  { BRAM_buffer_1_3_ce0 mem_ce 1 1 }  { BRAM_buffer_1_3_we0 mem_we 1 1 }  { BRAM_buffer_1_3_d0 mem_din 1 32 }  { BRAM_buffer_1_3_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_3_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_3_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_4_1 { ap_memory {  { BRAM_conv_weight_4_1_address0 mem_address 1 8 }  { BRAM_conv_weight_4_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_4_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_4 { ap_memory {  { BRAM_buffer_1_4_address0 mem_address 1 7 }  { BRAM_buffer_1_4_ce0 mem_ce 1 1 }  { BRAM_buffer_1_4_we0 mem_we 1 1 }  { BRAM_buffer_1_4_d0 mem_din 1 32 }  { BRAM_buffer_1_4_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_4_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_4_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_5_1 { ap_memory {  { BRAM_conv_weight_5_1_address0 mem_address 1 8 }  { BRAM_conv_weight_5_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_5_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_5 { ap_memory {  { BRAM_buffer_1_5_address0 mem_address 1 7 }  { BRAM_buffer_1_5_ce0 mem_ce 1 1 }  { BRAM_buffer_1_5_we0 mem_we 1 1 }  { BRAM_buffer_1_5_d0 mem_din 1 32 }  { BRAM_buffer_1_5_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_5_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_5_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_6_1 { ap_memory {  { BRAM_conv_weight_6_1_address0 mem_address 1 8 }  { BRAM_conv_weight_6_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_6_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_6 { ap_memory {  { BRAM_buffer_1_6_address0 mem_address 1 7 }  { BRAM_buffer_1_6_ce0 mem_ce 1 1 }  { BRAM_buffer_1_6_we0 mem_we 1 1 }  { BRAM_buffer_1_6_d0 mem_din 1 32 }  { BRAM_buffer_1_6_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_6_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_6_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_7_1 { ap_memory {  { BRAM_conv_weight_7_1_address0 mem_address 1 8 }  { BRAM_conv_weight_7_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_7_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_7 { ap_memory {  { BRAM_buffer_1_7_address0 mem_address 1 7 }  { BRAM_buffer_1_7_ce0 mem_ce 1 1 }  { BRAM_buffer_1_7_we0 mem_we 1 1 }  { BRAM_buffer_1_7_d0 mem_din 1 32 }  { BRAM_buffer_1_7_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_7_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_7_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_8_1 { ap_memory {  { BRAM_conv_weight_8_1_address0 mem_address 1 8 }  { BRAM_conv_weight_8_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_8_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_8 { ap_memory {  { BRAM_buffer_1_8_address0 mem_address 1 7 }  { BRAM_buffer_1_8_ce0 mem_ce 1 1 }  { BRAM_buffer_1_8_we0 mem_we 1 1 }  { BRAM_buffer_1_8_d0 mem_din 1 32 }  { BRAM_buffer_1_8_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_8_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_8_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_9_1 { ap_memory {  { BRAM_conv_weight_9_1_address0 mem_address 1 8 }  { BRAM_conv_weight_9_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_9_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_9 { ap_memory {  { BRAM_buffer_1_9_address0 mem_address 1 7 }  { BRAM_buffer_1_9_ce0 mem_ce 1 1 }  { BRAM_buffer_1_9_we0 mem_we 1 1 }  { BRAM_buffer_1_9_d0 mem_din 1 32 }  { BRAM_buffer_1_9_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_9_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_9_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_10_1 { ap_memory {  { BRAM_conv_weight_10_1_address0 mem_address 1 8 }  { BRAM_conv_weight_10_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_10_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_10 { ap_memory {  { BRAM_buffer_1_10_address0 mem_address 1 7 }  { BRAM_buffer_1_10_ce0 mem_ce 1 1 }  { BRAM_buffer_1_10_we0 mem_we 1 1 }  { BRAM_buffer_1_10_d0 mem_din 1 32 }  { BRAM_buffer_1_10_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_10_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_10_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_11_1 { ap_memory {  { BRAM_conv_weight_11_1_address0 mem_address 1 8 }  { BRAM_conv_weight_11_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_11_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_11 { ap_memory {  { BRAM_buffer_1_11_address0 mem_address 1 7 }  { BRAM_buffer_1_11_ce0 mem_ce 1 1 }  { BRAM_buffer_1_11_we0 mem_we 1 1 }  { BRAM_buffer_1_11_d0 mem_din 1 32 }  { BRAM_buffer_1_11_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_11_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_11_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_12_1 { ap_memory {  { BRAM_conv_weight_12_1_address0 mem_address 1 8 }  { BRAM_conv_weight_12_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_12_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_12 { ap_memory {  { BRAM_buffer_1_12_address0 mem_address 1 7 }  { BRAM_buffer_1_12_ce0 mem_ce 1 1 }  { BRAM_buffer_1_12_we0 mem_we 1 1 }  { BRAM_buffer_1_12_d0 mem_din 1 32 }  { BRAM_buffer_1_12_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_12_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_12_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_13_1 { ap_memory {  { BRAM_conv_weight_13_1_address0 mem_address 1 8 }  { BRAM_conv_weight_13_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_13_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_13 { ap_memory {  { BRAM_buffer_1_13_address0 mem_address 1 7 }  { BRAM_buffer_1_13_ce0 mem_ce 1 1 }  { BRAM_buffer_1_13_we0 mem_we 1 1 }  { BRAM_buffer_1_13_d0 mem_din 1 32 }  { BRAM_buffer_1_13_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_13_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_13_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_14_1 { ap_memory {  { BRAM_conv_weight_14_1_address0 mem_address 1 8 }  { BRAM_conv_weight_14_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_14_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_14 { ap_memory {  { BRAM_buffer_1_14_address0 mem_address 1 7 }  { BRAM_buffer_1_14_ce0 mem_ce 1 1 }  { BRAM_buffer_1_14_we0 mem_we 1 1 }  { BRAM_buffer_1_14_d0 mem_din 1 32 }  { BRAM_buffer_1_14_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_14_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_14_q1 MemPortDOUT2 0 32 } } }
	BRAM_conv_weight_15_1 { ap_memory {  { BRAM_conv_weight_15_1_address0 mem_address 1 8 }  { BRAM_conv_weight_15_1_ce0 mem_ce 1 1 }  { BRAM_conv_weight_15_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_15 { ap_memory {  { BRAM_buffer_1_15_address0 mem_address 1 7 }  { BRAM_buffer_1_15_ce0 mem_ce 1 1 }  { BRAM_buffer_1_15_we0 mem_we 1 1 }  { BRAM_buffer_1_15_d0 mem_din 1 32 }  { BRAM_buffer_1_15_address1 MemPortADDR2 1 7 }  { BRAM_buffer_1_15_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_15_q1 MemPortDOUT2 0 32 } } }
}
