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
#define DATA_TYPE_INST ap_int<64>

#define SEQ_LEN     8
#define DIM         32
#define EXPERT_NUM  2
#define NUM_HEADS   4
#define HEAD_DIM    8

int control_status;

void grouped_multihead_attention(
    data_t input[DIM],
    data_t q_weight[DIM][DIM],
    data_t k_weight[DIM][DIM],
    data_t v_weight[DIM][DIM],
    data_t output[DIM],
    int   groups
) {

    #pragma HLS inline off
    #pragma HLS array_partition variable=input type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=q_weight type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=k_weight type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=v_weight type=cyclic factor=1 dim=2
    #pragma HLS array_partition variable=output type=cyclic factor=1 dim=1

    const int heads_per_group = NUM_HEADS / groups;
    const data_t scale = (data_t)1.0 / hls::sqrt((data_t)HEAD_DIM);

    data_t Q[DIM];
    data_t K[DIM];
    data_t V[DIM];

    #pragma HLS array_partition variable=Q type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=K type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=V type=cyclic factor=1 dim=1

    // 1a) Compute Q, K, V
    
    for (int dout = 0; dout < DIM; dout++) {
        Q[dout] = 0;
        K[dout] = 0;
        V[dout] = 0;
        for (int din = 0; din < DIM; din++) {
            #pragma HLS UNROLL factor=1
            Q[dout] += input[din] * q_weight[dout][din];
            K[dout] += input[din] * k_weight[dout][din];
            V[dout] += input[din] * v_weight[dout][din];
        }
    }

    // 1b) Attention per head
    for (int g = 0; g < groups; g++) {
        for (int h = 0; h < heads_per_group; h++) {
            int head_index = g * heads_per_group + h;
            data_t scores = 0;
            for (int d = 0; d < HEAD_DIM; d++) {
            #pragma HLS UNROLL factor=1
                int idx = head_index * HEAD_DIM + d;
                scores += Q[idx] * K[idx];
            }
            scores = scores * scale;
            for (int d = 0; d < HEAD_DIM; d++) {
            #pragma HLS UNROLL factor=1
                int idx = head_index * HEAD_DIM + d;
                output[idx] = scores * V[idx];
            }
        }
    }
}

void top1_gating(
    data_t in_vec[DIM],
    data_t W_g[EXPERT_NUM][DIM],
    data_t B_g[EXPERT_NUM],
    int *control_status
) {

    #pragma HLS inline off
    #pragma HLS array_partition variable=in_vec type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=W_g type=cyclic factor=1 dim=2
    #pragma HLS bind_storage variable=B_g type=ram_1p impl=bram

    data_t best_score = (data_t)-1e9;
    int  best_idx = 0;

    for (int e = 0; e < EXPERT_NUM; e++) {
        data_t acc = B_g[e];
        for (int d = 0; d < DIM; d++) {
    #pragma HLS UNROLL factor=1
            acc += W_g[e][d] * in_vec[d];
        }
        if (acc > best_score) {
            best_score = acc;
            best_idx   = e;
        }
    }
    *control_status = best_idx;
}


void ffn_layer_one(
    data_t input_vector[DIM],
    data_t ffn_weight[DIM][DIM],
    data_t ffn_bias[DIM],
    data_t output_vector[DIM]
) {

    #pragma HLS inline off
    #pragma HLS array_partition variable=input_vector type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=ffn_weight type=cyclic factor=1 dim=2
    
    for (int o = 0; o < DIM; o++) {
        data_t acc = ffn_bias[o];
        for (int i = 0; i < DIM; i++) {
    #pragma HLS UNROLL factor=1
            acc += ffn_weight[o][i] * input_vector[i];
        }
        output_vector[o] = acc;
    }
}

