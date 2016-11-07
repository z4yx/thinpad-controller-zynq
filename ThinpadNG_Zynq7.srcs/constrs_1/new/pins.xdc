set_property PACKAGE_PIN Y6 [get_ports clk_out1]
set_property PACKAGE_PIN Y5 [get_ports clk_out2]

set_property PACKAGE_PIN P16 [get_ports UART_1_rxd]
set_property PACKAGE_PIN W15 [get_ports UART_1_txd]
set_property PACKAGE_PIN R18 [get_ports rxd_232]
set_property PACKAGE_PIN U19 [get_ports txd_232]

set_property PACKAGE_PIN T17 [get_ports SPI0_MOSI_O]
set_property PACKAGE_PIN R19 [get_ports SPI0_SCLK_O]

set_property PACKAGE_PIN T19 [get_ports {progb[0]}]
set_property PACKAGE_PIN N19 [get_ports initb]
set_property PACKAGE_PIN P18 [get_ports done]

set_property IOSTANDARD LVCMOS33 [get_ports clk_out1]
set_property IOSTANDARD LVCMOS33 [get_ports clk_out2]

set_property IOSTANDARD LVCMOS33 [get_ports UART_1_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_1_txd]
set_property IOSTANDARD LVCMOS33 [get_ports rxd_232]
set_property IOSTANDARD LVCMOS33 [get_ports txd_232]

set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O]

set_property IOSTANDARD LVCMOS33 [get_ports {progb[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports initb]
set_property IOSTANDARD LVCMOS33 [get_ports done]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 2 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/ps7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/ps7_0_GPIO_O[0]} {design_1_i/ps7_0_GPIO_O[1]} {design_1_i/ps7_0_GPIO_O[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/xlconcat_0_dout[1]} {design_1_i/xlconcat_0_dout[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list design_1_i/ps7_0_SPI0_MOSI_O]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list design_1_i/ps7_0_SPI0_SCLK_O]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
