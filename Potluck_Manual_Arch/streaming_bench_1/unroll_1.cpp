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
#define DATA_TYPE_INST ap_int<128>

#define SEQ_LEN  8
#define HIDDEN_DIM  128
#define DIM 256


data_t BRAM_input_buffer[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_output_buffer_one[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_output_buffer_two[SEQ_LEN][HIDDEN_DIM];


void matmul_PE_one(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    //data_t output_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=1 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=1 dim=1
    //#pragma HLS ARRAY_PARTITION variable=output_buffer cyclic factor=2 dim=1
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
            data_t acc = 0;
        K_Loop:
            for (int k = 0; k < HIDDEN_DIM; k++) {
    #pragma HLS UNROLL factor=1
                acc += input[i][k] * weight[k][j];
            }
            output_stream.write(acc);
            //output_buffer[j] = acc;
        }
    //     for (int j2 = 0; j2 < HIDDEN_DIM; j2++) {
    // #pragma HLS PIPELINE II=1
    //         output_stream.write(output_buffer[j2]);
    //     }
    // }
    }
}



void matmul_PE_two(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=1 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=1 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int k2 = 0; k2 < HIDDEN_DIM; k2++) {
    #pragma HLS PIPELINE II=1
            input_buffer[k2] = input_stream.read();
        }
    Col_Loop_2:
        for (int j = 0; j < HIDDEN_DIM; j++) {
            data_t acc = 0;
        K_Loop:
            for (int k = 0; k < HIDDEN_DIM; k++) {
    #pragma HLS UNROLL factor=1
                acc += input_buffer[k] * weight[k][j];
            }
            output[i][j] = acc;
        }
    }
}


void dataflow_region(data_t input[SEQ_LEN][HIDDEN_DIM],
                    data_t weight_one[HIDDEN_DIM][HIDDEN_DIM], 
                    data_t weight_two[HIDDEN_DIM][HIDDEN_DIM],
                    data_t output[SEQ_LEN][HIDDEN_DIM]
)
{
    #pragma HLS inline off
    hls::stream<data_t> hidden_states_fifo;
    #pragma HLS STREAM variable=hidden_states_fifo depth=256
    #pragma HLS dataflow
    matmul_PE_one(input, weight_one, hidden_states_fifo);
    matmul_PE_two(hidden_states_fifo, weight_two, output);
}

void relu_activation(
    data_t input [SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=1
            data_t v = input[i][j];
            // both branches are data_t, so no ambiguous conversion
            output[i][j] = (v > data_t(0)) ? v : data_t(0);
        }
    }
}

void sigmoid_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=2


    for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
    {
        for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
        {
            #pragma HLS unroll factor=1
            data_t val     = input[idx1][idx2];
            data_t exp_val = hls::exp(-val);
            output[idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
        }
    }
}

void tanh_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=2

    for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
    {
        for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
        {
            #pragma HLS unroll factor=1
            data_t val    = input[idx1][idx2];
            // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
            data_t exp2x  = hls::exp((data_t)2 * val);
            output[idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
        }
    }
}


void leaky_relu_activation(
    data_t input[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=2

    const data_t alpha = data_t(0.1);  // negative slope

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=1
            data_t v   = input[i][j];
            data_t neg = alpha * v;        // now neg is data_t
            output[i][j] = (v > data_t(0)) ? v : neg;
        }
    }
}

void elu_activation(
    data_t input [SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=2

    const data_t alpha = data_t(1.0); 
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=1
            data_t v = input[i][j];
            if (v > data_t(0)) {
                output[i][j] = v;
            } else {
                // alpha * (exp(v) - 1)
                output[i][j] = alpha * (hls::exp(v) - data_t(1));
            }
        }
    }
}


void load_data(
    data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM]
) {
#pragma HLS INLINE off
    // Load data from DRAM to BRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input[i][j] = DRAM_input[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_one[i][j] = DRAM_weight_one[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_two[i][j] = DRAM_weight_two[i][j];
        }
    }
}

