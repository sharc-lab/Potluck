set moduleName conv2d
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
set C_modelName {conv2d}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict BRAM_conv_bias { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_buffer_1 { MEM_WIDTH 32 MEM_SIZE 800 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_image_input { MEM_WIDTH 32 MEM_SIZE 800 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict BRAM_conv_weight { MEM_WIDTH 32 MEM_SIZE 2304 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ BRAM_conv_bias int 32 regular {array 8 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_buffer_1 int 32 regular {array 200 { 0 1 } 1 1 } {global 2}  }
	{ BRAM_image_input int 32 regular {array 200 { 1 3 } 1 1 } {global 0}  }
	{ BRAM_conv_weight int 32 regular {array 576 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "BRAM_conv_bias", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_buffer_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "BRAM_image_input", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "BRAM_conv_weight", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ BRAM_conv_bias_address0 sc_out sc_lv 3 signal 0 } 
	{ BRAM_conv_bias_ce0 sc_out sc_logic 1 signal 0 } 
	{ BRAM_conv_bias_q0 sc_in sc_lv 32 signal 0 } 
	{ BRAM_buffer_1_address0 sc_out sc_lv 8 signal 1 } 
	{ BRAM_buffer_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ BRAM_buffer_1_we0 sc_out sc_logic 1 signal 1 } 
	{ BRAM_buffer_1_d0 sc_out sc_lv 32 signal 1 } 
	{ BRAM_buffer_1_address1 sc_out sc_lv 8 signal 1 } 
	{ BRAM_buffer_1_ce1 sc_out sc_logic 1 signal 1 } 
	{ BRAM_buffer_1_q1 sc_in sc_lv 32 signal 1 } 
	{ BRAM_image_input_address0 sc_out sc_lv 8 signal 2 } 
	{ BRAM_image_input_ce0 sc_out sc_logic 1 signal 2 } 
	{ BRAM_image_input_q0 sc_in sc_lv 32 signal 2 } 
	{ BRAM_conv_weight_address0 sc_out sc_lv 10 signal 3 } 
	{ BRAM_conv_weight_ce0 sc_out sc_logic 1 signal 3 } 
	{ BRAM_conv_weight_q0 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "BRAM_conv_bias_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "BRAM_conv_bias", "role": "address0" }} , 
 	{ "name": "BRAM_conv_bias_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_bias", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_bias_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_bias", "role": "q0" }} , 
 	{ "name": "BRAM_buffer_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "address0" }} , 
 	{ "name": "BRAM_buffer_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "ce0" }} , 
 	{ "name": "BRAM_buffer_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "we0" }} , 
 	{ "name": "BRAM_buffer_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "d0" }} , 
 	{ "name": "BRAM_buffer_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "address1" }} , 
 	{ "name": "BRAM_buffer_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "ce1" }} , 
 	{ "name": "BRAM_buffer_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_buffer_1", "role": "q1" }} , 
 	{ "name": "BRAM_image_input_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "BRAM_image_input", "role": "address0" }} , 
 	{ "name": "BRAM_image_input_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_image_input", "role": "ce0" }} , 
 	{ "name": "BRAM_image_input_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_image_input", "role": "q0" }} , 
 	{ "name": "BRAM_conv_weight_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "BRAM_conv_weight", "role": "address0" }} , 
 	{ "name": "BRAM_conv_weight_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "BRAM_conv_weight", "role": "ce0" }} , 
 	{ "name": "BRAM_conv_weight_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "BRAM_conv_weight", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3"],
		"CDFG" : "conv2d",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "864", "EstimateLatencyMax" : "15714",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BRAM_conv_bias", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_84", "Port" : "BRAM_conv_bias", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_buffer_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92", "Port" : "BRAM_buffer_1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_84", "Port" : "BRAM_buffer_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "BRAM_image_input", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92", "Port" : "BRAM_image_input", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "BRAM_conv_weight", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92", "Port" : "BRAM_conv_weight", "Inst_start_state" : "6", "Inst_end_state" : "7"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_115_7", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_114_6", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_113_5", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_112_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "7", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_84", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "202", "EstimateLatencyMax" : "202",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "BRAM_conv_bias", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92", "Parent" : "0", "Child" : ["4", "5"],
		"CDFG" : "conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln118", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln112", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln113", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln114", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln115", "Type" : "None", "Direction" : "I"},
			{"Name" : "BRAM_image_input", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_conv_weight", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "BRAM_buffer_1", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_119_8_VITIS_LOOP_121_9", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92.mul_32s_32s_54_1_1_U21", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9_fu_92.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"}]}


set ArgLastReadFirstWriteLatency {
	conv2d {
		BRAM_conv_bias {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1 {Type IO LastRead 0 FirstWrite 1}
		BRAM_image_input {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight {Type I LastRead 0 FirstWrite -1}}
	conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3 {
		BRAM_conv_bias {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1 {Type O LastRead -1 FirstWrite 1}}
	conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9 {
		p_cast {Type I LastRead 0 FirstWrite -1}
		sext_ln118 {Type I LastRead 0 FirstWrite -1}
		zext_ln112 {Type I LastRead 0 FirstWrite -1}
		zext_ln113 {Type I LastRead 0 FirstWrite -1}
		zext_ln114 {Type I LastRead 0 FirstWrite -1}
		zext_ln115 {Type I LastRead 0 FirstWrite -1}
		BRAM_image_input {Type I LastRead 0 FirstWrite -1}
		BRAM_conv_weight {Type I LastRead 0 FirstWrite -1}
		BRAM_buffer_1 {Type IO LastRead 0 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "864", "Max" : "15714"}
	, {"Name" : "Interval", "Min" : "864", "Max" : "15714"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	BRAM_conv_bias { ap_memory {  { BRAM_conv_bias_address0 mem_address 1 3 }  { BRAM_conv_bias_ce0 mem_ce 1 1 }  { BRAM_conv_bias_q0 mem_dout 0 32 } } }
	BRAM_buffer_1 { ap_memory {  { BRAM_buffer_1_address0 mem_address 1 8 }  { BRAM_buffer_1_ce0 mem_ce 1 1 }  { BRAM_buffer_1_we0 mem_we 1 1 }  { BRAM_buffer_1_d0 mem_din 1 32 }  { BRAM_buffer_1_address1 MemPortADDR2 1 8 }  { BRAM_buffer_1_ce1 MemPortCE2 1 1 }  { BRAM_buffer_1_q1 MemPortDOUT2 0 32 } } }
	BRAM_image_input { ap_memory {  { BRAM_image_input_address0 mem_address 1 8 }  { BRAM_image_input_ce0 mem_ce 1 1 }  { BRAM_image_input_q0 mem_dout 0 32 } } }
	BRAM_conv_weight { ap_memory {  { BRAM_conv_weight_address0 mem_address 1 10 }  { BRAM_conv_weight_ce0 mem_ce 1 1 }  { BRAM_conv_weight_q0 mem_dout 0 32 } } }
}
