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
  {SRCNAME conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9 MODELNAME conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9 RTLNAME top_conv2d_Pipeline_VITIS_LOOP_119_8_VITIS_LOOP_121_9
    SUBMODULES {
      {MODELNAME top_mul_32s_32s_54_1_1 RTLNAME top_mul_32s_32s_54_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv2d MODELNAME conv2d RTLNAME top_conv2d}
  {SRCNAME leaky_relu_activation MODELNAME leaky_relu_activation RTLNAME top_leaky_relu_activation}
  {SRCNAME store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3 MODELNAME store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3 RTLNAME top_store_Pipeline_VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3}
  {SRCNAME store MODELNAME store RTLNAME top_store}
  {SRCNAME top MODELNAME top RTLNAME top IS_TOP 1
    SUBMODULES {
      {MODELNAME top_BRAM_image_input_RAM_AUTO_1R1W RTLNAME top_BRAM_image_input_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_conv_weight_RAM_AUTO_1R1W RTLNAME top_BRAM_conv_weight_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_conv_bias_RAM_AUTO_1R1W RTLNAME top_BRAM_conv_bias_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_BRAM_buffer_1_RAM_AUTO_1R1W RTLNAME top_BRAM_buffer_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_mem1_m_axi RTLNAME top_mem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_mem2_m_axi RTLNAME top_mem2_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME top_control_s_axi RTLNAME top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
