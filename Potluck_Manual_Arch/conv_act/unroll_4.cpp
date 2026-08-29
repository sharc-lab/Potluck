#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ap_fixed.h>
#include <hls_math.h>
#include <stdlib.h>
#include <cstdint>
#include <hls_math.h>

#include "hls_stream.h"
#include "ap_axi_sdata.h"   // for ap_axis

using namespace std;

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<64>

#define IN_C 8
#define OUT_C 8
#define FW 5
#define FH 5
#define K 3

#define N 20


void load_image(data_t input[IN_C][FW][FH], data_t output[IN_C][FW][FH])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < IN_C; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}

void load_weight(data_t input[OUT_C][IN_C][K][K], data_t output[OUT_C][IN_C][K][K])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < IN_C; idx1++) {
            for (int idx2 = 0; idx2 < K; idx2++) {
                for (int idx3 = 0; idx3 < K; idx3++) {
                    output[idx0][idx1][idx2][idx3] = input[idx0][idx1][idx2][idx3];
                }
            }
        }
    }
}

void load_bias(data_t input[OUT_C], data_t output[OUT_C])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        output[idx0] = input[idx0];
    }
}

/*
 * Auto-generated Convolution HLS Code (with optional bias and grouping)
 *
 * Dimensions:
 *   Input  : [64][14][14]
 *   Kernel : [64][64][3][3]
 *   Output : [64][14][14]
 *
 * Data type: ap_fixed<16, 5>
 *
 * If bias is included, a 1D bias array of size [64] is expected.
 * For group convolution, we assume:
 *   64 % groups == 0
 *   64 % groups == 0
 */

// Use a typedef for the data type

//////////////////////////////////////////
// Begin: CONV2D FUNCTION (co in the innermost loop)
//////////////////////////////////////////

void conv2d(
    data_t input[IN_C][FW][FH],
    data_t kernel[OUT_C][IN_C][K][K],
    data_t bias[OUT_C],
    data_t output[OUT_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=4 dim=2
    #pragma HLS array_partition variable=bias   type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1
    // Initialize output to bias[co], with co in the innermost loop
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=4
                output[co][i][j] = bias[co];
            }
        }
    }

    // Perform convolution (co in the innermost loop)
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int kh = 0; kh < K; kh++) {
                for (int kw = 0; kw < K; kw++) {
                    int in_row = i * 1 - 1 + kh;
                    int in_col = j * 1 - 1 + kw;
                    if (in_row >= 0 && in_row < FW && in_col >= 0 && in_col < FH) {
                        for (int ci = 0; ci < IN_C; ci++) {
                        #pragma HLS unroll factor=4
                            for (int co = 0; co < OUT_C; co++) {
                            #pragma HLS unroll factor=4
                                output[co][i][j] += input[ci][in_row][in_col] * kernel[co][ci][kh][kw];
                            }
                        }
                    }
                }
            }
        }
    }
}

void store(data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}


void matrix_add (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
                #pragma HLS unroll factor=4
                output[idx0][idx1][idx2] = 2 * input[idx0][idx1][idx2] + 1;
            }
        }
    }
}

void relu_activation(
    data_t input [OUT_C][FW][FH],
    data_t output[OUT_C][FW][FH]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1

    for (int y = 0; y < FW;  y++) {
        for (int x = 0; x < FH; x++) {
            for (int c = 0; c < OUT_C; c++) {
                #pragma HLS unroll factor=4
                data_t v = input[c][y][x];
                // both branches are data_t, so no ambiguous conversion
                output[c][y][x] = (v > data_t(0)) ? v : data_t(0);
            }
        }
    }
}

void leaky_relu_activation(
    data_t input [OUT_C][FW][FH],
    data_t output[OUT_C][FW][FH]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1

    const data_t alpha = data_t(0.1);  // negative slope

    for (int y = 0; y < FW;  y++) {
        for (int x = 0; x < FH; x++) {
            for (int c = 0; c < OUT_C; c++) {
                #pragma HLS unroll factor=4
                data_t v   = input[c][y][x];
                data_t neg = alpha * v;        // now neg is data_t
                output[c][y][x] = (v > data_t(0)) ? v : neg;
            }
        }
    }
}

void sigmoid_activation (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
                #pragma HLS unroll factor=4
                data_t val     = input[idx0][idx1][idx2];
                data_t exp_val = hls::exp(-val);
                output[idx0][idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
            }
        }
    }
}

