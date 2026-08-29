
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
set bs_dir ${proj_root}/automatic_gen_bitstream_baseline_arch
set ip_dir ${proj_root}/architecture_IP_baseline_arch
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
set_property ip_repo_paths $ip_dir [current_project]
update_ip_catalog

# 6) build block-design -----------------------------------------------
create_bd_design "design_1"
update_compile_order -fileset sources_1

create_bd_cell -type ip -vlnv user.org:user:top:1.0                     top_0
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.5 zynq_ultra_ps_e_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0

# 7) dynamically enable PS-GP2 … PS-GP<N+1> ----------------------------
set max_cnt [expr {[llength $m_axi_list] + 1}]

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

set_property -dict [list \
  CONFIG.c_include_s2mm 0 \
  CONFIG.c_include_sg 0 \
  CONFIG.c_m_axi_mm2s_data_width $inst_length \
  CONFIG.c_m_axis_mm2s_tdata_width $inst_length \
  CONFIG.c_mm2s_burst_size 16 \
] [get_bd_cells axi_dma_0]

set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} [get_bd_cells zynq_ultra_ps_e_0]

# 8) clock/reset automation -------------------------------------------
apply_bd_automation -rule xilinx.com:bd_rule:clkrst \
  -config {Clk {/zynq_ultra_ps_e_0/pl_clk0 (96 MHz)} Freq {96}} \
  [get_bd_pins top_0/ap_clk]

# 9) AXI-4 automation --------------------------------------------------
# 9a) s_axi_control
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config {Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} \
           Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} \
           Slave  {/top_0/s_axi_control} \
           ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}} \
  [get_bd_intf_pins top_0/s_axi_control]

# 9b) DMA ports → HP0
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
  -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} \
          Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} \
          Slave {/axi_dma_0/S_AXI_LITE} \
          ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}} \
  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]

apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/zynq_ultra_ps_e_0/S_AXI_HP0_FPD} ddr_seg {Auto} intc_ip {New AXI SmartConnect} master_apm {0}}  [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]

# 9c) m_axi ports → HP0…HP3
set hp_ports [list \
    /zynq_ultra_ps_e_0/S_AXI_HP0_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP1_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP2_FPD \
    /zynq_ultra_ps_e_0/S_AXI_HP3_FPD]

set idx 1
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

connect_bd_intf_net [get_bd_intf_pins top_0/inst] [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S]

# 10) set FREQ_HZ on all AXI interfaces --------------------------------
set_property CONFIG.FREQ_HZ 96968727 [get_bd_intf_pins /top_0/inst]
set_property CONFIG.FREQ_HZ 96968727 [get_bd_intf_pins /top_0/s_axi_control]
foreach port $m_axi_list {
    set_property CONFIG.FREQ_HZ 96968727 [get_bd_intf_pins /top_0/$port]
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