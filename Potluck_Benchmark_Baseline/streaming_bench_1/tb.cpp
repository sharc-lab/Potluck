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

data_t dram_input[SEQ_LEN][HIDDEN_DIM];
data_t AW00[HIDDEN_DIM][HIDDEN_DIM];
data_t BW00[HIDDEN_DIM][HIDDEN_DIM];
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
    data_t DRAM_output[SEQ_LEN][HIDDEN_DIM]
); 

int main()

{

    load_txt_to_array("DRAM_input_1.txt", (data_t*)dram_input, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_one_1.txt", (data_t*)AW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("DRAM_weight_two_1.txt", (data_t*)BW00, HIDDEN_DIM * HIDDEN_DIM);

    top(dram_input, AW00, BW00, dram_output);

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

