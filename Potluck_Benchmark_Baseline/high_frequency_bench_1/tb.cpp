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

typedef ap_fixed<16, 5> data_t;
typedef ap_fixed<32, 10> data_t_input;
#define DATA_TYPE_INST ap_int<64>

#define SEQ_LEN  128
#define SEQ_LEN_INPUT 64
#define HIDDEN_DIM  128
#define HIDDEN_DIM_INPUT 64
#define DIM 256

data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM];
data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM];
data_t_input dram_input_3[SEQ_LEN_INPUT][HIDDEN_DIM];
data_t_input dram_input_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM];
data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM];


data_t dram_input_1_data[SEQ_LEN][HIDDEN_DIM];
data_t dram_input_2_data[SEQ_LEN][HIDDEN_DIM];
data_t dram_input_3_data[SEQ_LEN][HIDDEN_DIM];
data_t dram_input_weight_data[HIDDEN_DIM][HIDDEN_DIM];
data_t dram_output_data[SEQ_LEN][DIM];

void top(
    data_t_input dram_input_1[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_2[SEQ_LEN_INPUT][HIDDEN_DIM],
    data_t_input dram_input_weight[HIDDEN_DIM_INPUT][HIDDEN_DIM],
    data_t_input dram_output[SEQ_LEN_INPUT][HIDDEN_DIM]
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
    load_txt_to_array("/usr/scratch/hchen799/ArchHLS_benchmark/bench_matmul_high_freq/dram_input_1.txt", (data_t*)dram_input_1_data, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("/usr/scratch/hchen799/ArchHLS_benchmark/bench_matmul_high_freq/dram_input_2.txt", (data_t*)dram_input_2_data, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("/usr/scratch/hchen799/ArchHLS_benchmark/bench_matmul_high_freq/dram_input_3.txt", (data_t*)dram_input_3_data, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("/usr/scratch/hchen799/ArchHLS_benchmark/bench_matmul_high_freq/dram_input_weight.txt", (data_t*)dram_input_weight_data, HIDDEN_DIM * HIDDEN_DIM);

    for (int i = 0; i < SEQ_LEN_INPUT; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            dram_input_weight[i][j].range(15, 0) = dram_input_weight_data[2 * i][j].range(15, 0);
            dram_input_weight[i][j].range(31, 16) = dram_input_weight_data[2 * i + 1][j].range(15, 0);
        }
    }

    for (int i = 0; i < HIDDEN_DIM_INPUT; i++) {
        for (int j = 0; j < HIDDEN_DIM; j++) {
            dram_input_1[i][j].range(15, 0) = dram_input_1_data[2 * i][j].range(15, 0);
            dram_input_2[i][j].range(15, 0) = dram_input_2_data[2 * i][j].range(15, 0);
            dram_input_3[i][j].range(15, 0) = dram_input_3_data[2 * i][j].range(15, 0);

            dram_input_1[i][j].range(31, 16) = dram_input_1_data[2 * i + 1][j].range(15, 0);
            dram_input_2[i][j].range(31, 16) = dram_input_2_data[2 * i + 1][j].range(15, 0);
            dram_input_3[i][j].range(31, 16) = dram_input_3_data[2 * i + 1][j].range(15, 0);
        }
    }

    top(dram_input_1, dram_input_2, dram_input_weight, dram_output);

    // Write contents of dram_output to dram_output.txt
    FILE *fp = fopen("dram_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN_INPUT; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < DIM; j++) {
                fprintf(fp, "%f", (float)dram_output[i][j]);
                if (j + 1 < DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN_INPUT)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    }   
    return 0;
}