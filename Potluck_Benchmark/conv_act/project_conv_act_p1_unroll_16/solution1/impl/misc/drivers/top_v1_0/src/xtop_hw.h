// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1.2 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of DRAM_image_input
//        bit 31~0 - DRAM_image_input[31:0] (Read/Write)
// 0x14 : Data signal of DRAM_image_input
//        bit 31~0 - DRAM_image_input[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of DRAM_conv_weight
//        bit 31~0 - DRAM_conv_weight[31:0] (Read/Write)
// 0x20 : Data signal of DRAM_conv_weight
//        bit 31~0 - DRAM_conv_weight[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of DRAM_conv_bias
//        bit 31~0 - DRAM_conv_bias[31:0] (Read/Write)
// 0x2c : Data signal of DRAM_conv_bias
//        bit 31~0 - DRAM_conv_bias[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of DRAM_image_output
//        bit 31~0 - DRAM_image_output[31:0] (Read/Write)
// 0x38 : Data signal of DRAM_image_output
//        bit 31~0 - DRAM_image_output[63:32] (Read/Write)
// 0x3c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTOP_CONTROL_ADDR_AP_CTRL                0x00
#define XTOP_CONTROL_ADDR_GIE                    0x04
#define XTOP_CONTROL_ADDR_IER                    0x08
#define XTOP_CONTROL_ADDR_ISR                    0x0c
#define XTOP_CONTROL_ADDR_DRAM_IMAGE_INPUT_DATA  0x10
#define XTOP_CONTROL_BITS_DRAM_IMAGE_INPUT_DATA  64
#define XTOP_CONTROL_ADDR_DRAM_CONV_WEIGHT_DATA  0x1c
#define XTOP_CONTROL_BITS_DRAM_CONV_WEIGHT_DATA  64
#define XTOP_CONTROL_ADDR_DRAM_CONV_BIAS_DATA    0x28
#define XTOP_CONTROL_BITS_DRAM_CONV_BIAS_DATA    64
#define XTOP_CONTROL_ADDR_DRAM_IMAGE_OUTPUT_DATA 0x34
#define XTOP_CONTROL_BITS_DRAM_IMAGE_OUTPUT_DATA 64

