create_clock -period 6.667 -name dvi_clk -add [get_ports dvi_clk]
set_input_delay -clock [get_clocks dvi_clk] -max -add_delay  [expr 6.667 - 1.2] [get_ports {dvi_d[*] dvi_hs dvi_de dvi_vs}] -clock_fall
set_input_delay -clock [get_clocks dvi_clk] -min -add_delay  1.3 [get_ports {dvi_d[*] dvi_hs dvi_de dvi_vs}] -clock_fall


set_false_path -to [get_pins {block_design/design_1_i/axi_register_0/inst/axi_register_v1_0_S00_AXI_inst/port2reg_sync1_reg[*]/D}]
set_false_path -to [get_pins {uart_r/RxD_sync_reg[0]/D}]
#set_false_path -to [get_pins cpld_emu/u2/rxd1_reg/D]
set_false_path -to [get_pins block_design/design_1_i/axi_uart16550_0/U0/XUART_I_1/UART16550_I_1/rx16550_1/sin_d1_reg/D]
set_false_path -to [get_pins {la_rx_rst_sync/data_buf_reg[0][0]/D}]
set_false_path -to [get_pins {LApack/sync_cnt/data_buf_reg[0][*]/D}]
set_false_path -to [get_pins {LApack/sync_control/data_buf_reg[0][*]/D}]
set_false_path -to [get_pins vid_reset_sync/D]
set_false_path -to [get_pins -hierarchical {*SyncA_clkB_reg[0]/D}]
set_false_path -to [get_pins -hierarchical {*SyncA_clkB_reg[*]/CLR}]
set_false_path -to [get_pins {TxD_data_sync_reg[*]/D}]

