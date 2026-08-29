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
#define DATA_TYPE_INST ap_int<128>

#define SEQ_LEN     8
#define DIM         32
#define EXPERT_NUM  2
#define NUM_HEADS   4
#define HEAD_DIM    8

int control_status_1;
int control_status_2;
int control_status_3;

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


void softmax_gating(
    data_t in_vec[DIM],
    data_t W_g[EXPERT_NUM][DIM],
    data_t B_g[EXPERT_NUM],
    int *sel
) {

    #pragma HLS inline off
    #pragma HLS array_partition variable=in_vec type=cyclic factor=1 dim=1
    #pragma HLS array_partition variable=W_g type=cyclic factor=1 dim=2
    #pragma HLS bind_storage variable=B_g type=ram_1p impl=bram
    data_t scores[EXPERT_NUM];
    data_t sum_exp = 0;

    for (int e = 0; e < EXPERT_NUM; e++) {
        data_t acc = B_g[e];
        for (int d = 0; d < DIM; d++) {
            #pragma HLS UNROLL factor=1
            acc += W_g[e][d] * in_vec[d];
        }
        scores[e] = hls::exp(acc);
        sum_exp += scores[e];
    }

    // Normalize
    for (int e = 0; e < EXPERT_NUM; e++) {
        scores[e] /= sum_exp;
    }

    // Pick best (optional)
    data_t best_score = -1;
    int best_idx = 0;
    for (int e = 0; e < EXPERT_NUM; e++) {
        if (scores[e] > best_score) {
            best_score = scores[e];
            best_idx = e;
        }
    }
    *sel = best_idx;
}

