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


data_t DRAM_input[DIM];
data_t DRAM_q_weight[DIM][DIM];
data_t DRAM_k_weight[DIM][DIM];
data_t DRAM_v_weight[DIM][DIM];
data_t DRAM_W_g[EXPERT_NUM][DIM];
data_t DRAM_b_g[EXPERT_NUM];
data_t DRAM_inv_norm_W_g[EXPERT_NUM];
data_t DRAM_ffn_weight_1[DIM][DIM];
data_t DRAM_ffn_bias_1[DIM];
data_t DRAM_ffn_weight_2[2 * DIM][DIM];
data_t DRAM_ffn_bias_2[2 * DIM];
data_t DRAM_ffn_weight_3[DIM][2 * DIM];
data_t DRAM_ffn_bias_3[DIM];
data_t DRAM_output[DIM];


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
);


void load_txt_to_array(const char *filename, data_t *array, int total_size) {
    FILE *fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("Failed to open %s\n", filename);
        exit(1);
    }
    for (int i = 0; i < total_size; i++) {
        float temp;
        fscanf(fp, "%f", &temp);
        array[i] = (data_t)temp;
    }
    fclose(fp);
}



int main() {
    load_txt_to_array("DRAM_input.txt", (data_t*)DRAM_input, DIM);
    load_txt_to_array("DRAM_q_weight.txt", (data_t*)DRAM_q_weight, DIM * DIM);
    load_txt_to_array("DRAM_k_weight.txt", (data_t*)DRAM_k_weight, DIM * DIM);
    load_txt_to_array("DRAM_v_weight.txt", (data_t*)DRAM_v_weight, DIM * DIM);
    load_txt_to_array("DRAM_W_g.txt", (data_t*)DRAM_W_g, EXPERT_NUM * DIM);
    load_txt_to_array("DRAM_b_g.txt", (data_t*)DRAM_b_g, EXPERT_NUM);
    load_txt_to_array("DRAM_ffn_weight_1.txt", (data_t*)DRAM_ffn_weight_1, DIM * DIM);
    load_txt_to_array("DRAM_ffn_bias_1.txt", (data_t*)DRAM_ffn_bias_1, DIM);
    load_txt_to_array("DRAM_ffn_weight_2.txt", (data_t*)DRAM_ffn_weight_2, 2 * DIM * DIM);
    load_txt_to_array("DRAM_ffn_bias_2.txt", (data_t*)DRAM_ffn_bias_2, 2 * DIM);
    load_txt_to_array("DRAM_ffn_weight_3.txt", (data_t*)DRAM_ffn_weight_3, DIM * 2 * DIM);
    load_txt_to_array("DRAM_ffn_bias_3.txt", (data_t*)DRAM_ffn_bias_3, DIM);
    
   int groups = 1;

    top(DRAM_input, DRAM_q_weight, DRAM_k_weight, DRAM_v_weight,
         DRAM_W_g, DRAM_b_g,
         DRAM_ffn_weight_1, DRAM_ffn_bias_1,
         DRAM_ffn_weight_2, DRAM_ffn_bias_2,
         DRAM_ffn_weight_3, DRAM_ffn_bias_3,
         DRAM_output, groups);

    // Write contents of DRAM_output to DRAM_output.txt
    FILE *fp = fopen("DRAM_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < DIM; i++) {
            fprintf(fp, "%f", (float)DRAM_output[i]);
            if (i + 1 < DIM)
                fprintf(fp, ", ");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    } else {
        printf("Failed to open DRAM_output.txt for writing.\n");
    }
    // // Write contents of DRAM_image_output to DRAM_image_output_output.txt
    // FILE *fp = fopen("DRAM_image_output.txt", "w");
    // if (fp != NULL) {
    //     fprintf(fp, "{\n");
    //     for (int c = 0; c < OUT_C; c++) {
    //         fprintf(fp, "  {\n");
    //         for (int i = 0; i < FW; i++) {
    //             fprintf(fp, "    {");
    //             for (int j = 0; j < FH; j++) {
    //                 // compute the flat index
    //                 int idx = c*FW*FH + i*FH + j;
    //                 fprintf(fp, "%f", (float)((data_t*)DRAM_image_output_1)[idx]);
    //                 if (j + 1 < FH) 
    //                     fprintf(fp, ", ");
    //             }
    //             fprintf(fp, "}");
    //             if (i + 1 < FW) 
    //                 fprintf(fp, ",");
    //             fprintf(fp, "\n");
    //         }
    //         fprintf(fp, "  }");
    //         if (c + 1 < OUT_C) 
    //             fprintf(fp, ",");
    //         fprintf(fp, "\n");
    //     }
    //     fprintf(fp, "}\n");
    //     fclose(fp);
    // }

    return 0;
}