void ffn_layer_two(
    data_t input_vector[DIM],
    const data_t ffn_weight_1[2*DIM][DIM],
    const data_t ffn_bias_1[2*DIM],
    const data_t ffn_weight_2[DIM][2*DIM],
    const data_t ffn_bias_2[DIM],
    data_t output_vector[DIM]
) {
    #pragma HLS inline off

    // Partition inputs and weights for parallel access
    #pragma HLS array_partition variable=input_vector type=cyclic  factor=1 dim=1
    #pragma HLS array_partition variable=ffn_weight_1 type=cyclic  factor=1 dim=2

    #pragma HLS array_partition variable=ffn_weight_2 type=cyclic  factor=1 dim=2

    // Intermediate hidden layer
    data_t hidden[2*DIM];
    #pragma HLS array_partition variable=hidden       type=cyclic  factor=1 dim=1

    // --- Layer 1: DIM → 2*DIM with ReLU activation ---
    for (int h = 0; h < 2*DIM; h++) {
        data_t acc1 = ffn_bias_1[h];
        for (int i = 0; i < DIM; i++) {
    #pragma HLS UNROLL factor=1
            acc1 += ffn_weight_1[h][i] * input_vector[i];
        }
        // ReLU
        hidden[h] = (acc1 > 0) ? acc1 : (data_t)0;
    }

    // --- Layer 2: 2*DIM → DIM (no activation) ---
    for (int o = 0; o < DIM; o++) {
        data_t acc2 = ffn_bias_2[o];
        for (int h = 0; h < 2*DIM; h++) {
    #pragma HLS UNROLL factor=1
            acc2 += ffn_weight_2[o][h] * hidden[h];
        }
        output_vector[o] = acc2;
    }
}

void load_attention_weights(data_t DRAM_q_weight[DIM][DIM],
                            data_t DRAM_k_weight[DIM][DIM],
                            data_t DRAM_v_weight[DIM][DIM],
                            data_t BRAM_q_weight[DIM][DIM],
                            data_t BRAM_k_weight[DIM][DIM],
                            data_t BRAM_v_weight[DIM][DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_q_weight[i][j] = DRAM_q_weight[i][j];
            BRAM_k_weight[i][j] = DRAM_k_weight[i][j];
            BRAM_v_weight[i][j] = DRAM_v_weight[i][j];
        }
    }
}

void load_gating_weights(data_t DRAM_W_g[EXPERT_NUM][DIM],
                            data_t DRAM_b_g[EXPERT_NUM],
                            data_t BRAM_W_g[EXPERT_NUM][DIM],
                            data_t BRAM_b_g[EXPERT_NUM]) {
    #pragma HLS inline off
    for (int e = 0; e < EXPERT_NUM; e++) {
        for (int d = 0; d < DIM; d++) {
            BRAM_W_g[e][d] = DRAM_W_g[e][d];
        }
        BRAM_b_g[e] = DRAM_b_g[e];
    }
}
void load_ffn_weights(data_t DRAM_ffn_weight[DIM][DIM],
                      data_t DRAM_ffn_bias[DIM],
                      data_t BRAM_ffn_weight[DIM][DIM],
                      data_t BRAM_ffn_bias[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_ffn_weight[i][j] = DRAM_ffn_weight[i][j];
        }
        BRAM_ffn_bias[i] = DRAM_ffn_bias[i];
    }
}

void load_ffn_weights_one(data_t DRAM_ffn_weight[DIM][DIM],
                      data_t DRAM_ffn_bias[DIM],
                      data_t BRAM_ffn_weight[DIM][DIM],
                      data_t BRAM_ffn_bias[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_ffn_weight[i][j] = DRAM_ffn_weight[i][j];
        }
        BRAM_ffn_bias[i] = DRAM_ffn_bias[i];
    }
}

void load_ffn_weights_two(data_t DRAM_ffn_weight_2[2 * DIM][DIM],
                      data_t DRAM_ffn_bias_2[2 * DIM],
                      data_t BRAM_ffn_weight_2[2 * DIM][DIM],
                      data_t BRAM_ffn_bias_2[2 * DIM],
                      data_t DRAM_ffn_weight_3[DIM][2 * DIM],
                      data_t DRAM_ffn_bias_3[DIM],
                      data_t BRAM_ffn_weight_3[DIM][2 * DIM],
                      data_t BRAM_ffn_bias_3[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < 2 * DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_ffn_weight_2[i][j] = DRAM_ffn_weight_2[i][j];
        }
        BRAM_ffn_bias_2[i] = DRAM_ffn_bias_2[i];
    }

    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < 2 * DIM; j++) {
            BRAM_ffn_weight_3[i][j] = DRAM_ffn_weight_3[i][j];
        }
        BRAM_ffn_bias_3[i] = DRAM_ffn_bias_3[i];
    }
}

void load_ffn_weights_three(data_t DRAM_ffn_weight[DIM][DIM],
                      data_t DRAM_ffn_bias[DIM],
                      data_t BRAM_ffn_weight[DIM][DIM],
                      data_t BRAM_ffn_bias[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_ffn_weight[i][j] = DRAM_ffn_weight[i][j];
        }
        BRAM_ffn_bias[i] = DRAM_ffn_bias[i];
    }
}

