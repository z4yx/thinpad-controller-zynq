
##
## Create Clock Constraints on BSCAN ports DRCK & UPDATE
##
#set clk_period [get_property PERIOD [get_clocks -of_objects [get_ports s_axi_aclk]]]
#set tck_period [expr [expr $clk_period / 8] * 1000]
#create_clock -period $tck_period [get_ports tck]

#set_false_path -from [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdi_output_reg[0]"}]
#set_false_path -from [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tms_output_reg[0]"}]
#set_false_path -to [get_cells -hierarchical -filter {NAME =~ "*u_jtag_proc/tdo_buffer_reg[*][0]"}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ "*sync_reg1_reg*"}]
