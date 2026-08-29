
########################################################################
# automatic_gen_bitstream.tcl
#
# Usage:
#   vivado -mode batch -nojournal -nolog -notrace \
#          -source automatic_gen_bitstream.tcl \
#          <proj_root> <m_axi_interface_file>
########################################################################

# 1) argument check ----------------------------------------------------
if {[llength $argv] != 3} {
    puts stderr "ERROR: need exactly 2 arguments:"
    puts stderr "  1) <proj_root>             — Vivado project root"
    puts stderr "  2) <m_axi_interface_file>  — TXT file listing up to 4 m_axi ports"
    puts stderr "  3) <inst_length_file>  — The file contains instruction length"
    exit 1
}
set proj_root  [lindex $argv 0]
set iface_file [lindex $argv 1]
set inst_length_file [lindex $argv 2]

# 2) validate / create paths ------------------------------------------
if {![file exists $proj_root]}   { file mkdir -p $proj_root }
if {![file exists $iface_file]} {
    puts stderr "ERROR: interface list file \"$iface_file\" not found"
    exit 1
}
if {![file exists $inst_length_file]} {
    puts stderr "ERROR: instruction length file \"$inst_length_file\" not found"
    exit 1
}
# 3) derive sub-dirs & ensure exist -----------------------------------
set bs_dir ${proj_root}/automatic_gen_bitstream_baseline_debug_arch
set ip_dir ${proj_root}/architecture_IP_baseline_arch
set ip_cycle_counter ${proj_root}/cycle_counter_IP
foreach d [list $bs_dir $ip_dir] {
    if {![file exists $d]} { file mkdir -p $d }
}

# 4) read up to 4 m_axi names -----------------------------------------
set raw         [split [read [open $iface_file r]] "\n"]
set m_axi_list  {}
foreach l $raw {
    if {[string trim $l] ne ""} {
        lappend m_axi_list [string trim $l]
        if {[llength $m_axi_list] == 4} { break }
    }
}
puts "INFO: found [llength $m_axi_list] m_axi port(s): $m_axi_list"

# 5) create & configure project ---------------------------------------
create_project automatic_gen_bitstream $bs_dir -part xczu9eg-ffvb1156-2-e
set_property board_part xilinx.com:zcu102:part0:3.4 [current_project]
set_property ip_repo_paths [list $ip_dir $ip_cycle_counter] [current_project]
update_ip_catalog

# 6) build block-design -----------------------------------------------
create_bd_design "design_1"
update_compile_order -fileset sources_1

create_bd_cell -type ip -vlnv user.org:user:top:1.0                     top_0
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.5 zynq_ultra_ps_e_0
create_bd_cell -type ip -vlnv user.org:user:cycle_counter:1.0 cycle_counter_0

# 7) dynamically enable PS-GP2 … PS-GP<N+1> ----------------------------
set max_cnt [expr {[llength $m_axi_list]}]

set gp_props {}
for {set i 0} {$i < $max_cnt} {incr i} {
    # PS-GP2 … PS-GP(max_cnt+1)
    set gp_num [expr {2 + $i}]
    lappend gp_props CONFIG.PSU__USE__S_AXI_GP${gp_num} 1
}
set_property -dict $gp_props [get_bd_cells zynq_ultra_ps_e_0]

# Read the single value inside
set fp           [open $inst_length_file r]
set inst_length  [string trim [gets $fp]]   ;# e.g. "64"
close $fp

# Optional sanity-check & cast to integer
if {![string is integer -strict $inst_length]} {
    puts "ERROR: '$inst_length' in $inst_length_file is not an integer."
    exit 1
}
set inst_length [expr {$inst_length}]      ;# forces numeric type

# -----------------------------------------------------------------
# 2) Echo it so you can see what was read
# -----------------------------------------------------------------
puts ">> Using inst_length = $inst_length bits"

set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {250} [get_bd_cells zynq_ultra_ps_e_0]

# 8) clock/reset automation -------------------------------------------
apply_bd_automation -rule xilinx.com:bd_rule:clkrst \
  -config {Clk {/zynq_ultra_ps_e_0/pl_clk0 (213 MHz)} Freq {213}} \
  [get_bd_pins top_0/ap_clk]

