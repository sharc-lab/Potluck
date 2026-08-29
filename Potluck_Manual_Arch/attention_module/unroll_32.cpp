
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

#include "hls_stream.h"
#include "ap_axi_sdata.h"   // for ap_axis

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<256>

#define SEQ_LEN  128
#define HIDDEN_DIM  128
#define DIM 256


void matmul_PE_one(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
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
            output[i][j] = acc;
        }
    }
}


void matmul_PE_two(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
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
            output[i][j] = acc;
        }
    }
}

void matmul_PE_three(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
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
            output[i][j] = acc;
        }
    }
}


void matmul_PE_four(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=32 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
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
            output[i][j] = acc;
        }
    }
}

void accumulate_redistribute(
    data_t C00[SEQ_LEN][HIDDEN_DIM],   // partial from A0×W00
    data_t C10[SEQ_LEN][HIDDEN_DIM],   // partial from A1×W10
    data_t C01[SEQ_LEN][HIDDEN_DIM],   // partial from A0×W01
    data_t C11[SEQ_LEN][HIDDEN_DIM],   // partial from A1×W11
    data_t output[SEQ_LEN][DIM] // final 32×64 output
) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=C00 cyclic factor=16 dim=2
#pragma HLS ARRAY_PARTITION variable=C10 cyclic factor=16 dim=2
#pragma HLS ARRAY_PARTITION variable=C01 cyclic factor=16 dim=2
#pragma HLS ARRAY_PARTITION variable=C11 cyclic factor=16 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=16 dim=2
    // Pipeline the outer loop so we can sustain one row per cycle
    for (int i = 0; i < SEQ_LEN; i++) {
        // Unroll inner j-loop a bit for throughput
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=16
            // accumulate along k
            data_t s0 = C00[i][j] + C10[i][j];
            data_t s1 = C01[i][j] + C11[i][j];
            // pack back into the 64-wide row
            output[i][j]            = s0;            // cols 0..31
            output[i][j + HIDDEN_DIM] = s1;            // cols 32..63
        }
    }
}

void accumulate_one(
    data_t C0[SEQ_LEN][HIDDEN_DIM],       // e.g. A0×W00
    data_t C1[SEQ_LEN][HIDDEN_DIM],       // e.g. A1×W10
    data_t output[SEQ_LEN][HIDDEN_DIM]    // final 32×64 output
) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=C0 cyclic factor=32 dim=2
#pragma HLS ARRAY_PARTITION variable=C1 cyclic factor=32 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=32
            output[i][j] = C0[i][j] + C1[i][j];
        }
    }
}

void accumulate_two(
    data_t C0[SEQ_LEN][HIDDEN_DIM],       // e.g. A0×W00
    data_t C1[SEQ_LEN][HIDDEN_DIM],       // e.g. A1×W10
    data_t output[SEQ_LEN][HIDDEN_DIM]    // final 32×64 output
) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=C0 cyclic factor=32 dim=2
#pragma HLS ARRAY_PARTITION variable=C1 cyclic factor=32 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=32
            output[i][j] = C0[i][j] + C1[i][j];
        }
    }
}

