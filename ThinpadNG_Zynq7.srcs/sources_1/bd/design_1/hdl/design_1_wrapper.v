//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Sat Sep  7 20:27:27 2019
//Host        : nuc6i7 running 64-bit Ubuntu 19.04
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    SPI0_MOSI_O,
    SPI0_SCLK_O,
    UART_1_rxd,
    UART_1_txd,
    UART_CPLD_baudoutn,
    UART_CPLD_ctsn,
    UART_CPLD_dcdn,
    UART_CPLD_ddis,
    UART_CPLD_dsrn,
    UART_CPLD_dtrn,
    UART_CPLD_out1n,
    UART_CPLD_out2n,
    UART_CPLD_ri,
    UART_CPLD_rtsn,
    UART_CPLD_rxd,
    UART_CPLD_rxrdyn,
    UART_CPLD_txd,
    UART_CPLD_txrdyn,
    bus_analyze_axis_tdata,
    bus_analyze_axis_tlast,
    bus_analyze_axis_tready,
    bus_analyze_axis_tvalid,
    bus_analyze_clk,
    bus_analyze_rst_n,
    clk_out1,
    clk_out2,
    clk_serdes,
    done,
    emc_rtl_addr,
    emc_rtl_ben,
    emc_rtl_ce_n,
    emc_rtl_dq_i,
    emc_rtl_dq_o,
    emc_rtl_dq_t,
    emc_rtl_oen,
    emc_rtl_wen,
    gpio_rtl_0_tri_io,
    gpio_sw_i,
    gpio_sw_o,
    gpio_sw_t,
    initb,
    la_fifo_aclk,
    la_fifo_aresetn,
    la_rst_n,
    la_storage_axis_tdata,
    la_storage_axis_tlast,
    la_storage_axis_tready,
    la_storage_axis_tvalid,
    led_in,
    port2reg,
    pp_csel,
    pp_data_i,
    pp_data_o,
    pp_data_t,
    pp_nrst,
    pp_rd,
    pp_rs,
    pp_wr,
    progb,
    ps_perph_rstn,
    reg2port,
    tap_tck_0,
    tap_tdi_0,
    tap_tdo_0,
    tap_tms_0,
    vid_axis_rst_n,
    vid_axis_tdata,
    vid_axis_tlast,
    vid_axis_tready,
    vid_axis_tuser,
    vid_axis_tvalid,
    vid_fifo_count,
    vid_in_clk,
    vid_overflow,
    vid_timing_in_active_video,
    vid_timing_in_hsync,
    vid_timing_in_vsync,
    vtc_locked);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output SPI0_MOSI_O;
  output SPI0_SCLK_O;
  input UART_1_rxd;
  output UART_1_txd;
  output UART_CPLD_baudoutn;
  input UART_CPLD_ctsn;
  input UART_CPLD_dcdn;
  output UART_CPLD_ddis;
  input UART_CPLD_dsrn;
  output UART_CPLD_dtrn;
  output UART_CPLD_out1n;
  output UART_CPLD_out2n;
  input UART_CPLD_ri;
  output UART_CPLD_rtsn;
  input UART_CPLD_rxd;
  output UART_CPLD_rxrdyn;
  output UART_CPLD_txd;
  output UART_CPLD_txrdyn;
  input [127:0]bus_analyze_axis_tdata;
  input bus_analyze_axis_tlast;
  output bus_analyze_axis_tready;
  input bus_analyze_axis_tvalid;
  output bus_analyze_clk;
  output [0:0]bus_analyze_rst_n;
  output clk_out1;
  output clk_out2;
  output clk_serdes;
  input done;
  output [31:0]emc_rtl_addr;
  output [3:0]emc_rtl_ben;
  output [0:0]emc_rtl_ce_n;
  input [31:0]emc_rtl_dq_i;
  output [31:0]emc_rtl_dq_o;
  output [31:0]emc_rtl_dq_t;
  output [0:0]emc_rtl_oen;
  output emc_rtl_wen;
  inout [5:0]gpio_rtl_0_tri_io;
  input [31:0]gpio_sw_i;
  output [31:0]gpio_sw_o;
  output [31:0]gpio_sw_t;
  input initb;
  input la_fifo_aclk;
  input la_fifo_aresetn;
  output [0:0]la_rst_n;
  input [255:0]la_storage_axis_tdata;
  input la_storage_axis_tlast;
  output la_storage_axis_tready;
  input la_storage_axis_tvalid;
  input [31:0]led_in;
  input [287:0]port2reg;
  output pp_csel;
  input [23:0]pp_data_i;
  output [23:0]pp_data_o;
  output [23:0]pp_data_t;
  output pp_nrst;
  output pp_rd;
  output pp_rs;
  output pp_wr;
  output [0:0]progb;
  output [0:0]ps_perph_rstn;
  output [127:0]reg2port;
  output tap_tck_0;
  output tap_tdi_0;
  input tap_tdo_0;
  output tap_tms_0;
  input vid_axis_rst_n;
  input [7:0]vid_axis_tdata;
  input vid_axis_tlast;
  output vid_axis_tready;
  input [0:0]vid_axis_tuser;
  input vid_axis_tvalid;
  output [9:0]vid_fifo_count;
  input vid_in_clk;
  output vid_overflow;
  input vid_timing_in_active_video;
  input vid_timing_in_hsync;
  input vid_timing_in_vsync;
  output [0:0]vtc_locked;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire SPI0_MOSI_O;
  wire SPI0_SCLK_O;
  wire UART_1_rxd;
  wire UART_1_txd;
  wire UART_CPLD_baudoutn;
  wire UART_CPLD_ctsn;
  wire UART_CPLD_dcdn;
  wire UART_CPLD_ddis;
  wire UART_CPLD_dsrn;
  wire UART_CPLD_dtrn;
  wire UART_CPLD_out1n;
  wire UART_CPLD_out2n;
  wire UART_CPLD_ri;
  wire UART_CPLD_rtsn;
  wire UART_CPLD_rxd;
  wire UART_CPLD_rxrdyn;
  wire UART_CPLD_txd;
  wire UART_CPLD_txrdyn;
  wire [127:0]bus_analyze_axis_tdata;
  wire bus_analyze_axis_tlast;
  wire bus_analyze_axis_tready;
  wire bus_analyze_axis_tvalid;
  wire bus_analyze_clk;
  wire [0:0]bus_analyze_rst_n;
  wire clk_out1;
  wire clk_out2;
  wire clk_serdes;
  wire done;
  wire [31:0]emc_rtl_addr;
  wire [3:0]emc_rtl_ben;
  wire [0:0]emc_rtl_ce_n;
  wire [31:0]emc_rtl_dq_i;
  wire [31:0]emc_rtl_dq_o;
  wire [31:0]emc_rtl_dq_t;
  wire [0:0]emc_rtl_oen;
  wire emc_rtl_wen;
  wire [0:0]gpio_rtl_0_tri_i_0;
  wire [1:1]gpio_rtl_0_tri_i_1;
  wire [2:2]gpio_rtl_0_tri_i_2;
  wire [3:3]gpio_rtl_0_tri_i_3;
  wire [4:4]gpio_rtl_0_tri_i_4;
  wire [5:5]gpio_rtl_0_tri_i_5;
  wire [0:0]gpio_rtl_0_tri_io_0;
  wire [1:1]gpio_rtl_0_tri_io_1;
  wire [2:2]gpio_rtl_0_tri_io_2;
  wire [3:3]gpio_rtl_0_tri_io_3;
  wire [4:4]gpio_rtl_0_tri_io_4;
  wire [5:5]gpio_rtl_0_tri_io_5;
  wire [0:0]gpio_rtl_0_tri_o_0;
  wire [1:1]gpio_rtl_0_tri_o_1;
  wire [2:2]gpio_rtl_0_tri_o_2;
  wire [3:3]gpio_rtl_0_tri_o_3;
  wire [4:4]gpio_rtl_0_tri_o_4;
  wire [5:5]gpio_rtl_0_tri_o_5;
  wire [0:0]gpio_rtl_0_tri_t_0;
  wire [1:1]gpio_rtl_0_tri_t_1;
  wire [2:2]gpio_rtl_0_tri_t_2;
  wire [3:3]gpio_rtl_0_tri_t_3;
  wire [4:4]gpio_rtl_0_tri_t_4;
  wire [5:5]gpio_rtl_0_tri_t_5;
  wire [31:0]gpio_sw_i;
  wire [31:0]gpio_sw_o;
  wire [31:0]gpio_sw_t;
  wire initb;
  wire la_fifo_aclk;
  wire la_fifo_aresetn;
  wire [0:0]la_rst_n;
  wire [255:0]la_storage_axis_tdata;
  wire la_storage_axis_tlast;
  wire la_storage_axis_tready;
  wire la_storage_axis_tvalid;
  wire [31:0]led_in;
  wire [287:0]port2reg;
  wire pp_csel;
  wire [23:0]pp_data_i;
  wire [23:0]pp_data_o;
  wire [23:0]pp_data_t;
  wire pp_nrst;
  wire pp_rd;
  wire pp_rs;
  wire pp_wr;
  wire [0:0]progb;
  wire [0:0]ps_perph_rstn;
  wire [127:0]reg2port;
  wire tap_tck_0;
  wire tap_tdi_0;
  wire tap_tdo_0;
  wire tap_tms_0;
  wire vid_axis_rst_n;
  wire [7:0]vid_axis_tdata;
  wire vid_axis_tlast;
  wire vid_axis_tready;
  wire [0:0]vid_axis_tuser;
  wire vid_axis_tvalid;
  wire [9:0]vid_fifo_count;
  wire vid_in_clk;
  wire vid_overflow;
  wire vid_timing_in_active_video;
  wire vid_timing_in_hsync;
  wire vid_timing_in_vsync;
  wire [0:0]vtc_locked;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .SPI0_MOSI_O(SPI0_MOSI_O),
        .SPI0_SCLK_O(SPI0_SCLK_O),
        .UART_1_rxd(UART_1_rxd),
        .UART_1_txd(UART_1_txd),
        .UART_CPLD_baudoutn(UART_CPLD_baudoutn),
        .UART_CPLD_ctsn(UART_CPLD_ctsn),
        .UART_CPLD_dcdn(UART_CPLD_dcdn),
        .UART_CPLD_ddis(UART_CPLD_ddis),
        .UART_CPLD_dsrn(UART_CPLD_dsrn),
        .UART_CPLD_dtrn(UART_CPLD_dtrn),
        .UART_CPLD_out1n(UART_CPLD_out1n),
        .UART_CPLD_out2n(UART_CPLD_out2n),
        .UART_CPLD_ri(UART_CPLD_ri),
        .UART_CPLD_rtsn(UART_CPLD_rtsn),
        .UART_CPLD_rxd(UART_CPLD_rxd),
        .UART_CPLD_rxrdyn(UART_CPLD_rxrdyn),
        .UART_CPLD_txd(UART_CPLD_txd),
        .UART_CPLD_txrdyn(UART_CPLD_txrdyn),
        .bus_analyze_axis_tdata(bus_analyze_axis_tdata),
        .bus_analyze_axis_tlast(bus_analyze_axis_tlast),
        .bus_analyze_axis_tready(bus_analyze_axis_tready),
        .bus_analyze_axis_tvalid(bus_analyze_axis_tvalid),
        .bus_analyze_clk(bus_analyze_clk),
        .bus_analyze_rst_n(bus_analyze_rst_n),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
        .clk_serdes(clk_serdes),
        .done(done),
        .emc_rtl_addr(emc_rtl_addr),
        .emc_rtl_ben(emc_rtl_ben),
        .emc_rtl_ce_n(emc_rtl_ce_n),
        .emc_rtl_dq_i(emc_rtl_dq_i),
        .emc_rtl_dq_o(emc_rtl_dq_o),
        .emc_rtl_dq_t(emc_rtl_dq_t),
        .emc_rtl_oen(emc_rtl_oen),
        .emc_rtl_wen(emc_rtl_wen),
        .gpio_rtl_0_tri_i({gpio_rtl_0_tri_i_5,gpio_rtl_0_tri_i_4,gpio_rtl_0_tri_i_3,gpio_rtl_0_tri_i_2,gpio_rtl_0_tri_i_1,gpio_rtl_0_tri_i_0}),
        .gpio_rtl_0_tri_o({gpio_rtl_0_tri_o_5,gpio_rtl_0_tri_o_4,gpio_rtl_0_tri_o_3,gpio_rtl_0_tri_o_2,gpio_rtl_0_tri_o_1,gpio_rtl_0_tri_o_0}),
        .gpio_rtl_0_tri_t({gpio_rtl_0_tri_t_5,gpio_rtl_0_tri_t_4,gpio_rtl_0_tri_t_3,gpio_rtl_0_tri_t_2,gpio_rtl_0_tri_t_1,gpio_rtl_0_tri_t_0}),
        .gpio_sw_i(gpio_sw_i),
        .gpio_sw_o(gpio_sw_o),
        .gpio_sw_t(gpio_sw_t),
        .initb(initb),
        .la_fifo_aclk(la_fifo_aclk),
        .la_fifo_aresetn(la_fifo_aresetn),
        .la_rst_n(la_rst_n),
        .la_storage_axis_tdata(la_storage_axis_tdata),
        .la_storage_axis_tlast(la_storage_axis_tlast),
        .la_storage_axis_tready(la_storage_axis_tready),
        .la_storage_axis_tvalid(la_storage_axis_tvalid),
        .led_in(led_in),
        .port2reg(port2reg),
        .pp_csel(pp_csel),
        .pp_data_i(pp_data_i),
        .pp_data_o(pp_data_o),
        .pp_data_t(pp_data_t),
        .pp_nrst(pp_nrst),
        .pp_rd(pp_rd),
        .pp_rs(pp_rs),
        .pp_wr(pp_wr),
        .progb(progb),
        .ps_perph_rstn(ps_perph_rstn),
        .reg2port(reg2port),
        .tap_tck_0(tap_tck_0),
        .tap_tdi_0(tap_tdi_0),
        .tap_tdo_0(tap_tdo_0),
        .tap_tms_0(tap_tms_0),
        .vid_axis_rst_n(vid_axis_rst_n),
        .vid_axis_tdata(vid_axis_tdata),
        .vid_axis_tlast(vid_axis_tlast),
        .vid_axis_tready(vid_axis_tready),
        .vid_axis_tuser(vid_axis_tuser),
        .vid_axis_tvalid(vid_axis_tvalid),
        .vid_fifo_count(vid_fifo_count),
        .vid_in_clk(vid_in_clk),
        .vid_overflow(vid_overflow),
        .vid_timing_in_active_video(vid_timing_in_active_video),
        .vid_timing_in_hsync(vid_timing_in_hsync),
        .vid_timing_in_vsync(vid_timing_in_vsync),
        .vtc_locked(vtc_locked));
  IOBUF gpio_rtl_0_tri_iobuf_0
       (.I(gpio_rtl_0_tri_o_0),
        .IO(gpio_rtl_0_tri_io[0]),
        .O(gpio_rtl_0_tri_i_0),
        .T(gpio_rtl_0_tri_t_0));
  IOBUF gpio_rtl_0_tri_iobuf_1
       (.I(gpio_rtl_0_tri_o_1),
        .IO(gpio_rtl_0_tri_io[1]),
        .O(gpio_rtl_0_tri_i_1),
        .T(gpio_rtl_0_tri_t_1));
  IOBUF gpio_rtl_0_tri_iobuf_2
       (.I(gpio_rtl_0_tri_o_2),
        .IO(gpio_rtl_0_tri_io[2]),
        .O(gpio_rtl_0_tri_i_2),
        .T(gpio_rtl_0_tri_t_2));
  IOBUF gpio_rtl_0_tri_iobuf_3
       (.I(gpio_rtl_0_tri_o_3),
        .IO(gpio_rtl_0_tri_io[3]),
        .O(gpio_rtl_0_tri_i_3),
        .T(gpio_rtl_0_tri_t_3));
  IOBUF gpio_rtl_0_tri_iobuf_4
       (.I(gpio_rtl_0_tri_o_4),
        .IO(gpio_rtl_0_tri_io[4]),
        .O(gpio_rtl_0_tri_i_4),
        .T(gpio_rtl_0_tri_t_4));
  IOBUF gpio_rtl_0_tri_iobuf_5
       (.I(gpio_rtl_0_tri_o_5),
        .IO(gpio_rtl_0_tri_io[5]),
        .O(gpio_rtl_0_tri_i_5),
        .T(gpio_rtl_0_tri_t_5));
endmodule
