set moduleName top
set isTopModule 1
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
set C_modelName {top}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mem1 int 32 regular {axi_master 0}  }
	{ mem2 int 32 regular {axi_master 1}  }
	{ DRAM_image_input int 64 regular {axi_slave 0}  }
	{ DRAM_conv_weight int 64 regular {axi_slave 0}  }
	{ DRAM_conv_bias int 64 regular {axi_slave 0}  }
	{ DRAM_image_output int 64 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mem1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "DRAM_image_input","offset": { "type": "dynamic","port_name": "DRAM_image_input","bundle": "control"},"direction": "READONLY"},{"cName": "DRAM_conv_weight","offset": { "type": "dynamic","port_name": "DRAM_conv_weight","bundle": "control"},"direction": "READONLY"},{"cName": "DRAM_conv_bias","offset": { "type": "dynamic","port_name": "DRAM_conv_bias","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "mem2", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "DRAM_image_output","offset": { "type": "dynamic","port_name": "DRAM_image_output","bundle": "control"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "DRAM_image_input", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "DRAM_conv_weight", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "DRAM_conv_bias", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "DRAM_image_output", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_mem1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_mem1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_mem1_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_mem1_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_mem1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_mem1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_mem1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_mem1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem1_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_mem2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_mem2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_mem2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_mem2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_mem2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_mem2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_mem2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_mem2_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_mem2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_mem2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_mem2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_mem2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_mem2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_mem2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_mem2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_mem2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_mem2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_mem2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_mem2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_mem2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_mem2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_mem2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_mem2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_mem2_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"top","role":"start","value":"0","valid_bit":"0"},{"name":"top","role":"continue","value":"0","valid_bit":"4"},{"name":"top","role":"auto_start","value":"0","valid_bit":"7"},{"name":"DRAM_image_input","role":"data","value":"16"},{"name":"DRAM_conv_weight","role":"data","value":"28"},{"name":"DRAM_conv_bias","role":"data","value":"40"},{"name":"DRAM_image_output","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"top","role":"start","value":"0","valid_bit":"0"},{"name":"top","role":"done","value":"0","valid_bit":"1"},{"name":"top","role":"idle","value":"0","valid_bit":"2"},{"name":"top","role":"ready","value":"0","valid_bit":"3"},{"name":"top","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_mem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "AWID" }} , 
 	{ "name": "m_axi_mem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_mem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_mem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_mem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_mem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_mem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_mem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_mem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BID" }} , 
 	{ "name": "m_axi_mem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem1", "role": "BUSER" }} , 
 	{ "name": "m_axi_mem2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_mem2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_mem2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mem2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_mem2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "AWID" }} , 
 	{ "name": "m_axi_mem2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem2", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_mem2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "mem2", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_mem2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "RUSER" }} , 
 	{ "name": "m_axi_mem2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "RRESP" }} , 
 	{ "name": "m_axi_mem2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BVALID" }} , 
 	{ "name": "m_axi_mem2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BREADY" }} , 
 	{ "name": "m_axi_mem2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "mem2", "role": "BRESP" }} , 
 	{ "name": "m_axi_mem2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BID" }} , 
 	{ "name": "m_axi_mem2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "324", "327", "330", "621", "799", "803", "804", "805"],
		"CDFG" : "top",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41059", "EstimateLatencyMax" : "157159",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "mem1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "mem1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "mem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "mem2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "mem2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "DRAM_image_input", "Type" : "None", "Direction" : "I"},
			{"Name" : "DRAM_conv_weight", "Type" : "None", "Direction" : "I"},
			{"Name" : "DRAM_conv_bias", "Type" : "None", "Direction" : "I"},
			{"Name" : "DRAM_image_output", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_image_input_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_4", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_5", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_6", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_7", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_8", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_9", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_10", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_11", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_12", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_13", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_14", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "321", "SubInstance" : "grp_load_image_fu_742", "Port" : "BRAM_image_input_15", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_image_input_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_0_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_0_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_0_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_1_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_1_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_2_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_2_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_3_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_3_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_4_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_4_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_5_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_5_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_6_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_6_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_7_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_7_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_8_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_8_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_9_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_9_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_10_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_10_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_11_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_11_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_12_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_12_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_13_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_13_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_14_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_14_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_0", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_1", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_2", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_3", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_4", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_5", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_6", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_7", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_8", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_9", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_10", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_11", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_12", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_13", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_14", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "324", "SubInstance" : "grp_load_weight_fu_781", "Port" : "BRAM_conv_weight_15_15", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_weight_15_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_3", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_4", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_5", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_6", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_7", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_8", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_9", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_10", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_11", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_12", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_13", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_14", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "327", "SubInstance" : "grp_load_bias_fu_1300", "Port" : "BRAM_conv_bias_15", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_conv_bias_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "330", "SubInstance" : "grp_conv2d_fu_1339", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "f_x_msb_4_h_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "f_x_lsb_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "f_x_msb_3_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "f_x_msb_2_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_0", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_0", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_1", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_2", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_2", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_3", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_4", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_4", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_5", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_5", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_6", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_6", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_7", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_7", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_8", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_8", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_9", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_9", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_10", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_10", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_11", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_11", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_12", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_12", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_13", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_13", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_14", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_14", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_buffer_2_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "799", "SubInstance" : "grp_store_fu_2031", "Port" : "BRAM_buffer_2_15", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "621", "SubInstance" : "grp_elu_activation_fu_1951", "Port" : "BRAM_buffer_2_15", "Inst_start_state" : "10", "Inst_end_state" : "11"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_image_input_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_0_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_3_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_4_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_5_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_6_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_8_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_9_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_10_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_11_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_12_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_13_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_14_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_0_15_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_0_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_1_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_2_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_3_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_4_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_5_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_6_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_7_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_8_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_9_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_10_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_11_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_12_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_13_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_14_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_1_15_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_0_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_1_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_2_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_3_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_4_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_5_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_6_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_7_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_8_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_9_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_10_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_11_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_12_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_13_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_14_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_2_15_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_0_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_1_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_2_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_3_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_4_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_5_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_6_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_7_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_8_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_9_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_10_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_11_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_12_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_13_U", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_14_U", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_3_15_U", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_0_U", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_1_U", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_2_U", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_3_U", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_4_U", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_5_U", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_6_U", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_7_U", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_8_U", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_9_U", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_10_U", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_11_U", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_12_U", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_13_U", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_14_U", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_4_15_U", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_0_U", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_1_U", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_2_U", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_3_U", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_4_U", "Parent" : "0"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_5_U", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_6_U", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_7_U", "Parent" : "0"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_8_U", "Parent" : "0"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_9_U", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_10_U", "Parent" : "0"},
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_11_U", "Parent" : "0"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_12_U", "Parent" : "0"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_13_U", "Parent" : "0"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_14_U", "Parent" : "0"},
	{"ID" : "112", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_5_15_U", "Parent" : "0"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_0_U", "Parent" : "0"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_1_U", "Parent" : "0"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_2_U", "Parent" : "0"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_3_U", "Parent" : "0"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_4_U", "Parent" : "0"},
	{"ID" : "118", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_5_U", "Parent" : "0"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_6_U", "Parent" : "0"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_7_U", "Parent" : "0"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_8_U", "Parent" : "0"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_9_U", "Parent" : "0"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_10_U", "Parent" : "0"},
	{"ID" : "124", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_11_U", "Parent" : "0"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_12_U", "Parent" : "0"},
	{"ID" : "126", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_13_U", "Parent" : "0"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_14_U", "Parent" : "0"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_6_15_U", "Parent" : "0"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_0_U", "Parent" : "0"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_1_U", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_2_U", "Parent" : "0"},
	{"ID" : "132", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_3_U", "Parent" : "0"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_4_U", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_5_U", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_6_U", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_7_U", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_8_U", "Parent" : "0"},
	{"ID" : "138", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_9_U", "Parent" : "0"},
	{"ID" : "139", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_10_U", "Parent" : "0"},
	{"ID" : "140", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_11_U", "Parent" : "0"},
	{"ID" : "141", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_12_U", "Parent" : "0"},
	{"ID" : "142", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_13_U", "Parent" : "0"},
	{"ID" : "143", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_14_U", "Parent" : "0"},
	{"ID" : "144", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_7_15_U", "Parent" : "0"},
	{"ID" : "145", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_0_U", "Parent" : "0"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_1_U", "Parent" : "0"},
	{"ID" : "147", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_2_U", "Parent" : "0"},
	{"ID" : "148", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_3_U", "Parent" : "0"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_4_U", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_5_U", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_6_U", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_7_U", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_8_U", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_9_U", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_10_U", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_11_U", "Parent" : "0"},
	{"ID" : "157", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_12_U", "Parent" : "0"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_13_U", "Parent" : "0"},
	{"ID" : "159", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_14_U", "Parent" : "0"},
	{"ID" : "160", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_8_15_U", "Parent" : "0"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_0_U", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_1_U", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_2_U", "Parent" : "0"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_3_U", "Parent" : "0"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_4_U", "Parent" : "0"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_5_U", "Parent" : "0"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_6_U", "Parent" : "0"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_7_U", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_8_U", "Parent" : "0"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_9_U", "Parent" : "0"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_10_U", "Parent" : "0"},
	{"ID" : "172", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_11_U", "Parent" : "0"},
	{"ID" : "173", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_12_U", "Parent" : "0"},
	{"ID" : "174", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_13_U", "Parent" : "0"},
	{"ID" : "175", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_14_U", "Parent" : "0"},
	{"ID" : "176", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_9_15_U", "Parent" : "0"},
	{"ID" : "177", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_0_U", "Parent" : "0"},
	{"ID" : "178", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_1_U", "Parent" : "0"},
	{"ID" : "179", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_2_U", "Parent" : "0"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_3_U", "Parent" : "0"},
	{"ID" : "181", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_4_U", "Parent" : "0"},
	{"ID" : "182", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_5_U", "Parent" : "0"},
	{"ID" : "183", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_6_U", "Parent" : "0"},
	{"ID" : "184", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_7_U", "Parent" : "0"},
	{"ID" : "185", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_8_U", "Parent" : "0"},
	{"ID" : "186", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_9_U", "Parent" : "0"},
	{"ID" : "187", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_10_U", "Parent" : "0"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_11_U", "Parent" : "0"},
	{"ID" : "189", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_12_U", "Parent" : "0"},
	{"ID" : "190", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_13_U", "Parent" : "0"},
	{"ID" : "191", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_14_U", "Parent" : "0"},
	{"ID" : "192", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_10_15_U", "Parent" : "0"},
	{"ID" : "193", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_0_U", "Parent" : "0"},
	{"ID" : "194", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_1_U", "Parent" : "0"},
	{"ID" : "195", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_2_U", "Parent" : "0"},
	{"ID" : "196", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_3_U", "Parent" : "0"},
	{"ID" : "197", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_4_U", "Parent" : "0"},
	{"ID" : "198", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_5_U", "Parent" : "0"},
	{"ID" : "199", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_6_U", "Parent" : "0"},
	{"ID" : "200", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_7_U", "Parent" : "0"},
	{"ID" : "201", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_8_U", "Parent" : "0"},
	{"ID" : "202", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_9_U", "Parent" : "0"},
	{"ID" : "203", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_10_U", "Parent" : "0"},
	{"ID" : "204", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_11_U", "Parent" : "0"},
	{"ID" : "205", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_12_U", "Parent" : "0"},
	{"ID" : "206", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_13_U", "Parent" : "0"},
	{"ID" : "207", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_14_U", "Parent" : "0"},
	{"ID" : "208", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_11_15_U", "Parent" : "0"},
	{"ID" : "209", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_0_U", "Parent" : "0"},
	{"ID" : "210", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_1_U", "Parent" : "0"},
	{"ID" : "211", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_2_U", "Parent" : "0"},
	{"ID" : "212", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_3_U", "Parent" : "0"},
	{"ID" : "213", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_4_U", "Parent" : "0"},
	{"ID" : "214", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_5_U", "Parent" : "0"},
	{"ID" : "215", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_6_U", "Parent" : "0"},
	{"ID" : "216", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_7_U", "Parent" : "0"},
	{"ID" : "217", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_8_U", "Parent" : "0"},
	{"ID" : "218", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_9_U", "Parent" : "0"},
	{"ID" : "219", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_10_U", "Parent" : "0"},
	{"ID" : "220", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_11_U", "Parent" : "0"},
	{"ID" : "221", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_12_U", "Parent" : "0"},
	{"ID" : "222", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_13_U", "Parent" : "0"},
	{"ID" : "223", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_14_U", "Parent" : "0"},
	{"ID" : "224", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_12_15_U", "Parent" : "0"},
	{"ID" : "225", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_0_U", "Parent" : "0"},
	{"ID" : "226", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_1_U", "Parent" : "0"},
	{"ID" : "227", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_2_U", "Parent" : "0"},
	{"ID" : "228", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_3_U", "Parent" : "0"},
	{"ID" : "229", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_4_U", "Parent" : "0"},
	{"ID" : "230", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_5_U", "Parent" : "0"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_6_U", "Parent" : "0"},
	{"ID" : "232", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_7_U", "Parent" : "0"},
	{"ID" : "233", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_8_U", "Parent" : "0"},
	{"ID" : "234", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_9_U", "Parent" : "0"},
	{"ID" : "235", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_10_U", "Parent" : "0"},
	{"ID" : "236", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_11_U", "Parent" : "0"},
	{"ID" : "237", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_12_U", "Parent" : "0"},
	{"ID" : "238", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_13_U", "Parent" : "0"},
	{"ID" : "239", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_14_U", "Parent" : "0"},
	{"ID" : "240", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_13_15_U", "Parent" : "0"},
	{"ID" : "241", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_0_U", "Parent" : "0"},
	{"ID" : "242", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_1_U", "Parent" : "0"},
	{"ID" : "243", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_2_U", "Parent" : "0"},
	{"ID" : "244", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_3_U", "Parent" : "0"},
	{"ID" : "245", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_4_U", "Parent" : "0"},
	{"ID" : "246", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_5_U", "Parent" : "0"},
	{"ID" : "247", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_6_U", "Parent" : "0"},
	{"ID" : "248", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_7_U", "Parent" : "0"},
	{"ID" : "249", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_8_U", "Parent" : "0"},
	{"ID" : "250", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_9_U", "Parent" : "0"},
	{"ID" : "251", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_10_U", "Parent" : "0"},
	{"ID" : "252", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_11_U", "Parent" : "0"},
	{"ID" : "253", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_12_U", "Parent" : "0"},
	{"ID" : "254", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_13_U", "Parent" : "0"},
	{"ID" : "255", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_14_U", "Parent" : "0"},
	{"ID" : "256", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_14_15_U", "Parent" : "0"},
	{"ID" : "257", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_0_U", "Parent" : "0"},
	{"ID" : "258", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_1_U", "Parent" : "0"},
	{"ID" : "259", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_2_U", "Parent" : "0"},
	{"ID" : "260", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_3_U", "Parent" : "0"},
	{"ID" : "261", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_4_U", "Parent" : "0"},
	{"ID" : "262", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_5_U", "Parent" : "0"},
	{"ID" : "263", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_6_U", "Parent" : "0"},
	{"ID" : "264", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_7_U", "Parent" : "0"},
	{"ID" : "265", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_8_U", "Parent" : "0"},
	{"ID" : "266", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_9_U", "Parent" : "0"},
	{"ID" : "267", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_10_U", "Parent" : "0"},
	{"ID" : "268", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_11_U", "Parent" : "0"},
	{"ID" : "269", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_12_U", "Parent" : "0"},
	{"ID" : "270", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_13_U", "Parent" : "0"},
	{"ID" : "271", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_14_U", "Parent" : "0"},
	{"ID" : "272", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_weight_15_15_U", "Parent" : "0"},
	{"ID" : "273", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_0_U", "Parent" : "0"},
	{"ID" : "274", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_1_U", "Parent" : "0"},
	{"ID" : "275", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_2_U", "Parent" : "0"},
	{"ID" : "276", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_3_U", "Parent" : "0"},
	{"ID" : "277", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_4_U", "Parent" : "0"},
	{"ID" : "278", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_5_U", "Parent" : "0"},
	{"ID" : "279", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_6_U", "Parent" : "0"},
	{"ID" : "280", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_7_U", "Parent" : "0"},
	{"ID" : "281", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_8_U", "Parent" : "0"},
	{"ID" : "282", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_9_U", "Parent" : "0"},
	{"ID" : "283", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_10_U", "Parent" : "0"},
	{"ID" : "284", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_11_U", "Parent" : "0"},
	{"ID" : "285", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_12_U", "Parent" : "0"},
	{"ID" : "286", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_13_U", "Parent" : "0"},
	{"ID" : "287", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_14_U", "Parent" : "0"},
	{"ID" : "288", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_conv_bias_15_U", "Parent" : "0"},
	{"ID" : "289", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_0_U", "Parent" : "0"},
	{"ID" : "290", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_1_U", "Parent" : "0"},
	{"ID" : "291", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_2_U", "Parent" : "0"},
	{"ID" : "292", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_3_U", "Parent" : "0"},
	{"ID" : "293", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_4_U", "Parent" : "0"},
	{"ID" : "294", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_5_U", "Parent" : "0"},
	{"ID" : "295", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_6_U", "Parent" : "0"},
	{"ID" : "296", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_7_U", "Parent" : "0"},
	{"ID" : "297", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_8_U", "Parent" : "0"},
	{"ID" : "298", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_9_U", "Parent" : "0"},
	{"ID" : "299", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_10_U", "Parent" : "0"},
	{"ID" : "300", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_11_U", "Parent" : "0"},
	{"ID" : "301", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_12_U", "Parent" : "0"},
	{"ID" : "302", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_13_U", "Parent" : "0"},
	{"ID" : "303", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_14_U", "Parent" : "0"},
	{"ID" : "304", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_1_15_U", "Parent" : "0"},
	{"ID" : "305", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_0_U", "Parent" : "0"},
	{"ID" : "306", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_1_U", "Parent" : "0"},
	{"ID" : "307", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_2_U", "Parent" : "0"},
	{"ID" : "308", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_3_U", "Parent" : "0"},
	{"ID" : "309", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_4_U", "Parent" : "0"},
	{"ID" : "310", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_5_U", "Parent" : "0"},
	{"ID" : "311", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_6_U", "Parent" : "0"},
	{"ID" : "312", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_7_U", "Parent" : "0"},
	{"ID" : "313", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_8_U", "Parent" : "0"},
	{"ID" : "314", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_9_U", "Parent" : "0"},
	{"ID" : "315", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_10_U", "Parent" : "0"},
	{"ID" : "316", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_11_U", "Parent" : "0"},
	{"ID" : "317", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_12_U", "Parent" : "0"},
	{"ID" : "318", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_13_U", "Parent" : "0"},
	{"ID" : "319", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_14_U", "Parent" : "0"},
	{"ID" : "320", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.BRAM_buffer_2_15_U", "Parent" : "0"},
	{"ID" : "321", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_image_fu_742", "Parent" : "0", "Child" : ["322"],
		"CDFG" : "load_image",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1612", "EstimateLatencyMax" : "1612",
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
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "mem1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_image_input_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_image_input_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "322", "SubInstance" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Port" : "BRAM_image_input_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "322", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_load_image_fu_742.grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79", "Parent" : "321", "Child" : ["323"],
		"CDFG" : "load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3",
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
			{"Name" : "mem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln35", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_image_input_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_image_input_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "323", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_load_image_fu_742.grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79.flow_control_loop_pipe_sequential_init_U", "Parent" : "322"},
	{"ID" : "324", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_weight_fu_781", "Parent" : "0", "Child" : ["325"],
		"CDFG" : "load_weight",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "36876", "EstimateLatencyMax" : "36876",
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
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "mem1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_0_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_0_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_1_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_1_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_2_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_2_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_3_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_3_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_4_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_4_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_5_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_5_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_6_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_6_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_7_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_7_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_8_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_8_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_9_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_9_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_10_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_10_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_11_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_11_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_12_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_12_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_13_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_13_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_14_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_14_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_weight_15_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "325", "SubInstance" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Port" : "BRAM_conv_weight_15_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "325", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_load_weight_fu_781.grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559", "Parent" : "324", "Child" : ["326"],
		"CDFG" : "load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "36867", "EstimateLatencyMax" : "36867",
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
			{"Name" : "sext_ln47", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_0_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_1_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_2_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_3_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_4_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_5_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_6_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_7_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_8_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_9_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_10_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_11_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_12_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_13_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_14_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_conv_weight_15_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_50_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "326", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_load_weight_fu_781.grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559.flow_control_loop_pipe_sequential_init_U", "Parent" : "325"},
	{"ID" : "327", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_load_bias_fu_1300", "Parent" : "0", "Child" : ["328"],
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
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "mem1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_0", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_1", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_4", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_5", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_6", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_7", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_8", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_9", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_10", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_11", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_12", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_13", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_14", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "328", "SubInstance" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Port" : "BRAM_conv_bias_15", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "328", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_load_bias_fu_1300.grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79", "Parent" : "327", "Child" : ["329"],
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
	{"ID" : "329", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_load_bias_fu_1300.grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79.flow_control_loop_pipe_sequential_init_U", "Parent" : "328"},
	{"ID" : "330", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339", "Parent" : "0", "Child" : ["331", "333", "351", "369", "387", "405", "423", "441", "459", "477", "495", "513", "531", "549", "567", "585", "603"],
		"CDFG" : "conv2d",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "764", "EstimateLatencyMax" : "116864",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_4", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_5", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_6", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_7", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_8", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_9", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_10", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_11", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_12", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_13", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_14", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_conv_bias_15", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_0", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_1", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_2", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_3", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_4", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_5", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_6", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_7", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_8", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_9", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_11", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_12", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_13", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_14", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "331", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "10", "Inst_end_state" : "11"},
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "30", "Inst_end_state" : "31"},
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "32", "Inst_end_state" : "33"},
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "34", "Inst_end_state" : "35"},
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "36", "Inst_end_state" : "37"},
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "38", "Inst_end_state" : "39"},
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "12", "Inst_end_state" : "13"},
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "18", "Inst_end_state" : "19"},
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "22", "Inst_end_state" : "23"},
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "24", "Inst_end_state" : "25"},
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_buffer_1_15", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_image_input_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_0_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_1_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_2_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_3_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_4_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_5_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_5_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_6_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_6_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_7_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_7_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_8_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_8_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_9_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_9_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_10_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_10_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_11_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_11_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_12_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_12_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_13_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_13_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_14_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_14_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_conv_weight_15_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "333", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Port" : "BRAM_conv_weight_15_0", "Inst_start_state" : "8", "Inst_end_state" : "9"}]},
			{"Name" : "BRAM_image_input_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_0_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_1_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_1_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_2_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_3_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_3_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_4_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_4_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_5_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_5_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_6_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_6_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_7_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_7_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_8_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_8_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_9_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_9_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_10_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_10_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_11_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_11_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_12_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_12_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_13_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_13_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_14_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_14_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_conv_weight_15_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "351", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Port" : "BRAM_conv_weight_15_1", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "BRAM_image_input_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_0_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_1_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_1_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_2_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_2_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_3_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_3_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_4_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_4_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_5_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_5_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_6_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_6_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_7_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_7_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_8_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_8_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_9_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_9_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_10_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_10_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_11_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_11_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_12_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_12_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_13_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_13_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_14_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_14_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_conv_weight_15_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "369", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Port" : "BRAM_conv_weight_15_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "BRAM_image_input_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_0_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_1_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_1_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_2_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_2_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_3_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_3_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_4_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_4_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_5_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_5_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_6_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_6_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_7_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_7_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_8_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_8_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_9_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_9_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_10_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_10_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_11_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_11_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_12_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_12_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_13_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_13_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_14_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_14_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_conv_weight_15_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "387", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Port" : "BRAM_conv_weight_15_3", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "BRAM_image_input_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_0_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_1_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_1_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_2_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_2_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_3_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_3_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_4_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_4_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_5_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_5_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_6_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_6_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_7_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_7_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_8_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_8_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_9_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_9_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_10_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_10_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_11_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_11_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_12_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_12_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_13_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_13_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_14_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_14_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_conv_weight_15_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "405", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Port" : "BRAM_conv_weight_15_4", "Inst_start_state" : "16", "Inst_end_state" : "17"}]},
			{"Name" : "BRAM_image_input_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_0_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_1_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_1_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_2_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_2_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_3_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_3_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_4_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_4_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_5_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_5_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_6_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_6_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_7_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_7_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_8_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_8_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_9_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_9_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_10_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_10_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_11_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_11_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_12_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_12_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_13_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_13_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_14_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_14_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_conv_weight_15_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "423", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Port" : "BRAM_conv_weight_15_5", "Inst_start_state" : "18", "Inst_end_state" : "19"}]},
			{"Name" : "BRAM_image_input_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_0_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_1_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_1_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_2_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_2_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_3_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_3_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_4_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_4_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_5_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_5_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_6_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_6_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_7_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_7_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_8_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_8_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_9_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_9_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_10_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_10_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_11_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_11_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_12_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_12_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_13_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_13_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_14_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_14_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_conv_weight_15_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "441", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Port" : "BRAM_conv_weight_15_6", "Inst_start_state" : "20", "Inst_end_state" : "21"}]},
			{"Name" : "BRAM_image_input_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_0_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_1_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_1_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_2_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_2_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_3_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_3_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_4_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_4_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_5_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_5_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_6_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_6_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_7_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_7_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_8_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_8_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_9_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_9_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_10_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_10_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_11_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_11_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_12_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_12_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_13_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_13_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_14_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_14_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_conv_weight_15_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "459", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Port" : "BRAM_conv_weight_15_7", "Inst_start_state" : "22", "Inst_end_state" : "23"}]},
			{"Name" : "BRAM_image_input_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_0_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_1_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_1_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_2_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_2_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_3_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_3_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_4_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_4_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_5_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_5_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_6_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_6_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_7_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_7_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_8_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_8_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_9_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_9_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_10_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_10_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_11_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_11_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_12_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_12_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_13_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_13_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_14_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_14_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_conv_weight_15_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "477", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Port" : "BRAM_conv_weight_15_8", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "BRAM_image_input_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_0_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_1_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_1_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_2_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_2_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_3_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_3_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_4_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_4_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_5_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_5_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_6_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_6_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_7_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_7_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_8_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_8_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_9_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_9_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_10_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_10_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_11_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_11_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_12_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_12_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_13_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_13_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_14_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_14_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_conv_weight_15_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "495", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Port" : "BRAM_conv_weight_15_9", "Inst_start_state" : "26", "Inst_end_state" : "27"}]},
			{"Name" : "BRAM_image_input_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_0_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_1_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_1_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_2_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_2_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_3_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_3_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_4_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_4_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_5_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_5_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_6_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_6_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_7_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_7_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_8_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_8_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_9_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_9_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_10_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_10_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_11_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_11_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_12_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_12_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_13_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_13_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_14_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_14_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_conv_weight_15_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "513", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Port" : "BRAM_conv_weight_15_10", "Inst_start_state" : "28", "Inst_end_state" : "29"}]},
			{"Name" : "BRAM_image_input_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_0_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_1_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_1_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_2_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_2_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_3_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_3_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_4_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_4_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_5_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_5_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_6_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_6_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_7_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_7_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_8_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_8_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_9_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_9_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_10_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_10_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_11_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_11_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_12_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_12_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_13_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_13_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_14_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_14_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_conv_weight_15_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "531", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Port" : "BRAM_conv_weight_15_11", "Inst_start_state" : "30", "Inst_end_state" : "31"}]},
			{"Name" : "BRAM_image_input_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_0_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_1_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_1_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_2_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_2_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_3_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_3_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_4_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_4_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_5_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_5_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_6_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_6_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_7_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_7_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_8_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_8_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_9_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_9_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_10_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_10_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_11_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_11_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_12_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_12_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_13_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_13_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_14_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_14_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_conv_weight_15_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "549", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Port" : "BRAM_conv_weight_15_12", "Inst_start_state" : "32", "Inst_end_state" : "33"}]},
			{"Name" : "BRAM_image_input_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_0_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_1_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_1_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_2_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_2_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_3_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_3_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_4_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_4_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_5_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_5_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_6_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_6_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_7_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_7_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_8_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_8_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_9_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_9_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_10_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_10_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_11_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_11_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_12_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_12_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_13_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_13_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_14_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_14_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_conv_weight_15_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "567", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Port" : "BRAM_conv_weight_15_13", "Inst_start_state" : "34", "Inst_end_state" : "35"}]},
			{"Name" : "BRAM_image_input_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_0_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_1_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_1_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_2_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_2_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_3_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_3_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_4_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_4_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_5_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_5_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_6_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_6_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_7_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_7_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_8_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_8_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_9_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_9_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_10_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_10_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_11_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_11_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_12_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_12_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_13_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_13_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_14_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_14_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_conv_weight_15_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "585", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Port" : "BRAM_conv_weight_15_14", "Inst_start_state" : "36", "Inst_end_state" : "37"}]},
			{"Name" : "BRAM_image_input_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_0_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_1_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_1_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_2_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_2_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_3_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_3_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_4_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_4_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_5_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_5_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_6_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_6_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_7_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_7_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_8_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_8_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_9_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_9_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_10_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_10_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_11_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_11_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_12_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_12_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_13_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_13_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_14_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_14_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]},
			{"Name" : "BRAM_conv_weight_15_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Port" : "BRAM_conv_weight_15_15", "Inst_start_state" : "38", "Inst_end_state" : "39"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_119_8", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state39"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_115_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_114_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_112_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "39", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "331", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957", "Parent" : "330", "Child" : ["332"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BRAM_conv_bias_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_bias_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "332", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957.flow_control_loop_pipe_sequential_init_U", "Parent" : "331"},
	{"ID" : "333", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025", "Parent" : "330", "Child" : ["334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_9",
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
			{"Name" : "sext_ln121", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "334", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U621", "Parent" : "333"},
	{"ID" : "335", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U622", "Parent" : "333"},
	{"ID" : "336", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U623", "Parent" : "333"},
	{"ID" : "337", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U624", "Parent" : "333"},
	{"ID" : "338", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U625", "Parent" : "333"},
	{"ID" : "339", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U626", "Parent" : "333"},
	{"ID" : "340", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U627", "Parent" : "333"},
	{"ID" : "341", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U628", "Parent" : "333"},
	{"ID" : "342", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U629", "Parent" : "333"},
	{"ID" : "343", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U630", "Parent" : "333"},
	{"ID" : "344", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U631", "Parent" : "333"},
	{"ID" : "345", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U632", "Parent" : "333"},
	{"ID" : "346", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U633", "Parent" : "333"},
	{"ID" : "347", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U634", "Parent" : "333"},
	{"ID" : "348", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U635", "Parent" : "333"},
	{"ID" : "349", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.mul_32s_32s_54_1_1_U636", "Parent" : "333"},
	{"ID" : "350", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025.flow_control_loop_pipe_sequential_init_U", "Parent" : "333"},
	{"ID" : "351", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103", "Parent" : "330", "Child" : ["352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368"],
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
	{"ID" : "352", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U676", "Parent" : "351"},
	{"ID" : "353", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U677", "Parent" : "351"},
	{"ID" : "354", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U678", "Parent" : "351"},
	{"ID" : "355", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U679", "Parent" : "351"},
	{"ID" : "356", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U680", "Parent" : "351"},
	{"ID" : "357", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U681", "Parent" : "351"},
	{"ID" : "358", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U682", "Parent" : "351"},
	{"ID" : "359", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U683", "Parent" : "351"},
	{"ID" : "360", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U684", "Parent" : "351"},
	{"ID" : "361", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U685", "Parent" : "351"},
	{"ID" : "362", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U686", "Parent" : "351"},
	{"ID" : "363", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U687", "Parent" : "351"},
	{"ID" : "364", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U688", "Parent" : "351"},
	{"ID" : "365", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U689", "Parent" : "351"},
	{"ID" : "366", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U690", "Parent" : "351"},
	{"ID" : "367", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.mul_32s_32s_54_1_1_U691", "Parent" : "351"},
	{"ID" : "368", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103.flow_control_loop_pipe_sequential_init_U", "Parent" : "351"},
	{"ID" : "369", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181", "Parent" : "330", "Child" : ["370", "371", "372", "373", "374", "375", "376", "377", "378", "379", "380", "381", "382", "383", "384", "385", "386"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_92",
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
			{"Name" : "sext_ln121_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "370", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U730", "Parent" : "369"},
	{"ID" : "371", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U731", "Parent" : "369"},
	{"ID" : "372", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U732", "Parent" : "369"},
	{"ID" : "373", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U733", "Parent" : "369"},
	{"ID" : "374", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U734", "Parent" : "369"},
	{"ID" : "375", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U735", "Parent" : "369"},
	{"ID" : "376", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U736", "Parent" : "369"},
	{"ID" : "377", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U737", "Parent" : "369"},
	{"ID" : "378", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U738", "Parent" : "369"},
	{"ID" : "379", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U739", "Parent" : "369"},
	{"ID" : "380", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U740", "Parent" : "369"},
	{"ID" : "381", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U741", "Parent" : "369"},
	{"ID" : "382", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U742", "Parent" : "369"},
	{"ID" : "383", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U743", "Parent" : "369"},
	{"ID" : "384", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U744", "Parent" : "369"},
	{"ID" : "385", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.mul_32s_32s_54_1_1_U745", "Parent" : "369"},
	{"ID" : "386", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181.flow_control_loop_pipe_sequential_init_U", "Parent" : "369"},
	{"ID" : "387", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259", "Parent" : "330", "Child" : ["388", "389", "390", "391", "392", "393", "394", "395", "396", "397", "398", "399", "400", "401", "402", "403", "404"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_93",
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
			{"Name" : "sext_ln121_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "388", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U784", "Parent" : "387"},
	{"ID" : "389", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U785", "Parent" : "387"},
	{"ID" : "390", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U786", "Parent" : "387"},
	{"ID" : "391", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U787", "Parent" : "387"},
	{"ID" : "392", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U788", "Parent" : "387"},
	{"ID" : "393", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U789", "Parent" : "387"},
	{"ID" : "394", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U790", "Parent" : "387"},
	{"ID" : "395", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U791", "Parent" : "387"},
	{"ID" : "396", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U792", "Parent" : "387"},
	{"ID" : "397", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U793", "Parent" : "387"},
	{"ID" : "398", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U794", "Parent" : "387"},
	{"ID" : "399", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U795", "Parent" : "387"},
	{"ID" : "400", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U796", "Parent" : "387"},
	{"ID" : "401", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U797", "Parent" : "387"},
	{"ID" : "402", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U798", "Parent" : "387"},
	{"ID" : "403", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.mul_32s_32s_54_1_1_U799", "Parent" : "387"},
	{"ID" : "404", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259.flow_control_loop_pipe_sequential_init_U", "Parent" : "387"},
	{"ID" : "405", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337", "Parent" : "330", "Child" : ["406", "407", "408", "409", "410", "411", "412", "413", "414", "415", "416", "417", "418", "419", "420", "421", "422"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_94",
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
			{"Name" : "sext_ln121_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "406", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U838", "Parent" : "405"},
	{"ID" : "407", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U839", "Parent" : "405"},
	{"ID" : "408", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U840", "Parent" : "405"},
	{"ID" : "409", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U841", "Parent" : "405"},
	{"ID" : "410", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U842", "Parent" : "405"},
	{"ID" : "411", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U843", "Parent" : "405"},
	{"ID" : "412", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U844", "Parent" : "405"},
	{"ID" : "413", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U845", "Parent" : "405"},
	{"ID" : "414", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U846", "Parent" : "405"},
	{"ID" : "415", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U847", "Parent" : "405"},
	{"ID" : "416", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U848", "Parent" : "405"},
	{"ID" : "417", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U849", "Parent" : "405"},
	{"ID" : "418", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U850", "Parent" : "405"},
	{"ID" : "419", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U851", "Parent" : "405"},
	{"ID" : "420", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U852", "Parent" : "405"},
	{"ID" : "421", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.mul_32s_32s_54_1_1_U853", "Parent" : "405"},
	{"ID" : "422", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337.flow_control_loop_pipe_sequential_init_U", "Parent" : "405"},
	{"ID" : "423", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415", "Parent" : "330", "Child" : ["424", "425", "426", "427", "428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_95",
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
			{"Name" : "sext_ln121_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "424", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U892", "Parent" : "423"},
	{"ID" : "425", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U893", "Parent" : "423"},
	{"ID" : "426", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U894", "Parent" : "423"},
	{"ID" : "427", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U895", "Parent" : "423"},
	{"ID" : "428", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U896", "Parent" : "423"},
	{"ID" : "429", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U897", "Parent" : "423"},
	{"ID" : "430", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U898", "Parent" : "423"},
	{"ID" : "431", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U899", "Parent" : "423"},
	{"ID" : "432", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U900", "Parent" : "423"},
	{"ID" : "433", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U901", "Parent" : "423"},
	{"ID" : "434", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U902", "Parent" : "423"},
	{"ID" : "435", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U903", "Parent" : "423"},
	{"ID" : "436", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U904", "Parent" : "423"},
	{"ID" : "437", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U905", "Parent" : "423"},
	{"ID" : "438", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U906", "Parent" : "423"},
	{"ID" : "439", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.mul_32s_32s_54_1_1_U907", "Parent" : "423"},
	{"ID" : "440", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415.flow_control_loop_pipe_sequential_init_U", "Parent" : "423"},
	{"ID" : "441", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493", "Parent" : "330", "Child" : ["442", "443", "444", "445", "446", "447", "448", "449", "450", "451", "452", "453", "454", "455", "456", "457", "458"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_96",
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
			{"Name" : "sext_ln121_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "442", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U946", "Parent" : "441"},
	{"ID" : "443", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U947", "Parent" : "441"},
	{"ID" : "444", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U948", "Parent" : "441"},
	{"ID" : "445", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U949", "Parent" : "441"},
	{"ID" : "446", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U950", "Parent" : "441"},
	{"ID" : "447", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U951", "Parent" : "441"},
	{"ID" : "448", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U952", "Parent" : "441"},
	{"ID" : "449", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U953", "Parent" : "441"},
	{"ID" : "450", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U954", "Parent" : "441"},
	{"ID" : "451", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U955", "Parent" : "441"},
	{"ID" : "452", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U956", "Parent" : "441"},
	{"ID" : "453", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U957", "Parent" : "441"},
	{"ID" : "454", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U958", "Parent" : "441"},
	{"ID" : "455", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U959", "Parent" : "441"},
	{"ID" : "456", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U960", "Parent" : "441"},
	{"ID" : "457", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.mul_32s_32s_54_1_1_U961", "Parent" : "441"},
	{"ID" : "458", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493.flow_control_loop_pipe_sequential_init_U", "Parent" : "441"},
	{"ID" : "459", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571", "Parent" : "330", "Child" : ["460", "461", "462", "463", "464", "465", "466", "467", "468", "469", "470", "471", "472", "473", "474", "475", "476"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_97",
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
			{"Name" : "sext_ln121_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "460", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1000", "Parent" : "459"},
	{"ID" : "461", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1001", "Parent" : "459"},
	{"ID" : "462", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1002", "Parent" : "459"},
	{"ID" : "463", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1003", "Parent" : "459"},
	{"ID" : "464", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1004", "Parent" : "459"},
	{"ID" : "465", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1005", "Parent" : "459"},
	{"ID" : "466", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1006", "Parent" : "459"},
	{"ID" : "467", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1007", "Parent" : "459"},
	{"ID" : "468", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1008", "Parent" : "459"},
	{"ID" : "469", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1009", "Parent" : "459"},
	{"ID" : "470", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1010", "Parent" : "459"},
	{"ID" : "471", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1011", "Parent" : "459"},
	{"ID" : "472", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1012", "Parent" : "459"},
	{"ID" : "473", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1013", "Parent" : "459"},
	{"ID" : "474", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1014", "Parent" : "459"},
	{"ID" : "475", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.mul_32s_32s_54_1_1_U1015", "Parent" : "459"},
	{"ID" : "476", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571.flow_control_loop_pipe_sequential_init_U", "Parent" : "459"},
	{"ID" : "477", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649", "Parent" : "330", "Child" : ["478", "479", "480", "481", "482", "483", "484", "485", "486", "487", "488", "489", "490", "491", "492", "493", "494"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_98",
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
			{"Name" : "sext_ln121_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "478", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1054", "Parent" : "477"},
	{"ID" : "479", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1055", "Parent" : "477"},
	{"ID" : "480", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1056", "Parent" : "477"},
	{"ID" : "481", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1057", "Parent" : "477"},
	{"ID" : "482", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1058", "Parent" : "477"},
	{"ID" : "483", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1059", "Parent" : "477"},
	{"ID" : "484", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1060", "Parent" : "477"},
	{"ID" : "485", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1061", "Parent" : "477"},
	{"ID" : "486", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1062", "Parent" : "477"},
	{"ID" : "487", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1063", "Parent" : "477"},
	{"ID" : "488", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1064", "Parent" : "477"},
	{"ID" : "489", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1065", "Parent" : "477"},
	{"ID" : "490", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1066", "Parent" : "477"},
	{"ID" : "491", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1067", "Parent" : "477"},
	{"ID" : "492", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1068", "Parent" : "477"},
	{"ID" : "493", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.mul_32s_32s_54_1_1_U1069", "Parent" : "477"},
	{"ID" : "494", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649.flow_control_loop_pipe_sequential_init_U", "Parent" : "477"},
	{"ID" : "495", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727", "Parent" : "330", "Child" : ["496", "497", "498", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_99",
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
			{"Name" : "sext_ln121_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "496", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1108", "Parent" : "495"},
	{"ID" : "497", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1109", "Parent" : "495"},
	{"ID" : "498", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1110", "Parent" : "495"},
	{"ID" : "499", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1111", "Parent" : "495"},
	{"ID" : "500", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1112", "Parent" : "495"},
	{"ID" : "501", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1113", "Parent" : "495"},
	{"ID" : "502", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1114", "Parent" : "495"},
	{"ID" : "503", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1115", "Parent" : "495"},
	{"ID" : "504", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1116", "Parent" : "495"},
	{"ID" : "505", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1117", "Parent" : "495"},
	{"ID" : "506", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1118", "Parent" : "495"},
	{"ID" : "507", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1119", "Parent" : "495"},
	{"ID" : "508", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1120", "Parent" : "495"},
	{"ID" : "509", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1121", "Parent" : "495"},
	{"ID" : "510", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1122", "Parent" : "495"},
	{"ID" : "511", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.mul_32s_32s_54_1_1_U1123", "Parent" : "495"},
	{"ID" : "512", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727.flow_control_loop_pipe_sequential_init_U", "Parent" : "495"},
	{"ID" : "513", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805", "Parent" : "330", "Child" : ["514", "515", "516", "517", "518", "519", "520", "521", "522", "523", "524", "525", "526", "527", "528", "529", "530"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_910",
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
			{"Name" : "sext_ln121_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "514", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1162", "Parent" : "513"},
	{"ID" : "515", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1163", "Parent" : "513"},
	{"ID" : "516", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1164", "Parent" : "513"},
	{"ID" : "517", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1165", "Parent" : "513"},
	{"ID" : "518", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1166", "Parent" : "513"},
	{"ID" : "519", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1167", "Parent" : "513"},
	{"ID" : "520", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1168", "Parent" : "513"},
	{"ID" : "521", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1169", "Parent" : "513"},
	{"ID" : "522", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1170", "Parent" : "513"},
	{"ID" : "523", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1171", "Parent" : "513"},
	{"ID" : "524", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1172", "Parent" : "513"},
	{"ID" : "525", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1173", "Parent" : "513"},
	{"ID" : "526", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1174", "Parent" : "513"},
	{"ID" : "527", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1175", "Parent" : "513"},
	{"ID" : "528", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1176", "Parent" : "513"},
	{"ID" : "529", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.mul_32s_32s_54_1_1_U1177", "Parent" : "513"},
	{"ID" : "530", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805.flow_control_loop_pipe_sequential_init_U", "Parent" : "513"},
	{"ID" : "531", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883", "Parent" : "330", "Child" : ["532", "533", "534", "535", "536", "537", "538", "539", "540", "541", "542", "543", "544", "545", "546", "547", "548"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_911",
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
			{"Name" : "sext_ln121_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "532", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1216", "Parent" : "531"},
	{"ID" : "533", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1217", "Parent" : "531"},
	{"ID" : "534", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1218", "Parent" : "531"},
	{"ID" : "535", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1219", "Parent" : "531"},
	{"ID" : "536", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1220", "Parent" : "531"},
	{"ID" : "537", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1221", "Parent" : "531"},
	{"ID" : "538", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1222", "Parent" : "531"},
	{"ID" : "539", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1223", "Parent" : "531"},
	{"ID" : "540", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1224", "Parent" : "531"},
	{"ID" : "541", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1225", "Parent" : "531"},
	{"ID" : "542", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1226", "Parent" : "531"},
	{"ID" : "543", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1227", "Parent" : "531"},
	{"ID" : "544", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1228", "Parent" : "531"},
	{"ID" : "545", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1229", "Parent" : "531"},
	{"ID" : "546", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1230", "Parent" : "531"},
	{"ID" : "547", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.mul_32s_32s_54_1_1_U1231", "Parent" : "531"},
	{"ID" : "548", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883.flow_control_loop_pipe_sequential_init_U", "Parent" : "531"},
	{"ID" : "549", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961", "Parent" : "330", "Child" : ["550", "551", "552", "553", "554", "555", "556", "557", "558", "559", "560", "561", "562", "563", "564", "565", "566"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_912",
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
			{"Name" : "sext_ln121_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "550", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1270", "Parent" : "549"},
	{"ID" : "551", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1271", "Parent" : "549"},
	{"ID" : "552", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1272", "Parent" : "549"},
	{"ID" : "553", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1273", "Parent" : "549"},
	{"ID" : "554", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1274", "Parent" : "549"},
	{"ID" : "555", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1275", "Parent" : "549"},
	{"ID" : "556", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1276", "Parent" : "549"},
	{"ID" : "557", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1277", "Parent" : "549"},
	{"ID" : "558", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1278", "Parent" : "549"},
	{"ID" : "559", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1279", "Parent" : "549"},
	{"ID" : "560", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1280", "Parent" : "549"},
	{"ID" : "561", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1281", "Parent" : "549"},
	{"ID" : "562", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1282", "Parent" : "549"},
	{"ID" : "563", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1283", "Parent" : "549"},
	{"ID" : "564", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1284", "Parent" : "549"},
	{"ID" : "565", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.mul_32s_32s_54_1_1_U1285", "Parent" : "549"},
	{"ID" : "566", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961.flow_control_loop_pipe_sequential_init_U", "Parent" : "549"},
	{"ID" : "567", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039", "Parent" : "330", "Child" : ["568", "569", "570", "571", "572", "573", "574", "575", "576", "577", "578", "579", "580", "581", "582", "583", "584"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_913",
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
			{"Name" : "sext_ln121_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "568", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1324", "Parent" : "567"},
	{"ID" : "569", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1325", "Parent" : "567"},
	{"ID" : "570", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1326", "Parent" : "567"},
	{"ID" : "571", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1327", "Parent" : "567"},
	{"ID" : "572", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1328", "Parent" : "567"},
	{"ID" : "573", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1329", "Parent" : "567"},
	{"ID" : "574", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1330", "Parent" : "567"},
	{"ID" : "575", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1331", "Parent" : "567"},
	{"ID" : "576", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1332", "Parent" : "567"},
	{"ID" : "577", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1333", "Parent" : "567"},
	{"ID" : "578", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1334", "Parent" : "567"},
	{"ID" : "579", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1335", "Parent" : "567"},
	{"ID" : "580", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1336", "Parent" : "567"},
	{"ID" : "581", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1337", "Parent" : "567"},
	{"ID" : "582", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1338", "Parent" : "567"},
	{"ID" : "583", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.mul_32s_32s_54_1_1_U1339", "Parent" : "567"},
	{"ID" : "584", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039.flow_control_loop_pipe_sequential_init_U", "Parent" : "567"},
	{"ID" : "585", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117", "Parent" : "330", "Child" : ["586", "587", "588", "589", "590", "591", "592", "593", "594", "595", "596", "597", "598", "599", "600", "601", "602"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_914",
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
			{"Name" : "sext_ln121_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "586", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1378", "Parent" : "585"},
	{"ID" : "587", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1379", "Parent" : "585"},
	{"ID" : "588", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1380", "Parent" : "585"},
	{"ID" : "589", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1381", "Parent" : "585"},
	{"ID" : "590", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1382", "Parent" : "585"},
	{"ID" : "591", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1383", "Parent" : "585"},
	{"ID" : "592", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1384", "Parent" : "585"},
	{"ID" : "593", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1385", "Parent" : "585"},
	{"ID" : "594", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1386", "Parent" : "585"},
	{"ID" : "595", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1387", "Parent" : "585"},
	{"ID" : "596", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1388", "Parent" : "585"},
	{"ID" : "597", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1389", "Parent" : "585"},
	{"ID" : "598", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1390", "Parent" : "585"},
	{"ID" : "599", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1391", "Parent" : "585"},
	{"ID" : "600", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1392", "Parent" : "585"},
	{"ID" : "601", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.mul_32s_32s_54_1_1_U1393", "Parent" : "585"},
	{"ID" : "602", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117.flow_control_loop_pipe_sequential_init_U", "Parent" : "585"},
	{"ID" : "603", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195", "Parent" : "330", "Child" : ["604", "605", "606", "607", "608", "609", "610", "611", "612", "613", "614", "615", "616", "617", "618", "619", "620"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_121_915",
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
			{"Name" : "sext_ln121_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight_0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_1_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_2_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_3_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_4_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_5_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_6_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_7_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_8_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_9_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_9", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_10_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_10", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_11_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_11", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_12_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_12", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_13_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_13", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_14_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_14", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BRAM_conv_weight_15_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1_15", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "604", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1432", "Parent" : "603"},
	{"ID" : "605", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1433", "Parent" : "603"},
	{"ID" : "606", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1434", "Parent" : "603"},
	{"ID" : "607", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1435", "Parent" : "603"},
	{"ID" : "608", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1436", "Parent" : "603"},
	{"ID" : "609", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1437", "Parent" : "603"},
	{"ID" : "610", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1438", "Parent" : "603"},
	{"ID" : "611", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1439", "Parent" : "603"},
	{"ID" : "612", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1440", "Parent" : "603"},
	{"ID" : "613", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1441", "Parent" : "603"},
	{"ID" : "614", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1442", "Parent" : "603"},
	{"ID" : "615", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1443", "Parent" : "603"},
	{"ID" : "616", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1444", "Parent" : "603"},
	{"ID" : "617", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1445", "Parent" : "603"},
	{"ID" : "618", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1446", "Parent" : "603"},
	{"ID" : "619", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.mul_32s_32s_54_1_1_U1447", "Parent" : "603"},
	{"ID" : "620", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_fu_1339.grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195.flow_control_loop_pipe_sequential_init_U", "Parent" : "603"},
	{"ID" : "621", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951", "Parent" : "0", "Child" : ["622", "633", "644", "655", "666", "677", "688", "699", "710", "721", "732", "743", "754", "765", "776", "787", "798"],
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
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_4_h_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_4_l_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_4_l_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_lsb_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_lsb_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_3_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_3_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "f_x_msb_2_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "f_x_msb_2_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
			{"Name" : "exp_x_msb_1_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "677", "SubInstance" : "grp_exp_32_10_s_fu_822", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "655", "SubInstance" : "grp_exp_32_10_s_fu_786", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "721", "SubInstance" : "grp_exp_32_10_s_fu_894", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "622", "SubInstance" : "grp_exp_32_10_s_fu_732", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "776", "SubInstance" : "grp_exp_32_10_s_fu_984", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "787", "SubInstance" : "grp_exp_32_10_s_fu_1002", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "732", "SubInstance" : "grp_exp_32_10_s_fu_912", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "666", "SubInstance" : "grp_exp_32_10_s_fu_804", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "688", "SubInstance" : "grp_exp_32_10_s_fu_840", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "644", "SubInstance" : "grp_exp_32_10_s_fu_768", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "633", "SubInstance" : "grp_exp_32_10_s_fu_750", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "754", "SubInstance" : "grp_exp_32_10_s_fu_948", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "699", "SubInstance" : "grp_exp_32_10_s_fu_858", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "710", "SubInstance" : "grp_exp_32_10_s_fu_876", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "743", "SubInstance" : "grp_exp_32_10_s_fu_930", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"},
					{"ID" : "765", "SubInstance" : "grp_exp_32_10_s_fu_966", "Port" : "exp_x_msb_1_table", "Inst_start_state" : "2", "Inst_end_state" : "8"}]},
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
	{"ID" : "622", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732", "Parent" : "621", "Child" : ["623", "624", "625", "626", "627", "628", "629", "630", "631", "632"],
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
	{"ID" : "623", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.f_x_msb_4_h_table_U", "Parent" : "622"},
	{"ID" : "624", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.f_x_msb_4_l_table_U", "Parent" : "622"},
	{"ID" : "625", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.f_x_lsb_table_U", "Parent" : "622"},
	{"ID" : "626", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.f_x_msb_3_table_U", "Parent" : "622"},
	{"ID" : "627", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.f_x_msb_2_table_U", "Parent" : "622"},
	{"ID" : "628", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.exp_x_msb_1_table_U", "Parent" : "622"},
	{"ID" : "629", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.mul_44ns_42ns_86_1_1_U1790", "Parent" : "622"},
	{"ID" : "630", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.mul_50ns_48ns_98_1_1_U1791", "Parent" : "622"},
	{"ID" : "631", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.mul_50ns_50ns_100_1_1_U1792", "Parent" : "622"},
	{"ID" : "632", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_732.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "622"},
	{"ID" : "633", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750", "Parent" : "621", "Child" : ["634", "635", "636", "637", "638", "639", "640", "641", "642", "643"],
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
	{"ID" : "634", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.f_x_msb_4_h_table_U", "Parent" : "633"},
	{"ID" : "635", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.f_x_msb_4_l_table_U", "Parent" : "633"},
	{"ID" : "636", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.f_x_lsb_table_U", "Parent" : "633"},
	{"ID" : "637", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.f_x_msb_3_table_U", "Parent" : "633"},
	{"ID" : "638", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.f_x_msb_2_table_U", "Parent" : "633"},
	{"ID" : "639", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.exp_x_msb_1_table_U", "Parent" : "633"},
	{"ID" : "640", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.mul_44ns_42ns_86_1_1_U1790", "Parent" : "633"},
	{"ID" : "641", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.mul_50ns_48ns_98_1_1_U1791", "Parent" : "633"},
	{"ID" : "642", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.mul_50ns_50ns_100_1_1_U1792", "Parent" : "633"},
	{"ID" : "643", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_750.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "633"},
	{"ID" : "644", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768", "Parent" : "621", "Child" : ["645", "646", "647", "648", "649", "650", "651", "652", "653", "654"],
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
	{"ID" : "645", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.f_x_msb_4_h_table_U", "Parent" : "644"},
	{"ID" : "646", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.f_x_msb_4_l_table_U", "Parent" : "644"},
	{"ID" : "647", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.f_x_lsb_table_U", "Parent" : "644"},
	{"ID" : "648", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.f_x_msb_3_table_U", "Parent" : "644"},
	{"ID" : "649", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.f_x_msb_2_table_U", "Parent" : "644"},
	{"ID" : "650", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.exp_x_msb_1_table_U", "Parent" : "644"},
	{"ID" : "651", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.mul_44ns_42ns_86_1_1_U1790", "Parent" : "644"},
	{"ID" : "652", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.mul_50ns_48ns_98_1_1_U1791", "Parent" : "644"},
	{"ID" : "653", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.mul_50ns_50ns_100_1_1_U1792", "Parent" : "644"},
	{"ID" : "654", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_768.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "644"},
	{"ID" : "655", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786", "Parent" : "621", "Child" : ["656", "657", "658", "659", "660", "661", "662", "663", "664", "665"],
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
	{"ID" : "656", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.f_x_msb_4_h_table_U", "Parent" : "655"},
	{"ID" : "657", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.f_x_msb_4_l_table_U", "Parent" : "655"},
	{"ID" : "658", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.f_x_lsb_table_U", "Parent" : "655"},
	{"ID" : "659", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.f_x_msb_3_table_U", "Parent" : "655"},
	{"ID" : "660", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.f_x_msb_2_table_U", "Parent" : "655"},
	{"ID" : "661", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.exp_x_msb_1_table_U", "Parent" : "655"},
	{"ID" : "662", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.mul_44ns_42ns_86_1_1_U1790", "Parent" : "655"},
	{"ID" : "663", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.mul_50ns_48ns_98_1_1_U1791", "Parent" : "655"},
	{"ID" : "664", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.mul_50ns_50ns_100_1_1_U1792", "Parent" : "655"},
	{"ID" : "665", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_786.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "655"},
	{"ID" : "666", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804", "Parent" : "621", "Child" : ["667", "668", "669", "670", "671", "672", "673", "674", "675", "676"],
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
	{"ID" : "667", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.f_x_msb_4_h_table_U", "Parent" : "666"},
	{"ID" : "668", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.f_x_msb_4_l_table_U", "Parent" : "666"},
	{"ID" : "669", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.f_x_lsb_table_U", "Parent" : "666"},
	{"ID" : "670", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.f_x_msb_3_table_U", "Parent" : "666"},
	{"ID" : "671", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.f_x_msb_2_table_U", "Parent" : "666"},
	{"ID" : "672", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.exp_x_msb_1_table_U", "Parent" : "666"},
	{"ID" : "673", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.mul_44ns_42ns_86_1_1_U1790", "Parent" : "666"},
	{"ID" : "674", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.mul_50ns_48ns_98_1_1_U1791", "Parent" : "666"},
	{"ID" : "675", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.mul_50ns_50ns_100_1_1_U1792", "Parent" : "666"},
	{"ID" : "676", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_804.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "666"},
	{"ID" : "677", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822", "Parent" : "621", "Child" : ["678", "679", "680", "681", "682", "683", "684", "685", "686", "687"],
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
	{"ID" : "678", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.f_x_msb_4_h_table_U", "Parent" : "677"},
	{"ID" : "679", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.f_x_msb_4_l_table_U", "Parent" : "677"},
	{"ID" : "680", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.f_x_lsb_table_U", "Parent" : "677"},
	{"ID" : "681", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.f_x_msb_3_table_U", "Parent" : "677"},
	{"ID" : "682", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.f_x_msb_2_table_U", "Parent" : "677"},
	{"ID" : "683", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.exp_x_msb_1_table_U", "Parent" : "677"},
	{"ID" : "684", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.mul_44ns_42ns_86_1_1_U1790", "Parent" : "677"},
	{"ID" : "685", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.mul_50ns_48ns_98_1_1_U1791", "Parent" : "677"},
	{"ID" : "686", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.mul_50ns_50ns_100_1_1_U1792", "Parent" : "677"},
	{"ID" : "687", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_822.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "677"},
	{"ID" : "688", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840", "Parent" : "621", "Child" : ["689", "690", "691", "692", "693", "694", "695", "696", "697", "698"],
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
	{"ID" : "689", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.f_x_msb_4_h_table_U", "Parent" : "688"},
	{"ID" : "690", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.f_x_msb_4_l_table_U", "Parent" : "688"},
	{"ID" : "691", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.f_x_lsb_table_U", "Parent" : "688"},
	{"ID" : "692", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.f_x_msb_3_table_U", "Parent" : "688"},
	{"ID" : "693", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.f_x_msb_2_table_U", "Parent" : "688"},
	{"ID" : "694", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.exp_x_msb_1_table_U", "Parent" : "688"},
	{"ID" : "695", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.mul_44ns_42ns_86_1_1_U1790", "Parent" : "688"},
	{"ID" : "696", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.mul_50ns_48ns_98_1_1_U1791", "Parent" : "688"},
	{"ID" : "697", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.mul_50ns_50ns_100_1_1_U1792", "Parent" : "688"},
	{"ID" : "698", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_840.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "688"},
	{"ID" : "699", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858", "Parent" : "621", "Child" : ["700", "701", "702", "703", "704", "705", "706", "707", "708", "709"],
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
	{"ID" : "700", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.f_x_msb_4_h_table_U", "Parent" : "699"},
	{"ID" : "701", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.f_x_msb_4_l_table_U", "Parent" : "699"},
	{"ID" : "702", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.f_x_lsb_table_U", "Parent" : "699"},
	{"ID" : "703", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.f_x_msb_3_table_U", "Parent" : "699"},
	{"ID" : "704", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.f_x_msb_2_table_U", "Parent" : "699"},
	{"ID" : "705", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.exp_x_msb_1_table_U", "Parent" : "699"},
	{"ID" : "706", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.mul_44ns_42ns_86_1_1_U1790", "Parent" : "699"},
	{"ID" : "707", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.mul_50ns_48ns_98_1_1_U1791", "Parent" : "699"},
	{"ID" : "708", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.mul_50ns_50ns_100_1_1_U1792", "Parent" : "699"},
	{"ID" : "709", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_858.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "699"},
	{"ID" : "710", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876", "Parent" : "621", "Child" : ["711", "712", "713", "714", "715", "716", "717", "718", "719", "720"],
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
	{"ID" : "711", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.f_x_msb_4_h_table_U", "Parent" : "710"},
	{"ID" : "712", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.f_x_msb_4_l_table_U", "Parent" : "710"},
	{"ID" : "713", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.f_x_lsb_table_U", "Parent" : "710"},
	{"ID" : "714", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.f_x_msb_3_table_U", "Parent" : "710"},
	{"ID" : "715", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.f_x_msb_2_table_U", "Parent" : "710"},
	{"ID" : "716", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.exp_x_msb_1_table_U", "Parent" : "710"},
	{"ID" : "717", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.mul_44ns_42ns_86_1_1_U1790", "Parent" : "710"},
	{"ID" : "718", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.mul_50ns_48ns_98_1_1_U1791", "Parent" : "710"},
	{"ID" : "719", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.mul_50ns_50ns_100_1_1_U1792", "Parent" : "710"},
	{"ID" : "720", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_876.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "710"},
	{"ID" : "721", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894", "Parent" : "621", "Child" : ["722", "723", "724", "725", "726", "727", "728", "729", "730", "731"],
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
	{"ID" : "722", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.f_x_msb_4_h_table_U", "Parent" : "721"},
	{"ID" : "723", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.f_x_msb_4_l_table_U", "Parent" : "721"},
	{"ID" : "724", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.f_x_lsb_table_U", "Parent" : "721"},
	{"ID" : "725", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.f_x_msb_3_table_U", "Parent" : "721"},
	{"ID" : "726", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.f_x_msb_2_table_U", "Parent" : "721"},
	{"ID" : "727", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.exp_x_msb_1_table_U", "Parent" : "721"},
	{"ID" : "728", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.mul_44ns_42ns_86_1_1_U1790", "Parent" : "721"},
	{"ID" : "729", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.mul_50ns_48ns_98_1_1_U1791", "Parent" : "721"},
	{"ID" : "730", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.mul_50ns_50ns_100_1_1_U1792", "Parent" : "721"},
	{"ID" : "731", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_894.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "721"},
	{"ID" : "732", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912", "Parent" : "621", "Child" : ["733", "734", "735", "736", "737", "738", "739", "740", "741", "742"],
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
	{"ID" : "733", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.f_x_msb_4_h_table_U", "Parent" : "732"},
	{"ID" : "734", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.f_x_msb_4_l_table_U", "Parent" : "732"},
	{"ID" : "735", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.f_x_lsb_table_U", "Parent" : "732"},
	{"ID" : "736", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.f_x_msb_3_table_U", "Parent" : "732"},
	{"ID" : "737", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.f_x_msb_2_table_U", "Parent" : "732"},
	{"ID" : "738", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.exp_x_msb_1_table_U", "Parent" : "732"},
	{"ID" : "739", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.mul_44ns_42ns_86_1_1_U1790", "Parent" : "732"},
	{"ID" : "740", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.mul_50ns_48ns_98_1_1_U1791", "Parent" : "732"},
	{"ID" : "741", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.mul_50ns_50ns_100_1_1_U1792", "Parent" : "732"},
	{"ID" : "742", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_912.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "732"},
	{"ID" : "743", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930", "Parent" : "621", "Child" : ["744", "745", "746", "747", "748", "749", "750", "751", "752", "753"],
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
	{"ID" : "744", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.f_x_msb_4_h_table_U", "Parent" : "743"},
	{"ID" : "745", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.f_x_msb_4_l_table_U", "Parent" : "743"},
	{"ID" : "746", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.f_x_lsb_table_U", "Parent" : "743"},
	{"ID" : "747", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.f_x_msb_3_table_U", "Parent" : "743"},
	{"ID" : "748", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.f_x_msb_2_table_U", "Parent" : "743"},
	{"ID" : "749", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.exp_x_msb_1_table_U", "Parent" : "743"},
	{"ID" : "750", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.mul_44ns_42ns_86_1_1_U1790", "Parent" : "743"},
	{"ID" : "751", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.mul_50ns_48ns_98_1_1_U1791", "Parent" : "743"},
	{"ID" : "752", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.mul_50ns_50ns_100_1_1_U1792", "Parent" : "743"},
	{"ID" : "753", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_930.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "743"},
	{"ID" : "754", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948", "Parent" : "621", "Child" : ["755", "756", "757", "758", "759", "760", "761", "762", "763", "764"],
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
	{"ID" : "755", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.f_x_msb_4_h_table_U", "Parent" : "754"},
	{"ID" : "756", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.f_x_msb_4_l_table_U", "Parent" : "754"},
	{"ID" : "757", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.f_x_lsb_table_U", "Parent" : "754"},
	{"ID" : "758", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.f_x_msb_3_table_U", "Parent" : "754"},
	{"ID" : "759", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.f_x_msb_2_table_U", "Parent" : "754"},
	{"ID" : "760", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.exp_x_msb_1_table_U", "Parent" : "754"},
	{"ID" : "761", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.mul_44ns_42ns_86_1_1_U1790", "Parent" : "754"},
	{"ID" : "762", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.mul_50ns_48ns_98_1_1_U1791", "Parent" : "754"},
	{"ID" : "763", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.mul_50ns_50ns_100_1_1_U1792", "Parent" : "754"},
	{"ID" : "764", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_948.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "754"},
	{"ID" : "765", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966", "Parent" : "621", "Child" : ["766", "767", "768", "769", "770", "771", "772", "773", "774", "775"],
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
	{"ID" : "766", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.f_x_msb_4_h_table_U", "Parent" : "765"},
	{"ID" : "767", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.f_x_msb_4_l_table_U", "Parent" : "765"},
	{"ID" : "768", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.f_x_lsb_table_U", "Parent" : "765"},
	{"ID" : "769", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.f_x_msb_3_table_U", "Parent" : "765"},
	{"ID" : "770", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.f_x_msb_2_table_U", "Parent" : "765"},
	{"ID" : "771", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.exp_x_msb_1_table_U", "Parent" : "765"},
	{"ID" : "772", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.mul_44ns_42ns_86_1_1_U1790", "Parent" : "765"},
	{"ID" : "773", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.mul_50ns_48ns_98_1_1_U1791", "Parent" : "765"},
	{"ID" : "774", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.mul_50ns_50ns_100_1_1_U1792", "Parent" : "765"},
	{"ID" : "775", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_966.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "765"},
	{"ID" : "776", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984", "Parent" : "621", "Child" : ["777", "778", "779", "780", "781", "782", "783", "784", "785", "786"],
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
	{"ID" : "777", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.f_x_msb_4_h_table_U", "Parent" : "776"},
	{"ID" : "778", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.f_x_msb_4_l_table_U", "Parent" : "776"},
	{"ID" : "779", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.f_x_lsb_table_U", "Parent" : "776"},
	{"ID" : "780", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.f_x_msb_3_table_U", "Parent" : "776"},
	{"ID" : "781", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.f_x_msb_2_table_U", "Parent" : "776"},
	{"ID" : "782", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.exp_x_msb_1_table_U", "Parent" : "776"},
	{"ID" : "783", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.mul_44ns_42ns_86_1_1_U1790", "Parent" : "776"},
	{"ID" : "784", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.mul_50ns_48ns_98_1_1_U1791", "Parent" : "776"},
	{"ID" : "785", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.mul_50ns_50ns_100_1_1_U1792", "Parent" : "776"},
	{"ID" : "786", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_984.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "776"},
	{"ID" : "787", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002", "Parent" : "621", "Child" : ["788", "789", "790", "791", "792", "793", "794", "795", "796", "797"],
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
	{"ID" : "788", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.f_x_msb_4_h_table_U", "Parent" : "787"},
	{"ID" : "789", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.f_x_msb_4_l_table_U", "Parent" : "787"},
	{"ID" : "790", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.f_x_lsb_table_U", "Parent" : "787"},
	{"ID" : "791", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.f_x_msb_3_table_U", "Parent" : "787"},
	{"ID" : "792", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.f_x_msb_2_table_U", "Parent" : "787"},
	{"ID" : "793", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.exp_x_msb_1_table_U", "Parent" : "787"},
	{"ID" : "794", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.mul_44ns_42ns_86_1_1_U1790", "Parent" : "787"},
	{"ID" : "795", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.mul_50ns_48ns_98_1_1_U1791", "Parent" : "787"},
	{"ID" : "796", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.mul_50ns_50ns_100_1_1_U1792", "Parent" : "787"},
	{"ID" : "797", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.grp_exp_32_10_s_fu_1002.mac_muladd_4ns_3ns_9ns_10_4_1_U1793", "Parent" : "787"},
	{"ID" : "798", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_elu_activation_fu_1951.flow_control_loop_pipe_sequential_init_U", "Parent" : "621"},
	{"ID" : "799", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_store_fu_2031", "Parent" : "0", "Child" : ["800"],
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
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "mem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_buffer_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_4", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_5", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_6", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_7", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_8", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_9", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_10", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_12", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_13", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_14", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "BRAM_buffer_2_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Port" : "BRAM_buffer_2_15", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "800", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_store_fu_2031.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82", "Parent" : "799", "Child" : ["801", "802"],
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
	{"ID" : "801", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_store_fu_2031.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82.sparsemux_33_4_32_1_1_U1837", "Parent" : "800"},
	{"ID" : "802", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_store_fu_2031.grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82.flow_control_loop_pipe_sequential_init_U", "Parent" : "800"},
	{"ID" : "803", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "804", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mem1_m_axi_U", "Parent" : "0"},
	{"ID" : "805", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mem2_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top {
		mem1 {Type I LastRead 1 FirstWrite -1}
		mem2 {Type O LastRead 3 FirstWrite 2}
		DRAM_image_input {Type I LastRead 0 FirstWrite -1}
		DRAM_conv_weight {Type I LastRead 0 FirstWrite -1}
		DRAM_conv_bias {Type I LastRead 0 FirstWrite -1}
		DRAM_image_output {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_image_input_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_0_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_1_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_2_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_3_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_4_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_5_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_6_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_7_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_8_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_9_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_10_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_11_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_12_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_13_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_14_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_weight_15_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_conv_bias_15 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead -1 FirstWrite -1}
		f_x_msb_4_h_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_4_l_table {Type I LastRead -1 FirstWrite -1}
		f_x_lsb_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_3_table {Type I LastRead -1 FirstWrite -1}
		f_x_msb_2_table {Type I LastRead -1 FirstWrite -1}
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}
		BRAM_buffer_2_0 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_1 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_2 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_3 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_4 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_5 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_6 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_7 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_8 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_9 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_10 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_11 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_12 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_13 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_14 {Type IO LastRead -1 FirstWrite -1}
		BRAM_buffer_2_15 {Type IO LastRead -1 FirstWrite -1}}
	load_image {
		mem1 {Type I LastRead 1 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_15 {Type O LastRead -1 FirstWrite 2}}
	load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3 {
		mem1 {Type I LastRead 1 FirstWrite -1}
		sext_ln35 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_image_input_15 {Type O LastRead -1 FirstWrite 2}}
	load_weight {
		mem1 {Type I LastRead 1 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_15 {Type O LastRead -1 FirstWrite 2}}
	load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s {
		mem1 {Type I LastRead 1 FirstWrite -1}
		sext_ln47 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_0_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_1_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_2_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_3_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_4_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_5_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_6_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_7_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_8_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_9_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_10_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_11_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_12_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_13_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_14_15 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_0 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_1 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_2 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_3 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_4 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_5 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_6 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_7 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_8 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_9 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_10 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_11 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_12 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_13 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_14 {Type O LastRead -1 FirstWrite 2}
		BRAM_conv_weight_15_15 {Type O LastRead -1 FirstWrite 2}}
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
		BRAM_conv_bias_15 {Type O LastRead -1 FirstWrite 2}}
	conv2d {
		BRAM_conv_bias_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}
		BRAM_image_input_0 {Type I LastRead 6 FirstWrite -1}
		BRAM_conv_weight_0_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_1 {Type I LastRead 8 FirstWrite -1}
		BRAM_conv_weight_0_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_2 {Type I LastRead 10 FirstWrite -1}
		BRAM_conv_weight_0_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_3 {Type I LastRead 12 FirstWrite -1}
		BRAM_conv_weight_0_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_4 {Type I LastRead 14 FirstWrite -1}
		BRAM_conv_weight_0_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_5 {Type I LastRead 16 FirstWrite -1}
		BRAM_conv_weight_0_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_6 {Type I LastRead 18 FirstWrite -1}
		BRAM_conv_weight_0_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_7 {Type I LastRead 20 FirstWrite -1}
		BRAM_conv_weight_0_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_8 {Type I LastRead 22 FirstWrite -1}
		BRAM_conv_weight_0_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_9 {Type I LastRead 24 FirstWrite -1}
		BRAM_conv_weight_0_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_10 {Type I LastRead 26 FirstWrite -1}
		BRAM_conv_weight_0_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_11 {Type I LastRead 28 FirstWrite -1}
		BRAM_conv_weight_0_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_12 {Type I LastRead 30 FirstWrite -1}
		BRAM_conv_weight_0_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_13 {Type I LastRead 32 FirstWrite -1}
		BRAM_conv_weight_0_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_14 {Type I LastRead 34 FirstWrite -1}
		BRAM_conv_weight_0_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input_15 {Type I LastRead 34 FirstWrite -1}
		BRAM_conv_weight_0_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_1_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_2_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_3_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_4_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_5_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_6_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_7_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_8_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_9_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_10_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_11_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_12_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_13_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_14_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_15_15 {Type I LastRead 0 FirstWrite -1}}
	conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3 {
		BRAM_conv_bias_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_1 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_bias_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_1 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_2 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_3 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_4 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_5 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_6 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_7 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_8 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_9 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_10 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_11 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_12 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_13 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_14 {Type O LastRead -1 FirstWrite 1}
		BRAM_buffer_1_15 {Type O LastRead -1 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_9 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_0 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
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
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_92 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_2 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_93 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_3 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_94 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_4 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_95 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_5 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_96 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_6 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_97 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_7 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_98 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_8 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_99 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_9 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_910 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_10 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_911 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_11 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_912 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_12 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_913 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_13 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_914 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_14 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_121_915 {
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		lshr_ln1 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		sext_ln121_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight_0_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_0 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_1_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_2_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_2 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_3_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_3 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_4_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_4 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_5_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_5 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_6_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_6 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_7_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_7 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_8_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_8 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_9_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_9 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_10_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_10 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_11_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_11 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_12_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_12 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_13_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_13 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_14_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_14 {Type IO LastRead 0 FirstWrite 1}
		BRAM_conv_weight_15_15 {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1_15 {Type IO LastRead 0 FirstWrite 1}}
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
		exp_x_msb_1_table {Type I LastRead -1 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "41059", "Max" : "157159"}
	, {"Name" : "Interval", "Min" : "41060", "Max" : "157160"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mem1 { m_axi {  { m_axi_mem1_AWVALID VALID 1 1 }  { m_axi_mem1_AWREADY READY 0 1 }  { m_axi_mem1_AWADDR ADDR 1 64 }  { m_axi_mem1_AWID ID 1 1 }  { m_axi_mem1_AWLEN SIZE 1 8 }  { m_axi_mem1_AWSIZE BURST 1 3 }  { m_axi_mem1_AWBURST LOCK 1 2 }  { m_axi_mem1_AWLOCK CACHE 1 2 }  { m_axi_mem1_AWCACHE PROT 1 4 }  { m_axi_mem1_AWPROT QOS 1 3 }  { m_axi_mem1_AWQOS REGION 1 4 }  { m_axi_mem1_AWREGION USER 1 4 }  { m_axi_mem1_AWUSER DATA 1 1 }  { m_axi_mem1_WVALID VALID 1 1 }  { m_axi_mem1_WREADY READY 0 1 }  { m_axi_mem1_WDATA FIFONUM 1 32 }  { m_axi_mem1_WSTRB STRB 1 4 }  { m_axi_mem1_WLAST LAST 1 1 }  { m_axi_mem1_WID ID 1 1 }  { m_axi_mem1_WUSER DATA 1 1 }  { m_axi_mem1_ARVALID VALID 1 1 }  { m_axi_mem1_ARREADY READY 0 1 }  { m_axi_mem1_ARADDR ADDR 1 64 }  { m_axi_mem1_ARID ID 1 1 }  { m_axi_mem1_ARLEN SIZE 1 8 }  { m_axi_mem1_ARSIZE BURST 1 3 }  { m_axi_mem1_ARBURST LOCK 1 2 }  { m_axi_mem1_ARLOCK CACHE 1 2 }  { m_axi_mem1_ARCACHE PROT 1 4 }  { m_axi_mem1_ARPROT QOS 1 3 }  { m_axi_mem1_ARQOS REGION 1 4 }  { m_axi_mem1_ARREGION USER 1 4 }  { m_axi_mem1_ARUSER DATA 1 1 }  { m_axi_mem1_RVALID VALID 0 1 }  { m_axi_mem1_RREADY READY 1 1 }  { m_axi_mem1_RDATA FIFONUM 0 32 }  { m_axi_mem1_RLAST LAST 0 1 }  { m_axi_mem1_RID ID 0 1 }  { m_axi_mem1_RUSER DATA 0 1 }  { m_axi_mem1_RRESP RESP 0 2 }  { m_axi_mem1_BVALID VALID 0 1 }  { m_axi_mem1_BREADY READY 1 1 }  { m_axi_mem1_BRESP RESP 0 2 }  { m_axi_mem1_BID ID 0 1 }  { m_axi_mem1_BUSER DATA 0 1 } } }
	mem2 { m_axi {  { m_axi_mem2_AWVALID VALID 1 1 }  { m_axi_mem2_AWREADY READY 0 1 }  { m_axi_mem2_AWADDR ADDR 1 64 }  { m_axi_mem2_AWID ID 1 1 }  { m_axi_mem2_AWLEN SIZE 1 8 }  { m_axi_mem2_AWSIZE BURST 1 3 }  { m_axi_mem2_AWBURST LOCK 1 2 }  { m_axi_mem2_AWLOCK CACHE 1 2 }  { m_axi_mem2_AWCACHE PROT 1 4 }  { m_axi_mem2_AWPROT QOS 1 3 }  { m_axi_mem2_AWQOS REGION 1 4 }  { m_axi_mem2_AWREGION USER 1 4 }  { m_axi_mem2_AWUSER DATA 1 1 }  { m_axi_mem2_WVALID VALID 1 1 }  { m_axi_mem2_WREADY READY 0 1 }  { m_axi_mem2_WDATA FIFONUM 1 32 }  { m_axi_mem2_WSTRB STRB 1 4 }  { m_axi_mem2_WLAST LAST 1 1 }  { m_axi_mem2_WID ID 1 1 }  { m_axi_mem2_WUSER DATA 1 1 }  { m_axi_mem2_ARVALID VALID 1 1 }  { m_axi_mem2_ARREADY READY 0 1 }  { m_axi_mem2_ARADDR ADDR 1 64 }  { m_axi_mem2_ARID ID 1 1 }  { m_axi_mem2_ARLEN SIZE 1 8 }  { m_axi_mem2_ARSIZE BURST 1 3 }  { m_axi_mem2_ARBURST LOCK 1 2 }  { m_axi_mem2_ARLOCK CACHE 1 2 }  { m_axi_mem2_ARCACHE PROT 1 4 }  { m_axi_mem2_ARPROT QOS 1 3 }  { m_axi_mem2_ARQOS REGION 1 4 }  { m_axi_mem2_ARREGION USER 1 4 }  { m_axi_mem2_ARUSER DATA 1 1 }  { m_axi_mem2_RVALID VALID 0 1 }  { m_axi_mem2_RREADY READY 1 1 }  { m_axi_mem2_RDATA FIFONUM 0 32 }  { m_axi_mem2_RLAST LAST 0 1 }  { m_axi_mem2_RID ID 0 1 }  { m_axi_mem2_RUSER DATA 0 1 }  { m_axi_mem2_RRESP RESP 0 2 }  { m_axi_mem2_BVALID VALID 0 1 }  { m_axi_mem2_BREADY READY 1 1 }  { m_axi_mem2_BRESP RESP 0 2 }  { m_axi_mem2_BID ID 0 1 }  { m_axi_mem2_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict mem1 { CHANNEL_NUM 0 BUNDLE mem1 NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}
dict set maxi_interface_dict mem2 { CHANNEL_NUM 0 BUNDLE mem2 NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE WRITE_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ mem1 1 }
	{ mem2 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ mem1 1 }
	{ mem2 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
