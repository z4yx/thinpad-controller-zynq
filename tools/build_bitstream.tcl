update_compile_order -fileset sources_1

set rev [lindex $argv 0]
puts "Build for thinpad rev.$rev"
set_property generic thinpad_rev=$rev [current_fileset]
set_property is_enabled [expr {$rev eq 2 ? true : false}] [get_files {*pins_rev2.xdc}]
set_property is_enabled [expr {$rev eq 3 ? true : false}] [get_files {*pins_rev3.xdc}]

reset_run impl_1
reset_run synth_1
launch_runs -jobs 2 impl_1 -to_step write_bitstream
wait_on_run impl_1

exit
