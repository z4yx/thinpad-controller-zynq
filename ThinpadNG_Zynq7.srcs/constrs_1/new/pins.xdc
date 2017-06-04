create_clock -period 8.620 -name clkin1_p -waveform {0.000 3.690} [get_ports clkin1_p]

set_property PACKAGE_PIN Y6 [get_ports clk_out1]
set_property PACKAGE_PIN Y5 [get_ports clk_out2]

set_property PACKAGE_PIN V18 [get_ports UART_1_rxd]
set_property PACKAGE_PIN V13 [get_ports UART_1_txd]

set_property PACKAGE_PIN T17 [get_ports SPI0_MOSI_O]
set_property PACKAGE_PIN R19 [get_ports SPI0_SCLK_O]

set_property PACKAGE_PIN T19 [get_ports {progb[0]}]
set_property PACKAGE_PIN N17 [get_ports initb]
set_property PACKAGE_PIN P18 [get_ports done]

#SERDES
set_property -dict {PACKAGE_PIN N19 IOSTANDARD TMDS_33} [get_ports clkin1_p]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD TMDS_33} [get_ports clkin1_n]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD TMDS_33} [get_ports {datain1_p[0]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD TMDS_33} [get_ports {datain1_n[0]}]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD TMDS_33} [get_ports {datain1_p[1]}]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD TMDS_33} [get_ports {datain1_n[1]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD TMDS_33} [get_ports {datain1_p[2]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD TMDS_33} [get_ports {datain1_n[2]}]
set_property -dict {PACKAGE_PIN Y13 IOSTANDARD TMDS_33} [get_ports {datain1_p[3]}]
set_property -dict {PACKAGE_PIN AA13 IOSTANDARD TMDS_33} [get_ports {datain1_n[3]}]

# GPIOs
# leds
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_tri_io[31]}]

set_property PACKAGE_PIN Y15 [get_ports {gpio_rtl_tri_io[0]}]
set_property PACKAGE_PIN Y14 [get_ports {gpio_rtl_tri_io[1]}]
set_property PACKAGE_PIN W12 [get_ports {gpio_rtl_tri_io[2]}]
set_property PACKAGE_PIN Y16 [get_ports {gpio_rtl_tri_io[3]}]
set_property PACKAGE_PIN Y20 [get_ports {gpio_rtl_tri_io[4]}]
set_property PACKAGE_PIN Y18 [get_ports {gpio_rtl_tri_io[5]}]
set_property PACKAGE_PIN W18 [get_ports {gpio_rtl_tri_io[6]}]
set_property PACKAGE_PIN U19 [get_ports {gpio_rtl_tri_io[7]}]
set_property PACKAGE_PIN Y11 [get_ports {gpio_rtl_tri_io[8]}]
set_property PACKAGE_PIN V10 [get_ports {gpio_rtl_tri_io[9]}]
set_property PACKAGE_PIN V12 [get_ports {gpio_rtl_tri_io[10]}]
set_property PACKAGE_PIN W15 [get_ports {gpio_rtl_tri_io[11]}]
set_property PACKAGE_PIN Y19 [get_ports {gpio_rtl_tri_io[12]}]
set_property PACKAGE_PIN W17 [get_ports {gpio_rtl_tri_io[13]}]
set_property PACKAGE_PIN W10 [get_ports {gpio_rtl_tri_io[14]}]
set_property PACKAGE_PIN V9 [get_ports {gpio_rtl_tri_io[15]}]
set_property PACKAGE_PIN AA17 [get_ports {gpio_rtl_tri_io[16]}]
set_property PACKAGE_PIN AB17 [get_ports {gpio_rtl_tri_io[17]}]
set_property PACKAGE_PIN AA18 [get_ports {gpio_rtl_tri_io[18]}]
set_property PACKAGE_PIN AB19 [get_ports {gpio_rtl_tri_io[19]}]
set_property PACKAGE_PIN AB1 [get_ports {gpio_rtl_tri_io[20]}]
set_property PACKAGE_PIN AB2 [get_ports {gpio_rtl_tri_io[21]}]
set_property PACKAGE_PIN W5 [get_ports {gpio_rtl_tri_io[22]}]
set_property PACKAGE_PIN AB4 [get_ports {gpio_rtl_tri_io[23]}]
set_property PACKAGE_PIN AB22 [get_ports {gpio_rtl_tri_io[24]}]
set_property PACKAGE_PIN AA22 [get_ports {gpio_rtl_tri_io[25]}]
set_property PACKAGE_PIN Y21 [get_ports {gpio_rtl_tri_io[26]}]
set_property PACKAGE_PIN W21 [get_ports {gpio_rtl_tri_io[27]}]
set_property PACKAGE_PIN AA19 [get_ports {gpio_rtl_tri_io[28]}]
set_property PACKAGE_PIN AB20 [get_ports {gpio_rtl_tri_io[29]}]
set_property PACKAGE_PIN AB21 [get_ports {gpio_rtl_tri_io[30]}]
set_property PACKAGE_PIN AA21 [get_ports {gpio_rtl_tri_io[31]}]
#switches
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_1_tri_io[31]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio_rtl_0_tri_io[5]}]