# 9) AXI-4 automation --------------------------------------------------
# 9a) s_axi_control
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config {Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} \
           Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} \
           Slave  {/top_0/s_axi_control} \
           ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}} \
  [get_bd_intf_pins top_0/s_axi_control]


# 9c) m_axi ports → HP0…HP3
set hp_ports [list \
    /zynq_ultra_ps_e_0/S_AXI_HP0_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP1_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP2_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP3_FPD]

set idx 0
foreach port $m_axi_list {
    if {$idx >= [llength $hp_ports]} { break }
    set hp [lindex $hp_ports $idx]

    # -------- FIX: no braces around variable substitutions ------------
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
      -config [list \
        Clk_master Auto  Clk_slave Auto  Clk_xbar Auto \
        Master /top_0/$port  Slave $hp \
        ddr_seg Auto  intc_ip {New AXI SmartConnect}  master_apm 0] \
      [get_bd_intf_pins $hp]
    # ------------------------------------------------------------------

    incr idx
}

apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/zynq_ultra_ps_e_0/pl_clk0 (213 MHz)} Freq {213} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins cycle_counter_0/clk]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1

set_property -dict [list \
  CONFIG.C_IS_DUAL {1} \
  CONFIG.C_ALL_INPUTS {1} \
  CONFIG.C_ALL_INPUTS_2 {1} \
] [get_bd_cells axi_gpio_0]

set_property -dict [list \
  CONFIG.DIN_FROM {63} \
  CONFIG.DIN_TO {32} \
  CONFIG.DIN_WIDTH {64} \
] [get_bd_cells xlslice_0]

set_property -dict [list \
  CONFIG.DIN_FROM {31} \
  CONFIG.DIN_TO {0} \
  CONFIG.DIN_WIDTH {64} \
] [get_bd_cells xlslice_1]

apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/zynq_ultra_ps_e_0/pl_clk0 (213 MHz)} Clk_slave {Auto} Clk_xbar {/zynq_ultra_ps_e_0/pl_clk0 (213 MHz)} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/axi_gpio_0/S_AXI} ddr_seg {Auto} intc_ip {/ps8_0_axi_periph} master_apm {0}}  [get_bd_intf_pins axi_gpio_0/S_AXI]

connect_bd_net [get_bd_pins cycle_counter_0/rst_p] [get_bd_pins top_0/dbg_ap_start]
connect_bd_net [get_bd_pins cycle_counter_0/freeze_p] [get_bd_pins top_0/dbg_ap_done]
connect_bd_net [get_bd_pins cycle_counter_0/count] [get_bd_pins xlslice_0/Din]
connect_bd_net [get_bd_pins cycle_counter_0/count] [get_bd_pins xlslice_1/Din]

connect_bd_net [get_bd_pins xlslice_0/Dout] [get_bd_pins axi_gpio_0/gpio2_io_i]
connect_bd_net [get_bd_pins xlslice_1/Dout] [get_bd_pins axi_gpio_0/gpio_io_i]


# 10) set FREQ_HZ on all AXI interfaces --------------------------------
set_property CONFIG.FREQ_HZ 213331207 [get_bd_intf_pins /top_0/s_axi_control]
foreach port $m_axi_list {
    set_property CONFIG.FREQ_HZ 213331207 [get_bd_intf_pins /top_0/$port]
}

# 11) wrapper & sources ------------------------------------------------
set bd_src ${bs_dir}/automatic_gen_bitstream.srcs/sources_1/bd/design_1
set bd_hdl ${bs_dir}/automatic_gen_bitstream.gen/sources_1/bd/design_1/hdl
make_wrapper -files [get_files $bd_src/design_1.bd] -top
add_files -norecurse $bd_hdl/design_1_wrapper.v

# 12) implementation ---------------------------------------------------
launch_runs impl_1 -to_step write_bitstream -jobs 64
wait_on_run [get_runs impl_1]

# 13) finish -----------------------------------------------------------
close_project
puts "INFO: bitstream generation completed successfully."