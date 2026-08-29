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
//typedef double data_t;
#define DATA_TYPE_INST ap_int<64>

#define SEQ_LEN  32
#define HIDDEN_DIM  32
#define DIM 64

void matmul_PE_one(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
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


void matmul_PE_two(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
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

void matmul_PE_three(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
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


void matmul_PE_four(
          data_t input[SEQ_LEN][HIDDEN_DIM],
          data_t weight[HIDDEN_DIM][HIDDEN_DIM],
          data_t output[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS inline off
    #pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
    #pragma HLS ARRAY_PARTITION variable=weight cyclic factor=4 dim=1
    #pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // Outer loops: iterate over output rows (i) and cols (j)
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < HIDDEN_DIM; j++) {
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


void softmax(
    data_t input[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // For each sequence element
    for (int j = 0; j < SEQ_LEN; j++) {
        // 1) find max for numerical stability
        data_t max_val = input[0][j];
    find_max:
        for (int i = 0; i < HIDDEN_DIM; i++) {

            if (input[i][j] > max_val) {
                max_val = input[i][j];
            }
        }
        // 2) compute un‐normalized exp and running sum
        data_t sum = 0;
    calc_exp:
        for (int i = 0; i < HIDDEN_DIM; i++) {
            data_t e = hls::exp(input[i][j] - max_val);
            output[i][j] = e;
            sum += e;
        }

        // 3) normalize to get probabilities
    normalize:
        for (int i = 0; i < HIDDEN_DIM; i++) {
            output[i][j] = output[i][j] / sum;
        }
    }
}


void softmax_second(
    data_t input[SEQ_LEN][HIDDEN_DIM],
    data_t output[SEQ_LEN][HIDDEN_DIM]
) {
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=input cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    // For each sequence element
    for (int i = 0; i < SEQ_LEN; i++) {
        // 1) find max for numerical stability
        data_t max_val = input[i][0];
    find_max:
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=4
            if (input[i][j] > max_val) {
                max_val = input[i][j];
            }
        }

        // 2) compute un‐normalized exp and running sum
        data_t sum = 0;
    calc_exp:
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=4
            data_t e = hls::exp(input[i][j] - max_val);
            output[i][j] = e;
            sum += e;
        }

        // 3) normalize to get probabilities
    normalize:
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=4
            output[i][j] = output[i][j] / sum;
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
#pragma HLS ARRAY_PARTITION variable=C00 cyclic factor=2 dim=2
#pragma HLS ARRAY_PARTITION variable=C10 cyclic factor=2 dim=2
#pragma HLS ARRAY_PARTITION variable=C01 cyclic factor=2 dim=2
#pragma HLS ARRAY_PARTITION variable=C11 cyclic factor=2 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=2 dim=2
    // Pipeline the outer loop so we can sustain one row per cycle
    for (int i = 0; i < SEQ_LEN; i++) {
        // Unroll inner j-loop a bit for throughput
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=2
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
#pragma HLS ARRAY_PARTITION variable=C0 cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=C1 cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=4
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
#pragma HLS ARRAY_PARTITION variable=C0 cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=C1 cyclic factor=4 dim=2
#pragma HLS ARRAY_PARTITION variable=output cyclic factor=4 dim=2
    for (int i = 0; i < SEQ_LEN; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
#pragma HLS UNROLL factor=4
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


void top(
    data_t A0[SEQ_LEN][HIDDEN_DIM],
    data_t A1[SEQ_LEN][HIDDEN_DIM],
    data_t AW00[HIDDEN_DIM][HIDDEN_DIM],
    data_t AW10[HIDDEN_DIM][HIDDEN_DIM],
    data_t AW01[HIDDEN_DIM][HIDDEN_DIM],
    data_t AW11[HIDDEN_DIM][HIDDEN_DIM],
    data_t B0[SEQ_LEN][HIDDEN_DIM],
    data_t B1[SEQ_LEN][HIDDEN_DIM],
    data_t output_matrix[SEQ_LEN][HIDDEN_DIM]
) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE m_axi port=A0 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=A1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW00 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW10 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW01 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW11 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=AW11 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=B0 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=B1 offset=slave bundle=mem1
    #pragma HLS INTERFACE m_axi port=output_matrix offset=slave bundle=mem2


    data_t BRAM_input_1[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_1[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_1[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_2[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_weight_2[HIDDEN_DIM][HIDDEN_DIM];
    data_t BRAM_output_2[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_3[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_3[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_input_4[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_4[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_A[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_B[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_1[SEQ_LEN][HIDDEN_DIM];
    data_t BRAM_output_final_act[SEQ_LEN][HIDDEN_DIM];


   load_data_QK(
        A0, AW00,
        A1, AW10,
        B0, B0,
        BRAM_input_1, BRAM_weight_1,
        BRAM_input_2, BRAM_weight_2,
        BRAM_input_3,  BRAM_input_4
    );

    matmul_PE_one(BRAM_input_1, BRAM_weight_1, BRAM_output_1);
    matmul_PE_two(BRAM_input_2, BRAM_weight_2, BRAM_output_2);
    matmul_PE_three(BRAM_output_1, BRAM_input_3, BRAM_output_3);
    matmul_PE_four(BRAM_output_2, BRAM_input_4, BRAM_output_4);
    accumulate_one(
        BRAM_output_3, BRAM_output_4,
        BRAM_output_final_A
    );

    load_data_QK(
        A0, AW01,
        A1, AW11,
        B1, B1,
        BRAM_input_1, BRAM_weight_1,
        BRAM_input_2, BRAM_weight_2,
        BRAM_input_3,  BRAM_input_4
    );

    matmul_PE_one(BRAM_input_1, BRAM_weight_1, BRAM_output_1);
    matmul_PE_two(BRAM_input_2, BRAM_weight_2, BRAM_output_2);
    matmul_PE_three(BRAM_output_1, BRAM_input_3, BRAM_output_3);
    matmul_PE_four(BRAM_output_2, BRAM_input_4, BRAM_output_4);
    accumulate_one(
        BRAM_output_3, BRAM_output_4,
        BRAM_output_final_B
    );

    accumulate_two(
        BRAM_output_final_A, BRAM_output_final_B,
        BRAM_output_final_1
    );
    store_data_A(
        BRAM_output_final_1, output_matrix
    );

}