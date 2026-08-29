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
    id 1292 \
    name BRAM_conv_weight_0_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_0_12 \
    op interface \
    ports { BRAM_conv_weight_0_12_address0 { O 8 vector } BRAM_conv_weight_0_12_ce0 { O 1 bit } BRAM_conv_weight_0_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_0_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1293 \
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
    id 1294 \
    name BRAM_conv_weight_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_1_12 \
    op interface \
    ports { BRAM_conv_weight_1_12_address0 { O 8 vector } BRAM_conv_weight_1_12_ce0 { O 1 bit } BRAM_conv_weight_1_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1295 \
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
    id 1296 \
    name BRAM_conv_weight_2_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_2_12 \
    op interface \
    ports { BRAM_conv_weight_2_12_address0 { O 8 vector } BRAM_conv_weight_2_12_ce0 { O 1 bit } BRAM_conv_weight_2_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1297 \
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
    id 1298 \
    name BRAM_conv_weight_3_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_3_12 \
    op interface \
    ports { BRAM_conv_weight_3_12_address0 { O 8 vector } BRAM_conv_weight_3_12_ce0 { O 1 bit } BRAM_conv_weight_3_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_3_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1299 \
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
    id 1300 \
    name BRAM_conv_weight_4_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_4_12 \
    op interface \
    ports { BRAM_conv_weight_4_12_address0 { O 8 vector } BRAM_conv_weight_4_12_ce0 { O 1 bit } BRAM_conv_weight_4_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_4_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1301 \
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
    id 1302 \
    name BRAM_conv_weight_5_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_5_12 \
    op interface \
    ports { BRAM_conv_weight_5_12_address0 { O 8 vector } BRAM_conv_weight_5_12_ce0 { O 1 bit } BRAM_conv_weight_5_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_5_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1303 \
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
    id 1304 \
    name BRAM_conv_weight_6_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_6_12 \
    op interface \
    ports { BRAM_conv_weight_6_12_address0 { O 8 vector } BRAM_conv_weight_6_12_ce0 { O 1 bit } BRAM_conv_weight_6_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_6_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1305 \
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
    id 1306 \
    name BRAM_conv_weight_7_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_7_12 \
    op interface \
    ports { BRAM_conv_weight_7_12_address0 { O 8 vector } BRAM_conv_weight_7_12_ce0 { O 1 bit } BRAM_conv_weight_7_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_7_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1307 \
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
    id 1308 \
    name BRAM_conv_weight_8_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_8_12 \
    op interface \
    ports { BRAM_conv_weight_8_12_address0 { O 8 vector } BRAM_conv_weight_8_12_ce0 { O 1 bit } BRAM_conv_weight_8_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_8_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1309 \
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
    id 1310 \
    name BRAM_conv_weight_9_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_9_12 \
    op interface \
    ports { BRAM_conv_weight_9_12_address0 { O 8 vector } BRAM_conv_weight_9_12_ce0 { O 1 bit } BRAM_conv_weight_9_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_9_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1311 \
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
    id 1312 \
    name BRAM_conv_weight_10_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_10_12 \
    op interface \
    ports { BRAM_conv_weight_10_12_address0 { O 8 vector } BRAM_conv_weight_10_12_ce0 { O 1 bit } BRAM_conv_weight_10_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_10_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1313 \
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
    id 1314 \
    name BRAM_conv_weight_11_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_11_12 \
    op interface \
    ports { BRAM_conv_weight_11_12_address0 { O 8 vector } BRAM_conv_weight_11_12_ce0 { O 1 bit } BRAM_conv_weight_11_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_11_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1315 \
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
    id 1316 \
    name BRAM_conv_weight_12_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_12_12 \
    op interface \
    ports { BRAM_conv_weight_12_12_address0 { O 8 vector } BRAM_conv_weight_12_12_ce0 { O 1 bit } BRAM_conv_weight_12_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_12_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1317 \
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
    id 1318 \
    name BRAM_conv_weight_13_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_13_12 \
    op interface \
    ports { BRAM_conv_weight_13_12_address0 { O 8 vector } BRAM_conv_weight_13_12_ce0 { O 1 bit } BRAM_conv_weight_13_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_13_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1319 \
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
    id 1320 \
    name BRAM_conv_weight_14_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_14_12 \
    op interface \
    ports { BRAM_conv_weight_14_12_address0 { O 8 vector } BRAM_conv_weight_14_12_ce0 { O 1 bit } BRAM_conv_weight_14_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_14_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1321 \
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
    id 1322 \
    name BRAM_conv_weight_15_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_conv_weight_15_12 \
    op interface \
    ports { BRAM_conv_weight_15_12_address0 { O 8 vector } BRAM_conv_weight_15_12_ce0 { O 1 bit } BRAM_conv_weight_15_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_conv_weight_15_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1323 \
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
    id 1286 \
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
    id 1287 \
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
    id 1288 \
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
    id 1289 \
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
    id 1290 \
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
    id 1291 \
    name sext_ln121_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln121_12 \
    op interface \
    ports { sext_ln121_12 { I 32 vector } } \
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


