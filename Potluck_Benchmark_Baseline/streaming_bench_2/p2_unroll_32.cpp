
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
#define HIDDEN_DIM  32
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
             output_stream.write(acc);
        }
    }
}

// void matmul_PE_one(
//           data_t input[SEQ_LEN][HIDDEN_DIM],
//           data_t weight[HIDDEN_DIM][HIDDEN_DIM],
//           hls::stream<data_t>& output_stream
// ) {

//     //data_t output_buffer[HIDDEN_DIM];
//     #pragma HLS inline off
//     #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
//     #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
//     //#pragma HLS ARRAY_PARTITION variable=output_buffer cyclic factor=2 dim=1
//     // Outer loops: iterate over output rows (i) and cols (j)
// Row_Loop:
//     for (int i = 0; i < SEQ_LEN; i++) {
//     Col_Loop:
//         for (int j = 0; j < HIDDEN_DIM; j++) {
//             data_t acc = 0;
//         K_Loop:
//             for (int k = 0; k < HIDDEN_DIM; k++) {
//     #pragma HLS UNROLL factor=32
//                 acc += input[i][k] * weight[k][j];
//             }
//             output_stream.write(acc);
//             //output_buffer[j] = acc;
//         }
//     //     for (int j2 = 0; j2 < HIDDEN_DIM; j2++) {
//     // #pragma HLS PIPELINE II=1
//     //         output_stream.write(output_buffer[j2]);
//     //     }
//     // }
//     }
// }


void matmul_PE_two(
          hls::stream<data_t>& input_stream,
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          hls::stream<data_t>& output_stream
) {

    data_t input_buffer[HIDDEN_DIM];
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS ARRAY_PARTITION variable=input_buffer cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
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
    #pragma HLS array_partition variable=input_1  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
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
    #pragma HLS array_partition variable=input_1  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
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
    #pragma HLS array_partition variable=input_1  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=input_2  type=cyclic factor=32 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            #pragma HLS unroll factor=32
            output[i][j] = input_1[i][j] * input_2[i][j];
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

// void sigmoid_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
// {
//     #pragma HLS inline off
//     #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
//     #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2


//     for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
//     {
//         for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
//         {
//             #pragma HLS unroll factor=32
//             data_t val     = input[idx1][idx2];
//             data_t exp_val = hls::exp(-val);
//             output[idx1][idx2] = (data_t)1 / ((data_t)1 + exp_val);
//         }
//     }
// }

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

// void tanh_activation (data_t input[SEQ_LEN][HIDDEN_DIM], data_t output[SEQ_LEN][HIDDEN_DIM])
// {
//     #pragma HLS inline off
//     #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
//     #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

//     for (int idx1 = 0; idx1 < SEQ_LEN; idx1++)
//     {
//         for (int idx2 = 0; idx2 < HIDDEN_DIM; idx2++)
//         {
//             #pragma HLS unroll factor=32
//             data_t val    = input[idx1][idx2];
//             // tanh(x) = (e^{2x} - 1) / (e^{2x} + 1)
//             data_t exp2x  = hls::exp((data_t)2 * val);
//             output[idx1][idx2] = (exp2x - (data_t)1) / (exp2x + (data_t)1);
//         }
//     }
// }

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

// void leaky_relu_activation(
//     data_t input[SEQ_LEN][HIDDEN_DIM],
//     data_t output[SEQ_LEN][HIDDEN_DIM]
// ) {
//     #pragma HLS inline off
//     #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
//     #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

//     const data_t alpha = data_t(0.1);  // negative slope

//     for (int i = 0; i < SEQ_LEN; i++) {
//         for (int j = 0; j < HIDDEN_DIM; j++) {
//             #pragma HLS unroll factor=32
//             data_t v   = input[i][j];
//             data_t neg = alpha * v;        // now neg is data_t
//             output[i][j] = (v > data_t(0)) ? v : neg;
//         }
//     }
// }
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

// void elu_activation(
//     data_t input [SEQ_LEN][HIDDEN_DIM],
//     data_t output[SEQ_LEN][HIDDEN_DIM]
// ) {
//     #pragma HLS inline off
//     #pragma HLS array_partition variable=input  type=cyclic factor=32 dim=2
//     #pragma HLS array_partition variable=output type=cyclic factor=32 dim=2

//     const data_t alpha = data_t(1.0); 
//     for (int i = 0; i < SEQ_LEN; i++) {
//         for (int j = 0; j < HIDDEN_DIM; j++) {
//             #pragma HLS unroll factor=32
//             data_t v = input[i][j];
//             if (v > data_t(0)) {
//                 output[i][j] = v;
//             } else {
//                 // alpha * (exp(v) - 1)
//                 output[i][j] = alpha * (hls::exp(v) - data_t(1));
//             }
//         }
//     }
// }


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



void top(
    data_t DRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_one[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_two[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_three[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_four[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_five[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_six[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_seven[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_weight_ten[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM]
) 
{
    #pragma HLS INTERFACE m_axi port=DRAM_input offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_one offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_two offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_three offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_four offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_five offset=slave bundle=mem1 
    #pragma HLS INTERFACE m_axi port=DRAM_weight_six offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_seven offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_weight_ten offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=DRAM_output offset=slave bundle=mem2
    #pragma HLS INTERFACE s_axilite port=return 

    load_data(DRAM_input, DRAM_weight_one, DRAM_weight_two, DRAM_weight_three, DRAM_weight_four, DRAM_weight_five, DRAM_weight_six, DRAM_weight_seven, DRAM_weight_ten, BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_weight_three, BRAM_weight_four, BRAM_weight_five, BRAM_weight_six, BRAM_weight_seven, BRAM_weight_ten);
    dataflow_region(BRAM_input_buffer, BRAM_weight_one, BRAM_weight_two, BRAM_weight_three, BRAM_weight_four, BRAM_weight_five, BRAM_weight_six, BRAM_weight_seven, BRAM_weight_ten, BRAM_output_buffer_one);
    vector_sub(BRAM_input_buffer, BRAM_output_buffer_one, BRAM_output_buffer_two);
    store_data(BRAM_output_buffer_two, DRAM_output);

}