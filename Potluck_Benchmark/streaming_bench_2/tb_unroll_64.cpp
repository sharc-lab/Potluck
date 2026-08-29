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
#define HIDDEN_DIM  64
#define DIM 256

data_t dram_input[SEQ_LEN][HIDDEN_DIM];
data_t AW00[HIDDEN_DIM][HIDDEN_DIM];
data_t BW00[HIDDEN_DIM][HIDDEN_DIM];
data_t CW00[HIDDEN_DIM][HIDDEN_DIM];
data_t DW00[HIDDEN_DIM][HIDDEN_DIM];
data_t EW00[HIDDEN_DIM][HIDDEN_DIM];
data_t FW00[HIDDEN_DIM][HIDDEN_DIM];
data_t GW00[HIDDEN_DIM][HIDDEN_DIM];
data_t HW00[HIDDEN_DIM][HIDDEN_DIM];
data_t dram_output[SEQ_LEN][HIDDEN_DIM];


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
); 

int main()

{

    load_txt_to_array("DRAM_input_1_64.txt", (data_t*)dram_input, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_one_1_64.txt", (data_t*)AW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_two_1_64.txt", (data_t*)BW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_three_1_64.txt", (data_t*)CW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_four_1_64.txt", (data_t*)DW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_five_1_64.txt", (data_t*)EW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_six_1_64.txt", (data_t*)FW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_seven_1_64.txt", (data_t*)GW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_ten_1_64.txt", (data_t*)HW00, HIDDEN_DIM * HIDDEN_DIM);

    top(dram_input, AW00, BW00, CW00, DW00, EW00, FW00, GW00, HW00, dram_output);

    FILE *fp = fopen("dram_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < HIDDEN_DIM; j++) {
                fprintf(fp, "%f", (float)dram_output[i][j]);
                if (j + 1 < HIDDEN_DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    }
}

