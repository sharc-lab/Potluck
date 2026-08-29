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

#define IN_C 64
#define OUT_C 64

#define CH1 64
#define CH2 64
#define CH3 64
#define CH4 64

#define FW 5
#define FH 5
#define K 3

#define N 20

// data_t BRAM_image_input[IN_C][FW][FH];

// data_t BRAM_image_buffer_1[IN_C][FW][FH];
// data_t BRAM_image_buffer_2[IN_C][FW][FH];
// data_t BRAM_image_buffer_3[IN_C][FW][FH];

// data_t BRAM_conv_weight_3x3[OUT_C][IN_C][K][K];
// data_t BRAM_conv_weight_5x5[OUT_C][IN_C][5][5];
// data_t BRAM_conv_weight_1x1[OUT_C][IN_C][1][1];

// data_t BRAM_conv_bias_5x5[OUT_C];
// data_t BRAM_conv_bias_3x3[OUT_C];
// data_t BRAM_conv_bias_1x1[OUT_C];


// data_t BRAM_buffer_1[OUT_C][FW][FH];
// data_t BRAM_buffer_2[OUT_C][FW][FH];
// data_t BRAM_buffer_3[OUT_C][FW][FH];
// data_t BRAM_buffer_4[OUT_C][FW][FH];

// data_t BRAM_image_output[CH1+CH2+CH3+CH4][FW][FH];


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

void load_weight_5x5(data_t input[OUT_C][IN_C][5][5], data_t output[OUT_C][IN_C][5][5])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < IN_C; idx1++) {
            for (int idx2 = 0; idx2 < 5; idx2++) {
                for (int idx3 = 0; idx3 < 5; idx3++) {
                    output[idx0][idx1][idx2][idx3] = input[idx0][idx1][idx2][idx3];
                }
            }
        }
    }
}

void load_weight_3x3(data_t input[OUT_C][IN_C][K][K], data_t output[OUT_C][IN_C][K][K])
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

void load_weight_1x1(data_t input[OUT_C][IN_C][1][1], data_t output[OUT_C][IN_C][1][1])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < IN_C; idx1++) {
            output[idx0][idx1][0][0] = input[idx0][idx1][0][0];
        }
    }
}


void load_bias_5x5(data_t input[OUT_C], data_t output[OUT_C])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        output[idx0] = input[idx0];
    }
}

void load_bias_3x3(data_t input[OUT_C], data_t output[OUT_C])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        output[idx0] = input[idx0];
    }
}

void load_bias_1x1(data_t input[OUT_C], data_t output[OUT_C])
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

void conv_3x3(
    data_t input[IN_C][FW][FH],
    data_t kernel[OUT_C][IN_C][K][K],
    data_t bias[OUT_C],
    data_t output[OUT_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=8 dim=2
    #pragma HLS array_partition variable=bias   type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    // Initialize output to bias[co], with co in the innermost loop
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=8
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
                        #pragma HLS unroll factor=8
                            for (int co = 0; co < OUT_C; co++) {
                            #pragma HLS unroll factor=8
                                output[co][i][j] += input[ci][in_row][in_col] * kernel[co][ci][kh][kw];
                            }
                        }
                    }
                }
            }
        }
    }
}


void conv_3x3_second(
    data_t input[IN_C][FW][FH],
    data_t kernel[OUT_C][IN_C][K][K],
    data_t bias[OUT_C],
    data_t output[OUT_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel type=cyclic factor=8 dim=2
    #pragma HLS array_partition variable=bias   type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    // Initialize output to bias[co], with co in the innermost loop
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=8
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
                        #pragma HLS unroll factor=8
                            for (int co = 0; co < OUT_C; co++) {
                            #pragma HLS unroll factor=8
                                output[co][i][j] += input[ci][in_row][in_col] * kernel[co][ci][kh][kw];
                            }
                        }
                    }
                }
            }
        }
    }
}


