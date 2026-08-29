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

typedef ap_fixed<16, 5> data_t;
typedef ap_fixed<32, 10> data_t_input;
#define DATA_TYPE_INST ap_int<64>

#define SEQ_LEN  128
#define SEQ_LEN_INPUT 64
#define HIDDEN_DIM  128
#define HIDDEN_DIM_INPUT 64
#define DIM 256


data_t BRAM_buffer_1[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_2[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_3[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_4[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_weight_buffer[HIDDEN_DIM][HIDDEN_DIM];

void matmul_PE_one(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
        #pragma HLS UNROLL factor=4
            data_t acc = 0;
        K_Loop:
            for (int k = 0; k < HIDDEN_DIM; k++) {
    #pragma HLS UNROLL factor=4
                acc += input[i][k] * weight[k][j];
            }
            output[i][j] = acc;
        }
    }
}

void matrix_add(
    data_t input_1[SEQ_LEN][HIDDEN_DIM], 
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
)
{
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input_1 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=input_2 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS UNROLL factor=4
            output[i][j] = input_1[i][j] + input_2[i][j];
        }
    }
}

void matrix_element_wise_multiply(
    data_t input_1[SEQ_LEN][HIDDEN_DIM], 
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
)
{
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input_1 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=input_2 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS UNROLL factor=4
            output[i][j] = input_1[i][j] * input_2[i][j];
        }
    }
}

void load_data(
    data_t_input DRAM_input[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t BRAM_input[SEQ_LEN][HIDDEN_DIM]
)
{
    #pragma HLS INLINE off
    for (int i = 0; i < SEQ_LEN_INPUT; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS pipeline II = 1
            BRAM_input[2 * i][j].range(15, 0) = DRAM_input[i][j].range(15, 0);
            BRAM_input[2 * i + 1][j].range(15, 0) = DRAM_input[i][j].range(31, 16);
        }
    }
}


void store_data(
    data_t BRAM_output[SEQ_LEN][HIDDEN_DIM],
    data_t_input DRAM_output[SEQ_LEN_INPUT][HIDDEN_DIM]
)
{
    #pragma HLS INLINE off
    for (int i = 0; i < SEQ_LEN_INPUT; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS pipeline II = 1
            DRAM_output[i][j].range(15, 0) = BRAM_output[2 * i][j].range(15, 0);
            DRAM_output[i][j].range(31, 16) = BRAM_output[2 * i + 1][j].range(15, 0);
        }
    }
}

void load_weight(
    data_t_input DRAM_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM],
    data_t BRAM_weight[HIDDEN_DIM][HIDDEN_DIM]
)
{
    #pragma HLS INLINE off
    for (int i = 0; i < HIDDEN_DIM_INPUT; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS pipeline II = 1
            BRAM_weight[2 * i][j].range(15, 0) = DRAM_weight[i][j].range(15, 0);
            BRAM_weight[2 * i + 1][j].range(15, 0) = DRAM_weight[i][j].range(31, 16);
        }
    }
}

void top(
    data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM],
    data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM]
) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE m_axi port=dram_input_1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_input_2 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_input_weight offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_output offset=slave bundle=mem2

    load_data(dram_input_1, BRAM_buffer_1);
    load_data(dram_input_2, BRAM_buffer_2);
    load_weight(dram_input_weight, BRAM_weight_buffer);

    matmul_PE_one(BRAM_buffer_1, BRAM_weight_buffer, BRAM_buffer_3);
    matrix_element_wise_multiply(BRAM_buffer_3, BRAM_buffer_2, BRAM_buffer_4);

    store_data(BRAM_buffer_4, dram_output);
}

