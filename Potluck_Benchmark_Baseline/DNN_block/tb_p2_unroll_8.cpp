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

#define IN_C 64
#define OUT_C 64

#define CH1 64
#define CH2 64
#define CH3 64
#define CH4 64

#define FW 5
#define FH 5
#define K 3

#define N 20


data_t DRAM_image_input_1[IN_C][FW][FH];
data_t DRAM_image_input_2[IN_C][FW][FH];
data_t DRAM_image_input_3[IN_C][FW][FH];
data_t DRAM_conv_weight_3x3[OUT_C][IN_C][K][K];
data_t DRAM_conv_weight_3x3_second[OUT_C][IN_C][K][K];
//data_t DRAM_conv_weight_5x5[OUT_C][IN_C][5][5];
data_t DRAM_conv_weight_1x1[OUT_C][IN_C][1][1];

//data_t DRAM_conv_bias_5x5[OUT_C];
data_t DRAM_conv_bias_3x3[OUT_C];
data_t DRAM_conv_bias_3x3_second[OUT_C];
data_t DRAM_conv_bias_1x1[OUT_C];

data_t DRAM_image_output_1[OUT_C][FW][FH];
data_t DRAM_image_output_2[OUT_C][FW][FH];
data_t DRAM_image_output_3[OUT_C][FW][FH];

DATA_TYPE_INST inst_array[N];

void top(data_t DRAM_image_input_1[IN_C][FW][FH], data_t DRAM_image_input_2[IN_C][FW][FH], data_t DRAM_image_input_3[IN_C][FW][FH],
         data_t DRAM_conv_weight_3x3[OUT_C][IN_C][K][K], data_t DRAM_conv_weight_3x3_second[OUT_C][IN_C][K][K],
         data_t DRAM_conv_bias_3x3[OUT_C], data_t DRAM_conv_bias_3x3_second[OUT_C],
         data_t DRAM_image_output_1[OUT_C][FW][FH], data_t DRAM_image_output_2[OUT_C][FW][FH], data_t DRAM_image_output_3[OUT_C][FW][FH]);


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
    load_txt_to_array("DRAM_image_input.txt", (data_t*)DRAM_image_input_1, IN_C * FW * FH);
    load_txt_to_array("DRAM_image_input.txt", (data_t*)DRAM_image_input_2, IN_C * FW * FH);
    load_txt_to_array("DRAM_image_input.txt", (data_t*)DRAM_image_input_3, IN_C * FW * FH);

    load_txt_to_array("DRAM_conv_weight_1x1.txt", (data_t*)DRAM_conv_weight_1x1, OUT_C * IN_C * 1 * 1);
    load_txt_to_array("DRAM_conv_bias_1x1.txt", (data_t*)DRAM_conv_bias_1x1, OUT_C);

    load_txt_to_array("DRAM_conv_weight_3x3.txt", (data_t*)DRAM_conv_weight_3x3, OUT_C * IN_C * K * K);
    load_txt_to_array("DRAM_conv_bias_3x3.txt", (data_t*)DRAM_conv_bias_3x3, OUT_C);

    load_txt_to_array("DRAM_conv_weight_3x3.txt", (data_t*)DRAM_conv_weight_3x3_second, OUT_C * IN_C * K * K);
    load_txt_to_array("DRAM_conv_bias_3x3.txt", (data_t*)DRAM_conv_bias_3x3_second, OUT_C);

    //load_txt_to_array("/usr/scratch/hchen799/ArchHLS_exp_dataset/bench_2_data/DRAM_conv_weight_5x5.txt", (data_t*)DRAM_conv_weight_5x5, OUT_C * IN_C * 5 * 5);
    //load_txt_to_array("/usr/scratch/hchen799/ArchHLS_exp_dataset/bench_2_data/DRAM_conv_bias_5x5.txt", (data_t*)DRAM_conv_bias_5x5, OUT_C);

    top(DRAM_image_input_1, DRAM_image_input_2, DRAM_image_input_3, DRAM_conv_weight_3x3, DRAM_conv_weight_3x3_second, DRAM_conv_bias_3x3, DRAM_conv_bias_3x3_second, DRAM_image_output_1, DRAM_image_output_2, DRAM_image_output_3);

    // Write contents of DRAM_image_output to DRAM_image_output_output.txt
    FILE *fp = fopen("DRAM_image_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int c = 0; c < OUT_C; c++) {
            fprintf(fp, "  {\n");
            for (int i = 0; i < FW; i++) {
                fprintf(fp, "    {");
                for (int j = 0; j < FH; j++) {
                    // compute the flat index
                    int idx = c*FW*FH + i*FH + j;
                    fprintf(fp, "%f", (float)((data_t*)DRAM_image_output_1)[idx]);
                    if (j + 1 < FH) 
                        fprintf(fp, ", ");
                }
                fprintf(fp, "}");
                if (i + 1 < FW) 
                    fprintf(fp, ",");
                fprintf(fp, "\n");
            }
            fprintf(fp, "  }");
            if (c + 1 < OUT_C) 
                fprintf(fp, ",");
            fprintf(fp, "\n");
        }
        fprintf(fp, "}\n");
        fclose(fp);
    }

    return 0;
}