void load_data(
    data_t DRAM_input_1[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_input_2[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_input_3[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_3[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_input_4[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_4[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_1[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_2[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_3[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_3[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_4[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_4[HIDDEN_DIM][HIDDEN_DIM]
) {
#pragma HLS INLINE off
    // Load data from DRAM to BRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_1[i][j] = DRAM_input_1[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_1[i][j] = DRAM_weight_1[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_2[i][j] = DRAM_input_2[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_2[i][j] = DRAM_weight_2[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_3[i][j] = DRAM_input_3[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_3[i][j] = DRAM_weight_3[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_4[i][j] = DRAM_input_4[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_4[i][j] = DRAM_weight_4[i][j];
        }
    }
}

void store_data(
    data_t BRAM_output[SEQ_LEN][DIM],
    data_t DRAM_output[SEQ_LEN][DIM]
) {
#pragma HLS INLINE off
    // Store data from BRAM to DRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < DIM; j++) {
            DRAM_output[i][j] = BRAM_output[i][j];
        }
    }
}

void store_data_two_first(
    data_t BRAM_output_A[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output_A[SEQ_LEN][DIM],
    data_t BRAM_output_B[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output_B[SEQ_LEN][DIM]

) {
#pragma HLS INLINE off
    // Store data from BRAM to DRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output_A[i][j] = BRAM_output_A[i][j];
        }
    }

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output_B[i][j] = BRAM_output_B[i][j];
        }
    }
}


void store_data_two_second(
    data_t BRAM_output_A[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output_A[SEQ_LEN][DIM],
    data_t BRAM_output_B[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output_B[SEQ_LEN][DIM]

) {
#pragma HLS INLINE off
    // Store data from BRAM to DRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output_A[i][j + HIDDEN_DIM] = BRAM_output_A[i][j];
        }
    }

    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output_B[i][j + HIDDEN_DIM] = BRAM_output_B[i][j];
        }
    }
}

void load_data_QK(
    data_t DRAM_input_1[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_input_2[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM],
    data_t DRAM_input_3[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_input_4[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_input_1[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_2[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM],
    data_t BRAM_input_3[SEQ_LEN][HIDDEN_DIM],
    data_t BRAM_input_4[SEQ_LEN][HIDDEN_DIM]
) {
#pragma HLS INLINE off
    // Load data from DRAM to BRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_1[i][j] = DRAM_input_1[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_1[i][j] = DRAM_weight_1[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_2[i][j] = DRAM_input_2[i][j];
        }
    }
    for (int i = 0; i < HIDDEN_DIM; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_weight_2[i][j] = DRAM_weight_2[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_3[i][j] = DRAM_input_3[i][j];
        }
    }
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            BRAM_input_4[i][j] = DRAM_input_4[i][j];
        }
    }
}

void store_data_A(
    data_t BRAM_input[SEQ_LEN][HIDDEN_DIM],
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM]
) {
#pragma HLS INLINE off
    // Store data from BRAM to DRAM
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            DRAM_output[i][j] = BRAM_input[i][j];
        }
    }
}

