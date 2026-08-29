# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1076 \
    name BRAM_conv_weight_0_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_0_8 \
    op interface \
    ports { BRAM_conv_weight_0_8_address0 { O 8 vector } BRAM_conv_weight_0_8_ce0 { O 1 bit } BRAM_conv_weight_0_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_0_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1077 \
    name BRAM_buffer_1_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_0 \
    op interface \
    ports { BRAM_buffer_1_0_address0 { O 7 vector } BRAM_buffer_1_0_ce0 { O 1 bit } BRAM_buffer_1_0_we0 { O 1 bit } BRAM_buffer_1_0_d0 { O 32 vector } BRAM_buffer_1_0_address1 { O 7 vector } BRAM_buffer_1_0_ce1 { O 1 bit } BRAM_buffer_1_0_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1078 \
    name BRAM_conv_weight_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_1_8 \
    op interface \
    ports { BRAM_conv_weight_1_8_address0 { O 8 vector } BRAM_conv_weight_1_8_ce0 { O 1 bit } BRAM_conv_weight_1_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1079 \
    name BRAM_buffer_1_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_1 \
    op interface \
    ports { BRAM_buffer_1_1_address0 { O 7 vector } BRAM_buffer_1_1_ce0 { O 1 bit } BRAM_buffer_1_1_we0 { O 1 bit } BRAM_buffer_1_1_d0 { O 32 vector } BRAM_buffer_1_1_address1 { O 7 vector } BRAM_buffer_1_1_ce1 { O 1 bit } BRAM_buffer_1_1_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1080 \
    name BRAM_conv_weight_2_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_2_8 \
    op interface \
    ports { BRAM_conv_weight_2_8_address0 { O 8 vector } BRAM_conv_weight_2_8_ce0 { O 1 bit } BRAM_conv_weight_2_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1081 \
    name BRAM_buffer_1_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_2 \
    op interface \
    ports { BRAM_buffer_1_2_address0 { O 7 vector } BRAM_buffer_1_2_ce0 { O 1 bit } BRAM_buffer_1_2_we0 { O 1 bit } BRAM_buffer_1_2_d0 { O 32 vector } BRAM_buffer_1_2_address1 { O 7 vector } BRAM_buffer_1_2_ce1 { O 1 bit } BRAM_buffer_1_2_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1082 \
    name BRAM_conv_weight_3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_3_8 \
    op interface \
    ports { BRAM_conv_weight_3_8_address0 { O 8 vector } BRAM_conv_weight_3_8_ce0 { O 1 bit } BRAM_conv_weight_3_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1083 \
    name BRAM_buffer_1_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_3 \
    op interface \
    ports { BRAM_buffer_1_3_address0 { O 7 vector } BRAM_buffer_1_3_ce0 { O 1 bit } BRAM_buffer_1_3_we0 { O 1 bit } BRAM_buffer_1_3_d0 { O 32 vector } BRAM_buffer_1_3_address1 { O 7 vector } BRAM_buffer_1_3_ce1 { O 1 bit } BRAM_buffer_1_3_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1084 \
    name BRAM_conv_weight_4_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_4_8 \
    op interface \
    ports { BRAM_conv_weight_4_8_address0 { O 8 vector } BRAM_conv_weight_4_8_ce0 { O 1 bit } BRAM_conv_weight_4_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_4_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1085 \
    name BRAM_buffer_1_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_4 \
    op interface \
    ports { BRAM_buffer_1_4_address0 { O 7 vector } BRAM_buffer_1_4_ce0 { O 1 bit } BRAM_buffer_1_4_we0 { O 1 bit } BRAM_buffer_1_4_d0 { O 32 vector } BRAM_buffer_1_4_address1 { O 7 vector } BRAM_buffer_1_4_ce1 { O 1 bit } BRAM_buffer_1_4_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1086 \
    name BRAM_conv_weight_5_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_5_8 \
    op interface \
    ports { BRAM_conv_weight_5_8_address0 { O 8 vector } BRAM_conv_weight_5_8_ce0 { O 1 bit } BRAM_conv_weight_5_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_5_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1087 \
    name BRAM_buffer_1_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_5 \
    op interface \
    ports { BRAM_buffer_1_5_address0 { O 7 vector } BRAM_buffer_1_5_ce0 { O 1 bit } BRAM_buffer_1_5_we0 { O 1 bit } BRAM_buffer_1_5_d0 { O 32 vector } BRAM_buffer_1_5_address1 { O 7 vector } BRAM_buffer_1_5_ce1 { O 1 bit } BRAM_buffer_1_5_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1088 \
    name BRAM_conv_weight_6_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_6_8 \
    op interface \
    ports { BRAM_conv_weight_6_8_address0 { O 8 vector } BRAM_conv_weight_6_8_ce0 { O 1 bit } BRAM_conv_weight_6_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_6_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1089 \
    name BRAM_buffer_1_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_6 \
    op interface \
    ports { BRAM_buffer_1_6_address0 { O 7 vector } BRAM_buffer_1_6_ce0 { O 1 bit } BRAM_buffer_1_6_we0 { O 1 bit } BRAM_buffer_1_6_d0 { O 32 vector } BRAM_buffer_1_6_address1 { O 7 vector } BRAM_buffer_1_6_ce1 { O 1 bit } BRAM_buffer_1_6_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1090 \
    name BRAM_conv_weight_7_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_7_8 \
    op interface \
    ports { BRAM_conv_weight_7_8_address0 { O 8 vector } BRAM_conv_weight_7_8_ce0 { O 1 bit } BRAM_conv_weight_7_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_7_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1091 \
    name BRAM_buffer_1_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_7 \
    op interface \
    ports { BRAM_buffer_1_7_address0 { O 7 vector } BRAM_buffer_1_7_ce0 { O 1 bit } BRAM_buffer_1_7_we0 { O 1 bit } BRAM_buffer_1_7_d0 { O 32 vector } BRAM_buffer_1_7_address1 { O 7 vector } BRAM_buffer_1_7_ce1 { O 1 bit } BRAM_buffer_1_7_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1092 \
    name BRAM_conv_weight_8_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_8_8 \
    op interface \
    ports { BRAM_conv_weight_8_8_address0 { O 8 vector } BRAM_conv_weight_8_8_ce0 { O 1 bit } BRAM_conv_weight_8_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_8_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1093 \
    name BRAM_buffer_1_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_8 \
    op interface \
    ports { BRAM_buffer_1_8_address0 { O 7 vector } BRAM_buffer_1_8_ce0 { O 1 bit } BRAM_buffer_1_8_we0 { O 1 bit } BRAM_buffer_1_8_d0 { O 32 vector } BRAM_buffer_1_8_address1 { O 7 vector } BRAM_buffer_1_8_ce1 { O 1 bit } BRAM_buffer_1_8_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1094 \
    name BRAM_conv_weight_9_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_9_8 \
    op interface \
    ports { BRAM_conv_weight_9_8_address0 { O 8 vector } BRAM_conv_weight_9_8_ce0 { O 1 bit } BRAM_conv_weight_9_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_9_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1095 \
    name BRAM_buffer_1_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_9 \
    op interface \
    ports { BRAM_buffer_1_9_address0 { O 7 vector } BRAM_buffer_1_9_ce0 { O 1 bit } BRAM_buffer_1_9_we0 { O 1 bit } BRAM_buffer_1_9_d0 { O 32 vector } BRAM_buffer_1_9_address1 { O 7 vector } BRAM_buffer_1_9_ce1 { O 1 bit } BRAM_buffer_1_9_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1096 \
    name BRAM_conv_weight_10_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_10_8 \
    op interface \
    ports { BRAM_conv_weight_10_8_address0 { O 8 vector } BRAM_conv_weight_10_8_ce0 { O 1 bit } BRAM_conv_weight_10_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_10_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1097 \
    name BRAM_buffer_1_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_10 \
    op interface \
    ports { BRAM_buffer_1_10_address0 { O 7 vector } BRAM_buffer_1_10_ce0 { O 1 bit } BRAM_buffer_1_10_we0 { O 1 bit } BRAM_buffer_1_10_d0 { O 32 vector } BRAM_buffer_1_10_address1 { O 7 vector } BRAM_buffer_1_10_ce1 { O 1 bit } BRAM_buffer_1_10_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1098 \
    name BRAM_conv_weight_11_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_11_8 \
    op interface \
    ports { BRAM_conv_weight_11_8_address0 { O 8 vector } BRAM_conv_weight_11_8_ce0 { O 1 bit } BRAM_conv_weight_11_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_11_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1099 \
    name BRAM_buffer_1_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_11 \
    op interface \
    ports { BRAM_buffer_1_11_address0 { O 7 vector } BRAM_buffer_1_11_ce0 { O 1 bit } BRAM_buffer_1_11_we0 { O 1 bit } BRAM_buffer_1_11_d0 { O 32 vector } BRAM_buffer_1_11_address1 { O 7 vector } BRAM_buffer_1_11_ce1 { O 1 bit } BRAM_buffer_1_11_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1100 \
    name BRAM_conv_weight_12_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_12_8 \
    op interface \
    ports { BRAM_conv_weight_12_8_address0 { O 8 vector } BRAM_conv_weight_12_8_ce0 { O 1 bit } BRAM_conv_weight_12_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_12_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1101 \
    name BRAM_buffer_1_12 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_12 \
    op interface \
    ports { BRAM_buffer_1_12_address0 { O 7 vector } BRAM_buffer_1_12_ce0 { O 1 bit } BRAM_buffer_1_12_we0 { O 1 bit } BRAM_buffer_1_12_d0 { O 32 vector } BRAM_buffer_1_12_address1 { O 7 vector } BRAM_buffer_1_12_ce1 { O 1 bit } BRAM_buffer_1_12_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1102 \
    name BRAM_conv_weight_13_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_13_8 \
    op interface \
    ports { BRAM_conv_weight_13_8_address0 { O 8 vector } BRAM_conv_weight_13_8_ce0 { O 1 bit } BRAM_conv_weight_13_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_13_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1103 \
    name BRAM_buffer_1_13 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_13 \
    op interface \
    ports { BRAM_buffer_1_13_address0 { O 7 vector } BRAM_buffer_1_13_ce0 { O 1 bit } BRAM_buffer_1_13_we0 { O 1 bit } BRAM_buffer_1_13_d0 { O 32 vector } BRAM_buffer_1_13_address1 { O 7 vector } BRAM_buffer_1_13_ce1 { O 1 bit } BRAM_buffer_1_13_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1104 \
    name BRAM_conv_weight_14_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_14_8 \
    op interface \
    ports { BRAM_conv_weight_14_8_address0 { O 8 vector } BRAM_conv_weight_14_8_ce0 { O 1 bit } BRAM_conv_weight_14_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_14_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1105 \
    name BRAM_buffer_1_14 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_14 \
    op interface \
    ports { BRAM_buffer_1_14_address0 { O 7 vector } BRAM_buffer_1_14_ce0 { O 1 bit } BRAM_buffer_1_14_we0 { O 1 bit } BRAM_buffer_1_14_d0 { O 32 vector } BRAM_buffer_1_14_address1 { O 7 vector } BRAM_buffer_1_14_ce1 { O 1 bit } BRAM_buffer_1_14_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1106 \
    name BRAM_conv_weight_15_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_15_8 \
    op interface \
    ports { BRAM_conv_weight_15_8_address0 { O 8 vector } BRAM_conv_weight_15_8_ce0 { O 1 bit } BRAM_conv_weight_15_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_15_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1107 \
    name BRAM_buffer_1_15 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename BRAM_buffer_1_15 \
    op interface \
    ports { BRAM_buffer_1_15_address0 { O 7 vector } BRAM_buffer_1_15_ce0 { O 1 bit } BRAM_buffer_1_15_we0 { O 1 bit } BRAM_buffer_1_15_d0 { O 32 vector } BRAM_buffer_1_15_address1 { O 7 vector } BRAM_buffer_1_15_ce1 { O 1 bit } BRAM_buffer_1_15_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_15'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1070 \
    name zext_ln112 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln112 \
    op interface \
    ports { zext_ln112 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1071 \
    name zext_ln113 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln113 \
    op interface \
    ports { zext_ln113 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1072 \
    name lshr_ln1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lshr_ln1 \
    op interface \
    ports { lshr_ln1 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1073 \
    name zext_ln114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln114 \
    op interface \
    ports { zext_ln114 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1074 \
    name zext_ln115 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln115 \
    op interface \
    ports { zext_ln115 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1075 \
    name sext_ln121_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln121_8 \
    op interface \
    ports { sext_ln121_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName top_flow_control_loop_pipe_sequential_init_U
set CompName top_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix top_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


