#include <ap_fixed.h>
#ifndef TOP_H
#define TOP_H

typedef ap_fixed<32, 10> data_t;
#define DATA_TYPE_INST ap_int<64>

#define IN_C 64
#define OUT_C 64
#define FW 5
#define FH 5
#define K 3

#define N 20

void top(data_t DRAM_image_input[IN_C][FW][FH], data_t DRAM_conv_weight[OUT_C][IN_C][K][K], data_t DRAM_conv_bias[OUT_C], data_t DRAM_image_output[OUT_C][FW][FH]);

#endif // TOP_H