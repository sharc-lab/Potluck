set ModuleHierarchy {[{
"Name" : "top","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_load_image_fu_742","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3_fu_79","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3","ID" : "3","Type" : "pipeline"},]},]},
	{"Name" : "grp_load_weight_fu_781","ID" : "4","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s_fu_559","ID" : "5","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_50_4","ID" : "6","Type" : "pipeline"},]},]},
	{"Name" : "grp_load_bias_fu_1300","ID" : "7","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_load_bias_Pipeline_VITIS_LOOP_61_1_fu_79","ID" : "8","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_61_1","ID" : "9","Type" : "pipeline"},]},]},
	{"Name" : "grp_conv2d_fu_1339","ID" : "10","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3_fu_957","ID" : "11","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3","ID" : "12","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_112_4","ID" : "13","Type" : "no",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_113_5","ID" : "14","Type" : "no",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_114_6","ID" : "15","Type" : "no",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_115_7","ID" : "16","Type" : "no",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_119_8","ID" : "17","Type" : "no",
						"SubInsts" : [
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_9_fu_1025","ID" : "18","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "19","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_91_fu_1103","ID" : "20","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "21","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_92_fu_1181","ID" : "22","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "23","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_93_fu_1259","ID" : "24","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "25","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_94_fu_1337","ID" : "26","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "27","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_95_fu_1415","ID" : "28","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "29","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_96_fu_1493","ID" : "30","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "31","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_97_fu_1571","ID" : "32","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "33","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_98_fu_1649","ID" : "34","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "35","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_99_fu_1727","ID" : "36","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "37","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_910_fu_1805","ID" : "38","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "39","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_911_fu_1883","ID" : "40","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "41","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_912_fu_1961","ID" : "42","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "43","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_913_fu_2039","ID" : "44","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "45","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_914_fu_2117","ID" : "46","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "47","Type" : "pipeline"},]},
						{"Name" : "grp_conv2d_Pipeline_VITIS_LOOP_121_915_fu_2195","ID" : "48","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_121_9","ID" : "49","Type" : "pipeline"},]},]},]},]},]},]},]},
	{"Name" : "grp_elu_activation_fu_1951","ID" : "50","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_252_1_VITIS_LOOP_253_2_VITIS_LOOP_254_3","ID" : "51","Type" : "pipeline",
		"SubInsts" : [
		{"Name" : "grp_exp_32_10_s_fu_732","ID" : "52","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_750","ID" : "53","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_768","ID" : "54","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_786","ID" : "55","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_804","ID" : "56","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_822","ID" : "57","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_840","ID" : "58","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_858","ID" : "59","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_876","ID" : "60","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_894","ID" : "61","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_912","ID" : "62","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_930","ID" : "63","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_948","ID" : "64","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_966","ID" : "65","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_984","ID" : "66","Type" : "pipeline"},
		{"Name" : "grp_exp_32_10_s_fu_1002","ID" : "67","Type" : "pipeline"},]},]},
	{"Name" : "grp_store_fu_2031","ID" : "68","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3_fu_82","ID" : "69","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3","ID" : "70","Type" : "pipeline"},]},]},]
}]}