void load_ffn_weights_four(data_t DRAM_ffn_weight[DIM][DIM],
                      data_t DRAM_ffn_bias[DIM],
                      data_t BRAM_ffn_weight[DIM][DIM],
                      data_t BRAM_ffn_bias[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        for (int j = 0; j < DIM; j++) {
            BRAM_ffn_weight[i][j] = DRAM_ffn_weight[i][j];
        }
        BRAM_ffn_bias[i] = DRAM_ffn_bias[i];
    }
}

void load_input_vector(data_t DRAM_input[DIM],
                            data_t BRAM_input[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        BRAM_input[i] = DRAM_input[i];
    }
}

void store_output_vector(data_t BRAM_output[DIM],
                            data_t DRAM_output[DIM]) {
    #pragma HLS inline off
    for (int i = 0; i < DIM; i++) {
        DRAM_output[i] = BRAM_output[i];
    }
}

void top(
    data_t DRAM_input[DIM],
    data_t DRAM_q_weight[DIM][DIM],
    data_t DRAM_k_weight[DIM][DIM],
    data_t DRAM_v_weight[DIM][DIM],
    data_t DRAM_W_g[EXPERT_NUM][DIM],
    data_t DRAM_b_g[EXPERT_NUM],
    data_t DRAM_ffn_weight_1[DIM][DIM],
    data_t DRAM_ffn_bias_1[DIM],
    data_t DRAM_ffn_weight_2[2 * DIM][DIM],
    data_t DRAM_ffn_bias_2[2 * DIM],
    data_t DRAM_ffn_weight_3[DIM][2 * DIM],
    data_t DRAM_ffn_bias_3[DIM],
    data_t DRAM_output[DIM], int groups
) {
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS interface m_axi port=DRAM_input offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_q_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_k_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_v_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_W_g offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_b_g offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_output offset=slave bundle=mem2

    #pragma HLS INTERFACE s_axilite port=groups
   
    data_t BRAM_input[DIM];
    data_t BRAM_q_weight[DIM][DIM];
    data_t BRAM_k_weight[DIM][DIM];
    data_t BRAM_v_weight[DIM][DIM];
    data_t BRAM_attn[DIM];
    data_t BRAM_W_g[EXPERT_NUM][DIM];
    data_t BRAM_b_g[EXPERT_NUM];
    data_t BRAM_ffn_weight_1[DIM][DIM];
    data_t BRAM_ffn_bias_1[DIM];
    data_t BRAM_ffn_weight_2[2 * DIM][DIM];
    data_t BRAM_ffn_bias_2[2 * DIM];
    data_t BRAM_ffn_weight_3[DIM][2 * DIM];
    data_t BRAM_ffn_bias_3[DIM];
    data_t BRAM_output[DIM];

    

    load_input_vector(DRAM_input, BRAM_input);
    load_attention_weights(DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
                            BRAM_q_weight, BRAM_k_weight, BRAM_v_weight);
    load_gating_weights(DRAM_W_g, DRAM_b_g, BRAM_W_g, BRAM_b_g);
    grouped_multihead_attention(
        BRAM_input, 
        BRAM_q_weight, 
        BRAM_k_weight, 
        BRAM_v_weight, 
        BRAM_attn, 
        groups
    );
    top1_gating(
        BRAM_attn, 
        BRAM_W_g, 
        BRAM_b_g, 
        &control_status
    );

    if (control_status == 0) {
        load_ffn_weights_one(DRAM_ffn_weight_1, DRAM_ffn_bias_1, BRAM_ffn_weight_1, BRAM_ffn_bias_1);
        ffn_layer_one(
            BRAM_attn, 
            BRAM_ffn_weight_1, 
            BRAM_ffn_bias_1, 
            BRAM_output
        );
    }
    else
    {
        load_ffn_weights_two(DRAM_ffn_weight_2, DRAM_ffn_bias_2, BRAM_ffn_weight_2, BRAM_ffn_bias_2,
                             DRAM_ffn_weight_3, DRAM_ffn_bias_3, BRAM_ffn_weight_3, BRAM_ffn_bias_3);
        ffn_layer_two(
            BRAM_attn, 
            BRAM_ffn_weight_2, 
            BRAM_ffn_bias_2,
            BRAM_ffn_weight_3, 
            BRAM_ffn_bias_3,
            BRAM_output
        );
    }

    store_output_vector(BRAM_output, DRAM_output);
}
    




