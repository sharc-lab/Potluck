set moduleName load_bias
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {load_bias}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict BRAM_conv_bias_0 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_1 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_2 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_3 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_4 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_5 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_6 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_7 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_8 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_9 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_10 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_11 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_12 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_13 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_14 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_bias_15 { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ mem1 int 32 regular {axi_master 0}  }
	{ input_r int 64 regular  }
	{ BRAM_conv_bias_0 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_1 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_2 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_3 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_4 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_5 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_6 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_7 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_8 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_9 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_10 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_11 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_12 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_13 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_14 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
	{ BRAM_conv_bias_15 int 32 regular {array 4 { 0 3 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "DRAM_image_input","offset": { "type": "dynamic","port_name": "DRAM_image_input","bundle": "control"},"direction": "READONLY"},{"cName": "DRAM_conv_weight","offset": { "type": "dynamic","port_name": "DRAM_conv_weight","bundle": "control"},"direction": "READONLY"},{"cName": "DRAM_conv_bias","offset": { "type": "dynamic","port_name": "DRAM_conv_bias","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "BRAM_conv_bias_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_bias_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 117
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_mem1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem1_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_mem1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem1_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_mem1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem1_BUSER sc_in sc_lv 1 signal 0 } 
	{ input_r sc_in sc_lv 64 signal 1 } 
	{ BRAM_conv_bias_0_address0 sc_out sc_lv 2 signal 2 } 
	{ BRAM_conv_bias_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ BRAM_conv_bias_0_we0 sc_out sc_logic 1 signal 2 } 
	{ BRAM_conv_bias_0_d0 sc_out sc_lv 32 signal 2 } 
	{ BRAM_conv_bias_1_address0 sc_out sc_lv 2 signal 3 } 
	{ BRAM_conv_bias_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_conv_bias_1_we0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_conv_bias_1_d0 sc_out sc_lv 32 signal 3 } 
	{ BRAM_conv_bias_2_address0 sc_out sc_lv 2 signal 4 } 
	{ BRAM_conv_bias_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ BRAM_conv_bias_2_we0 sc_out sc_logic 1 signal 4 } 
	{ BRAM_conv_bias_2_d0 sc_out sc_lv 32 signal 4 } 
	{ BRAM_conv_bias_3_address0 sc_out sc_lv 2 signal 5 } 
	{ BRAM_conv_bias_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ BRAM_conv_bias_3_we0 sc_out sc_logic 1 signal 5 } 
	{ BRAM_conv_bias_3_d0 sc_out sc_lv 32 signal 5 } 
	{ BRAM_conv_bias_4_address0 sc_out sc_lv 2 signal 6 } 
	{ BRAM_conv_bias_4_ce0 sc_out sc_logic 1 signal 6 } 
	{ BRAM_conv_bias_4_we0 sc_out sc_logic 1 signal 6 } 
	{ BRAM_conv_bias_4_d0 sc_out sc_lv 32 signal 6 } 
	{ BRAM_conv_bias_5_address0 sc_out sc_lv 2 signal 7 } 
	{ BRAM_conv_bias_5_ce0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_conv_bias_5_we0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_conv_bias_5_d0 sc_out sc_lv 32 signal 7 } 
	{ BRAM_conv_bias_6_address0 sc_out sc_lv 2 signal 8 } 
	{ BRAM_conv_bias_6_ce0 sc_out sc_logic 1 signal 8 } 
	{ BRAM_conv_bias_6_we0 sc_out sc_logic 1 signal 8 } 
	{ BRAM_conv_bias_6_d0 sc_out sc_lv 32 signal 8 } 
	{ BRAM_conv_bias_7_address0 sc_out sc_lv 2 signal 9 } 
	{ BRAM_conv_bias_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_conv_bias_7_we0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_conv_bias_7_d0 sc_out sc_lv 32 signal 9 } 
	{ BRAM_conv_bias_8_address0 sc_out sc_lv 2 signal 10 } 
	{ BRAM_conv_bias_8_ce0 sc_out sc_logic 1 signal 10 } 
	{ BRAM_conv_bias_8_we0 sc_out sc_logic 1 signal 10 } 
	{ BRAM_conv_bias_8_d0 sc_out sc_lv 32 signal 10 } 
	{ BRAM_conv_bias_9_address0 sc_out sc_lv 2 signal 11 } 
	{ BRAM_conv_bias_9_ce0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_conv_bias_9_we0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_conv_bias_9_d0 sc_out sc_lv 32 signal 11 } 
	{ BRAM_conv_bias_10_address0 sc_out sc_lv 2 signal 12 } 
	{ BRAM_conv_bias_10_ce0 sc_out sc_logic 1 signal 12 } 
	{ BRAM_conv_bias_10_we0 sc_out sc_logic 1 signal 12 } 
	{ BRAM_conv_bias_10_d0 sc_out sc_lv 32 signal 12 } 
	{ BRAM_conv_bias_11_address0 sc_out sc_lv 2 signal 13 } 
	{ BRAM_conv_bias_11_ce0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_conv_bias_11_we0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_conv_bias_11_d0 sc_out sc_lv 32 signal 13 } 
	{ BRAM_conv_bias_12_address0 sc_out sc_lv 2 signal 14 } 
	{ BRAM_conv_bias_12_ce0 sc_out sc_logic 1 signal 14 } 
	{ BRAM_conv_bias_12_we0 sc_out sc_logic 1 signal 14 } 
	{ BRAM_conv_bias_12_d0 sc_out sc_lv 32 signal 14 } 
	{ BRAM_conv_bias_13_address0 sc_out sc_lv 2 signal 15 } 
	{ BRAM_conv_bias_13_ce0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_conv_bias_13_we0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_conv_bias_13_d0 sc_out sc_lv 32 signal 15 } 
	{ BRAM_conv_bias_14_address0 sc_out sc_lv 2 signal 16 } 
	{ BRAM_conv_bias_14_ce0 sc_out sc_logic 1 signal 16 } 
	{ BRAM_conv_bias_14_we0 sc_out sc_logic 1 signal 16 } 
	{ BRAM_conv_bias_14_d0 sc_out sc_lv 32 signal 16 } 
	{ BRAM_conv_bias_15_address0 sc_out sc_lv 2 signal 17 } 
	{ BRAM_conv_bias_15_ce0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_conv_bias_15_we0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_conv_bias_15_d0 sc_out sc_lv 32 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_mem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWID" }} , 
 	{ "name": "m_axi_mem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_mem1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_mem1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_mem1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_mem1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_mem1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_mem1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_mem1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_mem1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_mem1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "WVALID" }} , 
 	{ "name": "m_axi_mem1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "WREADY" }} , 
 	{ "name": "m_axi_mem1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem1", "role": "WDATA" }} , 
 	{ "name": "m_axi_mem1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_mem1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "WLAST" }} , 
 	{ "name": "m_axi_mem1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "WID" }} , 
 	{ "name": "m_axi_mem1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "WUSER" }} , 
 	{ "name": "m_axi_mem1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_mem1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_mem1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_mem1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "ARID" }} , 
 	{ "name": "m_axi_mem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_mem1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_mem1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_mem1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_mem1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_mem1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_mem1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_mem1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_mem1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_mem1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RVALID" }} , 
 	{ "name": "m_axi_mem1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RREADY" }} , 
 	{ "name": "m_axi_mem1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem1", "role": "RDATA" }} , 
 	{ "name": "m_axi_mem1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RLAST" }} , 
 	{ "name": "m_axi_mem1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RID" }} , 
 	{ "name": "m_axi_mem1_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem1", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_mem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_mem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_mem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_mem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_mem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_mem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BID" }} , 
 	{ "name": "m_axi_mem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BUSER" }} , 
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "BRAM_conv_bias_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_0", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_0", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_0", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_0", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_1", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_1", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_1", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_1", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_2", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_2", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_2", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_2", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_3", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_3", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_3", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_3", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_4", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_4", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_4", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_4", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_5", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_5", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_5", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_5", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_6", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_6", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_6", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_6", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_7", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_7", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_7", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_7", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_8", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_8", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_8", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_8", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_9", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_9", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_9", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_9", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_10", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_10", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_10", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_10", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_11", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_11", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_11", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_11", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_12", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_12", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_12", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_12", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_13", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_13", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_13", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_13", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_14", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_14", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_14", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_14", "role": "d0" }} , 
 	{ "name": "BRAM_conv_bias_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "BRAM_conv_bias_15", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_15", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias_15", "role": "we0" }} , 
 	{ "name": "BRAM_conv_bias_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias_15", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "load_bias",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "76", "EstimateLatencyMax" : "76",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mem1_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "mem1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "load_bias_Pipeline_VITIS_LOOP_61_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln61", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	load_bias {
		mem1 {Type I LastRead 1 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_15 {Type O LastRead -1 FirstWrite 2}}
	load_bias_Pipeline_VITIS_LOOP_61_1 {
		mem1 {Type I LastRead 1 FirstWrite -1}
		sext_ln61 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_bias_15 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "76", "Max" : "76"}
	, {"Name" : "Interval", "Min" : "76", "Max" : "76"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_mem1_AWVALID VALID 1 1 }  { m_axi_mem1_AWREADY READY 0 1 }  { m_axi_mem1_AWADDR ADDR 1 64 }  { m_axi_mem1_AWID ID 1 1 }  { m_axi_mem1_AWLEN SIZE 1 32 }  { m_axi_mem1_AWSIZE BURST 1 3 }  { m_axi_mem1_AWBURST LOCK 1 2 }  { m_axi_mem1_AWLOCK CACHE 1 2 }  { m_axi_mem1_AWCACHE PROT 1 4 }  { m_axi_mem1_AWPROT QOS 1 3 }  { m_axi_mem1_AWQOS REGION 1 4 }  { m_axi_mem1_AWREGION USER 1 4 }  { m_axi_mem1_AWUSER DATA 1 1 }  { m_axi_mem1_WVALID VALID 1 1 }  { m_axi_mem1_WREADY READY 0 1 }  { m_axi_mem1_WDATA FIFONUM 1 32 }  { m_axi_mem1_WSTRB STRB 1 4 }  { m_axi_mem1_WLAST LAST 1 1 }  { m_axi_mem1_WID ID 1 1 }  { m_axi_mem1_WUSER DATA 1 1 }  { m_axi_mem1_ARVALID VALID 1 1 }  { m_axi_mem1_ARREADY READY 0 1 }  { m_axi_mem1_ARADDR ADDR 1 64 }  { m_axi_mem1_ARID ID 1 1 }  { m_axi_mem1_ARLEN SIZE 1 32 }  { m_axi_mem1_ARSIZE BURST 1 3 }  { m_axi_mem1_ARBURST LOCK 1 2 }  { m_axi_mem1_ARLOCK CACHE 1 2 }  { m_axi_mem1_ARCACHE PROT 1 4 }  { m_axi_mem1_ARPROT QOS 1 3 }  { m_axi_mem1_ARQOS REGION 1 4 }  { m_axi_mem1_ARREGION USER 1 4 }  { m_axi_mem1_ARUSER DATA 1 1 }  { m_axi_mem1_RVALID VALID 0 1 }  { m_axi_mem1_RREADY READY 1 1 }  { m_axi_mem1_RDATA FIFONUM 0 32 }  { m_axi_mem1_RLAST LAST 0 1 }  { m_axi_mem1_RID ID 0 1 }  { m_axi_mem1_RFIFONUM LEN 0 9 }  { m_axi_mem1_RUSER DATA 0 1 }  { m_axi_mem1_RRESP RESP 0 2 }  { m_axi_mem1_BVALID VALID 0 1 }  { m_axi_mem1_BREADY READY 1 1 }  { m_axi_mem1_BRESP RESP 0 2 }  { m_axi_mem1_BID ID 0 1 }  { m_axi_mem1_BUSER DATA 0 1 } } }
	input_r { ap_none {  { input_r in_data 0 64 } } }
	BRAM_conv_bias_0 { ap_memory {  { BRAM_conv_bias_0_address0 mem_address 1 2 }  { BRAM_conv_bias_0_ce0 mem_ce 1 1 }  { BRAM_conv_bias_0_we0 mem_we 1 1 }  { BRAM_conv_bias_0_d0 mem_din 1 32 } } }
	BRAM_conv_bias_1 { ap_memory {  { BRAM_conv_bias_1_address0 mem_address 1 2 }  { BRAM_conv_bias_1_ce0 mem_ce 1 1 }  { BRAM_conv_bias_1_we0 mem_we 1 1 }  { BRAM_conv_bias_1_d0 mem_din 1 32 } } }
	BRAM_conv_bias_2 { ap_memory {  { BRAM_conv_bias_2_address0 mem_address 1 2 }  { BRAM_conv_bias_2_ce0 mem_ce 1 1 }  { BRAM_conv_bias_2_we0 mem_we 1 1 }  { BRAM_conv_bias_2_d0 mem_din 1 32 } } }
	BRAM_conv_bias_3 { ap_memory {  { BRAM_conv_bias_3_address0 mem_address 1 2 }  { BRAM_conv_bias_3_ce0 mem_ce 1 1 }  { BRAM_conv_bias_3_we0 mem_we 1 1 }  { BRAM_conv_bias_3_d0 mem_din 1 32 } } }
	BRAM_conv_bias_4 { ap_memory {  { BRAM_conv_bias_4_address0 mem_address 1 2 }  { BRAM_conv_bias_4_ce0 mem_ce 1 1 }  { BRAM_conv_bias_4_we0 mem_we 1 1 }  { BRAM_conv_bias_4_d0 mem_din 1 32 } } }
	BRAM_conv_bias_5 { ap_memory {  { BRAM_conv_bias_5_address0 mem_address 1 2 }  { BRAM_conv_bias_5_ce0 mem_ce 1 1 }  { BRAM_conv_bias_5_we0 mem_we 1 1 }  { BRAM_conv_bias_5_d0 mem_din 1 32 } } }
	BRAM_conv_bias_6 { ap_memory {  { BRAM_conv_bias_6_address0 mem_address 1 2 }  { BRAM_conv_bias_6_ce0 mem_ce 1 1 }  { BRAM_conv_bias_6_we0 mem_we 1 1 }  { BRAM_conv_bias_6_d0 mem_din 1 32 } } }
	BRAM_conv_bias_7 { ap_memory {  { BRAM_conv_bias_7_address0 mem_address 1 2 }  { BRAM_conv_bias_7_ce0 mem_ce 1 1 }  { BRAM_conv_bias_7_we0 mem_we 1 1 }  { BRAM_conv_bias_7_d0 mem_din 1 32 } } }
	BRAM_conv_bias_8 { ap_memory {  { BRAM_conv_bias_8_address0 mem_address 1 2 }  { BRAM_conv_bias_8_ce0 mem_ce 1 1 }  { BRAM_conv_bias_8_we0 mem_we 1 1 }  { BRAM_conv_bias_8_d0 mem_din 1 32 } } }
	BRAM_conv_bias_9 { ap_memory {  { BRAM_conv_bias_9_address0 mem_address 1 2 }  { BRAM_conv_bias_9_ce0 mem_ce 1 1 }  { BRAM_conv_bias_9_we0 mem_we 1 1 }  { BRAM_conv_bias_9_d0 mem_din 1 32 } } }
	BRAM_conv_bias_10 { ap_memory {  { BRAM_conv_bias_10_address0 mem_address 1 2 }  { BRAM_conv_bias_10_ce0 mem_ce 1 1 }  { BRAM_conv_bias_10_we0 mem_we 1 1 }  { BRAM_conv_bias_10_d0 mem_din 1 32 } } }
	BRAM_conv_bias_11 { ap_memory {  { BRAM_conv_bias_11_address0 mem_address 1 2 }  { BRAM_conv_bias_11_ce0 mem_ce 1 1 }  { BRAM_conv_bias_11_we0 mem_we 1 1 }  { BRAM_conv_bias_11_d0 mem_din 1 32 } } }
	BRAM_conv_bias_12 { ap_memory {  { BRAM_conv_bias_12_address0 mem_address 1 2 }  { BRAM_conv_bias_12_ce0 mem_ce 1 1 }  { BRAM_conv_bias_12_we0 mem_we 1 1 }  { BRAM_conv_bias_12_d0 mem_din 1 32 } } }
	BRAM_conv_bias_13 { ap_memory {  { BRAM_conv_bias_13_address0 mem_address 1 2 }  { BRAM_conv_bias_13_ce0 mem_ce 1 1 }  { BRAM_conv_bias_13_we0 mem_we 1 1 }  { BRAM_conv_bias_13_d0 mem_din 1 32 } } }
	BRAM_conv_bias_14 { ap_memory {  { BRAM_conv_bias_14_address0 mem_address 1 2 }  { BRAM_conv_bias_14_ce0 mem_ce 1 1 }  { BRAM_conv_bias_14_we0 mem_we 1 1 }  { BRAM_conv_bias_14_d0 mem_din 1 32 } } }
	BRAM_conv_bias_15 { ap_memory {  { BRAM_conv_bias_15_address0 mem_address 1 2 }  { BRAM_conv_bias_15_ce0 mem_ce 1 1 }  { BRAM_conv_bias_15_we0 mem_we 1 1 }  { BRAM_conv_bias_15_d0 mem_din 1 32 } } }
}