void cosine_gating(
    const data_t in_vec[DIM],                     // token embedding x
    const data_t W_g[EXPERT_NUM][DIM],            // expert weight rows
    const data_t B_g[EXPERT_NUM],                 // (optional) bias
    const data_t inv_norm_W_g[EXPERT_NUM],        // 1 / ||W_g[e]||
    int         *control_status)                  // chosen expert index
{
#pragma HLS inline off
#pragma HLS array_partition variable=in_vec type=cyclic factor=1 dim=1
#pragma HLS array_partition variable=W_g   type=cyclic factor=1 dim=2
#pragma HLS bind_storage   variable=B_g    type=ram_1p impl=bram
#pragma HLS bind_storage   variable=inv_norm_W_g type=ram_1p impl=bram

    /* ---------- 1. compute 1 / ||x|| ---------- */
    data_t sqsum = 0;
    for (int d = 0; d < DIM; d++) {
    #pragma HLS UNROLL factor=1
        data_t v = in_vec[d];
        sqsum   += (data_t)v * (data_t)v;
    }
    /* use float sqrt for accuracy, then cast back to fixed-point */
    data_t norm_f      = hls::sqrt((sqsum) + (data_t) 0.001); // avoid /0
    data_t  inv_norm_in = (data_t)((data_t)1 / norm_f);

    /* ---------- 2. scan experts, keep best ---------- */
    data_t best_score = (data_t)(-1e9);
    int    best_idx   = 0;

    for (int e = 0; e < EXPERT_NUM; e++) {
        data_t acc = B_g[e];
        for (int d = 0; d < DIM; d++) {
            #pragma HLS UNROLL factor=1
            acc += W_g[e][d] * in_vec[d];
        }
        data_t score = (data_t)((data_t)acc * inv_norm_in * inv_norm_W_g[e]);
        if (score > best_score) {
            best_score = score;
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

void load_inv_norm_W_g(data_t DRAM_inv_norm_W_g[EXPERT_NUM],
                            data_t BRAM_inv_norm_W_g[EXPERT_NUM]) {
    #pragma HLS inline off
    for (int e = 0; e < EXPERT_NUM; e++) {
        BRAM_inv_norm_W_g[e] = DRAM_inv_norm_W_g[e];
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
                data_t DRAM_input[DIM],
                data_t DRAM_q_weight[DIM][DIM],
                data_t DRAM_k_weight[DIM][DIM],
                data_t DRAM_v_weight[DIM][DIM],
                data_t DRAM_W_g[EXPERT_NUM][DIM],
                data_t DRAM_b_g[EXPERT_NUM],
                data_t DRAM_inv_norm_W_g[EXPERT_NUM],
                data_t DRAM_ffn_weight_1[DIM][DIM],
                data_t DRAM_ffn_bias_1[DIM],
                data_t DRAM_ffn_weight_2[2 * DIM][DIM],
                data_t DRAM_ffn_bias_2[2 * DIM],
                data_t DRAM_ffn_weight_3[DIM][2 * DIM],
                data_t DRAM_ffn_bias_3[DIM],
                data_t DRAM_output[DIM], int groups,
                int DRAM_control_status_1[1],
                int DRAM_control_status_2[1],
                int DRAM_control_status_3[1]) 
{
    DATA_TYPE_INST instruction;

    static data_t BRAM_input[DIM];
    static data_t BRAM_q_weight[DIM][DIM];
    static data_t BRAM_k_weight[DIM][DIM];
    static data_t BRAM_v_weight[DIM][DIM];
    static data_t BRAM_attn[DIM];
    static data_t BRAM_W_g[EXPERT_NUM][DIM];
    static data_t BRAM_b_g[EXPERT_NUM];
    static data_t BRAM_inv_norm_W_g[EXPERT_NUM];
    static data_t BRAM_ffn_weight_1[DIM][DIM];
    static data_t BRAM_ffn_bias_1[DIM];
    static data_t BRAM_ffn_weight_2[2 * DIM][DIM];
    static data_t BRAM_ffn_bias_2[2 * DIM];
    static data_t BRAM_ffn_weight_3[DIM][2 * DIM];
    static data_t BRAM_ffn_bias_3[DIM];
    static data_t BRAM_output[DIM];


    ap_uint<1> load_input_vector_start[1];
    ap_uint<1> load_attention_weights_start[1];
    ap_uint<1> load_gating_weights_start[1];
    ap_uint<1> load_inv_norm_W_g_start[1];
    ap_uint<1> grouped_multihead_attention_start[1];
    ap_uint<1> top1_gating_start[1];
    ap_uint<1> softmax_gating_start[1];
    ap_uint<1> cosine_gating_start[1];
    ap_uint<1> ffn_layer_one_start[1];
    ap_uint<1> ffn_layer_two_start[1];
    ap_uint<1> load_ffn_weights_one_start[1];
    ap_uint<1> load_ffn_weights_two_start[1];
    ap_uint<1> store_output_vector_start[1];


    
    ap_uint<1> load_input_vector_DRAM_input_sel[1];
    ap_uint<1> load_input_vector_BRAM_input_sel[1];

    ap_uint<1> load_attention_weights_DRAM_q_weight_sel[1];
    ap_uint<1> load_attention_weights_DRAM_k_weight_sel[1];
    ap_uint<1> load_attention_weights_DRAM_v_weight_sel[1];
    ap_uint<1> load_attention_weights_BRAM_q_weight_sel[1];
    ap_uint<1> load_attention_weights_BRAM_k_weight_sel[1];
    ap_uint<1> load_attention_weights_BRAM_v_weight_sel[1];

    ap_uint<1> load_gating_weights_DRAM_W_g_sel[1];
    ap_uint<1> load_gating_weights_DRAM_b_g_sel[1];
    ap_uint<1> load_gating_weights_BRAM_W_g_sel[1];
    ap_uint<1> load_gating_weights_BRAM_b_g_sel[1];

    ap_uint<1> load_inv_norm_W_g_DRAM_inv_norm_W_g_sel[1];
    ap_uint<1> load_inv_norm_W_g_BRAM_inv_norm_W_g_sel[1];

    ap_uint<1> grouped_multihead_attention_input_sel[1];
    ap_uint<1> grouped_multihead_attention_q_weight_sel[1];
    ap_uint<1> grouped_multihead_attention_k_weight_sel[1];
    ap_uint<1> grouped_multihead_attention_v_weight_sel[1];
    ap_uint<1> grouped_multihead_attention_output_sel[1];
    ap_uint<1> grouped_multihead_attention_groups_sel[1];

    ap_uint<1> top1_gating_in_vec_sel[1];
    ap_uint<1> top1_gating_W_g_sel[1];
    ap_uint<1> top1_gating_b_g_sel[1];
    ap_uint<1> top1_gating_control_status_sel[1];

    ap_uint<1> softmax_gating_in_vec_sel[1];
    ap_uint<1> softmax_gating_W_g_sel[1];
    ap_uint<1> softmax_gating_b_g_sel[1];
    ap_uint<1> softmax_gating_control_status_sel[1];

    ap_uint<1> cosine_gating_in_vec_sel[1];
    ap_uint<1> cosine_gating_W_g_sel[1];
    ap_uint<1> cosine_gating_b_g_sel[1];
    ap_uint<1> cosine_gating_inv_norm_W_g_sel[1];
    ap_uint<1> cosine_gating_control_status_sel[1];

    ap_uint<1> ffn_layer_one_input_vector_sel[1];
    ap_uint<1> ffn_layer_one_ffn_weight_sel[1];
    ap_uint<1> ffn_layer_one_ffn_bias_sel[1];
    ap_uint<1> ffn_layer_one_output_vector_sel[1];

    ap_uint<1> ffn_layer_two_input_vector_sel[1];
    ap_uint<1> ffn_layer_two_ffn_weight_1_sel[1];
    ap_uint<1> ffn_layer_two_ffn_bias_1_sel[1];
    ap_uint<1> ffn_layer_two_ffn_weight_2_sel[1];
    ap_uint<1> ffn_layer_two_ffn_bias_2_sel[1];
    ap_uint<1> ffn_layer_two_output_vector_sel[1];

    ap_uint<1> load_ffn_weights_one_DRAM_ffn_weight_sel[1];
    ap_uint<1> load_ffn_weights_one_DRAM_ffn_bias_sel[1];
    ap_uint<1> load_ffn_weights_one_BRAM_ffn_weight_sel[1];
    ap_uint<1> load_ffn_weights_one_BRAM_ffn_bias_sel[1];

    ap_uint<1> load_ffn_weights_two_DRAM_ffn_weight_2_sel[1];
    ap_uint<1> load_ffn_weights_two_DRAM_ffn_bias_2_sel[1];
    ap_uint<1> load_ffn_weights_two_BRAM_ffn_weight_2_sel[1];
    ap_uint<1> load_ffn_weights_two_BRAM_ffn_bias_2_sel[1];
    ap_uint<1> load_ffn_weights_two_DRAM_ffn_weight_3_sel[1];
    ap_uint<1> load_ffn_weights_two_DRAM_ffn_bias_3_sel[1];
    ap_uint<1> load_ffn_weights_two_BRAM_ffn_weight_3_sel[1];
    ap_uint<1> load_ffn_weights_two_BRAM_ffn_bias_3_sel[1];

    ap_uint<1> store_output_vector_BRAM_output_sel[1];
    ap_uint<1> store_output_vector_DRAM_output_sel[1];

#pragma HLS inline off


while (1)
    {
        instruction = fifo.read();
        
        load_input_vector_start[0] = instruction.range(0, 0);
        load_attention_weights_start[0] = instruction.range(1, 1);
        load_gating_weights_start[0] = instruction.range(2, 2);
        load_inv_norm_W_g_start[0] = instruction.range(3, 3);
        grouped_multihead_attention_start[0] = instruction.range(4, 4);
        top1_gating_start[0] = instruction.range(5, 5);
        softmax_gating_start[0] = instruction.range(6, 6);
        cosine_gating_start[0] = instruction.range(7, 7);
        ffn_layer_one_start[0] = instruction.range(8, 8);
        ffn_layer_two_start[0] = instruction.range(9, 9);
        load_ffn_weights_one_start[0] = instruction.range(10, 10);
        load_ffn_weights_two_start[0] = instruction.range(11, 11);
        store_output_vector_start[0] = instruction.range(12, 12);

        load_input_vector_DRAM_input_sel[0] = instruction.range(13, 13);
        load_input_vector_BRAM_input_sel[0] = instruction.range(14, 14);

        load_attention_weights_DRAM_q_weight_sel[0] = instruction.range(15, 15);
        load_attention_weights_DRAM_k_weight_sel[0] = instruction.range(16, 16);
        load_attention_weights_DRAM_v_weight_sel[0] = instruction.range(17, 17);
        load_attention_weights_BRAM_q_weight_sel[0] = instruction.range(18, 18);
        load_attention_weights_BRAM_k_weight_sel[0] = instruction.range(19, 19);
        load_attention_weights_BRAM_v_weight_sel[0] = instruction.range(20, 20);
        load_gating_weights_DRAM_W_g_sel[0] = instruction.range(21, 21);
        load_gating_weights_DRAM_b_g_sel[0] = instruction.range(22, 22);
        load_gating_weights_BRAM_W_g_sel[0] = instruction.range(23, 23);
        load_gating_weights_BRAM_b_g_sel[0] = instruction.range(24, 24);
        load_inv_norm_W_g_DRAM_inv_norm_W_g_sel[0] = instruction.range(25, 25);
        load_inv_norm_W_g_BRAM_inv_norm_W_g_sel[0] = instruction.range(26, 26);

        grouped_multihead_attention_input_sel[0] = instruction.range(27, 27);
        grouped_multihead_attention_q_weight_sel[0] = instruction.range(28, 28);
        grouped_multihead_attention_k_weight_sel[0] = instruction.range(29, 29);
        grouped_multihead_attention_v_weight_sel[0] = instruction.range(30, 30);
        grouped_multihead_attention_output_sel[0] = instruction.range(31, 31);
        grouped_multihead_attention_groups_sel[0] = instruction.range(32, 32);

        top1_gating_in_vec_sel[0] = instruction.range(33, 33);
        top1_gating_W_g_sel[0] = instruction.range(34, 34);
        top1_gating_b_g_sel[0] = instruction.range(35, 35);
        top1_gating_control_status_sel[0] = instruction.range(36, 36);

        softmax_gating_in_vec_sel[0] = instruction.range(37, 37);
        softmax_gating_W_g_sel[0] = instruction.range(38, 38);
        softmax_gating_b_g_sel[0] = instruction.range(39, 39);
        softmax_gating_control_status_sel[0] = instruction.range(40, 40);

        cosine_gating_in_vec_sel[0] = instruction.range(41, 41);
        cosine_gating_W_g_sel[0] = instruction.range(42, 42);
        cosine_gating_b_g_sel[0] = instruction.range(43, 43);
        cosine_gating_inv_norm_W_g_sel[0] = instruction.range(44, 44);
        cosine_gating_control_status_sel[0] = instruction.range(45, 45);

        ffn_layer_one_input_vector_sel[0] = instruction.range(46, 46);
        ffn_layer_one_ffn_weight_sel[0] = instruction.range(47, 47);
        ffn_layer_one_ffn_bias_sel[0] = instruction.range(48, 48);
        ffn_layer_one_output_vector_sel[0] = instruction.range(49, 49);

        ffn_layer_two_input_vector_sel[0] = instruction.range(50, 50);
        ffn_layer_two_ffn_weight_1_sel[0] = instruction.range(51, 51);
        ffn_layer_two_ffn_bias_1_sel[0] = instruction.range(52, 52);
        ffn_layer_two_ffn_weight_2_sel[0] = instruction.range(53, 53);
        ffn_layer_two_ffn_bias_2_sel[0] = instruction.range(54, 54);
        ffn_layer_two_output_vector_sel[0] = instruction.range(55, 55);

        load_ffn_weights_one_DRAM_ffn_weight_sel[0] = instruction.range(56, 56);
        load_ffn_weights_one_DRAM_ffn_bias_sel[0] = instruction.range(57, 57);
        load_ffn_weights_one_BRAM_ffn_weight_sel[0] = instruction.range(58, 58);
        load_ffn_weights_one_BRAM_ffn_bias_sel[0] = instruction.range(59, 59);

        load_ffn_weights_two_DRAM_ffn_weight_2_sel[0] = instruction.range(60, 60);
        load_ffn_weights_two_DRAM_ffn_bias_2_sel[0] = instruction.range(61, 61);
        load_ffn_weights_two_BRAM_ffn_weight_2_sel[0] = instruction.range(62, 62);
        load_ffn_weights_two_BRAM_ffn_bias_2_sel[0] = instruction.range(63, 63);
        load_ffn_weights_two_DRAM_ffn_weight_3_sel[0] = instruction.range(64, 64);
        load_ffn_weights_two_DRAM_ffn_bias_3_sel[0] = instruction.range(65, 65);
        load_ffn_weights_two_BRAM_ffn_weight_3_sel[0] = instruction.range(66, 66);
        load_ffn_weights_two_BRAM_ffn_bias_3_sel[0] = instruction.range(67, 67);

        store_output_vector_BRAM_output_sel[0] = instruction.range(68, 68);
        store_output_vector_DRAM_output_sel[0] = instruction.range(69, 69);

        if (load_input_vector_start[0] == 0b1) {
            if(load_input_vector_DRAM_input_sel[0] == 0b1 && load_input_vector_BRAM_input_sel[0] == 0b1) {
                load_input_vector(DRAM_input, BRAM_input); // Load input vector from DRAM
            } 
        }

        if(load_attention_weights_start[0] == 0b1) {
            if(load_attention_weights_DRAM_q_weight_sel[0] == 0b1 && load_attention_weights_BRAM_q_weight_sel[0] == 0b1
                && load_attention_weights_DRAM_k_weight_sel[0] == 0b1 && load_attention_weights_BRAM_k_weight_sel[0] == 0b1
                && load_attention_weights_DRAM_v_weight_sel[0] == 0b1 && load_attention_weights_BRAM_v_weight_sel[0] == 0b1) {
                load_attention_weights(DRAM_q_weight, DRAM_k_weight, DRAM_v_weight, BRAM_q_weight, BRAM_k_weight, BRAM_v_weight); // Load attention weights from DRAM
            } 
        }

        if(load_gating_weights_start[0] == 0b1) {
            if(load_gating_weights_DRAM_W_g_sel[0] == 0b1 && load_gating_weights_BRAM_W_g_sel[0] == 0b1
                && load_gating_weights_DRAM_b_g_sel[0] == 0b1 && load_gating_weights_BRAM_b_g_sel[0] == 0b1) {
                load_gating_weights(DRAM_W_g, DRAM_b_g, BRAM_W_g, BRAM_b_g); // Load gating weights from DRAM
            } 
        }

        if(load_inv_norm_W_g_start[0] == 0b1) {
            if(load_inv_norm_W_g_DRAM_inv_norm_W_g_sel[0] == 0b1 && load_inv_norm_W_g_BRAM_inv_norm_W_g_sel[0] == 0b1) {
                load_inv_norm_W_g(DRAM_inv_norm_W_g, BRAM_inv_norm_W_g); // Load inverse norm weights from DRAM
            } 
        }

        if(grouped_multihead_attention_start[0] == 0b1) {
            if(grouped_multihead_attention_input_sel[0] == 0b1 && grouped_multihead_attention_q_weight_sel[0] == 0b1
                && grouped_multihead_attention_k_weight_sel[0] == 0b1 && grouped_multihead_attention_v_weight_sel[0] == 0b1
                && grouped_multihead_attention_output_sel[0] == 0b1 && grouped_multihead_attention_groups_sel[0] == 0b1) {
                grouped_multihead_attention(BRAM_input, BRAM_q_weight, BRAM_k_weight, BRAM_v_weight, BRAM_attn, groups); // Perform attention
            } 
        }

        if(top1_gating_start[0] == 0b1) {
            if(top1_gating_in_vec_sel[0] == 0b1 && top1_gating_W_g_sel[0] == 0b1
                && top1_gating_b_g_sel[0] == 0b1 && top1_gating_control_status_sel[0] == 0b1) {
                top1_gating(BRAM_attn, BRAM_W_g, BRAM_b_g, &control_status_1); // Perform gating
                DRAM_control_status_1[0] = control_status_1;
            } 
        }

        if(softmax_gating_start[0] == 0b1) {
            if(softmax_gating_in_vec_sel[0] == 0b1 && softmax_gating_W_g_sel[0] == 0b1
                && softmax_gating_b_g_sel[0] == 0b1 && softmax_gating_control_status_sel[0] == 0b1) {
                softmax_gating(BRAM_attn, BRAM_W_g, BRAM_b_g, &control_status_2); // Perform gating
                DRAM_control_status_2[0] = control_status_2; // Store control status
            } 
        }

        if(cosine_gating_start[0] == 0b1) {
            if(cosine_gating_in_vec_sel[0] == 0b1 && cosine_gating_W_g_sel[0] == 0b1
                && cosine_gating_b_g_sel[0] == 0b1 && cosine_gating_inv_norm_W_g_sel[0] == 0b1
                && cosine_gating_control_status_sel[0] == 0b1) {
                cosine_gating(BRAM_attn, BRAM_W_g, BRAM_b_g, BRAM_inv_norm_W_g, &control_status_3); // Perform gating
                DRAM_control_status_3[0] = control_status_3; // Store control status
            } 
        }

        if(ffn_layer_one_start[0] == 0b1) {
            if(ffn_layer_one_input_vector_sel[0] == 0b1 && ffn_layer_one_ffn_weight_sel[0] == 0b1
                && ffn_layer_one_ffn_bias_sel[0] == 0b1 && ffn_layer_one_output_vector_sel[0] == 0b1) {
                ffn_layer_one(BRAM_attn, BRAM_ffn_weight_1, BRAM_ffn_bias_1, BRAM_output); // Perform first part of FFN
            } 
        }

        if(ffn_layer_two_start[0] == 0b1) {
            if(ffn_layer_two_input_vector_sel[0] == 0b1 && ffn_layer_two_ffn_weight_1_sel[0] == 0b1
                && ffn_layer_two_ffn_bias_1_sel[0] == 0b1 && ffn_layer_two_ffn_weight_2_sel[0] == 0b1
                && ffn_layer_two_ffn_bias_2_sel[0] == 0b1 && ffn_layer_two_output_vector_sel[0] == 0b1) {
                ffn_layer_two(BRAM_attn, BRAM_ffn_weight_2, BRAM_ffn_bias_2, BRAM_ffn_weight_3, BRAM_ffn_bias_3, BRAM_output); // Perform second part of FFN
            } 
        }
        if(load_ffn_weights_one_start[0] == 0b1) {
            if(load_ffn_weights_one_DRAM_ffn_weight_sel[0] == 0b1 && load_ffn_weights_one_DRAM_ffn_bias_sel[0] == 0b1
                && load_ffn_weights_one_BRAM_ffn_weight_sel[0] == 0b1 && load_ffn_weights_one_BRAM_ffn_bias_sel[0] == 0b1) {
                load_ffn_weights_one(DRAM_ffn_weight_1, DRAM_ffn_bias_1, BRAM_ffn_weight_1, BRAM_ffn_bias_1); // Load first part of FFN weights
            } 
        }
        if(load_ffn_weights_two_start[0] == 0b1) {
            if(load_ffn_weights_two_DRAM_ffn_weight_2_sel[0] == 0b1 && load_ffn_weights_two_DRAM_ffn_bias_2_sel[0] == 0b1
                && load_ffn_weights_two_BRAM_ffn_weight_2_sel[0] == 0b1 && load_ffn_weights_two_BRAM_ffn_bias_2_sel[0] == 0b1
                && load_ffn_weights_two_DRAM_ffn_weight_3_sel[0] == 0b1 && load_ffn_weights_two_DRAM_ffn_bias_3_sel[0] == 0b1
                && load_ffn_weights_two_BRAM_ffn_weight_3_sel[0] == 0b1 && load_ffn_weights_two_BRAM_ffn_bias_3_sel[0] == 0b1) {
                load_ffn_weights_two(DRAM_ffn_weight_2, DRAM_ffn_bias_2, BRAM_ffn_weight_2, BRAM_ffn_bias_2,
                                     DRAM_ffn_weight_3, DRAM_ffn_bias_3, BRAM_ffn_weight_3, BRAM_ffn_bias_3); // Load second part of FFN weights
            } 
        }
        if(store_output_vector_start[0] == 0b1) {
            if(store_output_vector_BRAM_output_sel[0] == 0b1 && store_output_vector_DRAM_output_sel[0] == 0b1) {
                store_output_vector(BRAM_output, DRAM_output); // Store output vector to DRAM
            }

        }

        if (instruction.range(70, 70) == 0b1 or instruction.range(5, 5) == 0b1 or instruction.range(6, 6) == 0b1 or instruction.range(7, 7) == 0b1) {
            break; // Exit condition
        }  
    }  
}

void dataflow_region_1(DATA_TYPE_INST *inst_dram_0_0, int n_inst_0_0,
                     data_t DRAM_input[DIM],
                    data_t DRAM_q_weight[DIM][DIM],
                    data_t DRAM_k_weight[DIM][DIM],
                    data_t DRAM_v_weight[DIM][DIM],
                    data_t DRAM_W_g[EXPERT_NUM][DIM],
                    data_t DRAM_b_g[EXPERT_NUM],
                    data_t DRAM_inv_norm_W_g[EXPERT_NUM],
                    data_t DRAM_ffn_weight_1[DIM][DIM],
                    data_t DRAM_ffn_bias_1[DIM],
                    data_t DRAM_ffn_weight_2[2 * DIM][DIM],
                    data_t DRAM_ffn_bias_2[2 * DIM],
                    data_t DRAM_ffn_weight_3[DIM][2 * DIM],
                    data_t DRAM_ffn_bias_3[DIM],
                    data_t DRAM_output[DIM], int groups,
                    int DRAM_control_status_1[1],
                    int DRAM_control_status_2[1],
                    int DRAM_control_status_3[1]) 
{
    hls::stream<DATA_TYPE_INST, 1> fifo_1;
    #pragma HLS STREAM variable=fifo_1 depth=1
    #pragma HLS dataflow

    load_inst(inst_dram_0_0, fifo_1, n_inst_0_0);
    decode_inst(fifo_1, DRAM_input, DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
                DRAM_W_g, DRAM_b_g, DRAM_inv_norm_W_g,
                DRAM_ffn_weight_1, DRAM_ffn_bias_1,
                DRAM_ffn_weight_2, DRAM_ffn_bias_2,
                DRAM_ffn_weight_3, DRAM_ffn_bias_3,
                DRAM_output, groups, DRAM_control_status_1,
                DRAM_control_status_2, DRAM_control_status_3);
}

void top(data_t DRAM_input[DIM],
        data_t DRAM_q_weight[DIM][DIM],
        data_t DRAM_k_weight[DIM][DIM],
        data_t DRAM_v_weight[DIM][DIM],
        data_t DRAM_W_g[EXPERT_NUM][DIM],
        data_t DRAM_b_g[EXPERT_NUM],
        data_t DRAM_inv_norm_W_g[EXPERT_NUM],
        data_t DRAM_ffn_weight_1[DIM][DIM],
        data_t DRAM_ffn_bias_1[DIM],
        data_t DRAM_ffn_weight_2[2 * DIM][DIM],
        data_t DRAM_ffn_bias_2[2 * DIM],
        data_t DRAM_ffn_weight_3[DIM][2 * DIM],
        data_t DRAM_ffn_bias_3[DIM],
        data_t DRAM_output[DIM], int groups, 
        DATA_TYPE_INST *inst_dram_0_0,
        DATA_TYPE_INST *inst_dram_1_0,
        DATA_TYPE_INST *inst_dram_1_1,
        int n_inst_0_0,
        int n_inst_1_0,
        int n_inst_1_1
        )
{
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS interface m_axi port=DRAM_input offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_q_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_k_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_v_weight offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_W_g offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_b_g offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_inv_norm_W_g offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_1 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_2 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_weight_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_ffn_bias_3 offset=slave bundle=mem1
    #pragma HLS interface m_axi port=DRAM_output offset=slave bundle=mem2

    #pragma HLS INTERFACE m_axi port=inst_dram_0_0 offset=slave bundle=INPUT2 depth = 10
    #pragma HLS INTERFACE m_axi port=inst_dram_1_0 offset=slave bundle=INPUT2 depth = 10
    #pragma HLS INTERFACE m_axi port=inst_dram_1_1 offset=slave bundle=INPUT2 depth = 10

    
    #pragma HLS INTERFACE s_axilite port=groups
    #pragma HLS INTERFACE s_axilite port=n_inst_0_0
    #pragma HLS INTERFACE s_axilite port=n_inst_1_0
    #pragma HLS INTERFACE s_axilite port=n_inst_1_1
    
    int DRAM_control_status_1[1];
    int DRAM_control_status_2[1];
    int DRAM_control_status_3[1];
  
    dataflow_region_1(inst_dram_0_0, n_inst_0_0,
                     DRAM_input, DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
                     DRAM_W_g, DRAM_b_g, DRAM_inv_norm_W_g,
                     DRAM_ffn_weight_1, DRAM_ffn_bias_1,
                     DRAM_ffn_weight_2, DRAM_ffn_bias_2,
                     DRAM_ffn_weight_3, DRAM_ffn_bias_3,
                     DRAM_output, groups,
                     DRAM_control_status_1,
                     DRAM_control_status_2,
                     DRAM_control_status_3);
    if (DRAM_control_status_1[0] == 0 or DRAM_control_status_2[0] == 0 or DRAM_control_status_3[0] == 0) {
        dataflow_region_1(inst_dram_1_0, n_inst_1_0,
                     DRAM_input, DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
                     DRAM_W_g, DRAM_b_g, DRAM_inv_norm_W_g,
                     DRAM_ffn_weight_1, DRAM_ffn_bias_1,
                     DRAM_ffn_weight_2, DRAM_ffn_bias_2,
                     DRAM_ffn_weight_3, DRAM_ffn_bias_3,
                     DRAM_output, groups,
                     DRAM_control_status_1,
                     DRAM_control_status_2,
                     DRAM_control_status_3);
    }

    if (DRAM_control_status_1[0] == 1 or DRAM_control_status_2[0] == 1 or DRAM_control_status_3[0] == 1) {
        dataflow_region_1(inst_dram_1_1, n_inst_1_1,
                     DRAM_input, DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
                     DRAM_W_g, DRAM_b_g, DRAM_inv_norm_W_g,
                     DRAM_ffn_weight_1, DRAM_ffn_bias_1,
                     DRAM_ffn_weight_2, DRAM_ffn_bias_2,
                     DRAM_ffn_weight_3, DRAM_ffn_bias_3,
                     DRAM_output, groups,
                     DRAM_control_status_1,
                     DRAM_control_status_2,
                     DRAM_control_status_3);
    }


    
}