void conv_5x5(
    data_t input[IN_C][FW][FH],
    data_t kernel[OUT_C][IN_C][5][5],
    data_t bias[OUT_C],
    data_t output[OUT_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input   type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel  type=cyclic factor=8 dim=2
    #pragma HLS array_partition variable=bias    type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output  type=cyclic factor=8 dim=1

    // ——— Initialize output to bias[co] ———
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=8
                output[co][i][j] = bias[co];
            }
        }
    }

    // ——— 5×5 convolution with pad = 2, stride = 1 ———
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int kh = 0; kh < 5; kh++) {
                for (int kw = 0; kw < 5; kw++) {
                    // compute input coords with padding=2
                    int in_row = i - 2 + kh;
                    int in_col = j - 2 + kw;
                    if (in_row >= 0 && in_row < FW && in_col >= 0 && in_col < FH) {
                        for (int ci = 0; ci < IN_C; ci++) {
                        #pragma HLS unroll factor=8
                            for (int co = 0; co < OUT_C; co++) {
                            #pragma HLS unroll factor=8
                                output[co][i][j] +=
                                    input[ci][in_row][in_col]
                                  * kernel[co][ci][kh][kw];
                            }
                        }
                    }
                }
            }
        }
    }
}

void conv_1x1(
    data_t input[IN_C][FW][FH],
    data_t kernel[OUT_C][IN_C][1][1],
    data_t bias[OUT_C],
    data_t output[OUT_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input   type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=kernel  type=cyclic factor=8 dim=2
    #pragma HLS array_partition variable=bias    type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output  type=cyclic factor=8 dim=1

    // ——— Initialize output to bias[co] ———
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int co = 0; co < OUT_C; co++) {
            #pragma HLS unroll factor=8
                output[co][i][j] = bias[co];
            }
        }
    }

    // ——— 1×1 convolution (pad=0, stride=1) ———
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int ci = 0; ci < IN_C; ci++) {
            #pragma HLS unroll factor=8
                for (int co = 0; co < OUT_C; co++) {
                #pragma HLS unroll factor=8
                    output[co][i][j] +=
                        input[ci][i][j] 
                      * kernel[co][ci][0][0];
                }
            }
        }
    }
}

void concat(
    data_t out1x1[CH1][FW][FH],
    data_t out3x3[CH2][FW][FH],
    data_t out5x5[CH3][FW][FH],
    data_t outpool[CH4][FW][FH],
    data_t output[CH1+CH2+CH3+CH4][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=out1x1 type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=out3x3 type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=out5x5 type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=outpool type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1

    // For each spatial position, copy channels from each branch in turn
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            // 1×1 branch
            for (int c = 0; c < CH1; c++) {
            #pragma HLS unroll factor=8
                output[c][i][j] = out1x1[c][i][j];
            }
            // 3×3 branch
            for (int c = 0; c < CH2; c++) {
            #pragma HLS unroll factor=8
                output[CH1 + c][i][j] = out3x3[c][i][j];
            }
            // 5×5 branch
            for (int c = 0; c < CH3; c++) {
            #pragma HLS unroll factor=8
                output[CH1 + CH2 + c][i][j] = out5x5[c][i][j];
            }
            // max‐pool+1×1 branch
            for (int c = 0; c < CH4; c++) {
            #pragma HLS unroll factor=8
                output[CH1 + CH2 + CH3 + c][i][j] = outpool[c][i][j];
            }
        }
    }
}

