update_compile_order -fileset sources_1

# If IP cores are used
if { [llength [get_ips]] != 0} {
    upgrade_ip [get_ips]

    generate_target all [get_files -of_objects [get_fileset sources_1] -filter {FILE_TYPE == "Block Designs"}]
    export_ip_user_files -of_objects [get_files -of_objects [get_fileset sources_1] -filter {FILE_TYPE == "Block Designs"}] -no_script -sync -force -quiet
    create_ip_run [get_files -of_objects [get_fileset sources_1] -filter {FILE_TYPE == "Block Designs"}]

    foreach ip [get_ips] {
        create_ip_run -quiet [get_ips $ip]
    }

    set ip_runs [get_runs -filter {SRCSET != sources_1 && IS_SYNTHESIS && STATUS != "synth_design Complete!"}]
    

}

exit
