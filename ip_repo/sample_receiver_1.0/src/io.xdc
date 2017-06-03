create_clock -period 20.000 -name clk -add [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN D18 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports rst_in]
set_property PACKAGE_PIN F22 [get_ports rst_in]
set_property IOSTANDARD LVCMOS33 [get_ports txd]
set_property IOSTANDARD LVCMOS33 [get_ports rxd]
set_property PACKAGE_PIN L19 [get_ports txd]
set_property PACKAGE_PIN K21 [get_ports rxd]

set_property -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS33} [get_ports step_btn]

#SERDES
set_property -dict {PACKAGE_PIN P20 IOSTANDARD TMDS_33} [get_ports clkout1_p]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD TMDS_33} [get_ports clkout1_n]
set_property -dict {PACKAGE_PIN K22 IOSTANDARD TMDS_33} [get_ports {dataout1_p[0]}]
set_property -dict {PACKAGE_PIN K23 IOSTANDARD TMDS_33} [get_ports {dataout1_n[0]}]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD TMDS_33} [get_ports {dataout1_p[1]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD TMDS_33} [get_ports {dataout1_n[1]}]
set_property -dict {PACKAGE_PIN M16 IOSTANDARD TMDS_33} [get_ports {dataout1_p[2]}]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD TMDS_33} [get_ports {dataout1_n[2]}]
set_property -dict {PACKAGE_PIN J24 IOSTANDARD TMDS_33} [get_ports {dataout1_p[3]}]
set_property -dict {PACKAGE_PIN H24 IOSTANDARD TMDS_33} [get_ports {dataout1_n[3]}]

#LEDS
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[0]}]
set_property PACKAGE_PIN A17 [get_ports {gpio0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[1]}]
set_property PACKAGE_PIN G16 [get_ports {gpio0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[2]}]
set_property PACKAGE_PIN E16 [get_ports {gpio0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[3]}]
set_property PACKAGE_PIN H17 [get_ports {gpio0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[4]}]
set_property PACKAGE_PIN G17 [get_ports {gpio0[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[5]}]
set_property PACKAGE_PIN F18 [get_ports {gpio0[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[6]}]
set_property PACKAGE_PIN F19 [get_ports {gpio0[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[7]}]
set_property PACKAGE_PIN F20 [get_ports {gpio0[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[8]}]
set_property PACKAGE_PIN C17 [get_ports {gpio0[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[9]}]
set_property PACKAGE_PIN F17 [get_ports {gpio0[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[10]}]
set_property PACKAGE_PIN B17 [get_ports {gpio0[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[11]}]
set_property PACKAGE_PIN D19 [get_ports {gpio0[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[12]}]
set_property PACKAGE_PIN A18 [get_ports {gpio0[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[13]}]
set_property PACKAGE_PIN A19 [get_ports {gpio0[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[14]}]
set_property PACKAGE_PIN E17 [get_ports {gpio0[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[15]}]
set_property PACKAGE_PIN E18 [get_ports {gpio0[15]}]

#DPY0
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[16]}]
set_property PACKAGE_PIN D16 [get_ports {gpio0[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[17]}]
set_property PACKAGE_PIN F15 [get_ports {gpio0[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[18]}]
set_property PACKAGE_PIN H15 [get_ports {gpio0[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[19]}]
set_property PACKAGE_PIN G15 [get_ports {gpio0[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[20]}]
set_property PACKAGE_PIN H16 [get_ports {gpio0[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[21]}]
set_property PACKAGE_PIN H14 [get_ports {gpio0[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[22]}]
set_property PACKAGE_PIN G19 [get_ports {gpio0[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[23]}]
set_property PACKAGE_PIN J8 [get_ports {gpio0[23]}]

#DPY2
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[24]}]
set_property PACKAGE_PIN H9 [get_ports {gpio0[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[25]}]
set_property PACKAGE_PIN G8 [get_ports {gpio0[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[26]}]
set_property PACKAGE_PIN G7 [get_ports {gpio0[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[27]}]
set_property PACKAGE_PIN G6 [get_ports {gpio0[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[28]}]
set_property PACKAGE_PIN D6 [get_ports {gpio0[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[29]}]
set_property PACKAGE_PIN E5 [get_ports {gpio0[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[30]}]
set_property PACKAGE_PIN F4 [get_ports {gpio0[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio0[31]}]
set_property PACKAGE_PIN G5 [get_ports {gpio0[31]}]

#DIP_SW
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[0]}]
set_property PACKAGE_PIN N3 [get_ports {gpio1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[1]}]
set_property PACKAGE_PIN N4 [get_ports {gpio1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[2]}]
set_property PACKAGE_PIN P3 [get_ports {gpio1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[3]}]
set_property PACKAGE_PIN P4 [get_ports {gpio1[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[4]}]
set_property PACKAGE_PIN R5 [get_ports {gpio1[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[5]}]
set_property PACKAGE_PIN T7 [get_ports {gpio1[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[6]}]
set_property PACKAGE_PIN R8 [get_ports {gpio1[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[7]}]
set_property PACKAGE_PIN T8 [get_ports {gpio1[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[8]}]
set_property PACKAGE_PIN N2 [get_ports {gpio1[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[9]}]
set_property PACKAGE_PIN N1 [get_ports {gpio1[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[10]}]
set_property PACKAGE_PIN P1 [get_ports {gpio1[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[11]}]
set_property PACKAGE_PIN R2 [get_ports {gpio1[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[12]}]
set_property PACKAGE_PIN R1 [get_ports {gpio1[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[13]}]
set_property PACKAGE_PIN T2 [get_ports {gpio1[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[14]}]
set_property PACKAGE_PIN U1 [get_ports {gpio1[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[15]}]
set_property PACKAGE_PIN U2 [get_ports {gpio1[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[16]}]
set_property PACKAGE_PIN U6 [get_ports {gpio1[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[17]}]
set_property PACKAGE_PIN R6 [get_ports {gpio1[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[18]}]
set_property PACKAGE_PIN U5 [get_ports {gpio1[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[19]}]
set_property PACKAGE_PIN T5 [get_ports {gpio1[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[20]}]
set_property PACKAGE_PIN U4 [get_ports {gpio1[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[21]}]
set_property PACKAGE_PIN T4 [get_ports {gpio1[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[22]}]
set_property PACKAGE_PIN T3 [get_ports {gpio1[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[23]}]
set_property PACKAGE_PIN R3 [get_ports {gpio1[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[24]}]
set_property PACKAGE_PIN P5 [get_ports {gpio1[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[25]}]
set_property PACKAGE_PIN P6 [get_ports {gpio1[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[26]}]
set_property PACKAGE_PIN P8 [get_ports {gpio1[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[27]}]
set_property PACKAGE_PIN N8 [get_ports {gpio1[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[28]}]
set_property PACKAGE_PIN N6 [get_ports {gpio1[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[29]}]
set_property PACKAGE_PIN N7 [get_ports {gpio1[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[30]}]
set_property PACKAGE_PIN M7 [get_ports {gpio1[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio1[31]}]
set_property PACKAGE_PIN M5 [get_ports {gpio1[31]}]


set_false_path -from [get_pins la/init_timer_hold_reg/C] -to [get_pins {la/init_timer_sync_reg[0]/D}]