void maxpool_3x3(
    data_t input[IN_C][FW][FH],
    data_t output[IN_C][FW][FH]
)
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input   type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output  type=cyclic factor=8 dim=1

    // ——— 3×3 max‑pool with pad = 1, stride = 1 ———
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
            for (int ci = 0; ci < IN_C; ci++) {
            #pragma HLS unroll factor=8
                // initialize to the center pixel (always valid)
                data_t max_val = input[ci][i][j];
                // slide over 3×3 window
                for (int kh = 0; kh < 3; kh++) {
                    for (int kw = 0; kw < 3; kw++) {
                        int in_row = i - 1 + kh;
                        int in_col = j - 1 + kw;
                        if (in_row >= 0 && in_row < FW && in_col >= 0 && in_col < FH) {
                            data_t v = input[ci][in_row][in_col];
                            if (v > max_val) {
                                max_val = v;
                            }
                        }
                    }
                }
                output[ci][i][j] = max_val;
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

void store_concat(data_t input[CH1+CH2+CH3+CH4][FW][FH], data_t output[CH1+CH2+CH3+CH4][FW][FH])
{
    #pragma HLS inline off
    for (int idx0 = 0; idx0 < CH1+CH2+CH3+CH4; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}


void bram_copy_1(data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
            #pragma HLS unroll factor=8
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}

void bram_copy_2(data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
            #pragma HLS unroll factor=8
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}

void bram_copy_3(data_t input[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    for (int idx0 = 0; idx0 < OUT_C; idx0++) {
        for (int idx1 = 0; idx1 < FW; idx1++) {
            for (int idx2 = 0; idx2 < FH; idx2++) {
            #pragma HLS unroll factor=8
                output[idx0][idx1][idx2] = input[idx0][idx1][idx2];
            }
        }
    }
}

void load_all(
    data_t DRAM_img   [IN_C][FW][FH],
    data_t DRAM_w3x3  [OUT_C][IN_C][K][K],
    data_t DRAM_w1x1  [OUT_C][IN_C][1][1],
    data_t DRAM_b3x3  [OUT_C],
    data_t DRAM_b1x1  [OUT_C],

    data_t BRAM_img   [IN_C][FW][FH],
    data_t BRAM_w3x3  [OUT_C][IN_C][K][K],
    data_t BRAM_w1x1  [OUT_C][IN_C][1][1],
    data_t BRAM_b3x3  [OUT_C],
    data_t BRAM_b1x1  [OUT_C]
)
{
#pragma HLS inline off

// ---- Image ----
IMG_C: for (int c = 0; c < IN_C; c++) {
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
#pragma HLS PIPELINE II=1
            BRAM_img[c][i][j] = DRAM_img[c][i][j];
        }
    }
}

// ---- 3x3 Weights ----
W3O: for (int co = 0; co < OUT_C; co++) {
    for (int ci = 0; ci < IN_C; ci++) {
        for (int kh = 0; kh < K; kh++) {
            for (int kw = 0; kw < K; kw++) {
#pragma HLS PIPELINE II=1
                BRAM_w3x3[co][ci][kh][kw] = DRAM_w3x3[co][ci][kh][kw];
            }
        }
    }
}

// ---- 1x1 Weights ----
W1O: for (int co = 0; co < OUT_C; co++) {
    for (int ci = 0; ci < IN_C; ci++) {
#pragma HLS PIPELINE II=1
        BRAM_w1x1[co][ci][0][0] = DRAM_w1x1[co][ci][0][0];
    }
}

// ---- Bias 3x3 ----
B3: for (int co = 0; co < OUT_C; co++) {
#pragma HLS PIPELINE II=1
    BRAM_b3x3[co] = DRAM_b3x3[co];
}

// ---- Bias 1x1 ----
B1: for (int co = 0; co < OUT_C; co++) {
#pragma HLS PIPELINE II=1
    BRAM_b1x1[co] = DRAM_b1x1[co];
}
}



void load_all_third(
    data_t DRAM_img   [IN_C][FW][FH],
    data_t DRAM_w3x3  [OUT_C][IN_C][K][K],
    data_t DRAM_w3x3_second  [OUT_C][IN_C][K][K],
    data_t DRAM_w1x1  [OUT_C][IN_C][1][1],
    data_t DRAM_b3x3  [OUT_C],
    data_t DRAM_b3x3_second  [OUT_C],
    data_t DRAM_b1x1  [OUT_C],
    data_t BRAM_img   [IN_C][FW][FH],
    data_t BRAM_w3x3  [OUT_C][IN_C][K][K],
    data_t BRAM_w3x3_second  [OUT_C][IN_C][K][K],
    data_t BRAM_w1x1  [OUT_C][IN_C][1][1],
    data_t BRAM_b3x3  [OUT_C],
    data_t BRAM_b3x3_second  [OUT_C],
    data_t BRAM_b1x1  [OUT_C]
)
{
#pragma HLS inline off

// ---- Image ----
IMG_C: for (int c = 0; c < IN_C; c++) {
    for (int i = 0; i < FW; i++) {
        for (int j = 0; j < FH; j++) {
#pragma HLS PIPELINE II=1
            BRAM_img[c][i][j] = DRAM_img[c][i][j];
        }
    }
}

// ---- 3x3 Weights ----
W3O: for (int co = 0; co < OUT_C; co++) {
    for (int ci = 0; ci < IN_C; ci++) {
        for (int kh = 0; kh < K; kh++) {
            for (int kw = 0; kw < K; kw++) {
#pragma HLS PIPELINE II=1
                BRAM_w3x3[co][ci][kh][kw] = DRAM_w3x3[co][ci][kh][kw];
            }
        }
    }
}

W3O_second: for (int co = 0; co < OUT_C; co++) {
    for (int ci = 0; ci < IN_C; ci++) {
        for (int kh = 0; kh < K; kh++) {
            for (int kw = 0; kw < K; kw++) {
#pragma HLS PIPELINE II=1
                BRAM_w3x3_second[co][ci][kh][kw] = DRAM_w3x3_second[co][ci][kh][kw];
            }
        }
    }
}



// ---- 1x1 Weights ----
W1O: for (int co = 0; co < OUT_C; co++) {
    for (int ci = 0; ci < IN_C; ci++) {
#pragma HLS PIPELINE II=1
        BRAM_w1x1[co][ci][0][0] = DRAM_w1x1[co][ci][0][0];
    }
}

// ---- Bias 3x3 ----
B3: for (int co = 0; co < OUT_C; co++) {
#pragma HLS PIPELINE II=1
    BRAM_b3x3[co] = DRAM_b3x3[co];
}

B3_second: for (int co = 0; co < OUT_C; co++) {
#pragma HLS PIPELINE II=1
    BRAM_b3x3_second[co] = DRAM_b3x3_second[co];
}

// ---- Bias 1x1 ----
B1: for (int co = 0; co < OUT_C; co++) {
#pragma HLS PIPELINE II=1
    BRAM_b1x1[co] = DRAM_b1x1[co];
}
}

void matrix_add (data_t input_1[OUT_C][FW][FH], data_t input_2[OUT_C][FW][FH], data_t output[OUT_C][FW][FH])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input_1  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=input_2  type=cyclic factor=8 dim=1
    #pragma HLS array_partition variable=output type=cyclic factor=8 dim=1
    for (int idx1 = 0; idx1 < FW; idx1++)
    {
        for (int idx2 = 0; idx2 < FH; idx2++)
        {
            for (int idx0 = 0; idx0 < OUT_C; idx0++)
            {
            #pragma HLS unroll factor=8
                output[idx0][idx1][idx2] = input_1[idx0][idx1][idx2] + input_2[idx0][idx1][idx2];
            }
        }
    }
}



