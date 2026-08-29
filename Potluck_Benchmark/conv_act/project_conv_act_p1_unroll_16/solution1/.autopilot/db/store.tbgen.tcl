set moduleName store
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
set C_modelName {store}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict BRAM_buffer_2_0 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_1 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_2 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_3 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_4 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_5 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_6 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_7 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_8 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_9 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_10 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_11 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_12 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_13 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_14 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_2_15 { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ mem2 int 32 regular {axi_master 1}  }
	{ output_r int 64 regular  }
	{ BRAM_buffer_2_0 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_1 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_2 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_3 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_4 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_5 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_6 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_7 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_8 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_9 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_10 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_11 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_12 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_13 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_14 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_2_15 int 32 regular {array 100 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mem2", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "DRAM_image_output","offset": { "type": "dynamic","port_name": "DRAM_image_output","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "output_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "BRAM_buffer_2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_2_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 101
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_mem2_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem2_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem2_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem2_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem2_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem2_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem2_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem2_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem2_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_mem2_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem2_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem2_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_mem2_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_mem2_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_mem2_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem2_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_mem2_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem2_RFIFONUM sc_in sc_lv 9 signal 0 } 
	{ m_axi_mem2_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem2_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem2_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem2_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem2_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem2_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem2_BUSER sc_in sc_lv 1 signal 0 } 
	{ output_r sc_in sc_lv 64 signal 1 } 
	{ BRAM_buffer_2_0_address0 sc_out sc_lv 7 signal 2 } 
	{ BRAM_buffer_2_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ BRAM_buffer_2_0_q0 sc_in sc_lv 32 signal 2 } 
	{ BRAM_buffer_2_1_address0 sc_out sc_lv 7 signal 3 } 
	{ BRAM_buffer_2_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_buffer_2_1_q0 sc_in sc_lv 32 signal 3 } 
	{ BRAM_buffer_2_2_address0 sc_out sc_lv 7 signal 4 } 
	{ BRAM_buffer_2_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ BRAM_buffer_2_2_q0 sc_in sc_lv 32 signal 4 } 
	{ BRAM_buffer_2_3_address0 sc_out sc_lv 7 signal 5 } 
	{ BRAM_buffer_2_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ BRAM_buffer_2_3_q0 sc_in sc_lv 32 signal 5 } 
	{ BRAM_buffer_2_4_address0 sc_out sc_lv 7 signal 6 } 
	{ BRAM_buffer_2_4_ce0 sc_out sc_logic 1 signal 6 } 
	{ BRAM_buffer_2_4_q0 sc_in sc_lv 32 signal 6 } 
	{ BRAM_buffer_2_5_address0 sc_out sc_lv 7 signal 7 } 
	{ BRAM_buffer_2_5_ce0 sc_out sc_logic 1 signal 7 } 
	{ BRAM_buffer_2_5_q0 sc_in sc_lv 32 signal 7 } 
	{ BRAM_buffer_2_6_address0 sc_out sc_lv 7 signal 8 } 
	{ BRAM_buffer_2_6_ce0 sc_out sc_logic 1 signal 8 } 
	{ BRAM_buffer_2_6_q0 sc_in sc_lv 32 signal 8 } 
	{ BRAM_buffer_2_7_address0 sc_out sc_lv 7 signal 9 } 
	{ BRAM_buffer_2_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ BRAM_buffer_2_7_q0 sc_in sc_lv 32 signal 9 } 
	{ BRAM_buffer_2_8_address0 sc_out sc_lv 7 signal 10 } 
	{ BRAM_buffer_2_8_ce0 sc_out sc_logic 1 signal 10 } 
	{ BRAM_buffer_2_8_q0 sc_in sc_lv 32 signal 10 } 
	{ BRAM_buffer_2_9_address0 sc_out sc_lv 7 signal 11 } 
	{ BRAM_buffer_2_9_ce0 sc_out sc_logic 1 signal 11 } 
	{ BRAM_buffer_2_9_q0 sc_in sc_lv 32 signal 11 } 
	{ BRAM_buffer_2_10_address0 sc_out sc_lv 7 signal 12 } 
	{ BRAM_buffer_2_10_ce0 sc_out sc_logic 1 signal 12 } 
	{ BRAM_buffer_2_10_q0 sc_in sc_lv 32 signal 12 } 
	{ BRAM_buffer_2_11_address0 sc_out sc_lv 7 signal 13 } 
	{ BRAM_buffer_2_11_ce0 sc_out sc_logic 1 signal 13 } 
	{ BRAM_buffer_2_11_q0 sc_in sc_lv 32 signal 13 } 
	{ BRAM_buffer_2_12_address0 sc_out sc_lv 7 signal 14 } 
	{ BRAM_buffer_2_12_ce0 sc_out sc_logic 1 signal 14 } 
	{ BRAM_buffer_2_12_q0 sc_in sc_lv 32 signal 14 } 
	{ BRAM_buffer_2_13_address0 sc_out sc_lv 7 signal 15 } 
	{ BRAM_buffer_2_13_ce0 sc_out sc_logic 1 signal 15 } 
	{ BRAM_buffer_2_13_q0 sc_in sc_lv 32 signal 15 } 
	{ BRAM_buffer_2_14_address0 sc_out sc_lv 7 signal 16 } 
	{ BRAM_buffer_2_14_ce0 sc_out sc_logic 1 signal 16 } 
	{ BRAM_buffer_2_14_q0 sc_in sc_lv 32 signal 16 } 
	{ BRAM_buffer_2_15_address0 sc_out sc_lv 7 signal 17 } 
	{ BRAM_buffer_2_15_ce0 sc_out sc_logic 1 signal 17 } 
	{ BRAM_buffer_2_15_q0 sc_in sc_lv 32 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_mem2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mem2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mem2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mem2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWID" }} , 
 	{ "name": "m_axi_mem2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_mem2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_mem2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_mem2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_mem2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_mem2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_mem2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_mem2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_mem2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_mem2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "WVALID" }} , 
 	{ "name": "m_axi_mem2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "WREADY" }} , 
 	{ "name": "m_axi_mem2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2", "role": "WDATA" }} , 
 	{ "name": "m_axi_mem2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_mem2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "WLAST" }} , 
 	{ "name": "m_axi_mem2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "WID" }} , 
 	{ "name": "m_axi_mem2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "WUSER" }} , 
 	{ "name": "m_axi_mem2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_mem2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_mem2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_mem2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "ARID" }} , 
 	{ "name": "m_axi_mem2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_mem2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_mem2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_mem2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_mem2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_mem2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_mem2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_mem2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "mem2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_mem2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_mem2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RVALID" }} , 
 	{ "name": "m_axi_mem2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RREADY" }} , 
 	{ "name": "m_axi_mem2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2", "role": "RDATA" }} , 
 	{ "name": "m_axi_mem2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RLAST" }} , 
 	{ "name": "m_axi_mem2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RID" }} , 
 	{ "name": "m_axi_mem2_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mem2", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_mem2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RUSER" }} , 
 	{ "name": "m_axi_mem2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "RRESP" }} , 
 	{ "name": "m_axi_mem2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BVALID" }} , 
 	{ "name": "m_axi_mem2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BREADY" }} , 
 	{ "name": "m_axi_mem2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "BRESP" }} , 
 	{ "name": "m_axi_mem2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BID" }} , 
 	{ "name": "m_axi_mem2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BUSER" }} , 
 	{ "name": "output_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_r", "role": "default" }} , 
 	{ "name": "BRAM_buffer_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_0", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_1", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_2", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_3", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_4", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_5", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_6", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_7", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_8", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_9", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_10", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_11", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_12", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_13", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_14", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_2_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_2_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_2_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_2_15", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "store",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1610", "EstimateLatencyMax" : "1610",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "mem2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "mem2_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "mem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_4", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_5", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_6", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_7", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_8", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_9", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_10", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_12", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_13", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_14", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_15", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1603", "EstimateLatencyMax" : "1603",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "mem2_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln136", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_15", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82.sparsemux_33_4_32_1_1_U1837", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	store {
		mem2 {Type O LastRead 3 FirstWrite 2}
		output_r {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_15 {Type I LastRead 0 FirstWrite -1}}
	store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3 {
		mem2 {Type O LastRead -1 FirstWrite 2}
		sext_ln136 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_2_15 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1610", "Max" : "1610"}
	, {"Name" : "Interval", "Min" : "1610", "Max" : "1610"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_mem2_AWVALID VALID 1 1 }  { m_axi_mem2_AWREADY READY 0 1 }  { m_axi_mem2_AWADDR ADDR 1 64 }  { m_axi_mem2_AWID ID 1 1 }  { m_axi_mem2_AWLEN SIZE 1 32 }  { m_axi_mem2_AWSIZE BURST 1 3 }  { m_axi_mem2_AWBURST LOCK 1 2 }  { m_axi_mem2_AWLOCK CACHE 1 2 }  { m_axi_mem2_AWCACHE PROT 1 4 }  { m_axi_mem2_AWPROT QOS 1 3 }  { m_axi_mem2_AWQOS REGION 1 4 }  { m_axi_mem2_AWREGION USER 1 4 }  { m_axi_mem2_AWUSER DATA 1 1 }  { m_axi_mem2_WVALID VALID 1 1 }  { m_axi_mem2_WREADY READY 0 1 }  { m_axi_mem2_WDATA FIFONUM 1 32 }  { m_axi_mem2_WSTRB STRB 1 4 }  { m_axi_mem2_WLAST LAST 1 1 }  { m_axi_mem2_WID ID 1 1 }  { m_axi_mem2_WUSER DATA 1 1 }  { m_axi_mem2_ARVALID VALID 1 1 }  { m_axi_mem2_ARREADY READY 0 1 }  { m_axi_mem2_ARADDR ADDR 1 64 }  { m_axi_mem2_ARID ID 1 1 }  { m_axi_mem2_ARLEN SIZE 1 32 }  { m_axi_mem2_ARSIZE BURST 1 3 }  { m_axi_mem2_ARBURST LOCK 1 2 }  { m_axi_mem2_ARLOCK CACHE 1 2 }  { m_axi_mem2_ARCACHE PROT 1 4 }  { m_axi_mem2_ARPROT QOS 1 3 }  { m_axi_mem2_ARQOS REGION 1 4 }  { m_axi_mem2_ARREGION USER 1 4 }  { m_axi_mem2_ARUSER DATA 1 1 }  { m_axi_mem2_RVALID VALID 0 1 }  { m_axi_mem2_RREADY READY 1 1 }  { m_axi_mem2_RDATA FIFONUM 0 32 }  { m_axi_mem2_RLAST LAST 0 1 }  { m_axi_mem2_RID ID 0 1 }  { m_axi_mem2_RFIFONUM LEN 0 9 }  { m_axi_mem2_RUSER DATA 0 1 }  { m_axi_mem2_RRESP RESP 0 2 }  { m_axi_mem2_BVALID VALID 0 1 }  { m_axi_mem2_BREADY READY 1 1 }  { m_axi_mem2_BRESP RESP 0 2 }  { m_axi_mem2_BID ID 0 1 }  { m_axi_mem2_BUSER DATA 0 1 } } }
	output_r { ap_none {  { output_r in_data 0 64 } } }
	BRAM_buffer_2_0 { ap_memory {  { BRAM_buffer_2_0_address0 mem_address 1 7 }  { BRAM_buffer_2_0_ce0 mem_ce 1 1 }  { BRAM_buffer_2_0_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_1 { ap_memory {  { BRAM_buffer_2_1_address0 mem_address 1 7 }  { BRAM_buffer_2_1_ce0 mem_ce 1 1 }  { BRAM_buffer_2_1_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_2 { ap_memory {  { BRAM_buffer_2_2_address0 mem_address 1 7 }  { BRAM_buffer_2_2_ce0 mem_ce 1 1 }  { BRAM_buffer_2_2_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_3 { ap_memory {  { BRAM_buffer_2_3_address0 mem_address 1 7 }  { BRAM_buffer_2_3_ce0 mem_ce 1 1 }  { BRAM_buffer_2_3_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_4 { ap_memory {  { BRAM_buffer_2_4_address0 mem_address 1 7 }  { BRAM_buffer_2_4_ce0 mem_ce 1 1 }  { BRAM_buffer_2_4_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_5 { ap_memory {  { BRAM_buffer_2_5_address0 mem_address 1 7 }  { BRAM_buffer_2_5_ce0 mem_ce 1 1 }  { BRAM_buffer_2_5_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_6 { ap_memory {  { BRAM_buffer_2_6_address0 mem_address 1 7 }  { BRAM_buffer_2_6_ce0 mem_ce 1 1 }  { BRAM_buffer_2_6_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_7 { ap_memory {  { BRAM_buffer_2_7_address0 mem_address 1 7 }  { BRAM_buffer_2_7_ce0 mem_ce 1 1 }  { BRAM_buffer_2_7_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_8 { ap_memory {  { BRAM_buffer_2_8_address0 mem_address 1 7 }  { BRAM_buffer_2_8_ce0 mem_ce 1 1 }  { BRAM_buffer_2_8_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_9 { ap_memory {  { BRAM_buffer_2_9_address0 mem_address 1 7 }  { BRAM_buffer_2_9_ce0 mem_ce 1 1 }  { BRAM_buffer_2_9_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_10 { ap_memory {  { BRAM_buffer_2_10_address0 mem_address 1 7 }  { BRAM_buffer_2_10_ce0 mem_ce 1 1 }  { BRAM_buffer_2_10_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_11 { ap_memory {  { BRAM_buffer_2_11_address0 mem_address 1 7 }  { BRAM_buffer_2_11_ce0 mem_ce 1 1 }  { BRAM_buffer_2_11_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_12 { ap_memory {  { BRAM_buffer_2_12_address0 mem_address 1 7 }  { BRAM_buffer_2_12_ce0 mem_ce 1 1 }  { BRAM_buffer_2_12_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_13 { ap_memory {  { BRAM_buffer_2_13_address0 mem_address 1 7 }  { BRAM_buffer_2_13_ce0 mem_ce 1 1 }  { BRAM_buffer_2_13_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_14 { ap_memory {  { BRAM_buffer_2_14_address0 mem_address 1 7 }  { BRAM_buffer_2_14_ce0 mem_ce 1 1 }  { BRAM_buffer_2_14_q0 mem_dout 0 32 } } }
	BRAM_buffer_2_15 { ap_memory {  { BRAM_buffer_2_15_address0 mem_address 1 7 }  { BRAM_buffer_2_15_ce0 mem_ce 1 1 }  { BRAM_buffer_2_15_q0 mem_dout 0 32 } } }
}
