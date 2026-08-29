set SynModuleInfo {
  {SRCNAME load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3 MODELNAME load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3 RTLNAME top_load_image_Pipeline_VITIS_LOOP_35_1_VITIS_LOOP_36_2_VITIS_LOOP_37_3
    SUBMODULES {
      {MODELNAME top_flow_control_loop_pipe_sequential_init RTLNAME top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME load_image MODELNAME load_image RTLNAME top_load_image}
  {SRCNAME load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_ MODELNAME load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s RTLNAME top_load_weight_Pipeline_VITIS_LOOP_47_1_VITIS_LOOP_48_2_VITIS_LOOP_49_3_VITIS_LOOP_s}
  {SRCNAME load_weight MODELNAME load_weight RTLNAME top_load_weight}
  {SRCNAME load_bias_Pipeline_VITIS_LOOP_61_1 MODELNAME load_bias_Pipeline_VITIS_LOOP_61_1 RTLNAME top_load_bias_Pipeline_VITIS_LOOP_61_1}
  {SRCNAME load_bias MODELNAME load_bias RTLNAME top_load_bias}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3 MODELNAME conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_102_1_VITIS_LOOP_103_2_VITIS_LOOP_104_3}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_9 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_9 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_9
    SUBMODULES {
      {MODELNAME top_mul_32s_32s_54_1_1 RTLNAME top_mul_32s_32s_54_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_91 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_91 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_91}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_92 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_92 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_92}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_93 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_93 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_93}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_94 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_94 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_94}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_95 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_95 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_95}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_96 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_96 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_96}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_97 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_97 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_97}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_98 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_98 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_98}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_99 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_99 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_99}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_910 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_910 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_910}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_911 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_911 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_911}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_912 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_912 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_912}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_913 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_913 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_913}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_914 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_914 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_914}
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_121_915 MODELNAME conv2d_Pipeline_VITIS_LOOP_121_915 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_121_915}
  {SRCNAME conv2d MODELNAME conv2d RTLNAME top_conv2d}
  {SRCNAME {exp<32, 10>} MODELNAME exp_32_10_s RTLNAME top_exp_32_10_s
    SUBMODULES {
      {MODELNAME top_mul_44ns_42ns_86_1_1 RTLNAME top_mul_44ns_42ns_86_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_mul_50ns_48ns_98_1_1 RTLNAME top_mul_50ns_48ns_98_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_mul_50ns_50ns_100_1_1 RTLNAME top_mul_50ns_50ns_100_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_mac_muladd_4ns_3ns_9ns_10_4_1 RTLNAME top_mac_muladd_4ns_3ns_9ns_10_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME top_exp_32_10_s_f_x_msb_4_h_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_f_x_msb_4_h_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_exp_32_10_s_f_x_msb_4_l_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_f_x_msb_4_l_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_exp_32_10_s_f_x_lsb_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_f_x_lsb_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_exp_32_10_s_f_x_msb_3_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_f_x_msb_3_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_exp_32_10_s_f_x_msb_2_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_f_x_msb_2_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_exp_32_10_s_exp_x_msb_1_table_ROM_AUTO_1R RTLNAME top_exp_32_10_s_exp_x_msb_1_table_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME elu_activation MODELNAME elu_activation RTLNAME top_elu_activation}
  {SRCNAME store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3 MODELNAME store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3 RTLNAME top_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3
    SUBMODULES {
      {MODELNAME top_sparsemux_33_4_32_1_1 RTLNAME top_sparsemux_33_4_32_1_1 BINDTYPE op TYPE sparsemux IMPL auto}
    }
  }
  {SRCNAME store MODELNAME store RTLNAME top_store}
  {SRCNAME top MODELNAME top RTLNAME top IS_TOP 1
    SUBMODULES {
      {MODELNAME top_BRAM_image_input_0_RAM_AUTO_1R1W RTLNAME top_BRAM_image_input_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_conv_weight_0_0_RAM_AUTO_1R1W RTLNAME top_BRAM_conv_weight_0_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_conv_bias_0_RAM_AUTO_1R1W RTLNAME top_BRAM_conv_bias_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_buffer_1_0_RAM_AUTO_1R1W RTLNAME top_BRAM_buffer_1_0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_mem1_m_axi RTLNAME top_mem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_mem2_m_axi RTLNAME top_mem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_control_s_axi RTLNAME top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