void elu_activation(
    data_t input [OUT_C][FW][FH],
    data_t output[OUT_C][FW][FH]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1
    const data_t alpha = data_t(1.0);  // scaling factor for negative inputs
    for (int y = 0; y < FW;  y++) {
        for (int x = 0; x < FH; x++) {
            for (int c = 0; c < OUT_C; c++) {
                #pragma HLS unroll factor=4
                data_t v = input[c][y][x];
                if (v > data_t(0)) {
                    output[c][y][x] = v;
                } else {
                    // alpha * (exp(v) - 1)
                    output[c][y][x] = alpha * (hls::exp(v) - data_t(1));
                }
            }
        }
    }
}


void tanh_activation (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=4 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=4 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++) {
        for (int idx2 = 0; idx2 < FH; idx2++) {
            for (int idx0 = 0; idx0 < OUT_C; idx0++) {
                #pragma HLS unroll factor=4
                data_t val    = input[idx0][idx1][idx2];
                // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
                data_t exp2x  = hls::exp((data_t)2 * val);
                output[idx0][idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
            }
        }
    }
}

void load_inst(DATA_TYPE_INST *inst_dram, hls::stream<DATA_TYPE_INST, 1> &fifo, int n_inst)
{
#pragma HLS inline off
    for (int i = 0; i < n_inst; i++) {
        DATA_TYPE_INST instruction = inst_dram[i];
        fifo.write(instruction);
    }
  
}

