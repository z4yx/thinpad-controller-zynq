
#CPLD
set_property -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS33} [get_ports cpld_emu_wrn]
set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33} [get_ports cpld_emu_rdn]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS33} [get_ports cpld_emu_tbre]
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports cpld_emu_tsre]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports cpld_emu_dataready]

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