void copy_buffer(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=32 dim=2
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=32 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
        #pragma HLS UNROLL factor=32
            output[i][j] = input[i][j];
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
                data_t A0[SEQ_LEN][HIDDEN_DIM],
                data_t A1[SEQ_LEN][HIDDEN_DIM],
                data_t AW00[HIDDEN_DIM][HIDDEN_DIM],
                data_t AW10[HIDDEN_DIM][HIDDEN_DIM],
                data_t AW01[HIDDEN_DIM][HIDDEN_DIM],
                data_t AW11[HIDDEN_DIM][HIDDEN_DIM],
                data_t A_output[SEQ_LEN][DIM],
                data_t B0[SEQ_LEN][HIDDEN_DIM],
                data_t B1[SEQ_LEN][HIDDEN_DIM],
                data_t BW00[HIDDEN_DIM][HIDDEN_DIM],
                data_t BW10[HIDDEN_DIM][HIDDEN_DIM],
                data_t BW01[HIDDEN_DIM][HIDDEN_DIM],
                data_t BW11[HIDDEN_DIM][HIDDEN_DIM],
                data_t B_output[SEQ_LEN][DIM], 
                data_t output_matrix[SEQ_LEN][HIDDEN_DIM]) 
{
    DATA_TYPE_INST instruction;
    data_t BRAM_input_1[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_1[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_2[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_2[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_3[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_3[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_3[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_4[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_4[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_4[SEQ_LEN][HIDDEN_DIM];


    data_t BRAM_output_final_1[SEQ_LEN][DIM];
    data_t BRAM_output_final_A[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_B[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_3[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_2[SEQ_LEN][HIDDEN_DIM];


    ap_uint<1> load_data_start[1];
    ap_uint<1> load_data_QK_start[1];
    ap_uint<1> matmul_PE_one_start[1];
    ap_uint<1> matmul_PE_two_start[1];
    ap_uint<1> matmul_PE_three_start[1];
    ap_uint<1> matmul_PE_four_start[1];
    ap_uint<1> accumulate_redistribute_start[1];
    ap_uint<1> accumulate_one_start[1];
    ap_uint<1> accumulate_two_start[1];
    ap_uint<1> store_data_start[1];
    ap_uint<1> store_data_two_first_start[1];
    ap_uint<1> store_data_two_second_start[1];
    ap_uint<1> store_data_A_start[1];
    ap_uint<1> copy_buffer_start[1];

    ap_uint<3> load_data_DRAM_input_1_sel[1];
    ap_uint<3> load_data_DRAM_weight_1_sel[1];
    ap_uint<3> load_data_DRAM_input_2_sel[1];
    ap_uint<3> load_data_DRAM_weight_2_sel[1];
    ap_uint<3> load_data_DRAM_input_3_sel[1];
    ap_uint<3> load_data_DRAM_weight_3_sel[1];
    ap_uint<3> load_data_DRAM_input_4_sel[1];
    ap_uint<3> load_data_DRAM_weight_4_sel[1];
    ap_uint<1> load_data_BRAM_input_1_sel[1];
    ap_uint<1> load_data_BRAM_weight_1_sel[1];
    ap_uint<1> load_data_BRAM_input_2_sel[1];
    ap_uint<1> load_data_BRAM_weight_2_sel[1];
    ap_uint<1> load_data_BRAM_input_3_sel[1];
    ap_uint<1> load_data_BRAM_weight_3_sel[1];
    ap_uint<1> load_data_BRAM_input_4_sel[1];
    ap_uint<1> load_data_BRAM_weight_4_sel[1];

    ap_uint<2> load_data_QK_DRAM_input_1_sel[1];
    ap_uint<2> load_data_QK_DRAM_weight_1_sel[1];
    ap_uint<2> load_data_QK_DRAM_input_2_sel[1];
    ap_uint<2> load_data_QK_DRAM_weight_2_sel[1];
    ap_uint<2> load_data_QK_DRAM_input_3_sel[1];
    ap_uint<2> load_data_QK_DRAM_input_4_sel[1];
    ap_uint<1> load_data_QK_BRAM_input_1_sel[1];
    ap_uint<1> load_data_QK_BRAM_weight_1_sel[1];
    ap_uint<1> load_data_QK_BRAM_input_2_sel[1];
    ap_uint<1> load_data_QK_BRAM_weight_2_sel[1];
    ap_uint<1> load_data_QK_BRAM_input_3_sel[1];
    ap_uint<1> load_data_QK_BRAM_input_4_sel[1];

    ap_uint<1> accumulate_redistribute_C00_sel[1];
    ap_uint<1> accumulate_redistribute_C10_sel[1];
    ap_uint<1> accumulate_redistribute_C01_sel[1];
    ap_uint<1> accumulate_redistribute_C11_sel[1];
    ap_uint<1> accumulate_redistribute_output_sel[1];

    ap_uint<2> accumulate_one_C0_sel[1];
    ap_uint<2> accumulate_one_C1_sel[1];
    ap_uint<2> accumulate_one_output_sel[1];

    ap_uint<2> accumulate_two_C0_sel[1];
    ap_uint<2> accumulate_two_C1_sel[1];
    ap_uint<2> accumulate_two_output_sel[1];

    ap_uint<1> store_data_BRAM_output_sel[1];
    ap_uint<2> store_data_DRAM_output_sel[1];

    ap_uint<1> store_data_two_first_BRAM_output_A_sel[1];
    ap_uint<1> store_data_two_first_DRAM_output_A_sel[1];
    ap_uint<1> store_data_two_first_BRAM_output_B_sel[1];
    ap_uint<1> store_data_two_first_DRAM_output_B_sel[1];

    ap_uint<1> store_data_two_second_BRAM_output_A_sel[1];
    ap_uint<1> store_data_two_second_DRAM_output_A_sel[1];
    ap_uint<1> store_data_two_second_BRAM_output_B_sel[1];
    ap_uint<1> store_data_two_second_DRAM_output_B_sel[1];

    ap_uint<1> store_data_A_BRAM_output_sel[1];
    ap_uint<1> store_data_A_DRAM_output_sel[1];

    ap_uint<2> copy_buffer_input_sel[1];
    ap_uint<2> copy_buffer_output_sel[1];

    ap_uint<1> matmal_PE_one_input_sel[1];
    ap_uint<1> matmal_PE_one_weight_sel[1];
    ap_uint<1> matmal_PE_one_output_sel[1];

    ap_uint<1> matmal_PE_two_input_sel[1];
    ap_uint<1> matmal_PE_two_weight_sel[1];
    ap_uint<1> matmal_PE_two_output_sel[1];

    ap_uint<1> matmal_PE_three_input_sel[1];
    ap_uint<1> matmal_PE_three_weight_sel[1];
    ap_uint<1> matmal_PE_three_output_sel[1];

    ap_uint<1> matmal_PE_four_input_sel[1];
    ap_uint<1> matmal_PE_four_weight_sel[1];
    ap_uint<1> matmal_PE_four_output_sel[1];


#pragma HLS inline off
while (1)
    {
        instruction = fifo.read();
        load_data_start[0] = instruction.range(0, 0);
        load_data_QK_start[0] = instruction.range(1, 1);
        matmul_PE_one_start[0] = instruction.range(2, 2);
        matmul_PE_two_start[0] = instruction.range(3, 3);
        matmul_PE_three_start[0] = instruction.range(4, 4);
        matmul_PE_four_start[0] = instruction.range(5, 5);
        accumulate_redistribute_start[0] = instruction.range(6, 6);
        accumulate_one_start[0] = instruction.range(7, 7);
        accumulate_two_start[0] = instruction.range(8, 8);
        store_data_start[0] = instruction.range(9, 9);
        store_data_two_first_start[0] = instruction.range(10, 10);
        store_data_two_second_start[0] = instruction.range(11, 11);
        store_data_A_start[0] = instruction.range(12, 12);
        copy_buffer_start[0] = instruction.range(13, 13);

        load_data_DRAM_input_1_sel[0] = instruction.range(16, 14);
        load_data_DRAM_weight_1_sel[0] = instruction.range(19, 17);
        load_data_DRAM_input_2_sel[0] = instruction.range(22, 20);
        load_data_DRAM_weight_2_sel[0] = instruction.range(25, 23);
        load_data_DRAM_input_3_sel[0] = instruction.range(28, 26);
        load_data_DRAM_weight_3_sel[0] = instruction.range(31, 29);
        load_data_DRAM_input_4_sel[0] = instruction.range(34, 32);
        load_data_DRAM_weight_4_sel[0] = instruction.range(37, 35);
        load_data_BRAM_input_1_sel[0] = instruction.range(38, 38);
        load_data_BRAM_weight_1_sel[0] = instruction.range(39, 39);
        load_data_BRAM_input_2_sel[0] = instruction.range(40, 40);
        load_data_BRAM_weight_2_sel[0] = instruction.range(41, 41);
        load_data_BRAM_input_3_sel[0] = instruction.range(42, 42);
        load_data_BRAM_weight_3_sel[0] = instruction.range(43, 43);
        load_data_BRAM_input_4_sel[0] = instruction.range(44, 44);
        load_data_BRAM_weight_4_sel[0] = instruction.range(45, 45);

        load_data_QK_DRAM_input_1_sel[0] = instruction.range(47, 46);
        load_data_QK_DRAM_weight_1_sel[0] = instruction.range(49, 48);
        load_data_QK_DRAM_input_2_sel[0] = instruction.range(51, 50);
        load_data_QK_DRAM_weight_2_sel[0] = instruction.range(53, 52);
        load_data_QK_DRAM_input_3_sel[0] = instruction.range(55, 54);
        load_data_QK_DRAM_input_4_sel[0] = instruction.range(57, 56);
        load_data_QK_BRAM_input_1_sel[0] = instruction.range(58, 58);
        load_data_QK_BRAM_weight_1_sel[0] = instruction.range(59, 59);
        load_data_QK_BRAM_input_2_sel[0] = instruction.range(60, 60);
        load_data_QK_BRAM_weight_2_sel[0] = instruction.range(61, 61);
        load_data_QK_BRAM_input_3_sel[0] = instruction.range(62, 62);
        load_data_QK_BRAM_input_4_sel[0] = instruction.range(63, 63);

        accumulate_redistribute_C00_sel[0] = instruction.range(64, 64);
        accumulate_redistribute_C10_sel[0] = instruction.range(65, 65);
        accumulate_redistribute_C01_sel[0] = instruction.range(66, 66);
        accumulate_redistribute_C11_sel[0] = instruction.range(67, 67);
        accumulate_redistribute_output_sel[0] = instruction.range(68, 68);

        accumulate_one_C0_sel[0] = instruction.range(70, 69);
        accumulate_one_C1_sel[0] = instruction.range(72, 71);
        accumulate_one_output_sel[0] = instruction.range(74, 73);


        accumulate_two_C0_sel[0] = instruction.range(76, 75);
        accumulate_two_C1_sel[0] = instruction.range(78, 77);
        accumulate_two_output_sel[0] = instruction.range(80, 79);


        store_data_BRAM_output_sel[0] = instruction.range(81, 81);
        store_data_DRAM_output_sel[0] = instruction.range(83, 82);


        store_data_two_first_BRAM_output_A_sel[0] = instruction.range(84, 84);
        store_data_two_first_DRAM_output_A_sel[0] = instruction.range(85, 85);
        store_data_two_first_BRAM_output_B_sel[0] = instruction.range(86, 86);
        store_data_two_first_DRAM_output_B_sel[0] = instruction.range(87, 87);
        store_data_two_second_BRAM_output_A_sel[0] = instruction.range(88, 88);
        store_data_two_second_DRAM_output_A_sel[0] = instruction.range(89, 89);
        store_data_two_second_BRAM_output_B_sel[0] = instruction.range(90, 90);
        store_data_two_second_DRAM_output_B_sel[0] = instruction.range(91, 91);


        store_data_A_BRAM_output_sel[0] = instruction.range(92, 92);
        store_data_A_DRAM_output_sel[0] = instruction.range(93, 93);

        copy_buffer_input_sel[0] = instruction.range(95, 94);
        copy_buffer_output_sel[0] = instruction.range(97, 96);

        matmal_PE_one_input_sel[0] = instruction.range(99, 99);
        matmal_PE_one_weight_sel[0] = instruction.range(100, 100);
        matmal_PE_one_output_sel[0] = instruction.range(101, 101);

        matmal_PE_two_input_sel[0] = instruction.range(102, 102);
        matmal_PE_two_weight_sel[0] = instruction.range(103, 103);
        matmal_PE_two_output_sel[0] = instruction.range(104, 104);

        matmal_PE_three_input_sel[0] = instruction.range(105, 105);
        matmal_PE_three_weight_sel[0] = instruction.range(106, 106);
        matmal_PE_three_output_sel[0] = instruction.range(107, 107);

        matmal_PE_four_input_sel[0] = instruction.range(108, 108);
        matmal_PE_four_weight_sel[0] = instruction.range(109, 109);
        matmal_PE_four_output_sel[0] = instruction.range(110, 110);


        if (instruction.range(98, 98) == 0b1) {
            break; // Exit condition
        }  

        if( load_data_start[0] == 0b1) {
            if (load_data_DRAM_input_1_sel[0] == 0b001 
            && load_data_DRAM_weight_1_sel[0] == 0b001 
            && load_data_DRAM_input_2_sel[0] == 0b001
            && load_data_DRAM_weight_2_sel[0] == 0b001
            && load_data_DRAM_input_3_sel[0] == 0b001
            && load_data_DRAM_weight_3_sel[0] == 0b001
            && load_data_DRAM_input_4_sel[0] == 0b001
            && load_data_DRAM_weight_4_sel[0] == 0b001
            && load_data_BRAM_input_1_sel[0] == 0b1
            && load_data_BRAM_weight_1_sel[0] == 0b1
            && load_data_BRAM_input_2_sel[0] == 0b1
            && load_data_BRAM_weight_2_sel[0] == 0b1
            && load_data_BRAM_input_3_sel[0] == 0b1
            && load_data_BRAM_weight_3_sel[0] == 0b1
            && load_data_BRAM_input_4_sel[0] == 0b1
            && load_data_BRAM_weight_4_sel[0] == 0b1) {
                load_data(
                        A0, AW00,
                        A1, AW10,
                        A0, AW01,
                        A1, AW11,
                        BRAM_input_1, BRAM_weight_1,
                        BRAM_input_2, BRAM_weight_2,
                        BRAM_input_3, BRAM_weight_3,
                        BRAM_input_4, BRAM_weight_4
                    );
            }

            if(load_data_DRAM_input_1_sel[0] == 0b010 
            && load_data_DRAM_weight_1_sel[0] == 0b010
            && load_data_DRAM_input_2_sel[0] == 0b010
            && load_data_DRAM_weight_2_sel[0] == 0b010
            && load_data_DRAM_input_3_sel[0] == 0b010
            && load_data_DRAM_weight_3_sel[0] == 0b010
            && load_data_DRAM_input_4_sel[0] == 0b010
            && load_data_DRAM_weight_4_sel[0] == 0b010
            && load_data_BRAM_input_1_sel[0] == 0b1
            && load_data_BRAM_weight_1_sel[0] == 0b1
            && load_data_BRAM_input_2_sel[0] == 0b1
            && load_data_BRAM_weight_2_sel[0] == 0b1
            && load_data_BRAM_input_3_sel[0] == 0b1
            && load_data_BRAM_weight_3_sel[0] == 0b1
            && load_data_BRAM_input_4_sel[0] == 0b1
            && load_data_BRAM_weight_4_sel[0] == 0b1){
                load_data(
                    B0, BW00,
                    B1, BW10,
                    B0, BW01,
                    B1, BW11,
                    BRAM_input_1, BRAM_weight_1,
                    BRAM_input_2, BRAM_weight_2,
                    BRAM_input_3, BRAM_weight_3,
                    BRAM_input_4, BRAM_weight_4
                );

            }

            if(load_data_DRAM_input_1_sel[0] == 0b011 
            && load_data_DRAM_weight_1_sel[0] == 0b011
            && load_data_DRAM_input_2_sel[0] == 0b011
            && load_data_DRAM_weight_2_sel[0] == 0b011
            && load_data_DRAM_input_3_sel[0] == 0b011
            && load_data_DRAM_weight_3_sel[0] == 0b011
            && load_data_DRAM_input_4_sel[0] == 0b011
            && load_data_DRAM_weight_4_sel[0] == 0b011
            && load_data_BRAM_input_1_sel[0] == 0b1
            && load_data_BRAM_weight_1_sel[0] == 0b1
            && load_data_BRAM_input_2_sel[0] == 0b1
            && load_data_BRAM_weight_2_sel[0] == 0b1
            && load_data_BRAM_input_3_sel[0] == 0b1
            && load_data_BRAM_weight_3_sel[0] == 0b1
            && load_data_BRAM_input_4_sel[0] == 0b1
            && load_data_BRAM_weight_4_sel[0] == 0b1) {

                load_data(
                    A0, AW00,
                    A1, AW10,
                    B0, BW00,
                    B1, BW10,
                    BRAM_input_1, BRAM_weight_1,
                    BRAM_input_2, BRAM_weight_2,
                    BRAM_input_3, BRAM_weight_3,
                    BRAM_input_4, BRAM_weight_4
                );
        }

        if(load_data_DRAM_input_1_sel[0] == 0b100 
            && load_data_DRAM_weight_1_sel[0] == 0b100
            && load_data_DRAM_input_2_sel[0] == 0b100
            && load_data_DRAM_weight_2_sel[0] == 0b100
            && load_data_DRAM_input_3_sel[0] == 0b100
            && load_data_DRAM_weight_3_sel[0] == 0b100
            && load_data_DRAM_input_4_sel[0] == 0b100
            && load_data_DRAM_weight_4_sel[0] == 0b100
            && load_data_BRAM_input_1_sel[0] == 0b1
            && load_data_BRAM_weight_1_sel[0] == 0b1
            && load_data_BRAM_input_2_sel[0] == 0b1
            && load_data_BRAM_weight_2_sel[0] == 0b1
            && load_data_BRAM_input_3_sel[0] == 0b1
            && load_data_BRAM_weight_3_sel[0] == 0b1
            && load_data_BRAM_input_4_sel[0] == 0b1
            && load_data_BRAM_weight_4_sel[0] == 0b1) {

                load_data(
                A0, AW01,
                A1, AW11,
                B0, BW01,
                B1, BW11,
                BRAM_input_1, BRAM_weight_1,
                BRAM_input_2, BRAM_weight_2,
                BRAM_input_3, BRAM_weight_3,
                BRAM_input_4, BRAM_weight_4
                );
            }
            
        }

        if(load_data_QK_start[0] == 0b1) {
            if (load_data_QK_DRAM_input_1_sel[0] == 0b01
            && load_data_QK_DRAM_weight_1_sel[0] == 0b01
            && load_data_QK_DRAM_input_2_sel[0] == 0b01
            && load_data_QK_DRAM_weight_2_sel[0] == 0b01
            && load_data_QK_DRAM_input_3_sel[0] == 0b01
            && load_data_QK_DRAM_input_4_sel[0] == 0b01
            && load_data_QK_BRAM_input_1_sel[0] == 0b1
            && load_data_QK_BRAM_weight_1_sel[0] == 0b1
            && load_data_QK_BRAM_input_2_sel[0] == 0b1
            && load_data_QK_BRAM_weight_2_sel[0] == 0b1
            && load_data_QK_BRAM_input_3_sel[0] == 0b1
            && load_data_QK_BRAM_input_4_sel[0] == 0b1) {
                load_data_QK(
                    A0, AW00,
                    A1, AW10,
                    B0, B0,
                    BRAM_input_1, BRAM_weight_1,
                    BRAM_input_2, BRAM_weight_2,
                    BRAM_weight_3,  BRAM_weight_4
                );
            }

            if( load_data_QK_DRAM_input_1_sel[0] == 0b10 
            && load_data_QK_DRAM_weight_1_sel[0] == 0b10
            && load_data_QK_DRAM_input_2_sel[0] == 0b10
            && load_data_QK_DRAM_weight_2_sel[0] == 0b10
            && load_data_QK_DRAM_input_3_sel[0] == 0b10
            && load_data_QK_DRAM_input_4_sel[0] == 0b10
            && load_data_QK_BRAM_input_1_sel[0] == 0b1
            && load_data_QK_BRAM_weight_1_sel[0] == 0b1
            && load_data_QK_BRAM_input_2_sel[0] == 0b1
            && load_data_QK_BRAM_weight_2_sel[0] == 0b1
            && load_data_QK_BRAM_input_3_sel[0] == 0b1
            && load_data_QK_BRAM_input_4_sel[0] == 0b1) {
                
                load_data_QK(
                    A0, AW01,
                    A1, AW11,
                    B1, B1,
                    BRAM_input_1, BRAM_weight_1,
                    BRAM_input_2, BRAM_weight_2,
                    BRAM_weight_3,  BRAM_weight_4
                );
            }
        }

        if(matmul_PE_one_start[0] == 0b1 && matmul_PE_two_start[0] == 0b1
        && matmul_PE_three_start[0] == 0b1 && matmul_PE_four_start[0] == 0b1 &&
        matmal_PE_one_input_sel[0] == 0b1 && matmal_PE_one_weight_sel[0] == 0b1 && matmal_PE_one_output_sel[0] == 0b1 &&
        matmal_PE_two_input_sel[0] == 0b1 && matmal_PE_two_weight_sel[0] == 0b1 && matmal_PE_two_output_sel[0] == 0b1 &&
        matmal_PE_three_input_sel[0] == 0b1 && matmal_PE_three_weight_sel[0] == 0b1 && matmal_PE_three_output_sel[0] == 0b1 &&
        matmal_PE_four_input_sel[0] == 0b1 && matmal_PE_four_weight_sel[0] == 0b1 && matmal_PE_four_output_sel[0] == 0b1) {
           matmul_PE_one(BRAM_input_1, BRAM_weight_1, BRAM_output_1);
           matmul_PE_two(BRAM_input_2, BRAM_weight_2, BRAM_output_2);
           matmul_PE_three(BRAM_input_3, BRAM_weight_3, BRAM_output_3);
           matmul_PE_four(BRAM_input_4, BRAM_weight_4, BRAM_output_4); 
           printf("PE one, two, three and four finished\n");
        }
        if(accumulate_redistribute_start[0] == 0b1) {
            if (accumulate_redistribute_C00_sel[0] == 0b1 
            && accumulate_redistribute_C10_sel[0] == 0b1 
            && accumulate_redistribute_C01_sel[0] == 0b1
            && accumulate_redistribute_C11_sel[0] == 0b1
            && accumulate_redistribute_output_sel[0] == 0b1) {
                accumulate_redistribute(
                BRAM_output_1, BRAM_output_2,
                BRAM_output_3, BRAM_output_4,
                BRAM_output_final_1
                );

            }
        }

        if(accumulate_one_start[0] == 0b1) {
            if (accumulate_one_C0_sel[0] == 0b01 && accumulate_one_C1_sel[0] == 0b01 && accumulate_one_output_sel[0] == 0b01) {
                accumulate_one(
                BRAM_output_1, BRAM_output_2,
                BRAM_output_final_A
                );
            }
            if (accumulate_one_C0_sel[0] == 0b10 && accumulate_one_C1_sel[0] == 0b10 && accumulate_one_output_sel[0] == 0b01){
                accumulate_one(
                BRAM_output_3, BRAM_output_4,
                BRAM_output_final_A
                );
            }
            if (accumulate_one_C0_sel[0] == 0b10 && accumulate_one_C1_sel[0] == 0b10 && accumulate_one_output_sel[0] == 0b10){
                accumulate_one(
                BRAM_output_3, BRAM_output_4,
                BRAM_output_final_B
                );
            }
        }

        if (accumulate_two_start[0] == 0b1) {
            if (accumulate_two_C0_sel[0] == 0b01 && accumulate_two_C1_sel[0] == 0b01 && accumulate_two_output_sel[0] == 0b01) {
                accumulate_two(
                BRAM_output_3, BRAM_output_4,
                BRAM_output_final_B
                );
            }
            if (accumulate_two_C0_sel[0] == 0b10 && accumulate_two_C1_sel[0] == 0b10 && accumulate_two_output_sel[0] == 0b10){
                accumulate_two(
                BRAM_output_final_A, BRAM_output_final_B,
                BRAM_output_final_3
                );
            }
        }
        if(store_data_start[0] == 0b1) {
            if (store_data_BRAM_output_sel[0] == 0b1 && store_data_DRAM_output_sel[0] == 0b01) {
                store_data(BRAM_output_final_1, A_output);
            }
            if (store_data_BRAM_output_sel[0] == 0b1 && store_data_DRAM_output_sel[0] == 0b10) {
                store_data(BRAM_output_final_1, B_output);
            }
        }
        if(store_data_two_first_start[0] == 0b1) {
            if (store_data_two_first_BRAM_output_A_sel[0] == 0b1 
            && store_data_two_first_DRAM_output_A_sel[0] == 0b1
            && store_data_two_first_BRAM_output_B_sel[0] == 0b1
            && store_data_two_first_DRAM_output_B_sel[0] == 0b1) {
                store_data_two_first(
                    BRAM_output_final_A, A_output,
                    BRAM_output_final_B, B_output
                );
            }
        }
        if(store_data_two_second_start[0] == 0b1) {
            if (store_data_two_second_BRAM_output_A_sel[0] == 0b1 
            && store_data_two_second_DRAM_output_A_sel[0] == 0b1
            && store_data_two_second_BRAM_output_B_sel[0] == 0b1
            && store_data_two_second_DRAM_output_B_sel[0] == 0b1) {
                store_data_two_second(
                    BRAM_output_final_A, A_output,
                    BRAM_output_final_B, B_output
                );  
            }
        }

        if(store_data_A_start[0] == 0b1) {
            if (store_data_A_BRAM_output_sel[0] == 0b1 && store_data_A_DRAM_output_sel[0] == 0b1) {
                store_data_A(BRAM_output_final_3, output_matrix);
            }
        }

        if(copy_buffer_start[0] == 0b1) {
            if (copy_buffer_input_sel[0] == 0b01 && copy_buffer_output_sel[0] == 0b01) {
                copy_buffer(BRAM_output_1, BRAM_input_3);
            }
            if (copy_buffer_input_sel[0] == 0b10 && copy_buffer_output_sel[0] == 0b10) {
                copy_buffer(BRAM_output_2, BRAM_input_4);
            }
        }
    }
}

void top(data_t A0[SEQ_LEN][HIDDEN_DIM],
        data_t A1[SEQ_LEN][HIDDEN_DIM],
        data_t AW00[HIDDEN_DIM][HIDDEN_DIM],
        data_t AW10[HIDDEN_DIM][HIDDEN_DIM],
        data_t AW01[HIDDEN_DIM][HIDDEN_DIM],
        data_t AW11[HIDDEN_DIM][HIDDEN_DIM],
        data_t A_output[SEQ_LEN][DIM],
        data_t B0[SEQ_LEN][HIDDEN_DIM],
        data_t B1[SEQ_LEN][HIDDEN_DIM],
        data_t BW00[HIDDEN_DIM][HIDDEN_DIM],
        data_t BW10[HIDDEN_DIM][HIDDEN_DIM],
        data_t BW01[HIDDEN_DIM][HIDDEN_DIM],
        data_t BW11[HIDDEN_DIM][HIDDEN_DIM],
        data_t B_output[SEQ_LEN][DIM], 
        data_t output_matrix[SEQ_LEN][HIDDEN_DIM],
        DATA_TYPE_INST *inst_dram_0_0, 
        int n_inst_0_0)
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE m_axi port=A0 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=A1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW00 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW10 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW01 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW11 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW11 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=A_output offset=slave bundle=mem2
    #pragma HLS INTERFACE m_axi port=B0 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=B1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=BW00 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=BW10 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=BW01 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=BW11 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=B_output offset=slave bundle=mem2
    #pragma HLS INTERFACE m_axi port=output_matrix offset=slave bundle=mem2

    #pragma HLS INTERFACE m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth = 14


    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow

    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, A0, A1, AW00, AW10, AW01, AW11, A_output,
                B0, B1, BW00, BW10, BW01, BW11, B_output, output_matrix);
}





