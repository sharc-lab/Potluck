set moduleName elu_activation
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
set C_modelName {elu_activation}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict BRAM_buffer_2_0 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_1 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1_0 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_1 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_2 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_2 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_3 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_3 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_4 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_4 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_5 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_5 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_6 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_6 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_7 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_7 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_8 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_8 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_9 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_9 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_10 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_10 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_11 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_11 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_12 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_12 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_13 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_13 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_14 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_14 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict BRAM_buffer_1_15 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_15 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ BRAM_buffer_2_0 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_1 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1_0 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_1 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_2 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_2 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_3 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_3 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_4 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_4 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_5 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_5 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_6 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_6 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_7 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_7 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_8 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_8 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_9 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_9 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_10 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_10 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_11 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_11 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_12 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_12 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_13 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_13 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_14 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_14 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_buffer_1_15 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_15 int 32 regular {array 100 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "BRAM_buffer_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 118
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ BRAM_buffer_2_0_address0 sc_out sc_lv 7 signal 0 } 
	{ BRAM_buffer_2_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ BRAM_buffer_2_0_we0 sc_out sc_logic 1 signal 0 } 
	{ BRAM_buffer_2_0_d0 sc_out sc_lv 32 signal 0 } 
	{ BRAM_buffer_1_1_address0 sc_out sc_lv 7 signal 1 } 
	{ BRAM_buffer_1_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ BRAM_buffer_1_1_q0 sc_in sc_lv 32 signal 1 } 
	{ BRAM_buffer_1_0_address0 sc_out sc_lv 7 signal 2 } 
	{ BRAM_buffer_1_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ BRAM_buffer_1_0_q0 sc_in sc_lv 32 signal 2 } 
	{ BRAM_buffer_2_1_address0 sc_out sc_lv 7 signal 3 } 
	{ BRAM_buffer_2_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_buffer_2_1_we0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_buffer_2_1_d0 sc_out sc_lv 32 signal 3 } 
	{ BRAM_buffer_1_2_address0 sc_out sc_lv 7 signal 4 } 
	{ BRAM_buffer_1_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ BRAM_buffer_1_2_q0 sc_in sc_lv 32 signal 4 } 
	{ BRAM_buffer_2_2_address0 sc_out sc_lv 7 signal 5 } 
	{ BRAM_buffer_2_2_ce0 sc_out sc_logic 1 signal 5 } 
	{ BRAM_buffer_2_2_we0 sc_out sc_logic 1 signal 5 } 
	{ BRAM_buffer_2_2_d0 sc_out sc_lv 32 signal 5 } 
	{ BRAM_buffer_1_3_address0 sc_out sc_lv 7 signal 6 } 
	{ BRAM_buffer_1_3_ce0 sc_out sc_logic 1 signal 6 } 
	{ BRAM_buffer_1_3_q0 sc_in sc_lv 32 signal 6 } 
	{ BRAM_buffer_2_3_address0 sc_out sc_lv 7 signal 7 } 
	{ BRAM_buffer_2_3_ce0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_2_3_we0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_2_3_d0 sc_out sc_lv 32 signal 7 } 
	{ BRAM_buffer_1_4_address0 sc_out sc_lv 7 signal 8 } 
	{ BRAM_buffer_1_4_ce0 sc_out sc_logic 1 signal 8 } 
	{ BRAM_buffer_1_4_q0 sc_in sc_lv 32 signal 8 } 
	{ BRAM_buffer_2_4_address0 sc_out sc_lv 7 signal 9 } 
	{ BRAM_buffer_2_4_ce0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_2_4_we0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_2_4_d0 sc_out sc_lv 32 signal 9 } 
	{ BRAM_buffer_1_5_address0 sc_out sc_lv 7 signal 10 } 
	{ BRAM_buffer_1_5_ce0 sc_out sc_logic 1 signal 10 } 
	{ BRAM_buffer_1_5_q0 sc_in sc_lv 32 signal 10 } 
	{ BRAM_buffer_2_5_address0 sc_out sc_lv 7 signal 11 } 
	{ BRAM_buffer_2_5_ce0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_2_5_we0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_2_5_d0 sc_out sc_lv 32 signal 11 } 
	{ BRAM_buffer_1_6_address0 sc_out sc_lv 7 signal 12 } 
	{ BRAM_buffer_1_6_ce0 sc_out sc_logic 1 signal 12 } 
	{ BRAM_buffer_1_6_q0 sc_in sc_lv 32 signal 12 } 
	{ BRAM_buffer_2_6_address0 sc_out sc_lv 7 signal 13 } 
	{ BRAM_buffer_2_6_ce0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_2_6_we0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_2_6_d0 sc_out sc_lv 32 signal 13 } 
	{ BRAM_buffer_1_7_address0 sc_out sc_lv 7 signal 14 } 
	{ BRAM_buffer_1_7_ce0 sc_out sc_logic 1 signal 14 } 
	{ BRAM_buffer_1_7_q0 sc_in sc_lv 32 signal 14 } 
	{ BRAM_buffer_2_7_address0 sc_out sc_lv 7 signal 15 } 
	{ BRAM_buffer_2_7_ce0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_2_7_we0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_2_7_d0 sc_out sc_lv 32 signal 15 } 
	{ BRAM_buffer_1_8_address0 sc_out sc_lv 7 signal 16 } 
	{ BRAM_buffer_1_8_ce0 sc_out sc_logic 1 signal 16 } 
	{ BRAM_buffer_1_8_q0 sc_in sc_lv 32 signal 16 } 
	{ BRAM_buffer_2_8_address0 sc_out sc_lv 7 signal 17 } 
	{ BRAM_buffer_2_8_ce0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_2_8_we0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_2_8_d0 sc_out sc_lv 32 signal 17 } 
	{ BRAM_buffer_1_9_address0 sc_out sc_lv 7 signal 18 } 
	{ BRAM_buffer_1_9_ce0 sc_out sc_logic 1 signal 18 } 
	{ BRAM_buffer_1_9_q0 sc_in sc_lv 32 signal 18 } 
	{ BRAM_buffer_2_9_address0 sc_out sc_lv 7 signal 19 } 
	{ BRAM_buffer_2_9_ce0 sc_out sc_logic 1 signal 19 } 
	{ BRAM_buffer_2_9_we0 sc_out sc_logic 1 signal 19 } 
	{ BRAM_buffer_2_9_d0 sc_out sc_lv 32 signal 19 } 
	{ BRAM_buffer_1_10_address0 sc_out sc_lv 7 signal 20 } 
	{ BRAM_buffer_1_10_ce0 sc_out sc_logic 1 signal 20 } 
	{ BRAM_buffer_1_10_q0 sc_in sc_lv 32 signal 20 } 
	{ BRAM_buffer_2_10_address0 sc_out sc_lv 7 signal 21 } 
	{ BRAM_buffer_2_10_ce0 sc_out sc_logic 1 signal 21 } 
	{ BRAM_buffer_2_10_we0 sc_out sc_logic 1 signal 21 } 
	{ BRAM_buffer_2_10_d0 sc_out sc_lv 32 signal 21 } 
	{ BRAM_buffer_1_11_address0 sc_out sc_lv 7 signal 22 } 
	{ BRAM_buffer_1_11_ce0 sc_out sc_logic 1 signal 22 } 
	{ BRAM_buffer_1_11_q0 sc_in sc_lv 32 signal 22 } 
	{ BRAM_buffer_2_11_address0 sc_out sc_lv 7 signal 23 } 
	{ BRAM_buffer_2_11_ce0 sc_out sc_logic 1 signal 23 } 
	{ BRAM_buffer_2_11_we0 sc_out sc_logic 1 signal 23 } 
	{ BRAM_buffer_2_11_d0 sc_out sc_lv 32 signal 23 } 
	{ BRAM_buffer_1_12_address0 sc_out sc_lv 7 signal 24 } 
	{ BRAM_buffer_1_12_ce0 sc_out sc_logic 1 signal 24 } 
	{ BRAM_buffer_1_12_q0 sc_in sc_lv 32 signal 24 } 
	{ BRAM_buffer_2_12_address0 sc_out sc_lv 7 signal 25 } 
	{ BRAM_buffer_2_12_ce0 sc_out sc_logic 1 signal 25 } 
	{ BRAM_buffer_2_12_we0 sc_out sc_logic 1 signal 25 } 
	{ BRAM_buffer_2_12_d0 sc_out sc_lv 32 signal 25 } 
	{ BRAM_buffer_1_13_address0 sc_out sc_lv 7 signal 26 } 
	{ BRAM_buffer_1_13_ce0 sc_out sc_logic 1 signal 26 } 
	{ BRAM_buffer_1_13_q0 sc_in sc_lv 32 signal 26 } 
	{ BRAM_buffer_2_13_address0 sc_out sc_lv 7 signal 27 } 
	{ BRAM_buffer_2_13_ce0 sc_out sc_logic 1 signal 27 } 
	{ BRAM_buffer_2_13_we0 sc_out sc_logic 1 signal 27 } 
	{ BRAM_buffer_2_13_d0 sc_out sc_lv 32 signal 27 } 
	{ BRAM_buffer_1_14_address0 sc_out sc_lv 7 signal 28 } 
	{ BRAM_buffer_1_14_ce0 sc_out sc_logic 1 signal 28 } 
	{ BRAM_buffer_1_14_q0 sc_in sc_lv 32 signal 28 } 
	{ BRAM_buffer_2_14_address0 sc_out sc_lv 7 signal 29 } 
	{ BRAM_buffer_2_14_ce0 sc_out sc_logic 1 signal 29 } 
	{ BRAM_buffer_2_14_we0 sc_out sc_logic 1 signal 29 } 
	{ BRAM_buffer_2_14_d0 sc_out sc_lv 32 signal 29 } 
	{ BRAM_buffer_1_15_address0 sc_out sc_lv 7 signal 30 } 
	{ BRAM_buffer_1_15_ce0 sc_out sc_logic 1 signal 30 } 
	{ BRAM_buffer_1_15_q0 sc_in sc_lv 32 signal 30 } 
	{ BRAM_buffer_2_15_address0 sc_out sc_lv 7 signal 31 } 
	{ BRAM_buffer_2_15_ce0 sc_out sc_logic 1 signal 31 } 
	{ BRAM_buffer_2_15_we0 sc_out sc_logic 1 signal 31 } 
	{ BRAM_buffer_2_15_d0 sc_out sc_lv 32 signal 31 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "BRAM_buffer_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_0", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_2", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_3", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_4", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_5", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_6", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_7", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_8", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_9", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_10", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_11", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_12", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_13", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_14", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1_15", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_2_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "12", "23", "34", "45", "56", "67", "78", "89", "100", "111", "122", "133", "144", "155", "166", "177"],
		"CDFG" : "elu_activation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "109", "EstimateLatencyMax" : "109",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "34", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "100", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "155", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "166", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "111", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "45", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "67", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "23", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "12", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "133", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "78", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "89", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "122", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "144", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "BRAM_buffer_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_252_1_VITIS_LOOP_253_2_VITIS_LOOP_254_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.f_x_msb_4_h_table_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.f_x_msb_4_l_table_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.f_x_lsb_table_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.f_x_msb_3_table_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.f_x_msb_2_table_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.exp_x_msb_1_table_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.mul_44ns_42ns_86_1_1_U1790", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.mul_50ns_48ns_98_1_1_U1791", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.mul_50ns_50ns_100_1_1_U1792", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_732.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "1"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750", "Parent" : "0", "Child" : ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.f_x_msb_4_h_table_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.f_x_msb_4_l_table_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.f_x_lsb_table_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.f_x_msb_3_table_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.f_x_msb_2_table_U", "Parent" : "12"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.exp_x_msb_1_table_U", "Parent" : "12"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.mul_44ns_42ns_86_1_1_U1790", "Parent" : "12"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.mul_50ns_48ns_98_1_1_U1791", "Parent" : "12"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.mul_50ns_50ns_100_1_1_U1792", "Parent" : "12"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_750.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "12"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768", "Parent" : "0", "Child" : ["24", "25", "26", "27", "28", "29", "30", "31", "32", "33"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.f_x_msb_4_h_table_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.f_x_msb_4_l_table_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.f_x_lsb_table_U", "Parent" : "23"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.f_x_msb_3_table_U", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.f_x_msb_2_table_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.exp_x_msb_1_table_U", "Parent" : "23"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.mul_44ns_42ns_86_1_1_U1790", "Parent" : "23"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.mul_50ns_48ns_98_1_1_U1791", "Parent" : "23"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.mul_50ns_50ns_100_1_1_U1792", "Parent" : "23"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_768.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "23"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786", "Parent" : "0", "Child" : ["35", "36", "37", "38", "39", "40", "41", "42", "43", "44"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.f_x_msb_4_h_table_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.f_x_msb_4_l_table_U", "Parent" : "34"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.f_x_lsb_table_U", "Parent" : "34"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.f_x_msb_3_table_U", "Parent" : "34"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.f_x_msb_2_table_U", "Parent" : "34"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.exp_x_msb_1_table_U", "Parent" : "34"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.mul_44ns_42ns_86_1_1_U1790", "Parent" : "34"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.mul_50ns_48ns_98_1_1_U1791", "Parent" : "34"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.mul_50ns_50ns_100_1_1_U1792", "Parent" : "34"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_786.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "34"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804", "Parent" : "0", "Child" : ["46", "47", "48", "49", "50", "51", "52", "53", "54", "55"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.f_x_msb_4_h_table_U", "Parent" : "45"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.f_x_msb_4_l_table_U", "Parent" : "45"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.f_x_lsb_table_U", "Parent" : "45"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.f_x_msb_3_table_U", "Parent" : "45"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.f_x_msb_2_table_U", "Parent" : "45"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.exp_x_msb_1_table_U", "Parent" : "45"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.mul_44ns_42ns_86_1_1_U1790", "Parent" : "45"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.mul_50ns_48ns_98_1_1_U1791", "Parent" : "45"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.mul_50ns_50ns_100_1_1_U1792", "Parent" : "45"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_804.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "45"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822", "Parent" : "0", "Child" : ["57", "58", "59", "60", "61", "62", "63", "64", "65", "66"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.f_x_msb_4_h_table_U", "Parent" : "56"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.f_x_msb_4_l_table_U", "Parent" : "56"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.f_x_lsb_table_U", "Parent" : "56"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.f_x_msb_3_table_U", "Parent" : "56"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.f_x_msb_2_table_U", "Parent" : "56"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.exp_x_msb_1_table_U", "Parent" : "56"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.mul_44ns_42ns_86_1_1_U1790", "Parent" : "56"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.mul_50ns_48ns_98_1_1_U1791", "Parent" : "56"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.mul_50ns_50ns_100_1_1_U1792", "Parent" : "56"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_822.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "56"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840", "Parent" : "0", "Child" : ["68", "69", "70", "71", "72", "73", "74", "75", "76", "77"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.f_x_msb_4_h_table_U", "Parent" : "67"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.f_x_msb_4_l_table_U", "Parent" : "67"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.f_x_lsb_table_U", "Parent" : "67"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.f_x_msb_3_table_U", "Parent" : "67"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.f_x_msb_2_table_U", "Parent" : "67"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.exp_x_msb_1_table_U", "Parent" : "67"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.mul_44ns_42ns_86_1_1_U1790", "Parent" : "67"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.mul_50ns_48ns_98_1_1_U1791", "Parent" : "67"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.mul_50ns_50ns_100_1_1_U1792", "Parent" : "67"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_840.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "67"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858", "Parent" : "0", "Child" : ["79", "80", "81", "82", "83", "84", "85", "86", "87", "88"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.f_x_msb_4_h_table_U", "Parent" : "78"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.f_x_msb_4_l_table_U", "Parent" : "78"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.f_x_lsb_table_U", "Parent" : "78"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.f_x_msb_3_table_U", "Parent" : "78"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.f_x_msb_2_table_U", "Parent" : "78"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.exp_x_msb_1_table_U", "Parent" : "78"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.mul_44ns_42ns_86_1_1_U1790", "Parent" : "78"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.mul_50ns_48ns_98_1_1_U1791", "Parent" : "78"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.mul_50ns_50ns_100_1_1_U1792", "Parent" : "78"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_858.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "78"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876", "Parent" : "0", "Child" : ["90", "91", "92", "93", "94", "95", "96", "97", "98", "99"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.f_x_msb_4_h_table_U", "Parent" : "89"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.f_x_msb_4_l_table_U", "Parent" : "89"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.f_x_lsb_table_U", "Parent" : "89"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.f_x_msb_3_table_U", "Parent" : "89"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.f_x_msb_2_table_U", "Parent" : "89"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.exp_x_msb_1_table_U", "Parent" : "89"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.mul_44ns_42ns_86_1_1_U1790", "Parent" : "89"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.mul_50ns_48ns_98_1_1_U1791", "Parent" : "89"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.mul_50ns_50ns_100_1_1_U1792", "Parent" : "89"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_876.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "89"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894", "Parent" : "0", "Child" : ["101", "102", "103", "104", "105", "106", "107", "108", "109", "110"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.f_x_msb_4_h_table_U", "Parent" : "100"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.f_x_msb_4_l_table_U", "Parent" : "100"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.f_x_lsb_table_U", "Parent" : "100"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.f_x_msb_3_table_U", "Parent" : "100"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.f_x_msb_2_table_U", "Parent" : "100"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.exp_x_msb_1_table_U", "Parent" : "100"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.mul_44ns_42ns_86_1_1_U1790", "Parent" : "100"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.mul_50ns_48ns_98_1_1_U1791", "Parent" : "100"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.mul_50ns_50ns_100_1_1_U1792", "Parent" : "100"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_894.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "100"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912", "Parent" : "0", "Child" : ["112", "113", "114", "115", "116", "117", "118", "119", "120", "121"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.f_x_msb_4_h_table_U", "Parent" : "111"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.f_x_msb_4_l_table_U", "Parent" : "111"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.f_x_lsb_table_U", "Parent" : "111"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.f_x_msb_3_table_U", "Parent" : "111"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.f_x_msb_2_table_U", "Parent" : "111"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.exp_x_msb_1_table_U", "Parent" : "111"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.mul_44ns_42ns_86_1_1_U1790", "Parent" : "111"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.mul_50ns_48ns_98_1_1_U1791", "Parent" : "111"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.mul_50ns_50ns_100_1_1_U1792", "Parent" : "111"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_912.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "111"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930", "Parent" : "0", "Child" : ["123", "124", "125", "126", "127", "128", "129", "130", "131", "132"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.f_x_msb_4_h_table_U", "Parent" : "122"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.f_x_msb_4_l_table_U", "Parent" : "122"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.f_x_lsb_table_U", "Parent" : "122"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.f_x_msb_3_table_U", "Parent" : "122"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.f_x_msb_2_table_U", "Parent" : "122"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.exp_x_msb_1_table_U", "Parent" : "122"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.mul_44ns_42ns_86_1_1_U1790", "Parent" : "122"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.mul_50ns_48ns_98_1_1_U1791", "Parent" : "122"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.mul_50ns_50ns_100_1_1_U1792", "Parent" : "122"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_930.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "122"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948", "Parent" : "0", "Child" : ["134", "135", "136", "137", "138", "139", "140", "141", "142", "143"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.f_x_msb_4_h_table_U", "Parent" : "133"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.f_x_msb_4_l_table_U", "Parent" : "133"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.f_x_lsb_table_U", "Parent" : "133"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.f_x_msb_3_table_U", "Parent" : "133"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.f_x_msb_2_table_U", "Parent" : "133"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.exp_x_msb_1_table_U", "Parent" : "133"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.mul_44ns_42ns_86_1_1_U1790", "Parent" : "133"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.mul_50ns_48ns_98_1_1_U1791", "Parent" : "133"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.mul_50ns_50ns_100_1_1_U1792", "Parent" : "133"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_948.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "133"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966", "Parent" : "0", "Child" : ["145", "146", "147", "148", "149", "150", "151", "152", "153", "154"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.f_x_msb_4_h_table_U", "Parent" : "144"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.f_x_msb_4_l_table_U", "Parent" : "144"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.f_x_lsb_table_U", "Parent" : "144"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.f_x_msb_3_table_U", "Parent" : "144"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.f_x_msb_2_table_U", "Parent" : "144"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.exp_x_msb_1_table_U", "Parent" : "144"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.mul_44ns_42ns_86_1_1_U1790", "Parent" : "144"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.mul_50ns_48ns_98_1_1_U1791", "Parent" : "144"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.mul_50ns_50ns_100_1_1_U1792", "Parent" : "144"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_966.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "144"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984", "Parent" : "0", "Child" : ["156", "157", "158", "159", "160", "161", "162", "163", "164", "165"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.f_x_msb_4_h_table_U", "Parent" : "155"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.f_x_msb_4_l_table_U", "Parent" : "155"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.f_x_lsb_table_U", "Parent" : "155"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.f_x_msb_3_table_U", "Parent" : "155"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.f_x_msb_2_table_U", "Parent" : "155"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.exp_x_msb_1_table_U", "Parent" : "155"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.mul_44ns_42ns_86_1_1_U1790", "Parent" : "155"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.mul_50ns_48ns_98_1_1_U1791", "Parent" : "155"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.mul_50ns_50ns_100_1_1_U1792", "Parent" : "155"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_984.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "155"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002", "Parent" : "0", "Child" : ["167", "168", "169", "170", "171", "172", "173", "174", "175", "176"],
		"CDFG" : "exp_32_10_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "5", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.f_x_msb_4_h_table_U", "Parent" : "166"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.f_x_msb_4_l_table_U", "Parent" : "166"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.f_x_lsb_table_U", "Parent" : "166"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.f_x_msb_3_table_U", "Parent" : "166"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.f_x_msb_2_table_U", "Parent" : "166"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.exp_x_msb_1_table_U", "Parent" : "166"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.mul_44ns_42ns_86_1_1_U1790", "Parent" : "166"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.mul_50ns_48ns_98_1_1_U1791", "Parent" : "166"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.mul_50ns_50ns_100_1_1_U1792", "Parent" : "166"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_exp_32_10_s_fu_1002.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "166"},
	{"ID" : "177", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	elu_activation {
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}
		BRAM_buffer_2_0 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_1 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_2 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_3 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_4 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_5 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_6 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_7 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_8 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_9 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_10 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_11 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_12 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_13 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_14 {Type O LastRead -1 FirstWrite 8}
		BRAM_buffer_1_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_15 {Type O LastRead -1 FirstWrite 8}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
	exp_32_10_s {
		x {Type I LastRead 0 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "109", "Max" : "109"}
	, {"Name" : "Interval", "Min" : "109", "Max" : "109"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	BRAM_buffer_2_0 { ap_memory {  { BRAM_buffer_2_0_address0 mem_address 1 7 }  { BRAM_buffer_2_0_ce0 mem_ce 1 1 }  { BRAM_buffer_2_0_we0 mem_we 1 1 }  { BRAM_buffer_2_0_d0 mem_din 1 32 } } }
	BRAM_buffer_1_1 { ap_memory {  { BRAM_buffer_1_1_address0 mem_address 1 7 }  { BRAM_buffer_1_1_ce0 mem_ce 1 1 }  { BRAM_buffer_1_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_1_0 { ap_memory {  { BRAM_buffer_1_0_address0 mem_address 1 7 }  { BRAM_buffer_1_0_ce0 mem_ce 1 1 }  { BRAM_buffer_1_0_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_1 { ap_memory {  { BRAM_buffer_2_1_address0 mem_address 1 7 }  { BRAM_buffer_2_1_ce0 mem_ce 1 1 }  { BRAM_buffer_2_1_we0 mem_we 1 1 }  { BRAM_buffer_2_1_d0 mem_din 1 32 } } }
	BRAM_buffer_1_2 { ap_memory {  { BRAM_buffer_1_2_address0 mem_address 1 7 }  { BRAM_buffer_1_2_ce0 mem_ce 1 1 }  { BRAM_buffer_1_2_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_2 { ap_memory {  { BRAM_buffer_2_2_address0 mem_address 1 7 }  { BRAM_buffer_2_2_ce0 mem_ce 1 1 }  { BRAM_buffer_2_2_we0 mem_we 1 1 }  { BRAM_buffer_2_2_d0 mem_din 1 32 } } }
	BRAM_buffer_1_3 { ap_memory {  { BRAM_buffer_1_3_address0 mem_address 1 7 }  { BRAM_buffer_1_3_ce0 mem_ce 1 1 }  { BRAM_buffer_1_3_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_3 { ap_memory {  { BRAM_buffer_2_3_address0 mem_address 1 7 }  { BRAM_buffer_2_3_ce0 mem_ce 1 1 }  { BRAM_buffer_2_3_we0 mem_we 1 1 }  { BRAM_buffer_2_3_d0 mem_din 1 32 } } }
	BRAM_buffer_1_4 { ap_memory {  { BRAM_buffer_1_4_address0 mem_address 1 7 }  { BRAM_buffer_1_4_ce0 mem_ce 1 1 }  { BRAM_buffer_1_4_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_4 { ap_memory {  { BRAM_buffer_2_4_address0 mem_address 1 7 }  { BRAM_buffer_2_4_ce0 mem_ce 1 1 }  { BRAM_buffer_2_4_we0 mem_we 1 1 }  { BRAM_buffer_2_4_d0 mem_din 1 32 } } }
	BRAM_buffer_1_5 { ap_memory {  { BRAM_buffer_1_5_address0 mem_address 1 7 }  { BRAM_buffer_1_5_ce0 mem_ce 1 1 }  { BRAM_buffer_1_5_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_5 { ap_memory {  { BRAM_buffer_2_5_address0 mem_address 1 7 }  { BRAM_buffer_2_5_ce0 mem_ce 1 1 }  { BRAM_buffer_2_5_we0 mem_we 1 1 }  { BRAM_buffer_2_5_d0 mem_din 1 32 } } }
	BRAM_buffer_1_6 { ap_memory {  { BRAM_buffer_1_6_address0 mem_address 1 7 }  { BRAM_buffer_1_6_ce0 mem_ce 1 1 }  { BRAM_buffer_1_6_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_6 { ap_memory {  { BRAM_buffer_2_6_address0 mem_address 1 7 }  { BRAM_buffer_2_6_ce0 mem_ce 1 1 }  { BRAM_buffer_2_6_we0 mem_we 1 1 }  { BRAM_buffer_2_6_d0 mem_din 1 32 } } }
	BRAM_buffer_1_7 { ap_memory {  { BRAM_buffer_1_7_address0 mem_address 1 7 }  { BRAM_buffer_1_7_ce0 mem_ce 1 1 }  { BRAM_buffer_1_7_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_7 { ap_memory {  { BRAM_buffer_2_7_address0 mem_address 1 7 }  { BRAM_buffer_2_7_ce0 mem_ce 1 1 }  { BRAM_buffer_2_7_we0 mem_we 1 1 }  { BRAM_buffer_2_7_d0 mem_din 1 32 } } }
	BRAM_buffer_1_8 { ap_memory {  { BRAM_buffer_1_8_address0 mem_address 1 7 }  { BRAM_buffer_1_8_ce0 mem_ce 1 1 }  { BRAM_buffer_1_8_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_8 { ap_memory {  { BRAM_buffer_2_8_address0 mem_address 1 7 }  { BRAM_buffer_2_8_ce0 mem_ce 1 1 }  { BRAM_buffer_2_8_we0 mem_we 1 1 }  { BRAM_buffer_2_8_d0 mem_din 1 32 } } }
	BRAM_buffer_1_9 { ap_memory {  { BRAM_buffer_1_9_address0 mem_address 1 7 }  { BRAM_buffer_1_9_ce0 mem_ce 1 1 }  { BRAM_buffer_1_9_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_9 { ap_memory {  { BRAM_buffer_2_9_address0 mem_address 1 7 }  { BRAM_buffer_2_9_ce0 mem_ce 1 1 }  { BRAM_buffer_2_9_we0 mem_we 1 1 }  { BRAM_buffer_2_9_d0 mem_din 1 32 } } }
	BRAM_buffer_1_10 { ap_memory {  { BRAM_buffer_1_10_address0 mem_address 1 7 }  { BRAM_buffer_1_10_ce0 mem_ce 1 1 }  { BRAM_buffer_1_10_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_10 { ap_memory {  { BRAM_buffer_2_10_address0 mem_address 1 7 }  { BRAM_buffer_2_10_ce0 mem_ce 1 1 }  { BRAM_buffer_2_10_we0 mem_we 1 1 }  { BRAM_buffer_2_10_d0 mem_din 1 32 } } }
	BRAM_buffer_1_11 { ap_memory {  { BRAM_buffer_1_11_address0 mem_address 1 7 }  { BRAM_buffer_1_11_ce0 mem_ce 1 1 }  { BRAM_buffer_1_11_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_11 { ap_memory {  { BRAM_buffer_2_11_address0 mem_address 1 7 }  { BRAM_buffer_2_11_ce0 mem_ce 1 1 }  { BRAM_buffer_2_11_we0 mem_we 1 1 }  { BRAM_buffer_2_11_d0 mem_din 1 32 } } }
	BRAM_buffer_1_12 { ap_memory {  { BRAM_buffer_1_12_address0 mem_address 1 7 }  { BRAM_buffer_1_12_ce0 mem_ce 1 1 }  { BRAM_buffer_1_12_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_12 { ap_memory {  { BRAM_buffer_2_12_address0 mem_address 1 7 }  { BRAM_buffer_2_12_ce0 mem_ce 1 1 }  { BRAM_buffer_2_12_we0 mem_we 1 1 }  { BRAM_buffer_2_12_d0 mem_din 1 32 } } }
	BRAM_buffer_1_13 { ap_memory {  { BRAM_buffer_1_13_address0 mem_address 1 7 }  { BRAM_buffer_1_13_ce0 mem_ce 1 1 }  { BRAM_buffer_1_13_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_13 { ap_memory {  { BRAM_buffer_2_13_address0 mem_address 1 7 }  { BRAM_buffer_2_13_ce0 mem_ce 1 1 }  { BRAM_buffer_2_13_we0 mem_we 1 1 }  { BRAM_buffer_2_13_d0 mem_din 1 32 } } }
	BRAM_buffer_1_14 { ap_memory {  { BRAM_buffer_1_14_address0 mem_address 1 7 }  { BRAM_buffer_1_14_ce0 mem_ce 1 1 }  { BRAM_buffer_1_14_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_14 { ap_memory {  { BRAM_buffer_2_14_address0 mem_address 1 7 }  { BRAM_buffer_2_14_ce0 mem_ce 1 1 }  { BRAM_buffer_2_14_we0 mem_we 1 1 }  { BRAM_buffer_2_14_d0 mem_din 1 32 } } }
	BRAM_buffer_1_15 { ap_memory {  { BRAM_buffer_1_15_address0 mem_address 1 7 }  { BRAM_buffer_1_15_ce0 mem_ce 1 1 }  { BRAM_buffer_1_15_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_15 { ap_memory {  { BRAM_buffer_2_15_address0 mem_address 1 7 }  { BRAM_buffer_2_15_ce0 mem_ce 1 1 }  { BRAM_buffer_2_15_we0 mem_we 1 1 }  { BRAM_buffer_2_15_d0 mem_din 1 32 } } }
}