void store_data(
    data_t BRAM_output[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM]
) {
#pragma HLS INLINE off
    // Store data from BRAM to DRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output[i][j] = BRAM_output[i][j];
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
                data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
                data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_output[SEQ_LEN][HIDDEN_DIM])
{
    DATA_TYPE_INST instruction;

    ap_uint<1> load_data_start[1];
    ap_uint<1> dataflow_region_start[1];
    ap_uint<1> elu_activation_start[1];
    ap_uint<1> leaky_relu_activation_start[1];
    ap_uint<1> sigmoid_activation_start[1];
    ap_uint<1> store_data_start[1];

    ap_uint<1> load_data_DRAM_input_sel[1];
    ap_uint<1> load_data_DRAM_weight_one_sel[1];
    ap_uint<1> load_data_DRAM_weight_two_sel[1];
    ap_uint<1> load_data_BRAM_input_sel[1];
    ap_uint<1> load_data_BRAM_weight_one_sel[1];
    ap_uint<1> load_data_BRAM_weight_two_sel[1];
    ap_uint<1> dataflow_region_input_sel[1];
    ap_uint<1> dataflow_region_weight_one_sel[1];
    ap_uint<1> dataflow_region_weight_two_sel[1];
    ap_uint<1> dataflow_region_output_sel[1];
    ap_uint<1> elu_activation_input_sel[1];
    ap_uint<1> elu_activation_output_sel[1];
    ap_uint<1> leaky_relu_activation_input_sel[1];
    ap_uint<1> leaky_relu_activation_output_sel[1];
    ap_uint<1> sigmoid_activation_input_sel[1];
    ap_uint<1> sigmoid_activation_output_sel[1];
    ap_uint<1> store_data_BRAM_output_sel[1];
    ap_uint<1> store_data_DRAM_output_sel[1];

#pragma HLS inline off
    while (1)
    {
        instruction = fifo.read();

        load_data_start[0] = instruction.range(0, 0);
        dataflow_region_start[0] = instruction.range(1, 1);
        elu_activation_start[0] = instruction.range(2, 2);
        leaky_relu_activation_start[0] = instruction.range(3, 3);
        sigmoid_activation_start[0] = instruction.range(4, 4);
        store_data_start[0] = instruction.range(5, 5);

        load_data_DRAM_input_sel[0] = instruction.range(6, 6);
        load_data_DRAM_weight_one_sel[0] = instruction.range(7, 7);
        load_data_DRAM_weight_two_sel[0] = instruction.range(8, 8);
        load_data_BRAM_input_sel[0] = instruction.range(9, 9);
        load_data_BRAM_weight_one_sel[0] = instruction.range(10, 10);
        load_data_BRAM_weight_two_sel[0] = instruction.range(11, 11);
        dataflow_region_input_sel[0] = instruction.range(12, 12);
        dataflow_region_weight_one_sel[0] = instruction.range(13, 13);
        dataflow_region_weight_two_sel[0] = instruction.range(14, 14);
        dataflow_region_output_sel[0] = instruction.range(15, 15);
        elu_activation_input_sel[0] = instruction.range(16, 16);
        elu_activation_output_sel[0] = instruction.range(17, 17);
        leaky_relu_activation_input_sel[0] = instruction.range(18, 18);
        leaky_relu_activation_output_sel[0] = instruction.range(19, 19);
        sigmoid_activation_input_sel[0] = instruction.range(20, 20);
        sigmoid_activation_output_sel[0] = instruction.range(21, 21);
        store_data_BRAM_output_sel[0] = instruction.range(22, 22);
        store_data_DRAM_output_sel[0] = instruction.range(23, 23);
    
        if (instruction.range(24, 24) == 0b1) {
            break; // Exit condition
        }

        if (load_data_start[0] == 0b1) {
            if (load_data_DRAM_input_sel[0] == 0b1 && 
                load_data_DRAM_weight_one_sel[0] == 0b1 && 
                load_data_DRAM_weight_two_sel[0] == 0b1 && 
                load_data_BRAM_input_sel[0] == 0b1 && 
                load_data_BRAM_weight_one_sel[0] == 0b1 && 
                load_data_BRAM_weight_two_sel[0] == 0b1) {
            load_data(DRAM_input, DRAM_weight_one, DRAM_weight_two, BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two);
            }
        }
        if (dataflow_region_start[0] == 0b1) {
            if (dataflow_region_input_sel[0] == 0b1 && 
                dataflow_region_weight_one_sel[0] == 0b1 && 
                dataflow_region_weight_two_sel[0] == 0b1 && 
                dataflow_region_output_sel[0] == 0b1) {
                dataflow_region(BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_output_buffer_one);
            }
        }
        if (elu_activation_start[0] == 0b1) {
            if (elu_activation_input_sel[0] == 0b1 && elu_activation_output_sel[0] == 0b1) {
                elu_activation(BRAM_output_buffer_one, BRAM_output_buffer_two);
            }  
        }
        if (leaky_relu_activation_start[0] == 0b1) {
            if (leaky_relu_activation_input_sel[0] == 0b1 && leaky_relu_activation_output_sel[0] == 0b1) {
                leaky_relu_activation(BRAM_output_buffer_one, BRAM_output_buffer_two);
            }  
        }
        if (sigmoid_activation_start[0] == 0b1) {
            if (sigmoid_activation_input_sel[0] == 0b1 && sigmoid_activation_output_sel[0] == 0b1) {
                sigmoid_activation(BRAM_output_buffer_one, BRAM_output_buffer_two);
            }
        }
        if (store_data_start[0] == 0b1) {
            if (store_data_BRAM_output_sel[0] == 0b1 && store_data_DRAM_output_sel[0] == 0b1) {
                store_data(BRAM_output_buffer_two, DRAM_output);
            }
        }
    }
}


void top(data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM],
    DATA_TYPE_INST *inst_dram_0_0, 
    int n_inst_0_0)
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE ap_ctrl_hs port=return
    #pragma HLS interface m_axi port=DRAM_input offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_one offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_two offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_output offset=slave bundle=mem2
    #pragma HLS interface m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth=10
    

    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow
    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, DRAM_input, DRAM_weight_one, DRAM_weight_two, DRAM_output);


}



