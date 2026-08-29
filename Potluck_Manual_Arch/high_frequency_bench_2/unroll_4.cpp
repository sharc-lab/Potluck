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



void load_inst(DATA_TYPE_INST *inst_dram, hls::stream<DATA_TYPE_INST, 1> &fifo, int n_inst)
{
#pragma HLS inline off
    for (int i = 0; i < n_inst; i++) {
        DATA_TYPE_INST instruction = inst_dram[i];
        fifo.write(instruction);
    }
  
}

void decode_inst(hls::stream<DATA_TYPE_INST, 1> &fifo,
                data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
                data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
                data_t_input dram_input_3[SEQ_LEN_INPUT][HIDDEN_DIM],
                data_t_input dram_input_4[SEQ_LEN_INPUT][HIDDEN_DIM],
                data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM])
{
    DATA_TYPE_INST instruction;

    ap_uint<1> load_data_start[1];
    ap_uint<1> vector_mul_start[1];
    ap_uint<1> vector_add_start[1];
    ap_uint<1> vector_sub_start[1];
    ap_uint<1> store_data_start[1];

    ap_uint<3> load_data_DRAM_input_sel[1];
    ap_uint<3> load_data_BRAM_input_sel[1];
    ap_uint<2> vector_mul_BRAM_input_1_sel[1];
    ap_uint<2> vector_mul_BRAM_input_2_sel[1];
    ap_uint<2> vector_mul_BRAM_output_sel[1];
    ap_uint<2> vector_add_BRAM_input_1_sel[1];
    ap_uint<2> vector_add_BRAM_input_2_sel[1];
    ap_uint<2> vector_add_BRAM_output_sel[1];
    ap_uint<2> vector_sub_BRAM_input_1_sel[1];
    ap_uint<2> vector_sub_BRAM_input_2_sel[1];
    ap_uint<2> vector_sub_BRAM_output_sel[1];
    ap_uint<1> store_BRAM_output_sel[1];
    ap_uint<1> store_DRAM_output_sel[1];

#pragma HLS inline off
    while (1)
    {
        instruction = fifo.read();
        load_data_start[0] = instruction.range(0, 0);
        vector_mul_start[0] = instruction.range(1, 1);
        vector_add_start[0] = instruction.range(2, 2);
        vector_sub_start[0] = instruction.range(3, 3);
        store_data_start[0] = instruction.range(4, 4);

        load_data_DRAM_input_sel[0] = instruction.range(7, 5);
        load_data_BRAM_input_sel[0] = instruction.range(10, 8);
        vector_mul_BRAM_input_1_sel[0] = instruction.range(12, 11);
        vector_mul_BRAM_input_2_sel[0] = instruction.range(14, 13);
        vector_mul_BRAM_output_sel[0] = instruction.range(16, 15);
        vector_add_BRAM_input_1_sel[0] = instruction.range(18, 17);
        vector_add_BRAM_input_2_sel[0] = instruction.range(20, 19);
        vector_add_BRAM_output_sel[0] = instruction.range(22, 21);
        vector_sub_BRAM_input_1_sel[0] = instruction.range(24, 23);
        vector_sub_BRAM_input_2_sel[0] = instruction.range(26, 25);
        vector_sub_BRAM_output_sel[0] = instruction.range(28, 27);
        store_BRAM_output_sel[0] = instruction.range(29, 29);
        store_DRAM_output_sel[0] = instruction.range(30, 30);
        if (instruction.range(31, 31) == 0b1) {
            break; // Exit condition
        }

        if (load_data_start[0] == 0b1) {
            if (load_data_DRAM_input_sel[0] == 0b001 && load_data_BRAM_input_sel[0] == 0b001) {
                load_data(dram_input_1, BRAM_buffer_1); // Load from DRAM
            }
            else if (load_data_DRAM_input_sel[0] == 0b0010 && load_data_BRAM_input_sel[0] == 0b010) {
                load_data(dram_input_2, BRAM_buffer_2); // Load from DRAM
            }
            else if (load_data_DRAM_input_sel[0] == 0b011 && load_data_BRAM_input_sel[0] == 0b011) {
                load_data(dram_input_3, BRAM_buffer_3); // Load from DRAM
            }
            else if (load_data_DRAM_input_sel[0] == 0b100 && load_data_BRAM_input_sel[0] == 0b100) {
                load_data(dram_input_4, BRAM_buffer_4); // Load from DRAM
            }
        }

        if (vector_mul_start[0] == 0b1) {
            if (vector_mul_BRAM_input_1_sel[0] == 0b01 && 
                vector_mul_BRAM_input_2_sel[0] == 0b01 && 
                vector_mul_BRAM_output_sel[0] == 0b01)
            {
                vector_mul(BRAM_buffer_1, BRAM_buffer_2, BRAM_buffer_5); // Perform vector multiplicatio
            }
            else if (vector_mul_BRAM_input_1_sel[0] == 0b10 && 
                vector_mul_BRAM_input_2_sel[0] == 0b10 && 
                vector_mul_BRAM_output_sel[0] == 0b10)
            {
                vector_mul(BRAM_buffer_5, BRAM_buffer_3, BRAM_buffer_6); // Perform vector multiplication
            }
            else if (vector_mul_BRAM_input_1_sel[0] == 0b11 && 
                vector_mul_BRAM_input_2_sel[0] == 0b11 && 
                vector_mul_BRAM_output_sel[0] == 0b11)
            {
                vector_mul(BRAM_buffer_6, BRAM_buffer_4, BRAM_buffer_7); // Perform vector multiplication
            }
        }

        if (vector_add_start[0] == 0b1) {
            if (vector_add_BRAM_input_1_sel[0] == 0b01 && 
                vector_add_BRAM_input_2_sel[0] == 0b01 && 
                vector_add_BRAM_output_sel[0] == 0b01)
            {
                vector_add(BRAM_buffer_5, BRAM_buffer_3, BRAM_buffer_6); // Perform vector addition
            }
            else if (vector_add_BRAM_input_1_sel[0] == 0b10 && 
                vector_add_BRAM_input_2_sel[0] == 0b10 && 
                vector_add_BRAM_output_sel[0] == 0b10)
            {
                vector_add(BRAM_buffer_1, BRAM_buffer_2, BRAM_buffer_5); // Perform vector addition
            }
        }

        if (vector_sub_start[0] == 0b1) {
            if (vector_sub_BRAM_input_1_sel[0] == 0b01 && 
                vector_sub_BRAM_input_2_sel[0] == 0b01 && 
                vector_sub_BRAM_output_sel[0] == 0b01)
            {
                vector_sub(BRAM_buffer_6, BRAM_buffer_4, BRAM_buffer_7); // Perform vector subtraction
            }
            else if (vector_sub_BRAM_input_1_sel[0] == 0b10 && 
                vector_sub_BRAM_input_2_sel[0] == 0b10 && 
                vector_sub_BRAM_output_sel[0] == 0b10)
            {
                vector_sub(BRAM_buffer_5, BRAM_buffer_3, BRAM_buffer_6); // Perform vector subtraction
            }
        }
        if (store_data_start[0] == 0b1) {
            if (store_BRAM_output_sel[0] == 0b1 && store_DRAM_output_sel[0] == 0b1) {
                store_data(BRAM_buffer_7, dram_output); // Store result to DRAM
            }
        }
    
    }
}

void top(data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_3[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_4[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM],
    DATA_TYPE_INST *inst_dram_0_0, 
    int n_inst_0_0)
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS interface m_axi port=dram_input_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_input_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_input_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_input_4 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_output offset=slave bundle=mem2
    #pragma HLS interface m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth=10
    

    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow
    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, dram_input_1, dram_input_2, dram_input_3, dram_input_4, dram_output);


}