void top(data_t DRAM_image_input_1[IN_C][FW][FH], data_t DRAM_image_input_2[IN_C][FW][FH], data_t DRAM_image_input_3[IN_C][FW][FH],
         data_t DRAM_conv_weight_1x1[OUT_C][IN_C][1][1], data_t DRAM_conv_weight_3x3[OUT_C][IN_C][K][K], data_t DRAM_conv_weight_3x3_second[OUT_C][IN_C][K][K],
         data_t DRAM_conv_bias_1x1[OUT_C], data_t DRAM_conv_bias_3x3[OUT_C], data_t DRAM_conv_bias_3x3_second[OUT_C],
         data_t DRAM_image_output_1[OUT_C][FW][FH], data_t DRAM_image_output_2[OUT_C][FW][FH], data_t DRAM_image_output_3[OUT_C][FW][FH])
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS interface m_axi port=DRAM_image_input_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_image_input_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_image_input_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_weight_1x1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_weight_3x3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_weight_3x3_second offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_bias_1x1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_bias_3x3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_conv_bias_3x3_second offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_image_output_1 offset=slave bundle=mem2
    #pragma HLS interface m_axi port=DRAM_image_output_2 offset=slave bundle=mem2
    #pragma HLS interface m_axi port=DRAM_image_output_3 offset=slave bundle=mem2
    
    data_t BRAM_image_input_1[IN_C][FW][FH];
    data_t BRAM_image_input_2[IN_C][FW][FH];
    data_t BRAM_image_input_3[IN_C][FW][FH];

    data_t BRAM_conv_weight_3x3_1[OUT_C][IN_C][K][K];
    data_t BRAM_conv_weight_1x1_1[OUT_C][IN_C][1][1];
    data_t BRAM_conv_weight_3x3_2[OUT_C][IN_C][K][K];
    data_t BRAM_conv_weight_1x1_2[OUT_C][IN_C][1][1];
    data_t BRAM_conv_weight_3x3_3[OUT_C][IN_C][K][K];
    data_t BRAM_conv_weight_1x1_3[OUT_C][IN_C][1][1];

    data_t BRAM_conv_weight_3x3_second_1[OUT_C][IN_C][K][K];
    data_t BRAM_conv_weight_3x3_second_2[OUT_C][IN_C][K][K];
    data_t BRAM_conv_weight_3x3_second_3[OUT_C][IN_C][K][K];


    data_t BRAM_conv_bias_3x3_1[OUT_C];
    data_t BRAM_conv_bias_1x1_1[OUT_C];
    data_t BRAM_conv_bias_3x3_2[OUT_C];
    data_t BRAM_conv_bias_1x1_2[OUT_C];
    data_t BRAM_conv_bias_3x3_3[OUT_C];
    data_t BRAM_conv_bias_1x1_3[OUT_C];

    data_t BRAM_conv_bias_3x3_second_1[OUT_C];
    data_t BRAM_conv_bias_3x3_second_2[OUT_C];
    data_t BRAM_conv_bias_3x3_second_3[OUT_C];

    data_t BRAM_buffer_1[OUT_C][FW][FH];
    data_t BRAM_buffer_2[OUT_C][FW][FH];
    data_t BRAM_buffer_3[OUT_C][FW][FH];
    data_t BRAM_buffer_4[OUT_C][FW][FH];
    data_t BRAM_buffer_5[OUT_C][FW][FH];
    data_t BRAM_buffer_6[OUT_C][FW][FH];
    data_t BRAM_buffer_7[OUT_C][FW][FH];
    data_t BRAM_buffer_8[OUT_C][FW][FH];
    data_t BRAM_buffer_9[OUT_C][FW][FH];   
    data_t BRAM_buffer_10[OUT_C][FW][FH];
    data_t BRAM_buffer_11[OUT_C][FW][FH];
    data_t BRAM_buffer_12[OUT_C][FW][FH];

    // #pragma HLS bind_storage variable=BRAM_buffer_1 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_2 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_3 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_4 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_5 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_6 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_7 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_8 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_9 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_10 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_11 type=RAM_2P impl=bram
    // #pragma HLS bind_storage variable=BRAM_buffer_12 type=RAM_2P impl=bram

    //data_t BRAM_image_output[OUT_C][FW][FH];

    load_all_third(DRAM_image_input_1,
        DRAM_conv_weight_3x3,
        DRAM_conv_weight_3x3_second,
        DRAM_conv_weight_1x1,
        DRAM_conv_bias_3x3,
        DRAM_conv_bias_3x3_second,
        DRAM_conv_bias_1x1,
        BRAM_image_input_1,
        BRAM_conv_weight_3x3_1,
        BRAM_conv_weight_3x3_second_1,
        BRAM_conv_weight_1x1_1,
        BRAM_conv_bias_3x3_1,
        BRAM_conv_bias_3x3_second_1,
        BRAM_conv_bias_1x1_1);


    load_all_third(DRAM_image_input_2,
        DRAM_conv_weight_3x3,
        DRAM_conv_weight_3x3_second,
        DRAM_conv_weight_1x1,
        DRAM_conv_bias_3x3,
        DRAM_conv_bias_3x3_second,
        DRAM_conv_bias_1x1,
        BRAM_image_input_2,
        BRAM_conv_weight_3x3_2,
        BRAM_conv_weight_3x3_second_2,
        BRAM_conv_weight_1x1_2,
        BRAM_conv_bias_3x3_2,
        BRAM_conv_bias_3x3_second_2,
        BRAM_conv_bias_1x1_2);
    
    conv_3x3(BRAM_image_input_1, BRAM_conv_weight_3x3_1, BRAM_conv_bias_3x3_1, BRAM_buffer_1);
    

    load_all_third(DRAM_image_input_3,
        DRAM_conv_weight_3x3,
        DRAM_conv_weight_3x3_second,
        DRAM_conv_weight_1x1,
        DRAM_conv_bias_3x3,
        DRAM_conv_bias_3x3_second,
        DRAM_conv_bias_1x1,
        BRAM_image_input_3,
        BRAM_conv_weight_3x3_3,
        BRAM_conv_weight_3x3_second_3,
        BRAM_conv_weight_1x1_3,
        BRAM_conv_bias_3x3_3,
        BRAM_conv_bias_3x3_second_3,
        BRAM_conv_bias_1x1_3);
    
    //store(BRAM_buffer_3, DRAM_image_output_1);

    conv_3x3(BRAM_image_input_2, BRAM_conv_weight_3x3_2, BRAM_conv_bias_3x3_2, BRAM_buffer_2);
    conv_1x1(BRAM_image_input_1, BRAM_conv_weight_1x1_1, BRAM_conv_bias_1x1_1, BRAM_buffer_3);
    conv_3x3_second(BRAM_buffer_1, BRAM_conv_weight_3x3_second_1, BRAM_conv_bias_3x3_second_1, BRAM_buffer_4);
    //store(BRAM_buffer_3, DRAM_image_output_1);

    conv_3x3(BRAM_image_input_3, BRAM_conv_weight_3x3_3, BRAM_conv_bias_3x3_3, BRAM_buffer_5);
    conv_1x1(BRAM_image_input_2, BRAM_conv_weight_1x1_2, BRAM_conv_bias_1x1_2, BRAM_buffer_6);
    conv_3x3_second(BRAM_buffer_2, BRAM_conv_weight_3x3_second_2, BRAM_conv_bias_3x3_second_2, BRAM_buffer_7);
    matrix_add(BRAM_buffer_3, BRAM_buffer_4, BRAM_buffer_8);    
    store(BRAM_buffer_8, DRAM_image_output_1);

    conv_1x1(BRAM_image_input_3, BRAM_conv_weight_1x1_3, BRAM_conv_bias_1x1_3, BRAM_buffer_9);
    conv_3x3_second(BRAM_buffer_5, BRAM_conv_weight_3x3_second_3, BRAM_conv_bias_3x3_second_3, BRAM_buffer_10);
    matrix_add(BRAM_buffer_6, BRAM_buffer_7, BRAM_buffer_11);
    store(BRAM_buffer_11, DRAM_image_output_2);

    matrix_add(BRAM_buffer_9, BRAM_buffer_10, BRAM_buffer_12);
    store(BRAM_buffer_12, DRAM_image_output_3);

}