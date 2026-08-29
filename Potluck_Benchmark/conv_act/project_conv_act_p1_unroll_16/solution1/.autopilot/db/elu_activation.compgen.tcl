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
    id 1805 \
    name BRAM_buffer_2_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_0 \
    op interface \
    ports { BRAM_buffer_2_0_address0 { O 7 vector } BRAM_buffer_2_0_ce0 { O 1 bit } BRAM_buffer_2_0_we0 { O 1 bit } BRAM_buffer_2_0_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1806 \
    name BRAM_buffer_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_1 \
    op interface \
    ports { BRAM_buffer_1_1_address0 { O 7 vector } BRAM_buffer_1_1_ce0 { O 1 bit } BRAM_buffer_1_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1807 \
    name BRAM_buffer_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_0 \
    op interface \
    ports { BRAM_buffer_1_0_address0 { O 7 vector } BRAM_buffer_1_0_ce0 { O 1 bit } BRAM_buffer_1_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1808 \
    name BRAM_buffer_2_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_1 \
    op interface \
    ports { BRAM_buffer_2_1_address0 { O 7 vector } BRAM_buffer_2_1_ce0 { O 1 bit } BRAM_buffer_2_1_we0 { O 1 bit } BRAM_buffer_2_1_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1809 \
    name BRAM_buffer_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_2 \
    op interface \
    ports { BRAM_buffer_1_2_address0 { O 7 vector } BRAM_buffer_1_2_ce0 { O 1 bit } BRAM_buffer_1_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1810 \
    name BRAM_buffer_2_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_2 \
    op interface \
    ports { BRAM_buffer_2_2_address0 { O 7 vector } BRAM_buffer_2_2_ce0 { O 1 bit } BRAM_buffer_2_2_we0 { O 1 bit } BRAM_buffer_2_2_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1811 \
    name BRAM_buffer_1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_3 \
    op interface \
    ports { BRAM_buffer_1_3_address0 { O 7 vector } BRAM_buffer_1_3_ce0 { O 1 bit } BRAM_buffer_1_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1812 \
    name BRAM_buffer_2_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_3 \
    op interface \
    ports { BRAM_buffer_2_3_address0 { O 7 vector } BRAM_buffer_2_3_ce0 { O 1 bit } BRAM_buffer_2_3_we0 { O 1 bit } BRAM_buffer_2_3_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1813 \
    name BRAM_buffer_1_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_4 \
    op interface \
    ports { BRAM_buffer_1_4_address0 { O 7 vector } BRAM_buffer_1_4_ce0 { O 1 bit } BRAM_buffer_1_4_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1814 \
    name BRAM_buffer_2_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_4 \
    op interface \
    ports { BRAM_buffer_2_4_address0 { O 7 vector } BRAM_buffer_2_4_ce0 { O 1 bit } BRAM_buffer_2_4_we0 { O 1 bit } BRAM_buffer_2_4_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1815 \
    name BRAM_buffer_1_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_5 \
    op interface \
    ports { BRAM_buffer_1_5_address0 { O 7 vector } BRAM_buffer_1_5_ce0 { O 1 bit } BRAM_buffer_1_5_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1816 \
    name BRAM_buffer_2_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_5 \
    op interface \
    ports { BRAM_buffer_2_5_address0 { O 7 vector } BRAM_buffer_2_5_ce0 { O 1 bit } BRAM_buffer_2_5_we0 { O 1 bit } BRAM_buffer_2_5_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1817 \
    name BRAM_buffer_1_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_6 \
    op interface \
    ports { BRAM_buffer_1_6_address0 { O 7 vector } BRAM_buffer_1_6_ce0 { O 1 bit } BRAM_buffer_1_6_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1818 \
    name BRAM_buffer_2_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_6 \
    op interface \
    ports { BRAM_buffer_2_6_address0 { O 7 vector } BRAM_buffer_2_6_ce0 { O 1 bit } BRAM_buffer_2_6_we0 { O 1 bit } BRAM_buffer_2_6_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1819 \
    name BRAM_buffer_1_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_7 \
    op interface \
    ports { BRAM_buffer_1_7_address0 { O 7 vector } BRAM_buffer_1_7_ce0 { O 1 bit } BRAM_buffer_1_7_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1820 \
    name BRAM_buffer_2_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_7 \
    op interface \
    ports { BRAM_buffer_2_7_address0 { O 7 vector } BRAM_buffer_2_7_ce0 { O 1 bit } BRAM_buffer_2_7_we0 { O 1 bit } BRAM_buffer_2_7_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1821 \
    name BRAM_buffer_1_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_8 \
    op interface \
    ports { BRAM_buffer_1_8_address0 { O 7 vector } BRAM_buffer_1_8_ce0 { O 1 bit } BRAM_buffer_1_8_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1822 \
    name BRAM_buffer_2_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_8 \
    op interface \
    ports { BRAM_buffer_2_8_address0 { O 7 vector } BRAM_buffer_2_8_ce0 { O 1 bit } BRAM_buffer_2_8_we0 { O 1 bit } BRAM_buffer_2_8_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1823 \
    name BRAM_buffer_1_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_9 \
    op interface \
    ports { BRAM_buffer_1_9_address0 { O 7 vector } BRAM_buffer_1_9_ce0 { O 1 bit } BRAM_buffer_1_9_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1824 \
    name BRAM_buffer_2_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_9 \
    op interface \
    ports { BRAM_buffer_2_9_address0 { O 7 vector } BRAM_buffer_2_9_ce0 { O 1 bit } BRAM_buffer_2_9_we0 { O 1 bit } BRAM_buffer_2_9_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1825 \
    name BRAM_buffer_1_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_10 \
    op interface \
    ports { BRAM_buffer_1_10_address0 { O 7 vector } BRAM_buffer_1_10_ce0 { O 1 bit } BRAM_buffer_1_10_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1826 \
    name BRAM_buffer_2_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_10 \
    op interface \
    ports { BRAM_buffer_2_10_address0 { O 7 vector } BRAM_buffer_2_10_ce0 { O 1 bit } BRAM_buffer_2_10_we0 { O 1 bit } BRAM_buffer_2_10_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1827 \
    name BRAM_buffer_1_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_11 \
    op interface \
    ports { BRAM_buffer_1_11_address0 { O 7 vector } BRAM_buffer_1_11_ce0 { O 1 bit } BRAM_buffer_1_11_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1828 \
    name BRAM_buffer_2_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_11 \
    op interface \
    ports { BRAM_buffer_2_11_address0 { O 7 vector } BRAM_buffer_2_11_ce0 { O 1 bit } BRAM_buffer_2_11_we0 { O 1 bit } BRAM_buffer_2_11_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1829 \
    name BRAM_buffer_1_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_12 \
    op interface \
    ports { BRAM_buffer_1_12_address0 { O 7 vector } BRAM_buffer_1_12_ce0 { O 1 bit } BRAM_buffer_1_12_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1830 \
    name BRAM_buffer_2_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_12 \
    op interface \
    ports { BRAM_buffer_2_12_address0 { O 7 vector } BRAM_buffer_2_12_ce0 { O 1 bit } BRAM_buffer_2_12_we0 { O 1 bit } BRAM_buffer_2_12_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1831 \
    name BRAM_buffer_1_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_13 \
    op interface \
    ports { BRAM_buffer_1_13_address0 { O 7 vector } BRAM_buffer_1_13_ce0 { O 1 bit } BRAM_buffer_1_13_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1832 \
    name BRAM_buffer_2_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_13 \
    op interface \
    ports { BRAM_buffer_2_13_address0 { O 7 vector } BRAM_buffer_2_13_ce0 { O 1 bit } BRAM_buffer_2_13_we0 { O 1 bit } BRAM_buffer_2_13_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1833 \
    name BRAM_buffer_1_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_14 \
    op interface \
    ports { BRAM_buffer_1_14_address0 { O 7 vector } BRAM_buffer_1_14_ce0 { O 1 bit } BRAM_buffer_1_14_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1834 \
    name BRAM_buffer_2_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_14 \
    op interface \
    ports { BRAM_buffer_2_14_address0 { O 7 vector } BRAM_buffer_2_14_ce0 { O 1 bit } BRAM_buffer_2_14_we0 { O 1 bit } BRAM_buffer_2_14_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1835 \
    name BRAM_buffer_1_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename BRAM_buffer_1_15 \
    op interface \
    ports { BRAM_buffer_1_15_address0 { O 7 vector } BRAM_buffer_1_15_ce0 { O 1 bit } BRAM_buffer_1_15_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_1_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1836 \
    name BRAM_buffer_2_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename BRAM_buffer_2_15 \
    op interface \
    ports { BRAM_buffer_2_15_address0 { O 7 vector } BRAM_buffer_2_15_ce0 { O 1 bit } BRAM_buffer_2_15_we0 { O 1 bit } BRAM_buffer_2_15_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'BRAM_buffer_2_15'"
}
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


