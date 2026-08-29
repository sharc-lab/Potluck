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

create_project cycle_counter_package_IP ${proj_root}/cycle_counter_package_IP -part xc7z020clg400-1
add_files -norecurse ${rtl_dir}/cycle_counter.v

update_compile_order -fileset sources_1

set ip_dir ${proj_root}/cycle_counter_IP
if {![file exists $ip_dir]} {
    file mkdir $ip_dir
}

ipx::package_project -root_dir $ip_dir -vendor user.org -library user -taxonomy /UserIP -import_files -set_current false
ipx::unload_core $ip_dir/component.xml
ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $ip_dir $ip_dir/component.xml

update_compile_order -fileset sources_1
close_project