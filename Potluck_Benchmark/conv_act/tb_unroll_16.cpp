#include <stdio.h>
#include <stdlib.h>
#include <ap_fixed.h>
#include "top_conv_unroll_16.h"  // Include the top function declaration

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<64>

#define IN_C 64
#define OUT_C 64
#define FW 5
#define FH 5
#define K 3

#define N 20

data_t DRAM_image_input[IN_C][FW][FH];
data_t DRAM_conv_weight[OUT_C][IN_C][K][K];
data_t DRAM_conv_bias[OUT_C];
data_t DRAM_image_output[OUT_C][FW][FH];
DATA_TYPE_INST inst_array[N];




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
    load_txt_to_array("DRAM_image_input.txt", (data_t*)DRAM_image_input, IN_C * FW * FH);
    load_txt_to_array("DRAM_conv_weight.txt", (data_t*)DRAM_conv_weight, OUT_C * IN_C * K * K);
    load_txt_to_array("DRAM_conv_bias.txt", (data_t*)DRAM_conv_bias, OUT_C);

    top(DRAM_image_input, DRAM_conv_weight, DRAM_conv_bias, DRAM_image_output);

    // Write contents of DRAM_image_output to DRAM_image_output_output.txt
    FILE *fp = fopen("DRAM_image_output_4.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int c = 0; c < OUT_C; c++) {
            fprintf(fp, "  {\n");
            for (int i = 0; i < FW; i++) {
                fprintf(fp, "    {");
                for (int j = 0; j < FH; j++) {
                    // compute the flat index
                    int idx = c*FW*FH + i*FH + j;
                    fprintf(fp, "%f", (float)((data_t*)DRAM_image_output)[idx]);
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