set_property PACKAGE_PIN H15 [get_ports {gpio_rtl_1_tri_io[0]}]
set_property PACKAGE_PIN H17 [get_ports {gpio_rtl_1_tri_io[1]}]
set_property PACKAGE_PIN H18 [get_ports {gpio_rtl_1_tri_io[2]}]
set_property PACKAGE_PIN J15 [get_ports {gpio_rtl_1_tri_io[3]}]
set_property PACKAGE_PIN J16 [get_ports {gpio_rtl_1_tri_io[4]}]
set_property PACKAGE_PIN K18 [get_ports {gpio_rtl_1_tri_io[5]}]
set_property PACKAGE_PIN L19 [get_ports {gpio_rtl_1_tri_io[6]}]
set_property PACKAGE_PIN L18 [get_ports {gpio_rtl_1_tri_io[7]}]
set_property PACKAGE_PIN E19 [get_ports {gpio_rtl_1_tri_io[8]}]
set_property PACKAGE_PIN D20 [get_ports {gpio_rtl_1_tri_io[9]}]
set_property PACKAGE_PIN C20 [get_ports {gpio_rtl_1_tri_io[10]}]
set_property PACKAGE_PIN E18 [get_ports {gpio_rtl_1_tri_io[11]}]
set_property PACKAGE_PIN G16 [get_ports {gpio_rtl_1_tri_io[12]}]
set_property PACKAGE_PIN F16 [get_ports {gpio_rtl_1_tri_io[13]}]
set_property PACKAGE_PIN E16 [get_ports {gpio_rtl_1_tri_io[14]}]
set_property PACKAGE_PIN E15 [get_ports {gpio_rtl_1_tri_io[15]}]
set_property PACKAGE_PIN C19 [get_ports {gpio_rtl_1_tri_io[16]}]
set_property PACKAGE_PIN D18 [get_ports {gpio_rtl_1_tri_io[17]}]
set_property PACKAGE_PIN C18 [get_ports {gpio_rtl_1_tri_io[18]}]
set_property PACKAGE_PIN D17 [get_ports {gpio_rtl_1_tri_io[19]}]
set_property PACKAGE_PIN C17 [get_ports {gpio_rtl_1_tri_io[20]}]
set_property PACKAGE_PIN D16 [get_ports {gpio_rtl_1_tri_io[21]}]
set_property PACKAGE_PIN D15 [get_ports {gpio_rtl_1_tri_io[22]}]
set_property PACKAGE_PIN C15 [get_ports {gpio_rtl_1_tri_io[23]}]
set_property PACKAGE_PIN B19 [get_ports {gpio_rtl_1_tri_io[24]}]
set_property PACKAGE_PIN A19 [get_ports {gpio_rtl_1_tri_io[25]}]
set_property PACKAGE_PIN A18 [get_ports {gpio_rtl_1_tri_io[26]}]
set_property PACKAGE_PIN B17 [get_ports {gpio_rtl_1_tri_io[27]}]
set_property PACKAGE_PIN A17 [get_ports {gpio_rtl_1_tri_io[28]}]
set_property PACKAGE_PIN B16 [get_ports {gpio_rtl_1_tri_io[29]}]
set_property PACKAGE_PIN A16 [get_ports {gpio_rtl_1_tri_io[30]}]
set_property PACKAGE_PIN B15 [get_ports {gpio_rtl_1_tri_io[31]}]
set_property PACKAGE_PIN M19 [get_ports {gpio_rtl_0_tri_io[0]}]
set_property PACKAGE_PIN L16 [get_ports {gpio_rtl_0_tri_io[1]}]
set_property PACKAGE_PIN K19 [get_ports {gpio_rtl_0_tri_io[2]}]
set_property PACKAGE_PIN K15 [get_ports {gpio_rtl_0_tri_io[3]}]
set_property PACKAGE_PIN G19 [get_ports {gpio_rtl_0_tri_io[4]}]
set_property PACKAGE_PIN J17 [get_ports {gpio_rtl_0_tri_io[5]}]

