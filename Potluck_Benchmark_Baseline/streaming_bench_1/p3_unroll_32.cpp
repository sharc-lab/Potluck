
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ap_fixed.h>
#include <hls_math.h>
#include <stdlib.h>
#include <cstdint>
#include <hls_math.h>
#include <hls_stream.h>
using namespace std;

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<64>

#define SEQ_LEN  8
#define HIDDEN_DIM  128
#define DIM 256


data_t BRAM_input_buffer[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM];
data_t BRAM_output_buffer_one[SEQ_LEN][HIDDEN_DIM];
data_t BRAM_output_buffer_two[SEQ_LEN][HIDDEN_DIM];

// void matmul_PE_one(
//           data_t input[SEQ_LEN][HIDDEN_DIM],
//           data_t weight[HIDDEN_DIM][HIDDEN_DIM],
//           hls::stream<data_t>& output_stream
// ) {

//     data_t output_buffer[HIDDEN_DIM];
//     #pragma HLS inline off
//     #pragma HLS ARRAY_PARTITION variable=input cyclic factor=2 dim=2
//     #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=2 dim=1
//     #pragma HLS ARRAY_PARTITION variable=output_buffer cyclic factor=2 dim=1
//     // Outer loops: iterate over output rows (i) and cols (j)
// Row_Loop:
//     for (int i = 0; i < SEQ_LEN; i++) {
//     Col_Loop:
//         for (int j = 0; j < HIDDEN_DIM; j++) {
//             data_t acc = 0;
//         K_Loop:
//             for (int k = 0; k < HIDDEN_DIM; k++) {
//     #pragma HLS UNROLL factor=2
//                 acc += input[i][k] * weight[k][j];
//             }
//             output_buffer[j] = acc;
//         }
//         for (int j2 = 0; j2 < HIDDEN_DIM; j2++) {
//     #pragma HLS PIPELINE II=1
//             output_stream.write(output_buffer[j2]);
//         }
//     }
// }


void matmul_PE_one(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    //data_t output_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    //#pragma HLS ARRAY_PARTITION variable=output_buffer cyclic factor=2 dim=1
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
            data_t acc = 0;
        K_Loop:
            for (int k = 0; k < HIDDEN_DIM; k++) {
    #pragma HLS UNROLL factor=32
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
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
    #pragma HLS UNROLL factor=32
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
    #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
            data_t v = input[i][j];
            // both branches are data_t, so no ambiguous conversion
            output[i][j] = (v > data_t(0)) ? v : data_t(0);
        }
    }
}

//     for (int y = 0; y < FW;  y++) {
//         for (int x = 0; x < FH; x++) {
//             for (int c = 0; c < OUT_C; c++) {
//                 #pragma HLS unroll factor=16
//                 data_t v = input[c][y][x];
//                 // both branches are data_t, so no ambiguous conversion
//                 output[c][y][x] = (v > data_t(0)) ? v : data_t(0);
//             }
//         }
//     }
// }

void sigmoid_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2


    for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
    {
        for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
        {
            #pragma HLS unroll factor=32
            data_t val     = input[idx1][idx2];
            data_t exp_val = hls::exp(-val);
            output[idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
        }
    }
}

//     for (int idx1 = 0; idx1 < FW; idx1++)
//     {
//         for (int idx2 = 0; idx2 < FH; idx2++)
//         {
//             for (int idx0 = 0; idx0 < OUT_C; idx0++)
//             {
//                 #pragma HLS unroll factor=16
//                 data_t val     = input[idx0][idx1][idx2];
//                 data_t exp_val = hls::exp(-val);
//                 output[idx0][idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
//             }
//         }
//     }
// }

void tanh_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
{
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
    {
        for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
        {
            #pragma HLS unroll factor=32
            data_t val    = input[idx1][idx2];
            // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
            data_t exp2x  = hls::exp((data_t)2 * val);
            output[idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
        }
    }
}

//     for (int idx1 = 0; idx1 < FW; idx1++) {
//         for (int idx2 = 0; idx2 < FH; idx2++) {
//             for (int idx0 = 0; idx0 < OUT_C; idx0++) {
//                 #pragma HLS unroll factor=16
//                 data_t val    = input[idx0][idx1][idx2];
//                 // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
//                 data_t exp2x  = hls::exp((data_t)2 * val);
//                 output[idx0][idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
//             }
//         }
//     }
// }

void leaky_relu_activation(
    data_t input[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    const data_t alpha = data_t(0.1);  // negative slope

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
            data_t v   = input[i][j];
            data_t neg = alpha * v;        // now neg is data_t
            output[i][j] = (v > data_t(0)) ? v : neg;
        }
    }
}
//     for (int y = 0; y < FW;  y++) {
//         for (int x = 0; x < FH; x++) {
//             for (int c = 0; c < OUT_C; c++) {
//                 #pragma HLS unroll factor=16
//                 data_t v   = input[c][y][x];
//                 data_t neg = alpha * v;        // now neg is data_t
//                 output[c][y][x] = (v > data_t(0)) ? v : neg;
//             }
//         }
//     }
// }

void elu_activation(
    data_t input [SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    const data_t alpha = data_t(1.0); 
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
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


//     const data_t alpha = data_t(1.0);  // scaling factor for negative inputs
//     for (int y = 0; y < FW;  y++) {
//         for (int x = 0; x < FH; x++) {
//             for (int c = 0; c < OUT_C; c++) {
//                 #pragma HLS unroll factor=16
//                 data_t v = input[c][y][x];
//                 if (v > data_t(0)) {
//                     output[c][y][x] = v;
//                 } else {
//                     // alpha * (exp(v) - 1)
//                     output[c][y][x] = alpha * (hls::exp(v) - data_t(1));
//                 }
//             }
//         }
//     }
// }


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



void top(
    data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM]
) 
{
    #pragma HLS INTERFACE m_axi port=DRAM_input offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_one offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_two offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_output offset=slave bundle=mem2
    #pragma HLS INTERFACE s_axilite port=return 

    load_data(DRAM_input, DRAM_weight_one, DRAM_weight_two, BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two);
    dataflow_region(BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_output_buffer_one);
    sigmoid_activation(BRAM_output_buffer_one, BRAM_output_buffer_two);
    store_data(BRAM_output_buffer_two, DRAM_output);

}