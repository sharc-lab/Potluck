# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
DRAM_image_input { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
DRAM_conv_weight { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
DRAM_conv_bias { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
DRAM_image_output { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


