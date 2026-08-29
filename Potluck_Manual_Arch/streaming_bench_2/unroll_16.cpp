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
#define HIDDEN_DIM  16
#define DIM 256



data_t BRAM_input_buffer[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_output_buffer_one[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_output_buffer_two[SEQ_LEN][HIDDEN_DIM];



void load_to_stream(
    data_t input[SEQ_LEN][HIDDEN_DIM],
    hls::stream<data_t>& output_stream
) {
    #pragma HLS inline off
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
      #pragma HLS PIPELINE II=1  
            output_stream.write(input[i][j]);
        }
    }
}


void matmul_PE_one(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_two(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_three(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_four(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}


void matmul_PE_five(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}


void matmul_PE_six(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_seven(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_eight(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}

void matmul_PE_nine(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
             output_stream.write(acc);
        }
    }
}


void matmul_PE_ten(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=16 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=16 dim=2
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
    #pragma HLS UNROLL factor=16
                acc += input_buffer[k] * weight[k][j];
            }
            output[i][j] = acc;
        }
    }
}


void dataflow_region(data_t input[SEQ_LEN][HIDDEN_DIM],
                    data_t weight_one[HIDDEN_DIM][HIDDEN_DIM], 
                    data_t weight_two[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_three[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_four[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_five[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_six[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_seven[HIDDEN_DIM][HIDDEN_DIM],
                    data_t weight_ten[HIDDEN_DIM][HIDDEN_DIM],
                    data_t output[SEQ_LEN][HIDDEN_DIM]
)
{
    #pragma HLS inline off
    hls::stream<data_t> hidden_states_fifo_0;
    hls::stream<data_t> hidden_states_fifo_1;
    hls::stream<data_t> hidden_states_fifo_2;
    hls::stream<data_t> hidden_states_fifo_3;
    hls::stream<data_t> hidden_states_fifo_4;
    hls::stream<data_t> hidden_states_fifo_5;
    hls::stream<data_t> hidden_states_fifo_6;
    hls::stream<data_t> hidden_states_fifo_7;
    //hls::stream<data_t> hidden_states_fifo_8;
    //hls::stream<data_t> hidden_states_fifo_9;
    #pragma HLS STREAM variable=hidden_states_fifo_0 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_1 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_2 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_3 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_4 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_5 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_6 depth=256
    #pragma HLS STREAM variable=hidden_states_fifo_7 depth=256
    //#pragma HLS STREAM variable=hidden_states_fifo_8 depth=256
    //#pragma HLS STREAM variable=hidden_states_fifo_9 depth=256
    #pragma HLS dataflow

    load_to_stream(input, hidden_states_fifo_0);
    matmul_PE_one(hidden_states_fifo_0, weight_one, hidden_states_fifo_1);
    matmul_PE_two(hidden_states_fifo_1, weight_two, hidden_states_fifo_2);
    matmul_PE_three(hidden_states_fifo_2, weight_three, hidden_states_fifo_3);
    matmul_PE_four(hidden_states_fifo_3, weight_four, hidden_states_fifo_4);
    matmul_PE_five(hidden_states_fifo_4, weight_five, hidden_states_fifo_5);
    matmul_PE_six(hidden_states_fifo_5, weight_six, hidden_states_fifo_6);
    matmul_PE_seven(hidden_states_fifo_6, weight_seven, hidden_states_fifo_7);
    //matmul_PE_eight(hidden_states_fifo_7, weight_eight, hidden_states_fifo_8);
    //matmul_PE_nine(hidden_states_fifo_8, weight_nine, hidden_states_fifo_9);
    matmul_PE_ten(hidden_states_fifo_7, weight_ten, output);

}

void vector_add(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input_1  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=16 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=16
            output[i][j] = input_1[i][j] + input_2[i][j];
        }
    }
}

void vector_sub(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input_1  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=16 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=16
            output[i][j] = input_1[i][j] - input_2[i][j];
        }
    }
}

void vector_multiply(
    data_t input_1[SEQ_LEN][HIDDEN_DIM],
    data_t input_2[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input_1  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=16 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=16 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=16
            output[i][j] = input_1[i][j] * input_2[i][j];
        }
    }
}



