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

void matrix_sub(
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
            output[i][j] = input_1[i][j] - input_2[i][j];
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
                data_t_input dram_input_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM],
                data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM])
{
    DATA_TYPE_INST instruction;

    ap_uint<1> load_data_start[1];
    ap_uint<1> load_weight_start[1];
    ap_uint<1> matmul_PE_one_start[1];
    ap_uint<1> matrix_add_start[1];
    ap_uint<1> matrix_sub_start[1];
    ap_uint<1> matrix_element_wise_multiply_start[1];
    ap_uint<1> store_data_start[1];

    ap_uint<2> load_data_DRAM_input_sel[1];
    ap_uint<2> load_data_BRAM_input_sel[1];
    ap_uint<1> load_weight_DRAM_weight_sel[1];
    ap_uint<1> load_weight_BRAM_weight_sel[1];
    ap_uint<1> matmul_PE_one_BRAM_input_sel[1];
    ap_uint<1> matmul_PE_one_BRAM_weight_sel[1];
    ap_uint<1> matmul_PE_one_BRAM_output_sel[1];
    ap_uint<1> matrix_add_BRAM_input_1_sel[1];
    ap_uint<1> matrix_add_BRAM_input_2_sel[1];
    ap_uint<1> matrix_add_BRAM_output_sel[1];
    ap_uint<1> matrix_sub_BRAM_input_1_sel[1];
    ap_uint<1> matrix_sub_BRAM_input_2_sel[1];
    ap_uint<1> matrix_sub_BRAM_output_sel[1];
    ap_uint<1> matrix_element_wise_multiply_BRAM_input_1_sel[1];
    ap_uint<1> matrix_element_wise_multiply_BRAM_input_2_sel[1];
    ap_uint<1> matrix_element_wise_multiply_BRAM_output_sel[1];
    ap_uint<1> store_BRAM_output_sel[1];
    ap_uint<1> store_DRAM_output_sel[1];

#pragma HLS inline off
    while (1)
    {
        instruction = fifo.read();
        load_data_start[0] = instruction.range(0, 0);
        load_weight_start[0] = instruction.range(1, 1);
        matmul_PE_one_start[0] = instruction.range(2, 2);
        matrix_add_start[0] = instruction.range(3, 3);
        matrix_sub_start[0] = instruction.range(4, 4);
        matrix_element_wise_multiply_start[0] = instruction.range(5, 5);
        store_data_start[0] = instruction.range(6, 6);


        load_data_DRAM_input_sel[0] = instruction.range(8, 7);
        load_data_BRAM_input_sel[0] = instruction.range(10, 9);
        load_weight_DRAM_weight_sel[0] = instruction.range(11, 11);
        load_weight_BRAM_weight_sel[0] = instruction.range(12, 12);
        matmul_PE_one_BRAM_input_sel[0] = instruction.range(13, 13);
        matmul_PE_one_BRAM_weight_sel[0] = instruction.range(14, 14);
        matmul_PE_one_BRAM_output_sel[0] = instruction.range(15, 15);
        matrix_add_BRAM_input_1_sel[0] = instruction.range(16, 16);
        matrix_add_BRAM_input_2_sel[0] = instruction.range(17, 17);
        matrix_add_BRAM_output_sel[0] = instruction.range(18, 18);
        matrix_sub_BRAM_input_1_sel[0] = instruction.range(19, 19);
        matrix_sub_BRAM_input_2_sel[0] = instruction.range(20, 20);
        matrix_sub_BRAM_output_sel[0] = instruction.range(21, 21);
        matrix_element_wise_multiply_BRAM_input_1_sel[0] = instruction.range(22, 22);
        matrix_element_wise_multiply_BRAM_input_2_sel[0] = instruction.range(23, 23);
        matrix_element_wise_multiply_BRAM_output_sel[0] = instruction.range(24, 24);
        store_BRAM_output_sel[0] = instruction.range(25, 25);
        store_DRAM_output_sel[0] = instruction.range(26, 26);
        if (instruction.range(27, 27) == 0b1) {
            break; // Exit condition
        }

        if (load_data_start[0] == 0b1) {
            if (load_data_DRAM_input_sel[0] == 0b01 && load_data_BRAM_input_sel[0] == 0b01) {
                load_data(dram_input_1, BRAM_buffer_1); // Load from DRAM
            }
            else if (load_data_DRAM_input_sel[0] == 0b10 && load_data_BRAM_input_sel[0] == 0b10) {
                load_data(dram_input_2, BRAM_buffer_2); // Load from DRAM
            }
        }

        if (load_weight_start[0] == 0b1) {
            if (load_weight_DRAM_weight_sel[0] == 0b1 && load_weight_BRAM_weight_sel[0] == 0b1) {
                load_weight(dram_input_weight, BRAM_weight_buffer); // Load from DRAM
            }
        }

        if (matmul_PE_one_start[0] == 0b1) {
            if (matmul_PE_one_BRAM_input_sel[0] == 0b1 && 
                matmul_PE_one_BRAM_weight_sel[0] == 0b1 && 
                matmul_PE_one_BRAM_output_sel[0] == 0b1)
            {
                matmul_PE_one(BRAM_buffer_1, BRAM_weight_buffer, BRAM_buffer_3); // Perform matrix multiplication
                
            }
        }

        if (matrix_add_start[0] == 0b1) {
            if (matrix_add_BRAM_input_1_sel[0] == 0b1 && 
                matrix_add_BRAM_input_2_sel[0] == 0b1 && 
                matrix_add_BRAM_output_sel[0] == 0b1)
            {
                matrix_add(BRAM_buffer_3, BRAM_buffer_2, BRAM_buffer_4); // Perform matrix addition
            }
        }
         if (matrix_sub_start[0] == 0b1) {
            if (matrix_sub_BRAM_input_1_sel[0] == 0b1 && 
                matrix_sub_BRAM_input_2_sel[0] == 0b1 && 
                matrix_sub_BRAM_output_sel[0] == 0b1)
            {
                matrix_sub(BRAM_buffer_3, BRAM_buffer_2, BRAM_buffer_4); // Perform matrix subtraction
            }
        }
         if (matrix_element_wise_multiply_start[0] == 0b1) {
            if (matrix_element_wise_multiply_BRAM_input_1_sel[0] == 0b1 && 
                matrix_element_wise_multiply_BRAM_input_2_sel[0] == 0b1 && 
                matrix_element_wise_multiply_BRAM_output_sel[0] == 0b1)
            {
                matrix_element_wise_multiply(BRAM_buffer_3, BRAM_buffer_2, BRAM_buffer_4); // Perform matrix element-wise multiplication
            }
        }

        if (store_data_start[0] == 0b1) {
            if (store_BRAM_output_sel[0] == 0b1 && store_DRAM_output_sel[0] == 0b1) {
                store_data(BRAM_buffer_4, dram_output); // Store result to DRAM
            }
        }
    
    }
}

void top(data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM],
    data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM], 
    DATA_TYPE_INST *inst_dram_0_0, 
    int n_inst_0_0)
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS interface m_axi port=dram_input_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_input_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_input_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=dram_output offset=slave bundle=mem2
    #pragma HLS interface m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth=10
    

    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow
    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, dram_input_1, dram_input_2, dram_input_weight, dram_output);


}



