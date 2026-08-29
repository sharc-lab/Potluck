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

#define SEQ_LEN  32
#define HIDDEN_DIM  32
#define DIM 64

data_t A0[SEQ_LEN][HIDDEN_DIM];
data_t A1[SEQ_LEN][HIDDEN_DIM];
data_t B0[SEQ_LEN][HIDDEN_DIM];
data_t B1[SEQ_LEN][HIDDEN_DIM];
data_t AW00[HIDDEN_DIM][HIDDEN_DIM];
data_t AW10[HIDDEN_DIM][HIDDEN_DIM];
data_t AW01[HIDDEN_DIM][HIDDEN_DIM];
data_t AW11[HIDDEN_DIM][HIDDEN_DIM];
data_t BW00[HIDDEN_DIM][HIDDEN_DIM];
data_t BW10[HIDDEN_DIM][HIDDEN_DIM];
data_t BW01[HIDDEN_DIM][HIDDEN_DIM];
data_t BW11[HIDDEN_DIM][HIDDEN_DIM];
data_t A_output[SEQ_LEN][DIM];
data_t B_output[SEQ_LEN][DIM];

data_t A[SEQ_LEN][DIM];
data_t B[SEQ_LEN][DIM];
data_t AW[DIM][DIM];
data_t BW[DIM][DIM];
data_t A_output_ref[SEQ_LEN][DIM];
data_t B_output_ref[SEQ_LEN][DIM];


void matmul(
          data_t input[SEQ_LEN][DIM],
          data_t weight[DIM][DIM],
          data_t output[SEQ_LEN][DIM]
) {
Row_Loop:
    for (int i = 0; i < SEQ_LEN; i++) {
    Col_Loop:
        for (int j = 0; j < DIM; j++) {
            data_t acc = 0;
        K_Loop:
            for (int k = 0; k < DIM; k++) {
                acc += input[i][k] * weight[k][j];
            }
            output[i][j] = acc;
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
    data_t A_output[SEQ_LEN][DIM],
    data_t B0[SEQ_LEN][HIDDEN_DIM],
    data_t B1[SEQ_LEN][HIDDEN_DIM],
    data_t BW00[HIDDEN_DIM][HIDDEN_DIM],
    data_t BW10[HIDDEN_DIM][HIDDEN_DIM],
    data_t BW01[HIDDEN_DIM][HIDDEN_DIM],
    data_t BW11[HIDDEN_DIM][HIDDEN_DIM],
    data_t B_output[SEQ_LEN][DIM]
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
    load_txt_to_array("A0.txt", (data_t*)A0, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("A1.txt", (data_t*)A1, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("B0.txt", (data_t*)B0, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("B1.txt", (data_t*)B1, SEQ_LEN * HIDDEN_DIM);
    load_txt_to_array("AW00.txt", (data_t*)AW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("AW10.txt", (data_t*)AW10, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("AW01.txt", (data_t*)AW01, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("AW11.txt", (data_t*)AW11, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("BW00.txt", (data_t*)BW00, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("BW10.txt", (data_t*)BW10, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("BW01.txt", (data_t*)BW01, HIDDEN_DIM * HIDDEN_DIM);
    load_txt_to_array("BW11.txt", (data_t*)BW11, HIDDEN_DIM * HIDDEN_DIM);

    load_txt_to_array("A.txt", (data_t*)A, SEQ_LEN * DIM);
    load_txt_to_array("B.txt", (data_t*)B, SEQ_LEN * DIM);
    load_txt_to_array("AW.txt", (data_t*)AW, DIM * DIM);
    load_txt_to_array("BW.txt", (data_t*)BW, DIM * DIM);

    top(A0, A1, AW00, AW10, AW01, AW11, A_output, B0, B1, BW00, BW10, BW01, BW11, B_output);

    matmul(A, AW, A_output_ref);
    matmul(B, BW, B_output_ref);
    // Write contents of A_output to A_output.txt
    FILE *fp = fopen("A_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < DIM; j++) {
                fprintf(fp, "%f", (float)A_output[i][j]);
                if (j + 1 < DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    }   

    // Write contents of B_output to B_output.txt
    fp = fopen("B_output.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < DIM; j++) { 
                fprintf(fp, "%f", (float)B_output[i][j]);
                if (j + 1 < DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    }

    // Write contents of A_output_ref to A_output_ref.txt
    fp = fopen("A_output_ref.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < DIM; j++) {
                fprintf(fp, "%f", (float)A_output_ref[i][j]);
                if (j + 1 < DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
    }

    // Write contents of B_output_ref to B_output_ref.txt
    fp = fopen("B_output_ref.txt", "w");
    if (fp != NULL) {
        fprintf(fp, "{\n");
        for (int i = 0; i < SEQ_LEN; i++) {
            fprintf(fp, "  {");
            for (int j = 0; j < DIM; j++) {
                fprintf(fp, "%f", (float)B_output_ref[i][j]);
                if (j + 1 < DIM)
                    fprintf(fp, ", ");
            }
            fprintf(fp, "}");
            if (i + 1 < SEQ_LEN)
                fprintf(fp, ",\n");
        }
        fprintf(fp, "\n}\n");
        fclose(fp);
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