void load_data(
    data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM]
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
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_three[i][j] = DRAM_weight_three[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_four[i][j] = DRAM_weight_four[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_five[i][j] = DRAM_weight_five[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_six[i][j] = DRAM_weight_six[i][j];
        }  
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_seven[i][j] = DRAM_weight_seven[i][j];
        }
    }
    // for (int i = 0; i < HIDDEN_DIM; i++) {
    //     for (int j = 0; j < HIDDEN_DIM; j++) {
    //         BRAM_weight_eight[i][j] = DRAM_weight_eight[i][j];
    //     }
    // }
    // for (int i = 0; i < HIDDEN_DIM; i++) {
    //     for (int j = 0; j < HIDDEN_DIM; j++) {
    //         BRAM_weight_nine[i][j] = DRAM_weight_nine[i][j];
    //     }
    // }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_ten[i][j] = DRAM_weight_ten[i][j];
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
                data_t DRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM],
                data_t DRAM_output[SEQ_LEN][HIDDEN_DIM])
{
    DATA_TYPE_INST instruction;

    ap_uint<1> load_data_start[1];
    ap_uint<1> dataflow_region_start[1];
    ap_uint<1> vector_add_start[1];
    ap_uint<1> vector_sub_start[1];
    ap_uint<1> vector_mul_start[1];
    ap_uint<1> store_data_start[1];

    ap_uint<1> load_data_DRAM_input_sel[1];
    ap_uint<1> load_data_DRAM_weight_one_sel[1];
    ap_uint<1> load_data_DRAM_weight_two_sel[1];
    ap_uint<1> load_data_DRAM_weight_three_sel[1];
    ap_uint<1> load_data_DRAM_weight_four_sel[1];
    ap_uint<1> load_data_DRAM_weight_five_sel[1];
    ap_uint<1> load_data_DRAM_weight_six_sel[1];
    ap_uint<1> load_data_DRAM_weight_seven_sel[1];
    ap_uint<1> load_data_DRAM_weight_ten_sel[1];
    ap_uint<1> load_data_BRAM_input_sel[1];
    ap_uint<1> load_data_BRAM_weight_one_sel[1];
    ap_uint<1> load_data_BRAM_weight_two_sel[1];
    ap_uint<1> load_data_BRAM_weight_three_sel[1];
    ap_uint<1> load_data_BRAM_weight_four_sel[1];
    ap_uint<1> load_data_BRAM_weight_five_sel[1];
    ap_uint<1> load_data_BRAM_weight_six_sel[1];
    ap_uint<1> load_data_BRAM_weight_seven_sel[1];
    ap_uint<1> load_data_BRAM_weight_ten_sel[1];
    ap_uint<1> dataflow_region_input_sel[1];
    ap_uint<1> dataflow_region_weight_one_sel[1];
    ap_uint<1> dataflow_region_weight_two_sel[1];
    ap_uint<1> dataflow_region_weight_three_sel[1];
    ap_uint<1> dataflow_region_weight_four_sel[1];
    ap_uint<1> dataflow_region_weight_five_sel[1];
    ap_uint<1> dataflow_region_weight_six_sel[1];
    ap_uint<1> dataflow_region_weight_seven_sel[1];
    ap_uint<1> dataflow_region_weight_ten_sel[1];
    ap_uint<1> dataflow_region_output_sel[1];
    ap_uint<1> vector_add_BRAM_input_1_sel[1];
    ap_uint<1> vector_add_BRAM_input_2_sel[1];
    ap_uint<1> vector_add_BRAM_output_sel[1];
    ap_uint<1> vector_sub_BRAM_input_1_sel[1];
    ap_uint<1> vector_sub_BRAM_input_2_sel[1];
    ap_uint<1> vector_sub_BRAM_output_sel[1];
    ap_uint<1> vector_mul_BRAM_input_1_sel[1];
    ap_uint<1> vector_mul_BRAM_input_2_sel[1];
    ap_uint<1> vector_mul_BRAM_output_sel[1];
    ap_uint<1> store_data_BRAM_output_sel[1];
    ap_uint<1> store_data_DRAM_output_sel[1];
    


#pragma HLS inline off
    while (1)
    {
        instruction = fifo.read();
        load_data_start[0] = instruction.range(0, 0);
        dataflow_region_start[0] = instruction.range(1, 1);
        vector_add_start[0] = instruction.range(2, 2);
        vector_sub_start[0] = instruction.range(3, 3);
        vector_mul_start[0] = instruction.range(4, 4);
        store_data_start[0] = instruction.range(5, 5);

        load_data_DRAM_input_sel[0] = instruction.range(6, 6);
        load_data_DRAM_weight_one_sel[0] = instruction.range(7, 7);
        load_data_DRAM_weight_two_sel[0] = instruction.range(8, 8);
        load_data_DRAM_weight_three_sel[0] = instruction.range(9, 9);
        load_data_DRAM_weight_four_sel[0] = instruction.range(10, 10);
        load_data_DRAM_weight_five_sel[0] = instruction.range(11, 11);
        load_data_DRAM_weight_six_sel[0] = instruction.range(12, 12);
        load_data_DRAM_weight_seven_sel[0] = instruction.range(13, 13);
        load_data_DRAM_weight_ten_sel[0] = instruction.range(14, 14);
        load_data_BRAM_input_sel[0] = instruction.range(15, 15);
        load_data_BRAM_weight_one_sel[0] = instruction.range(16, 16);
        load_data_BRAM_weight_two_sel[0] = instruction.range(17, 17);
        load_data_BRAM_weight_three_sel[0] = instruction.range(18, 18);
        load_data_BRAM_weight_four_sel[0] = instruction.range(19, 19);
        load_data_BRAM_weight_five_sel[0] = instruction.range(20, 20);
        load_data_BRAM_weight_six_sel[0] = instruction.range(21, 21);
        load_data_BRAM_weight_seven_sel[0] = instruction.range(22, 22);
        load_data_BRAM_weight_ten_sel[0] = instruction.range(23, 23);
        dataflow_region_input_sel[0] = instruction.range(24, 24);
        dataflow_region_weight_one_sel[0] = instruction.range(25, 25);
        dataflow_region_weight_two_sel[0] = instruction.range(26, 26);
        dataflow_region_weight_three_sel[0] = instruction.range(27, 27);
        dataflow_region_weight_four_sel[0] = instruction.range(28, 28);
        dataflow_region_weight_five_sel[0] = instruction.range(29, 29);
        dataflow_region_weight_six_sel[0] = instruction.range(30, 30);
        dataflow_region_weight_seven_sel[0] = instruction.range(31, 31);
        dataflow_region_weight_ten_sel[0] = instruction.range(32, 32);
        dataflow_region_output_sel[0] = instruction.range(33, 33);
        vector_add_BRAM_input_1_sel[0] = instruction.range(34, 34);
        vector_add_BRAM_input_2_sel[0] = instruction.range(35, 35);
        vector_add_BRAM_output_sel[0] = instruction.range(36, 36);
        vector_sub_BRAM_input_1_sel[0] = instruction.range(37, 37);
        vector_sub_BRAM_input_2_sel[0] = instruction.range(38, 38);
        vector_sub_BRAM_output_sel[0] = instruction.range(39, 39);
        vector_mul_BRAM_input_1_sel[0] = instruction.range(40, 40);
        vector_mul_BRAM_input_2_sel[0] = instruction.range(41, 41);
        vector_mul_BRAM_output_sel[0] = instruction.range(42, 42);
        store_data_BRAM_output_sel[0] = instruction.range(43, 43);
        store_data_DRAM_output_sel[0] = instruction.range(44, 44);

        if (instruction.range(45, 45) == 0b1) {
            break; // Exit condition
        }

        if (load_data_start[0] == 0b1) {
            if (load_data_DRAM_input_sel[0] == 0b1 &&
                load_data_DRAM_weight_one_sel[0] == 0b1 &&
                load_data_DRAM_weight_two_sel[0] == 0b1 &&
                load_data_DRAM_weight_three_sel[0] == 0b1 &&
                load_data_DRAM_weight_four_sel[0] == 0b1 &&
                load_data_DRAM_weight_five_sel[0] == 0b1 &&
                load_data_DRAM_weight_six_sel[0] == 0b1 &&
                load_data_DRAM_weight_seven_sel[0] == 0b1 &&
                load_data_DRAM_weight_ten_sel[0] == 0b1 &&
                load_data_BRAM_input_sel[0] == 0b1 &&
                load_data_BRAM_weight_one_sel[0] == 0b1 &&
                load_data_BRAM_weight_two_sel[0] == 0b1 &&
                load_data_BRAM_weight_three_sel[0] == 0b1 &&
                load_data_BRAM_weight_four_sel[0] == 0b1 &&
                load_data_BRAM_weight_five_sel[0] == 0b1 &&
                load_data_BRAM_weight_six_sel[0] == 0b1 &&
                load_data_BRAM_weight_seven_sel[0] == 0b1 &&
                load_data_BRAM_weight_ten_sel[0] == 0b1) {
                // Load DRAM input
                load_data(DRAM_input, DRAM_weight_one, DRAM_weight_two, DRAM_weight_three, DRAM_weight_four,
                      DRAM_weight_five, DRAM_weight_six, DRAM_weight_seven, DRAM_weight_ten,
                      BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_weight_three, BRAM_weight_four,
                      BRAM_weight_five, BRAM_weight_six, BRAM_weight_seven, BRAM_weight_ten);
                }
            }
        
        if (dataflow_region_start[0] == 0b1) {
            if (dataflow_region_input_sel[0] == 0b1 &&
                dataflow_region_weight_one_sel[0] == 0b1 &&
                dataflow_region_weight_two_sel[0] == 0b1 &&
                dataflow_region_weight_three_sel[0] == 0b1 &&
                dataflow_region_weight_four_sel[0] == 0b1 &&
                dataflow_region_weight_five_sel[0] == 0b1 &&
                dataflow_region_weight_six_sel[0] == 0b1 &&
                dataflow_region_weight_seven_sel[0] == 0b1 &&
                dataflow_region_weight_ten_sel[0] == 0b1 &&
                dataflow_region_output_sel[0] == 0b1) {
            dataflow_region(BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_weight_three, BRAM_weight_four,
                            BRAM_weight_five, BRAM_weight_six, BRAM_weight_seven, BRAM_weight_ten,
                            BRAM_output_buffer_one);
            }
        }

        if (vector_add_start[0] == 0b1) {
            if (vector_add_BRAM_input_1_sel[0] == 0b1 &&
                vector_add_BRAM_input_2_sel[0] == 0b1 &&
                vector_add_BRAM_output_sel[0] == 0b1) {
            vector_add(BRAM_input_buffer, BRAM_output_buffer_one, BRAM_output_buffer_two);
        }
        }
        if (vector_sub_start[0] == 0b1) {
            if (vector_sub_BRAM_input_1_sel[0] == 0b1 &&
                vector_sub_BRAM_input_2_sel[0] == 0b1 &&
                vector_sub_BRAM_output_sel[0] == 0b1) {
            vector_sub(BRAM_input_buffer, BRAM_output_buffer_one, BRAM_output_buffer_two);
        }
        }
        if (vector_mul_start[0] == 0b1) {
            if (vector_mul_BRAM_input_1_sel[0] == 0b1 &&
                vector_mul_BRAM_input_2_sel[0] == 0b1 &&
                vector_mul_BRAM_output_sel[0] == 0b1) {
            vector_multiply(BRAM_input_buffer, BRAM_output_buffer_one, BRAM_output_buffer_two);
        }
        }
        if (store_data_start[0] == 0b1) {
            if (store_data_BRAM_output_sel[0] == 0b1 &&
                store_data_DRAM_output_sel[0] == 0b1) {
            store_data(BRAM_output_buffer_two, DRAM_output);
        }
        }
    }
}

void top( data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM],
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
    #pragma HLS interface m_axi port=DRAM_weight_three offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_four offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_five offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_six offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_seven offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_weight_ten offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_output offset=slave bundle=mem2
    #pragma HLS interface m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth=10
    

    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow
    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, DRAM_input, DRAM_weight_one, DRAM_weight_two, DRAM_weight_three,
                DRAM_weight_four, DRAM_weight_five, DRAM_weight_six, DRAM_weight_seven, DRAM_weight_ten, DRAM_output);
}



