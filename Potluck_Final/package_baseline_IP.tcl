# package_IP.tcl
# usage:
#   vivado -mode batch -nojournal -nolog -notrace \
#         -source package_IP.tcl \
#         <rtl_dir> \
#         <proj_root>

# 1) require exactly 2 args
if {[llength $argv] != 2} {
    puts stderr "ERROR: need exactly 2 arguments:"
    puts stderr "  1) <rtl_dir>   — directory containing your .v files"
    puts stderr "  2) <proj_root> — base directory for the Vivado project"
    exit 1
}

set rtl_dir  [lindex $argv 0]
set proj_root [lindex $argv 1]

# 2) sanity checks
if {![file isdirectory $rtl_dir]} {
    puts stderr "ERROR: RTL directory “$rtl_dir” not found"
    exit 1
}
# create proj_root if missing
if {![file exists $proj_root]} {
    file mkdir $proj_root
}

# 3) create the Vivado project under $proj_root
create_project automatic_gen_IP_baseline \
    ${proj_root}/automatic_gen_IP_baseline \
    -part xczu9eg-ffvb1156-2-e

set_property board_part xilinx.com:zcu102:part0:3.4 [current_project]

# 4) add all .v and .dat files from $rtl_dir (non‐recursive)
set files [glob -nocomplain -directory $rtl_dir *.v *.dat]
if {[llength $files] == 0} {
    puts stderr "WARNING: no .v or .dat files found in $rtl_dir"
} else {
    add_files -norecurse {*}$files
    puts "Added [llength $files] RTL files from $rtl_dir"
}

# set datfiles [glob -nocomplain -directory $rtl_dir *.dat]
# if {[llength $datfiles] == 0} {
#     puts stderr "WARNING: no .dat files found in $rtl_dir"
# } else {
#     add_files -norecurse {*}$datfiles
#     puts "Added [llength $datfiles] RTL files from $rtl_dir"
# }

update_compile_order -fileset sources_1


# # 6) source all .tcl files in ./architecture_design_TCL/ and update compile order
# set tcl_dir "./architecture_design_TCL"
# if {![file isdirectory $tcl_dir]} {
#     puts stderr "WARNING: TCL directory \"$tcl_dir\" not found, skipping"
# } else {
#     set tclfiles [glob -nocomplain -directory $tcl_dir *.tcl]
#     if {[llength $tclfiles] == 0} {
#         puts "No .tcl files found in $tcl_dir"
#     } else {
#         foreach tclfile $tclfiles {
#             puts "Sourcing [file tail $tclfile]..."
#             source $tclfile
#             update_compile_order -fileset sources_1
#             puts "Updated compile order after sourcing [file tail $tclfile]"
#         }
#     }
# }

# 5) ensure the IP directory exists, then package & edit IP there
set ip_dir ${proj_root}/architecture_IP_baseline
if {![file exists $ip_dir]} {
    file mkdir $ip_dir
}

ipx::package_project \
    -root_dir $ip_dir \
    -vendor user.org \
    -library user \
    -taxonomy /UserIP \
    -import_files \
    -set_current false

ipx::unload_core $ip_dir/component.xml
ipx::edit_ip_in_project \
    -upgrade true \
    -name tmp_edit_project \
    -directory $ip_dir \
    $ip_dir/component.xml

update_compile_order -fileset sources_1
close_project


