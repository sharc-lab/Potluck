#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ap_fixed.h>
#include <hls_math.h>
#include <stdlib.h>
#include <cstdint>
#include <hls_math.h>
using namespace std;

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<64>

#define IN_C 8
#define OUT_C 8
#define FW 5
#define FH 5
#define K 3

#define N 20

data_t BRAM_image_input[IN_C][FW][FH];
data_t BRAM_conv_weight[OUT_C][IN_C][K][K];
data_t BRAM_conv_bias[OUT_C];
data_t BRAM_buffer_1[OUT_C][FW][FH];
data_t BRAM_buffer_2[OUT_C][FW][FH];
data_t inst_buffer_split_1[N];
data_t inst_buffer_split_2[N];
DATA_TYPE_INST inst_buffer[N];

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
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=bias   type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1
    // Initialize output to bias[co], with co in the innermost loop
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=1
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
                        #pragma HLS unroll factor=1
                            for (int co = 0; co < OUT_C; co++) {
                            #pragma HLS unroll factor=1
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
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
                #pragma HLS unroll factor=1
                output[idx0][idx1][idx2] = 2 * input[idx0][idx1][idx2] + 1;
            }
        }
    }
}

void relu_activation (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
                #pragma HLS unroll factor=1
                data_t val = input[idx0][idx1][idx2];
                output[idx0][idx1][idx2] = (val > 0) ? val : (data_t)0;
            }
        }
    }
}

void sigmoid_activation (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
                #pragma HLS unroll factor=1
                data_t val     = input[idx0][idx1][idx2];
                data_t exp_val = hls::exp(-val);
                output[idx0][idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
            }
        }
    }
}

void tanh_activation (data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++) {
        for (int idx2 = 0; idx2 < FH; idx2++) {
            for (int idx0 = 0; idx0 < OUT_C; idx0++) {
                #pragma HLS unroll factor=1
                data_t val    = input[idx0][idx1][idx2];
                // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
                data_t exp2x  = hls::exp((data_t)2 * val);
                output[idx0][idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
            }
        }
    }
}

void leaky_relu_activation(
    data_t input [OUT_C][FW][FH],
    data_t output[OUT_C][FW][FH]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1

    const data_t alpha = data_t(0.1);  // negative slope

    for (int y = 0; y < FW;  y++) {
        for (int x = 0; x < FH; x++) {
            for (int c = 0; c < OUT_C; c++) {
                #pragma HLS unroll factor=1
                data_t v   = input[c][y][x];
                data_t neg = alpha * v;        // now neg is data_t
                output[c][y][x] = (v > data_t(0)) ? v : neg;
            }
        }
    }
}

void top(data_t DRAM_image_input[IN_C][FW][FH], data_t DRAM_conv_weight[OUT_C][IN_C][K][K], data_t DRAM_conv_bias[OUT_C], data_t DRAM_image_output[OUT_C][FW][FH])
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS interface m_axi port=DRAM_image_input offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_bias offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_image_output offset=slave bundle=mem2
    

    load_image(DRAM_image_input, BRAM_image_input);
    load_weight(DRAM_conv_weight, BRAM_conv_weight);
    load_bias(DRAM_conv_bias, BRAM_conv_bias);
    conv2d(BRAM_image_input, BRAM_conv_weight, BRAM_conv_bias, BRAM_buffer_1);
    leaky_relu_activation(BRAM_buffer_1, BRAM_buffer_2);
    store(BRAM_buffer_2, DRAM_image_output);
    
}