void decode_inst(hls::stream<DATA_TYPE_INST, 1> &fifo,
                data_t DRAM_image_input[IN_C][FW][FH], 
                data_t DRAM_conv_weight[OUT_C][IN_C][K][K], 
                data_t DRAM_conv_bias[OUT_C], 
                data_t DRAM_image_output[OUT_C][FW][FH])
{
    DATA_TYPE_INST instruction;

    static data_t BRAM_image_input[IN_C][FW][FH];
    static data_t BRAM_conv_weight[OUT_C][IN_C][K][K];
    static data_t BRAM_conv_bias[OUT_C];
    static data_t BRAM_buffer_1[OUT_C][FW][FH];
    static data_t BRAM_buffer_2[OUT_C][FW][FH];


    ap_uint<1> load_image_start[1];
    ap_uint<1> load_weight_start[1];
    ap_uint<1> load_bias_start[1];
    ap_uint<1> conv2d_start[1];
    ap_uint<1> relu_activation_start[1];
    ap_uint<1> leaky_relu_activation_start[1];
    ap_uint<1> sigmoid_activation_start[1];
    ap_uint<1> store_start[1];


    ap_uint<1> load_image_DRAM_image_input_sel[1];
    ap_uint<1> load_image_BRAM_image_input_sel[1];
    ap_uint<1> load_weight_DRAM_conv_weight_sel[1];
    ap_uint<1> load_weight_BRAM_conv_weight_sel[1];
    ap_uint<1> load_bias_DRAM_conv_bias_sel[1];
    ap_uint<1> load_bias_BRAM_conv_bias_sel[1];
    ap_uint<1> conv2d_BRAM_image_input_sel[1];
    ap_uint<1> conv2d_BRAM_conv_weight_sel[1];
    ap_uint<1> conv2d_BRAM_conv_bias_sel[1];
    ap_uint<1> conv2d_BRAM_buffer_1_sel[1];
    ap_uint<1> relu_activation_BRAM_buffer_1_sel[1];
    ap_uint<1> relu_activation_BRAM_buffer_2_sel[1];
    ap_uint<1> leaky_relu_activation_BRAM_buffer_1_sel[1];
    ap_uint<1> leaky_relu_activation_BRAM_buffer_2_sel[1];
    ap_uint<1> sigmoid_activation_BRAM_buffer_1_sel[1];
    ap_uint<1> sigmoid_activation_BRAM_buffer_2_sel[1];
    ap_uint<1> store_BRAM_buffer_2_sel[1];
    ap_uint<1> store_DRAM_image_output_sel[1];
    
#pragma HLS inline off
    while (1)
    {
        instruction = fifo.read();
        load_image_start[0] = instruction.range(0, 0);
        load_weight_start[0] = instruction.range(1, 1);
        load_bias_start[0] = instruction.range(2, 2);
        conv2d_start[0] = instruction.range(3, 3);
        relu_activation_start[0] = instruction.range(4, 4);
        leaky_relu_activation_start[0] = instruction.range(5, 5);
        sigmoid_activation_start[0] = instruction.range(6, 6);
        store_start[0] = instruction.range(7, 7);
        load_image_DRAM_image_input_sel[0] = instruction.range(8, 8);
        load_image_BRAM_image_input_sel[0] = instruction.range(9, 9);
        load_weight_DRAM_conv_weight_sel[0] = instruction.range(10, 10);
        load_weight_BRAM_conv_weight_sel[0] = instruction.range(11, 11);
        load_bias_DRAM_conv_bias_sel[0] = instruction.range(12, 12);
        load_bias_BRAM_conv_bias_sel[0] = instruction.range(13, 13);
        conv2d_BRAM_image_input_sel[0] = instruction.range(14, 14);
        conv2d_BRAM_conv_weight_sel[0] = instruction.range(15, 15);
        conv2d_BRAM_conv_bias_sel[0] = instruction.range(16, 16);
        conv2d_BRAM_buffer_1_sel[0] = instruction.range(17, 17);
        relu_activation_BRAM_buffer_1_sel[0] = instruction.range(18, 18);
        relu_activation_BRAM_buffer_2_sel[0] = instruction.range(19, 19);
        leaky_relu_activation_BRAM_buffer_1_sel[0] = instruction.range(20, 20);
        leaky_relu_activation_BRAM_buffer_2_sel[0] = instruction.range(21, 21);
        sigmoid_activation_BRAM_buffer_1_sel[0] = instruction.range(22, 22);
        sigmoid_activation_BRAM_buffer_2_sel[0] = instruction.range(23, 23);
        store_BRAM_buffer_2_sel[0] = instruction.range(24, 24);
        store_DRAM_image_output_sel[0] = instruction.range(25, 25);
        if (instruction.range(26, 26) == 0b1) {
            break; // Exit condition
        }  

        if (load_image_start[0] == 0b1) {
        if (load_image_DRAM_image_input_sel[0] == 0b1 && load_image_BRAM_image_input_sel[0] == 0b1) {
            load_image(DRAM_image_input, BRAM_image_input); // Load from DRAM
        }
    }
    if (load_weight_start[0] == 0b1) {
        if (load_weight_DRAM_conv_weight_sel[0] == 0b1 && load_weight_BRAM_conv_weight_sel[0] == 0b1) {
            load_weight(DRAM_conv_weight, BRAM_conv_weight); // Load from DRAM
        }
    }
    if (load_bias_start[0] == 0b1) {
        if (load_bias_DRAM_conv_bias_sel[0] == 0b1 && load_bias_BRAM_conv_bias_sel[0] == 0b1) {
            load_bias(DRAM_conv_bias, BRAM_conv_bias); // Load from DRAM
        }
    }
    if (conv2d_start[0] == 0b1) {
        if (conv2d_BRAM_image_input_sel[0] == 0b1 && 
            conv2d_BRAM_conv_weight_sel[0] == 0b1 && 
            conv2d_BRAM_conv_bias_sel[0] == 0b1 && 
            conv2d_BRAM_buffer_1_sel[0] == 0b1)
        {
            conv2d(BRAM_image_input, BRAM_conv_weight, BRAM_conv_bias,
                   BRAM_buffer_1); // Perform convolution
        }
    }
    if (relu_activation_start[0] == 0b1) {
        if (relu_activation_BRAM_buffer_1_sel[0] == 0b1 && 
            relu_activation_BRAM_buffer_2_sel[0] == 0b1) {
            elu_activation(BRAM_buffer_1, BRAM_buffer_2); // Apply ELU activation
        }
    }
    if (leaky_relu_activation_start[0] == 0b1) {
        if (leaky_relu_activation_BRAM_buffer_1_sel[0] == 0b1 && 
            leaky_relu_activation_BRAM_buffer_2_sel[0] == 0b1) {
            leaky_relu_activation(BRAM_buffer_1, BRAM_buffer_2); // Apply Leaky ReLU activation
        }
    }
    if (sigmoid_activation_start[0] == 0b1) {
        if (sigmoid_activation_BRAM_buffer_1_sel[0] == 0b1 && 
            sigmoid_activation_BRAM_buffer_2_sel[0] == 0b1) {
            sigmoid_activation(BRAM_buffer_1, BRAM_buffer_2); // Apply Sigmoid activation
        }
    }
    if (store_start[0] == 0b1) {
        if (store_BRAM_buffer_2_sel[0] == 0b1 && store_DRAM_image_output_sel[0] == 0b1) {
            store(BRAM_buffer_2, DRAM_image_output); // Store result to DRAM
        }
    }
}
}



void top(data_t DRAM_image_input[IN_C][FW][FH], data_t DRAM_conv_weight[OUT_C][IN_C][K][K], data_t DRAM_conv_bias[OUT_C], data_t DRAM_image_output[OUT_C][FW][FH], DATA_TYPE_INST *inst_dram_0_0, int n_inst_0_0)
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS interface m_axi port=DRAM_image_input offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_bias offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_image_output offset=slave bundle=mem2
    #pragma HLS interface m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth=10
    

    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow
    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, DRAM_image_input, DRAM_conv_weight, DRAM_conv_bias, DRAM_image_output);


}



