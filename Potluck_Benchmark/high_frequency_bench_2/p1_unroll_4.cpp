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
#define DIM 256


data_t BRAM_buffer_1[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_2[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_3[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_4[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_5[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_6[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_buffer_7[SEQ_LEN][HIDDEN_DIM];

void vector_sub(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {

    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input_1 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=input_2 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS UNROLL factor=4
    //#pragma HLS pipeline II = 1
            output[i][j] = input_1[i][j] - input_2[i][j];
        }
    }   

}


void vector_add(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {

    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input_1 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=input_2 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS UNROLL factor=4
    //#pragma HLS pipeline II = 1
            output[i][j] = input_1[i][j] + input_2[i][j];
        }
    }   

}

void vector_mul(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {

    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=input_1 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=input_2 cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
    #pragma HLS UNROLL factor=4
    //#pragma HLS pipeline II = 1
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

void top(
    data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_3[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_4[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM]
) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE m_axi port=dram_input_1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_input_2 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_input_3 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_input_4 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=dram_output offset=slave bundle=mem2

    load_data(dram_input_1, BRAM_buffer_1);
    load_data(dram_input_2, BRAM_buffer_2);
    load_data(dram_input_3, BRAM_buffer_3);
    load_data(dram_input_4, BRAM_buffer_4);

    vector_add(BRAM_buffer_1, BRAM_buffer_2, BRAM_buffer_5);
    vector_mul(BRAM_buffer_5, BRAM_buffer_3, BRAM_buffer_6);
    vector_sub(BRAM_buffer_6, BRAM_buffer_4, BRAM_buffer_7);

    store_data(BRAM_buffer_7, dram_output);
}