# base sram
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_addr_wrap[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_dq_io[31]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_ce_n_wrap[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_oen_wrap[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports emc_rtl_wen_wrap]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_ben_wrap[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_ben_wrap[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_ben_wrap[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {emc_rtl_ben_wrap[3]}]

set_property PACKAGE_PIN K20 [get_ports {emc_rtl_addr_wrap[0]}]
set_property PACKAGE_PIN J18 [get_ports {emc_rtl_addr_wrap[1]}]
set_property PACKAGE_PIN J20 [get_ports {emc_rtl_addr_wrap[2]}]
set_property PACKAGE_PIN H19 [get_ports {emc_rtl_addr_wrap[3]}]
set_property PACKAGE_PIN H20 [get_ports {emc_rtl_addr_wrap[4]}]
set_property PACKAGE_PIN R21 [get_ports {emc_rtl_addr_wrap[5]}]
set_property PACKAGE_PIN R20 [get_ports {emc_rtl_addr_wrap[6]}]
set_property PACKAGE_PIN R15 [get_ports {emc_rtl_addr_wrap[7]}]
set_property PACKAGE_PIN T16 [get_ports {emc_rtl_addr_wrap[8]}]
set_property PACKAGE_PIN T22 [get_ports {emc_rtl_addr_wrap[9]}]
set_property PACKAGE_PIN T21 [get_ports {emc_rtl_addr_wrap[10]}]
set_property PACKAGE_PIN U22 [get_ports {emc_rtl_addr_wrap[11]}]
set_property PACKAGE_PIN U21 [get_ports {emc_rtl_addr_wrap[12]}]
set_property PACKAGE_PIN V22 [get_ports {emc_rtl_addr_wrap[13]}]
set_property PACKAGE_PIN W22 [get_ports {emc_rtl_addr_wrap[14]}]
set_property PACKAGE_PIN G17 [get_ports {emc_rtl_addr_wrap[15]}]
set_property PACKAGE_PIN G20 [get_ports {emc_rtl_addr_wrap[16]}]
set_property PACKAGE_PIN G15 [get_ports {emc_rtl_addr_wrap[17]}]
set_property PACKAGE_PIN F19 [get_ports {emc_rtl_addr_wrap[18]}]
set_property PACKAGE_PIN E20 [get_ports {emc_rtl_addr_wrap[19]}]
set_property PACKAGE_PIN D22 [get_ports {emc_rtl_dq_io[0]}]
set_property PACKAGE_PIN D21 [get_ports {emc_rtl_dq_io[1]}]
set_property PACKAGE_PIN C22 [get_ports {emc_rtl_dq_io[2]}]
set_property PACKAGE_PIN B22 [get_ports {emc_rtl_dq_io[3]}]
set_property PACKAGE_PIN A22 [get_ports {emc_rtl_dq_io[4]}]
set_property PACKAGE_PIN B21 [get_ports {emc_rtl_dq_io[5]}]
set_property PACKAGE_PIN A21 [get_ports {emc_rtl_dq_io[6]}]
set_property PACKAGE_PIN B20 [get_ports {emc_rtl_dq_io[7]}]
set_property PACKAGE_PIN P21 [get_ports {emc_rtl_dq_io[8]}]
set_property PACKAGE_PIN P22 [get_ports {emc_rtl_dq_io[9]}]
set_property PACKAGE_PIN N22 [get_ports {emc_rtl_dq_io[10]}]
set_property PACKAGE_PIN M22 [get_ports {emc_rtl_dq_io[11]}]
set_property PACKAGE_PIN M21 [get_ports {emc_rtl_dq_io[12]}]
set_property PACKAGE_PIN L22 [get_ports {emc_rtl_dq_io[13]}]
set_property PACKAGE_PIN L21 [get_ports {emc_rtl_dq_io[14]}]
set_property PACKAGE_PIN K21 [get_ports {emc_rtl_dq_io[15]}]
set_property PACKAGE_PIN J22 [get_ports {emc_rtl_dq_io[16]}]
set_property PACKAGE_PIN J21 [get_ports {emc_rtl_dq_io[17]}]
set_property PACKAGE_PIN H22 [get_ports {emc_rtl_dq_io[18]}]
set_property PACKAGE_PIN G22 [get_ports {emc_rtl_dq_io[19]}]
set_property PACKAGE_PIN G21 [get_ports {emc_rtl_dq_io[20]}]
set_property PACKAGE_PIN F22 [get_ports {emc_rtl_dq_io[21]}]
set_property PACKAGE_PIN F21 [get_ports {emc_rtl_dq_io[22]}]
set_property PACKAGE_PIN E21 [get_ports {emc_rtl_dq_io[23]}]
set_property PACKAGE_PIN P15 [get_ports {emc_rtl_dq_io[24]}]
set_property PACKAGE_PIN P20 [get_ports {emc_rtl_dq_io[25]}]
set_property PACKAGE_PIN N18 [get_ports {emc_rtl_dq_io[26]}]
set_property PACKAGE_PIN P16 [get_ports {emc_rtl_dq_io[27]}]
set_property PACKAGE_PIN N15 [get_ports {emc_rtl_dq_io[28]}]
set_property PACKAGE_PIN M20 [get_ports {emc_rtl_dq_io[29]}]
set_property PACKAGE_PIN M17 [get_ports {emc_rtl_dq_io[30]}]
set_property PACKAGE_PIN M16 [get_ports {emc_rtl_dq_io[31]}]
set_property PACKAGE_PIN F17 [get_ports {emc_rtl_ce_n_wrap[0]}]
set_property PACKAGE_PIN V17 [get_ports {emc_rtl_oen_wrap[0]}]
set_property PACKAGE_PIN F18 [get_ports emc_rtl_wen_wrap]
set_property PACKAGE_PIN V19 [get_ports {emc_rtl_ben_wrap[0]}]
set_property PACKAGE_PIN W20 [get_ports {emc_rtl_ben_wrap[1]}]
set_property PACKAGE_PIN M15 [get_ports {emc_rtl_ben_wrap[2]}]
set_property PACKAGE_PIN L17 [get_ports {emc_rtl_ben_wrap[3]}]


# others
set_property IOSTANDARD LVCMOS33 [get_ports clk_out1]
set_property IOSTANDARD LVCMOS33 [get_ports clk_out2]

set_property IOSTANDARD LVCMOS33 [get_ports UART_1_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_1_txd]

set_property IOSTANDARD LVCMOS33 [get_ports SPI0_MOSI_O]
set_property IOSTANDARD LVCMOS33 [get_ports SPI0_SCLK_O]

set_property IOSTANDARD LVCMOS33 [get_ports {progb[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports initb]
set_property IOSTANDARD LVCMOS33 [get_ports done]


connect_debug_port u_ila_0/clk [get_nets [list LA/rx/rx0/rx0/CLK]]
connect_debug_port u_ila_0/probe0 [get_nets [list {LA/rx/rx0/rx_data[0]} {LA/rx/rx0/rx_data[1]} {LA/rx/rx0/rx_data[2]} {LA/rx/rx0/rx_data[3]} {LA/rx/rx0/rx_data[4]} {LA/rx/rx0/rx_data[5]} {LA/rx/rx0/rx_data[6]} {LA/rx/rx0/rx_data[7]} {LA/rx/rx0/rx_data[8]} {LA/rx/rx0/rx_data[9]} {LA/rx/rx0/rx_data[10]} {LA/rx/rx0/rx_data[11]} {LA/rx/rx0/rx_data[12]} {LA/rx/rx0/rx_data[13]} {LA/rx/rx0/rx_data[14]} {LA/rx/rx0/rx_data[15]} {LA/rx/rx0/rx_data[16]} {LA/rx/rx0/rx_data[17]} {LA/rx/rx0/rx_data[18]} {LA/rx/rx0/rx_data[19]} {LA/rx/rx0/rx_data[20]} {LA/rx/rx0/rx_data[21]} {LA/rx/rx0/rx_data[22]} {LA/rx/rx0/rx_data[23]} {LA/rx/rx0/rx_data[24]} {LA/rx/rx0/rx_data[25]} {LA/rx/rx0/rx_data[26]} {LA/rx/rx0/rx_data[27]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {LA/rx/rx0/rx_mmcm_lckdpsbs[0]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list LA/rx/dummy]]
connect_debug_port u_ila_0/probe3 [get_nets [list LA/rx/rx0/rx_mmcm_lckd]]
connect_debug_port u_ila_0/probe4 [get_nets [list LA/rx/rx0/rx_mmcm_lckdps]]
connect_debug_port u_ila_0/probe5 [get_nets [list LA/rx/rx0/reset]]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_CLK]

connect_debug_port u_ila_0/clk [get_nets [list LA/inst/rx/rx0/rx0/rx_pixel_clk]]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_rx_pixel_clk]

connect_debug_port dbg_hub/clk [get_nets u_ila_0_CLK]

connect_debug_port u_ila_0/probe1 [get_nets [list {LApack/selector[4]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list LA/inst/rx/rx0/rx0/CLK]]
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe0]
set_property port_width 51 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {acq_data_out[0]} {acq_data_out[1]} {acq_data_out[2]} {acq_data_out[3]} {acq_data_out[4]} {acq_data_out[5]} {acq_data_out[6]} {acq_data_out[7]} {acq_data_out[8]} {acq_data_out[9]} {acq_data_out[10]} {acq_data_out[11]} {acq_data_out[12]} {acq_data_out[13]} {acq_data_out[14]} {acq_data_out[15]} {acq_data_out[16]} {acq_data_out[17]} {acq_data_out[18]} {acq_data_out[19]} {acq_data_out[20]} {acq_data_out[21]} {acq_data_out[22]} {acq_data_out[23]} {acq_data_out[24]} {acq_data_out[25]} {acq_data_out[26]} {acq_data_out[27]} {acq_data_out[28]} {acq_data_out[29]} {acq_data_out[30]} {acq_data_out[31]} {acq_data_out[32]} {acq_data_out[33]} {acq_data_out[34]} {acq_data_out[35]} {acq_data_out[36]} {acq_data_out[37]} {acq_data_out[38]} {acq_data_out[39]} {acq_data_out[40]} {acq_data_out[41]} {acq_data_out[42]} {acq_data_out[43]} {acq_data_out[44]} {acq_data_out[45]} {acq_data_out[46]} {acq_data_out[47]} {acq_data_out[48]} {acq_data_out[49]} {acq_data_out[50]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list acq_data_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list LApack/la_overflow]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list LApack/la_storage_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list received_update]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list LApack/la_storage_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list LApack/la_storage_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list LApack/ctl_storage_enable_sync]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets la_fifo_aclk]
