//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
//Date        : Tue May  2 15:05:36 2017
//Host        : skyworks running 64-bit Ubuntu 16.04.2 LTS
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
    bus_analyze_axis_tdata,
    bus_analyze_axis_tlast,
    bus_analyze_axis_tready,
    bus_analyze_axis_tvalid,
    bus_analyze_clk,
    bus_analyze_rst_n,
    clk_out1,
    clk_out2,
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
    gpio_rtl_1_tri_io,
    gpio_rtl_tri_io,
    initb,
    progb,
    reg2port,
    rxd_232,
    txd_232);
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
  input [31:0]bus_analyze_axis_tdata;
  input bus_analyze_axis_tlast;
  output bus_analyze_axis_tready;
  input bus_analyze_axis_tvalid;
  output bus_analyze_clk;
  output [0:0]bus_analyze_rst_n;
  output clk_out1;
  output clk_out2;
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
  inout [31:0]gpio_rtl_1_tri_io;
  inout [31:0]gpio_rtl_tri_io;
  input initb;
  output [0:0]progb;
  output [127:0]reg2port;
  input rxd_232;
  output txd_232;

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
  wire [31:0]bus_analyze_axis_tdata;
  wire bus_analyze_axis_tlast;
  wire bus_analyze_axis_tready;
  wire bus_analyze_axis_tvalid;
  wire bus_analyze_clk;
  wire [0:0]bus_analyze_rst_n;
  wire clk_out1;
  wire clk_out2;
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
  wire [0:0]gpio_rtl_1_tri_i_0;
  wire [1:1]gpio_rtl_1_tri_i_1;
  wire [10:10]gpio_rtl_1_tri_i_10;
  wire [11:11]gpio_rtl_1_tri_i_11;
  wire [12:12]gpio_rtl_1_tri_i_12;
  wire [13:13]gpio_rtl_1_tri_i_13;
  wire [14:14]gpio_rtl_1_tri_i_14;
  wire [15:15]gpio_rtl_1_tri_i_15;
  wire [16:16]gpio_rtl_1_tri_i_16;
  wire [17:17]gpio_rtl_1_tri_i_17;
  wire [18:18]gpio_rtl_1_tri_i_18;
  wire [19:19]gpio_rtl_1_tri_i_19;
  wire [2:2]gpio_rtl_1_tri_i_2;
  wire [20:20]gpio_rtl_1_tri_i_20;
  wire [21:21]gpio_rtl_1_tri_i_21;
  wire [22:22]gpio_rtl_1_tri_i_22;
  wire [23:23]gpio_rtl_1_tri_i_23;
  wire [24:24]gpio_rtl_1_tri_i_24;
  wire [25:25]gpio_rtl_1_tri_i_25;
  wire [26:26]gpio_rtl_1_tri_i_26;
  wire [27:27]gpio_rtl_1_tri_i_27;
  wire [28:28]gpio_rtl_1_tri_i_28;
  wire [29:29]gpio_rtl_1_tri_i_29;
  wire [3:3]gpio_rtl_1_tri_i_3;
  wire [30:30]gpio_rtl_1_tri_i_30;
  wire [31:31]gpio_rtl_1_tri_i_31;
  wire [4:4]gpio_rtl_1_tri_i_4;
  wire [5:5]gpio_rtl_1_tri_i_5;
  wire [6:6]gpio_rtl_1_tri_i_6;
  wire [7:7]gpio_rtl_1_tri_i_7;
  wire [8:8]gpio_rtl_1_tri_i_8;
  wire [9:9]gpio_rtl_1_tri_i_9;
  wire [0:0]gpio_rtl_1_tri_io_0;
  wire [1:1]gpio_rtl_1_tri_io_1;
  wire [10:10]gpio_rtl_1_tri_io_10;
  wire [11:11]gpio_rtl_1_tri_io_11;
  wire [12:12]gpio_rtl_1_tri_io_12;
  wire [13:13]gpio_rtl_1_tri_io_13;
  wire [14:14]gpio_rtl_1_tri_io_14;
  wire [15:15]gpio_rtl_1_tri_io_15;
  wire [16:16]gpio_rtl_1_tri_io_16;
  wire [17:17]gpio_rtl_1_tri_io_17;
  wire [18:18]gpio_rtl_1_tri_io_18;
  wire [19:19]gpio_rtl_1_tri_io_19;
  wire [2:2]gpio_rtl_1_tri_io_2;
  wire [20:20]gpio_rtl_1_tri_io_20;
  wire [21:21]gpio_rtl_1_tri_io_21;
  wire [22:22]gpio_rtl_1_tri_io_22;
  wire [23:23]gpio_rtl_1_tri_io_23;
  wire [24:24]gpio_rtl_1_tri_io_24;
  wire [25:25]gpio_rtl_1_tri_io_25;
  wire [26:26]gpio_rtl_1_tri_io_26;
  wire [27:27]gpio_rtl_1_tri_io_27;
  wire [28:28]gpio_rtl_1_tri_io_28;
  wire [29:29]gpio_rtl_1_tri_io_29;
  wire [3:3]gpio_rtl_1_tri_io_3;
  wire [30:30]gpio_rtl_1_tri_io_30;
  wire [31:31]gpio_rtl_1_tri_io_31;
  wire [4:4]gpio_rtl_1_tri_io_4;
  wire [5:5]gpio_rtl_1_tri_io_5;
  wire [6:6]gpio_rtl_1_tri_io_6;
  wire [7:7]gpio_rtl_1_tri_io_7;
  wire [8:8]gpio_rtl_1_tri_io_8;
  wire [9:9]gpio_rtl_1_tri_io_9;
  wire [0:0]gpio_rtl_1_tri_o_0;
  wire [1:1]gpio_rtl_1_tri_o_1;
  wire [10:10]gpio_rtl_1_tri_o_10;
  wire [11:11]gpio_rtl_1_tri_o_11;
  wire [12:12]gpio_rtl_1_tri_o_12;
  wire [13:13]gpio_rtl_1_tri_o_13;
  wire [14:14]gpio_rtl_1_tri_o_14;
  wire [15:15]gpio_rtl_1_tri_o_15;
  wire [16:16]gpio_rtl_1_tri_o_16;
  wire [17:17]gpio_rtl_1_tri_o_17;
  wire [18:18]gpio_rtl_1_tri_o_18;
  wire [19:19]gpio_rtl_1_tri_o_19;
  wire [2:2]gpio_rtl_1_tri_o_2;
  wire [20:20]gpio_rtl_1_tri_o_20;
  wire [21:21]gpio_rtl_1_tri_o_21;
  wire [22:22]gpio_rtl_1_tri_o_22;
  wire [23:23]gpio_rtl_1_tri_o_23;
  wire [24:24]gpio_rtl_1_tri_o_24;
  wire [25:25]gpio_rtl_1_tri_o_25;
  wire [26:26]gpio_rtl_1_tri_o_26;
  wire [27:27]gpio_rtl_1_tri_o_27;
  wire [28:28]gpio_rtl_1_tri_o_28;
  wire [29:29]gpio_rtl_1_tri_o_29;
  wire [3:3]gpio_rtl_1_tri_o_3;
  wire [30:30]gpio_rtl_1_tri_o_30;
  wire [31:31]gpio_rtl_1_tri_o_31;
  wire [4:4]gpio_rtl_1_tri_o_4;
  wire [5:5]gpio_rtl_1_tri_o_5;
  wire [6:6]gpio_rtl_1_tri_o_6;
  wire [7:7]gpio_rtl_1_tri_o_7;
  wire [8:8]gpio_rtl_1_tri_o_8;
  wire [9:9]gpio_rtl_1_tri_o_9;
  wire [0:0]gpio_rtl_1_tri_t_0;
  wire [1:1]gpio_rtl_1_tri_t_1;
  wire [10:10]gpio_rtl_1_tri_t_10;
  wire [11:11]gpio_rtl_1_tri_t_11;
  wire [12:12]gpio_rtl_1_tri_t_12;
  wire [13:13]gpio_rtl_1_tri_t_13;
  wire [14:14]gpio_rtl_1_tri_t_14;
  wire [15:15]gpio_rtl_1_tri_t_15;
  wire [16:16]gpio_rtl_1_tri_t_16;
  wire [17:17]gpio_rtl_1_tri_t_17;
  wire [18:18]gpio_rtl_1_tri_t_18;
  wire [19:19]gpio_rtl_1_tri_t_19;
  wire [2:2]gpio_rtl_1_tri_t_2;
  wire [20:20]gpio_rtl_1_tri_t_20;
  wire [21:21]gpio_rtl_1_tri_t_21;
  wire [22:22]gpio_rtl_1_tri_t_22;
  wire [23:23]gpio_rtl_1_tri_t_23;
  wire [24:24]gpio_rtl_1_tri_t_24;
  wire [25:25]gpio_rtl_1_tri_t_25;
  wire [26:26]gpio_rtl_1_tri_t_26;
  wire [27:27]gpio_rtl_1_tri_t_27;
  wire [28:28]gpio_rtl_1_tri_t_28;
  wire [29:29]gpio_rtl_1_tri_t_29;
  wire [3:3]gpio_rtl_1_tri_t_3;
  wire [30:30]gpio_rtl_1_tri_t_30;
  wire [31:31]gpio_rtl_1_tri_t_31;
  wire [4:4]gpio_rtl_1_tri_t_4;
  wire [5:5]gpio_rtl_1_tri_t_5;
  wire [6:6]gpio_rtl_1_tri_t_6;
  wire [7:7]gpio_rtl_1_tri_t_7;
  wire [8:8]gpio_rtl_1_tri_t_8;
  wire [9:9]gpio_rtl_1_tri_t_9;
  wire [0:0]gpio_rtl_tri_i_0;
  wire [1:1]gpio_rtl_tri_i_1;
  wire [10:10]gpio_rtl_tri_i_10;
  wire [11:11]gpio_rtl_tri_i_11;
  wire [12:12]gpio_rtl_tri_i_12;
  wire [13:13]gpio_rtl_tri_i_13;
  wire [14:14]gpio_rtl_tri_i_14;
  wire [15:15]gpio_rtl_tri_i_15;
  wire [16:16]gpio_rtl_tri_i_16;
  wire [17:17]gpio_rtl_tri_i_17;
  wire [18:18]gpio_rtl_tri_i_18;
  wire [19:19]gpio_rtl_tri_i_19;
  wire [2:2]gpio_rtl_tri_i_2;
  wire [20:20]gpio_rtl_tri_i_20;
  wire [21:21]gpio_rtl_tri_i_21;
  wire [22:22]gpio_rtl_tri_i_22;
  wire [23:23]gpio_rtl_tri_i_23;
  wire [24:24]gpio_rtl_tri_i_24;
  wire [25:25]gpio_rtl_tri_i_25;
  wire [26:26]gpio_rtl_tri_i_26;
  wire [27:27]gpio_rtl_tri_i_27;
  wire [28:28]gpio_rtl_tri_i_28;
  wire [29:29]gpio_rtl_tri_i_29;
  wire [3:3]gpio_rtl_tri_i_3;
  wire [30:30]gpio_rtl_tri_i_30;
  wire [31:31]gpio_rtl_tri_i_31;
  wire [4:4]gpio_rtl_tri_i_4;
  wire [5:5]gpio_rtl_tri_i_5;
  wire [6:6]gpio_rtl_tri_i_6;
  wire [7:7]gpio_rtl_tri_i_7;
  wire [8:8]gpio_rtl_tri_i_8;
  wire [9:9]gpio_rtl_tri_i_9;
  wire [0:0]gpio_rtl_tri_io_0;
  wire [1:1]gpio_rtl_tri_io_1;
  wire [10:10]gpio_rtl_tri_io_10;
  wire [11:11]gpio_rtl_tri_io_11;
  wire [12:12]gpio_rtl_tri_io_12;
  wire [13:13]gpio_rtl_tri_io_13;
  wire [14:14]gpio_rtl_tri_io_14;
  wire [15:15]gpio_rtl_tri_io_15;
  wire [16:16]gpio_rtl_tri_io_16;
  wire [17:17]gpio_rtl_tri_io_17;
  wire [18:18]gpio_rtl_tri_io_18;
  wire [19:19]gpio_rtl_tri_io_19;
  wire [2:2]gpio_rtl_tri_io_2;
  wire [20:20]gpio_rtl_tri_io_20;
  wire [21:21]gpio_rtl_tri_io_21;
  wire [22:22]gpio_rtl_tri_io_22;
  wire [23:23]gpio_rtl_tri_io_23;
  wire [24:24]gpio_rtl_tri_io_24;
  wire [25:25]gpio_rtl_tri_io_25;
  wire [26:26]gpio_rtl_tri_io_26;
  wire [27:27]gpio_rtl_tri_io_27;
  wire [28:28]gpio_rtl_tri_io_28;
  wire [29:29]gpio_rtl_tri_io_29;
  wire [3:3]gpio_rtl_tri_io_3;
  wire [30:30]gpio_rtl_tri_io_30;
  wire [31:31]gpio_rtl_tri_io_31;
  wire [4:4]gpio_rtl_tri_io_4;
  wire [5:5]gpio_rtl_tri_io_5;
  wire [6:6]gpio_rtl_tri_io_6;
  wire [7:7]gpio_rtl_tri_io_7;
  wire [8:8]gpio_rtl_tri_io_8;
  wire [9:9]gpio_rtl_tri_io_9;
  wire [0:0]gpio_rtl_tri_o_0;
  wire [1:1]gpio_rtl_tri_o_1;
  wire [10:10]gpio_rtl_tri_o_10;
  wire [11:11]gpio_rtl_tri_o_11;
  wire [12:12]gpio_rtl_tri_o_12;
  wire [13:13]gpio_rtl_tri_o_13;
  wire [14:14]gpio_rtl_tri_o_14;
  wire [15:15]gpio_rtl_tri_o_15;
  wire [16:16]gpio_rtl_tri_o_16;
  wire [17:17]gpio_rtl_tri_o_17;
  wire [18:18]gpio_rtl_tri_o_18;
  wire [19:19]gpio_rtl_tri_o_19;
  wire [2:2]gpio_rtl_tri_o_2;
  wire [20:20]gpio_rtl_tri_o_20;
  wire [21:21]gpio_rtl_tri_o_21;
  wire [22:22]gpio_rtl_tri_o_22;
  wire [23:23]gpio_rtl_tri_o_23;
  wire [24:24]gpio_rtl_tri_o_24;
  wire [25:25]gpio_rtl_tri_o_25;
  wire [26:26]gpio_rtl_tri_o_26;
  wire [27:27]gpio_rtl_tri_o_27;
  wire [28:28]gpio_rtl_tri_o_28;
  wire [29:29]gpio_rtl_tri_o_29;
  wire [3:3]gpio_rtl_tri_o_3;
  wire [30:30]gpio_rtl_tri_o_30;
  wire [31:31]gpio_rtl_tri_o_31;
  wire [4:4]gpio_rtl_tri_o_4;
  wire [5:5]gpio_rtl_tri_o_5;
  wire [6:6]gpio_rtl_tri_o_6;
  wire [7:7]gpio_rtl_tri_o_7;
  wire [8:8]gpio_rtl_tri_o_8;
  wire [9:9]gpio_rtl_tri_o_9;
  wire [0:0]gpio_rtl_tri_t_0;
  wire [1:1]gpio_rtl_tri_t_1;
  wire [10:10]gpio_rtl_tri_t_10;
  wire [11:11]gpio_rtl_tri_t_11;
  wire [12:12]gpio_rtl_tri_t_12;
  wire [13:13]gpio_rtl_tri_t_13;
  wire [14:14]gpio_rtl_tri_t_14;
  wire [15:15]gpio_rtl_tri_t_15;
  wire [16:16]gpio_rtl_tri_t_16;
  wire [17:17]gpio_rtl_tri_t_17;
  wire [18:18]gpio_rtl_tri_t_18;
  wire [19:19]gpio_rtl_tri_t_19;
  wire [2:2]gpio_rtl_tri_t_2;
  wire [20:20]gpio_rtl_tri_t_20;
  wire [21:21]gpio_rtl_tri_t_21;
  wire [22:22]gpio_rtl_tri_t_22;
  wire [23:23]gpio_rtl_tri_t_23;
  wire [24:24]gpio_rtl_tri_t_24;
  wire [25:25]gpio_rtl_tri_t_25;
  wire [26:26]gpio_rtl_tri_t_26;
  wire [27:27]gpio_rtl_tri_t_27;
  wire [28:28]gpio_rtl_tri_t_28;
  wire [29:29]gpio_rtl_tri_t_29;
  wire [3:3]gpio_rtl_tri_t_3;
  wire [30:30]gpio_rtl_tri_t_30;
  wire [31:31]gpio_rtl_tri_t_31;
  wire [4:4]gpio_rtl_tri_t_4;
  wire [5:5]gpio_rtl_tri_t_5;
  wire [6:6]gpio_rtl_tri_t_6;
  wire [7:7]gpio_rtl_tri_t_7;
  wire [8:8]gpio_rtl_tri_t_8;
  wire [9:9]gpio_rtl_tri_t_9;
  wire initb;
  wire [0:0]progb;
  wire [127:0]reg2port;
  wire rxd_232;
  wire txd_232;

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
        .bus_analyze_axis_tdata(bus_analyze_axis_tdata),
        .bus_analyze_axis_tlast(bus_analyze_axis_tlast),
        .bus_analyze_axis_tready(bus_analyze_axis_tready),
        .bus_analyze_axis_tvalid(bus_analyze_axis_tvalid),
        .bus_analyze_clk(bus_analyze_clk),
        .bus_analyze_rst_n(bus_analyze_rst_n),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
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
        .gpio_rtl_1_tri_i({gpio_rtl_1_tri_i_31,gpio_rtl_1_tri_i_30,gpio_rtl_1_tri_i_29,gpio_rtl_1_tri_i_28,gpio_rtl_1_tri_i_27,gpio_rtl_1_tri_i_26,gpio_rtl_1_tri_i_25,gpio_rtl_1_tri_i_24,gpio_rtl_1_tri_i_23,gpio_rtl_1_tri_i_22,gpio_rtl_1_tri_i_21,gpio_rtl_1_tri_i_20,gpio_rtl_1_tri_i_19,gpio_rtl_1_tri_i_18,gpio_rtl_1_tri_i_17,gpio_rtl_1_tri_i_16,gpio_rtl_1_tri_i_15,gpio_rtl_1_tri_i_14,gpio_rtl_1_tri_i_13,gpio_rtl_1_tri_i_12,gpio_rtl_1_tri_i_11,gpio_rtl_1_tri_i_10,gpio_rtl_1_tri_i_9,gpio_rtl_1_tri_i_8,gpio_rtl_1_tri_i_7,gpio_rtl_1_tri_i_6,gpio_rtl_1_tri_i_5,gpio_rtl_1_tri_i_4,gpio_rtl_1_tri_i_3,gpio_rtl_1_tri_i_2,gpio_rtl_1_tri_i_1,gpio_rtl_1_tri_i_0}),
        .gpio_rtl_1_tri_o({gpio_rtl_1_tri_o_31,gpio_rtl_1_tri_o_30,gpio_rtl_1_tri_o_29,gpio_rtl_1_tri_o_28,gpio_rtl_1_tri_o_27,gpio_rtl_1_tri_o_26,gpio_rtl_1_tri_o_25,gpio_rtl_1_tri_o_24,gpio_rtl_1_tri_o_23,gpio_rtl_1_tri_o_22,gpio_rtl_1_tri_o_21,gpio_rtl_1_tri_o_20,gpio_rtl_1_tri_o_19,gpio_rtl_1_tri_o_18,gpio_rtl_1_tri_o_17,gpio_rtl_1_tri_o_16,gpio_rtl_1_tri_o_15,gpio_rtl_1_tri_o_14,gpio_rtl_1_tri_o_13,gpio_rtl_1_tri_o_12,gpio_rtl_1_tri_o_11,gpio_rtl_1_tri_o_10,gpio_rtl_1_tri_o_9,gpio_rtl_1_tri_o_8,gpio_rtl_1_tri_o_7,gpio_rtl_1_tri_o_6,gpio_rtl_1_tri_o_5,gpio_rtl_1_tri_o_4,gpio_rtl_1_tri_o_3,gpio_rtl_1_tri_o_2,gpio_rtl_1_tri_o_1,gpio_rtl_1_tri_o_0}),
        .gpio_rtl_1_tri_t({gpio_rtl_1_tri_t_31,gpio_rtl_1_tri_t_30,gpio_rtl_1_tri_t_29,gpio_rtl_1_tri_t_28,gpio_rtl_1_tri_t_27,gpio_rtl_1_tri_t_26,gpio_rtl_1_tri_t_25,gpio_rtl_1_tri_t_24,gpio_rtl_1_tri_t_23,gpio_rtl_1_tri_t_22,gpio_rtl_1_tri_t_21,gpio_rtl_1_tri_t_20,gpio_rtl_1_tri_t_19,gpio_rtl_1_tri_t_18,gpio_rtl_1_tri_t_17,gpio_rtl_1_tri_t_16,gpio_rtl_1_tri_t_15,gpio_rtl_1_tri_t_14,gpio_rtl_1_tri_t_13,gpio_rtl_1_tri_t_12,gpio_rtl_1_tri_t_11,gpio_rtl_1_tri_t_10,gpio_rtl_1_tri_t_9,gpio_rtl_1_tri_t_8,gpio_rtl_1_tri_t_7,gpio_rtl_1_tri_t_6,gpio_rtl_1_tri_t_5,gpio_rtl_1_tri_t_4,gpio_rtl_1_tri_t_3,gpio_rtl_1_tri_t_2,gpio_rtl_1_tri_t_1,gpio_rtl_1_tri_t_0}),
        .gpio_rtl_tri_i({gpio_rtl_tri_i_31,gpio_rtl_tri_i_30,gpio_rtl_tri_i_29,gpio_rtl_tri_i_28,gpio_rtl_tri_i_27,gpio_rtl_tri_i_26,gpio_rtl_tri_i_25,gpio_rtl_tri_i_24,gpio_rtl_tri_i_23,gpio_rtl_tri_i_22,gpio_rtl_tri_i_21,gpio_rtl_tri_i_20,gpio_rtl_tri_i_19,gpio_rtl_tri_i_18,gpio_rtl_tri_i_17,gpio_rtl_tri_i_16,gpio_rtl_tri_i_15,gpio_rtl_tri_i_14,gpio_rtl_tri_i_13,gpio_rtl_tri_i_12,gpio_rtl_tri_i_11,gpio_rtl_tri_i_10,gpio_rtl_tri_i_9,gpio_rtl_tri_i_8,gpio_rtl_tri_i_7,gpio_rtl_tri_i_6,gpio_rtl_tri_i_5,gpio_rtl_tri_i_4,gpio_rtl_tri_i_3,gpio_rtl_tri_i_2,gpio_rtl_tri_i_1,gpio_rtl_tri_i_0}),
        .gpio_rtl_tri_o({gpio_rtl_tri_o_31,gpio_rtl_tri_o_30,gpio_rtl_tri_o_29,gpio_rtl_tri_o_28,gpio_rtl_tri_o_27,gpio_rtl_tri_o_26,gpio_rtl_tri_o_25,gpio_rtl_tri_o_24,gpio_rtl_tri_o_23,gpio_rtl_tri_o_22,gpio_rtl_tri_o_21,gpio_rtl_tri_o_20,gpio_rtl_tri_o_19,gpio_rtl_tri_o_18,gpio_rtl_tri_o_17,gpio_rtl_tri_o_16,gpio_rtl_tri_o_15,gpio_rtl_tri_o_14,gpio_rtl_tri_o_13,gpio_rtl_tri_o_12,gpio_rtl_tri_o_11,gpio_rtl_tri_o_10,gpio_rtl_tri_o_9,gpio_rtl_tri_o_8,gpio_rtl_tri_o_7,gpio_rtl_tri_o_6,gpio_rtl_tri_o_5,gpio_rtl_tri_o_4,gpio_rtl_tri_o_3,gpio_rtl_tri_o_2,gpio_rtl_tri_o_1,gpio_rtl_tri_o_0}),
        .gpio_rtl_tri_t({gpio_rtl_tri_t_31,gpio_rtl_tri_t_30,gpio_rtl_tri_t_29,gpio_rtl_tri_t_28,gpio_rtl_tri_t_27,gpio_rtl_tri_t_26,gpio_rtl_tri_t_25,gpio_rtl_tri_t_24,gpio_rtl_tri_t_23,gpio_rtl_tri_t_22,gpio_rtl_tri_t_21,gpio_rtl_tri_t_20,gpio_rtl_tri_t_19,gpio_rtl_tri_t_18,gpio_rtl_tri_t_17,gpio_rtl_tri_t_16,gpio_rtl_tri_t_15,gpio_rtl_tri_t_14,gpio_rtl_tri_t_13,gpio_rtl_tri_t_12,gpio_rtl_tri_t_11,gpio_rtl_tri_t_10,gpio_rtl_tri_t_9,gpio_rtl_tri_t_8,gpio_rtl_tri_t_7,gpio_rtl_tri_t_6,gpio_rtl_tri_t_5,gpio_rtl_tri_t_4,gpio_rtl_tri_t_3,gpio_rtl_tri_t_2,gpio_rtl_tri_t_1,gpio_rtl_tri_t_0}),
        .initb(initb),
        .progb(progb),
        .reg2port(reg2port),
        .rxd_232(rxd_232),
        .txd_232(txd_232));
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
  IOBUF gpio_rtl_1_tri_iobuf_0
       (.I(gpio_rtl_1_tri_o_0),
        .IO(gpio_rtl_1_tri_io[0]),
        .O(gpio_rtl_1_tri_i_0),
        .T(gpio_rtl_1_tri_t_0));
  IOBUF gpio_rtl_1_tri_iobuf_1
       (.I(gpio_rtl_1_tri_o_1),
        .IO(gpio_rtl_1_tri_io[1]),
        .O(gpio_rtl_1_tri_i_1),
        .T(gpio_rtl_1_tri_t_1));
  IOBUF gpio_rtl_1_tri_iobuf_10
       (.I(gpio_rtl_1_tri_o_10),
        .IO(gpio_rtl_1_tri_io[10]),
        .O(gpio_rtl_1_tri_i_10),
        .T(gpio_rtl_1_tri_t_10));
  IOBUF gpio_rtl_1_tri_iobuf_11
       (.I(gpio_rtl_1_tri_o_11),
        .IO(gpio_rtl_1_tri_io[11]),
        .O(gpio_rtl_1_tri_i_11),
        .T(gpio_rtl_1_tri_t_11));
  IOBUF gpio_rtl_1_tri_iobuf_12
       (.I(gpio_rtl_1_tri_o_12),
        .IO(gpio_rtl_1_tri_io[12]),
        .O(gpio_rtl_1_tri_i_12),
        .T(gpio_rtl_1_tri_t_12));
  IOBUF gpio_rtl_1_tri_iobuf_13
       (.I(gpio_rtl_1_tri_o_13),
        .IO(gpio_rtl_1_tri_io[13]),
        .O(gpio_rtl_1_tri_i_13),
        .T(gpio_rtl_1_tri_t_13));
  IOBUF gpio_rtl_1_tri_iobuf_14
       (.I(gpio_rtl_1_tri_o_14),
        .IO(gpio_rtl_1_tri_io[14]),
        .O(gpio_rtl_1_tri_i_14),
        .T(gpio_rtl_1_tri_t_14));
  IOBUF gpio_rtl_1_tri_iobuf_15
       (.I(gpio_rtl_1_tri_o_15),
        .IO(gpio_rtl_1_tri_io[15]),
        .O(gpio_rtl_1_tri_i_15),
        .T(gpio_rtl_1_tri_t_15));
  IOBUF gpio_rtl_1_tri_iobuf_16
       (.I(gpio_rtl_1_tri_o_16),
        .IO(gpio_rtl_1_tri_io[16]),
        .O(gpio_rtl_1_tri_i_16),
        .T(gpio_rtl_1_tri_t_16));
  IOBUF gpio_rtl_1_tri_iobuf_17
       (.I(gpio_rtl_1_tri_o_17),
        .IO(gpio_rtl_1_tri_io[17]),
        .O(gpio_rtl_1_tri_i_17),
        .T(gpio_rtl_1_tri_t_17));
  IOBUF gpio_rtl_1_tri_iobuf_18
       (.I(gpio_rtl_1_tri_o_18),
        .IO(gpio_rtl_1_tri_io[18]),
        .O(gpio_rtl_1_tri_i_18),
        .T(gpio_rtl_1_tri_t_18));
  IOBUF gpio_rtl_1_tri_iobuf_19
       (.I(gpio_rtl_1_tri_o_19),
        .IO(gpio_rtl_1_tri_io[19]),
        .O(gpio_rtl_1_tri_i_19),
        .T(gpio_rtl_1_tri_t_19));
  IOBUF gpio_rtl_1_tri_iobuf_2
       (.I(gpio_rtl_1_tri_o_2),
        .IO(gpio_rtl_1_tri_io[2]),
        .O(gpio_rtl_1_tri_i_2),
        .T(gpio_rtl_1_tri_t_2));
  IOBUF gpio_rtl_1_tri_iobuf_20
       (.I(gpio_rtl_1_tri_o_20),
        .IO(gpio_rtl_1_tri_io[20]),
        .O(gpio_rtl_1_tri_i_20),
        .T(gpio_rtl_1_tri_t_20));
  IOBUF gpio_rtl_1_tri_iobuf_21
       (.I(gpio_rtl_1_tri_o_21),
        .IO(gpio_rtl_1_tri_io[21]),
        .O(gpio_rtl_1_tri_i_21),
        .T(gpio_rtl_1_tri_t_21));
  IOBUF gpio_rtl_1_tri_iobuf_22
       (.I(gpio_rtl_1_tri_o_22),
        .IO(gpio_rtl_1_tri_io[22]),
        .O(gpio_rtl_1_tri_i_22),
        .T(gpio_rtl_1_tri_t_22));
  IOBUF gpio_rtl_1_tri_iobuf_23
       (.I(gpio_rtl_1_tri_o_23),
        .IO(gpio_rtl_1_tri_io[23]),
        .O(gpio_rtl_1_tri_i_23),
        .T(gpio_rtl_1_tri_t_23));
  IOBUF gpio_rtl_1_tri_iobuf_24
       (.I(gpio_rtl_1_tri_o_24),
        .IO(gpio_rtl_1_tri_io[24]),
        .O(gpio_rtl_1_tri_i_24),
        .T(gpio_rtl_1_tri_t_24));
  IOBUF gpio_rtl_1_tri_iobuf_25
       (.I(gpio_rtl_1_tri_o_25),
        .IO(gpio_rtl_1_tri_io[25]),
        .O(gpio_rtl_1_tri_i_25),
        .T(gpio_rtl_1_tri_t_25));
  IOBUF gpio_rtl_1_tri_iobuf_26
       (.I(gpio_rtl_1_tri_o_26),
        .IO(gpio_rtl_1_tri_io[26]),
        .O(gpio_rtl_1_tri_i_26),
        .T(gpio_rtl_1_tri_t_26));
  IOBUF gpio_rtl_1_tri_iobuf_27
       (.I(gpio_rtl_1_tri_o_27),
        .IO(gpio_rtl_1_tri_io[27]),
        .O(gpio_rtl_1_tri_i_27),
        .T(gpio_rtl_1_tri_t_27));
  IOBUF gpio_rtl_1_tri_iobuf_28
       (.I(gpio_rtl_1_tri_o_28),
        .IO(gpio_rtl_1_tri_io[28]),
        .O(gpio_rtl_1_tri_i_28),
        .T(gpio_rtl_1_tri_t_28));
  IOBUF gpio_rtl_1_tri_iobuf_29
       (.I(gpio_rtl_1_tri_o_29),
        .IO(gpio_rtl_1_tri_io[29]),
        .O(gpio_rtl_1_tri_i_29),
        .T(gpio_rtl_1_tri_t_29));
  IOBUF gpio_rtl_1_tri_iobuf_3
       (.I(gpio_rtl_1_tri_o_3),
        .IO(gpio_rtl_1_tri_io[3]),
        .O(gpio_rtl_1_tri_i_3),
        .T(gpio_rtl_1_tri_t_3));
  IOBUF gpio_rtl_1_tri_iobuf_30
       (.I(gpio_rtl_1_tri_o_30),
        .IO(gpio_rtl_1_tri_io[30]),
        .O(gpio_rtl_1_tri_i_30),
        .T(gpio_rtl_1_tri_t_30));
  IOBUF gpio_rtl_1_tri_iobuf_31
       (.I(gpio_rtl_1_tri_o_31),
        .IO(gpio_rtl_1_tri_io[31]),
        .O(gpio_rtl_1_tri_i_31),
        .T(gpio_rtl_1_tri_t_31));
  IOBUF gpio_rtl_1_tri_iobuf_4
       (.I(gpio_rtl_1_tri_o_4),
        .IO(gpio_rtl_1_tri_io[4]),
        .O(gpio_rtl_1_tri_i_4),
        .T(gpio_rtl_1_tri_t_4));
  IOBUF gpio_rtl_1_tri_iobuf_5
       (.I(gpio_rtl_1_tri_o_5),
        .IO(gpio_rtl_1_tri_io[5]),
        .O(gpio_rtl_1_tri_i_5),
        .T(gpio_rtl_1_tri_t_5));
  IOBUF gpio_rtl_1_tri_iobuf_6
       (.I(gpio_rtl_1_tri_o_6),
        .IO(gpio_rtl_1_tri_io[6]),
        .O(gpio_rtl_1_tri_i_6),
        .T(gpio_rtl_1_tri_t_6));
  IOBUF gpio_rtl_1_tri_iobuf_7
       (.I(gpio_rtl_1_tri_o_7),
        .IO(gpio_rtl_1_tri_io[7]),
        .O(gpio_rtl_1_tri_i_7),
        .T(gpio_rtl_1_tri_t_7));
  IOBUF gpio_rtl_1_tri_iobuf_8
       (.I(gpio_rtl_1_tri_o_8),
        .IO(gpio_rtl_1_tri_io[8]),
        .O(gpio_rtl_1_tri_i_8),
        .T(gpio_rtl_1_tri_t_8));
  IOBUF gpio_rtl_1_tri_iobuf_9
       (.I(gpio_rtl_1_tri_o_9),
        .IO(gpio_rtl_1_tri_io[9]),
        .O(gpio_rtl_1_tri_i_9),
        .T(gpio_rtl_1_tri_t_9));
  IOBUF gpio_rtl_tri_iobuf_0
       (.I(gpio_rtl_tri_o_0),
        .IO(gpio_rtl_tri_io[0]),
        .O(gpio_rtl_tri_i_0),
        .T(gpio_rtl_tri_t_0));
  IOBUF gpio_rtl_tri_iobuf_1
       (.I(gpio_rtl_tri_o_1),
        .IO(gpio_rtl_tri_io[1]),
        .O(gpio_rtl_tri_i_1),
        .T(gpio_rtl_tri_t_1));
  IOBUF gpio_rtl_tri_iobuf_10
       (.I(gpio_rtl_tri_o_10),
        .IO(gpio_rtl_tri_io[10]),
        .O(gpio_rtl_tri_i_10),
        .T(gpio_rtl_tri_t_10));
  IOBUF gpio_rtl_tri_iobuf_11
       (.I(gpio_rtl_tri_o_11),
        .IO(gpio_rtl_tri_io[11]),
        .O(gpio_rtl_tri_i_11),
        .T(gpio_rtl_tri_t_11));
  IOBUF gpio_rtl_tri_iobuf_12
       (.I(gpio_rtl_tri_o_12),
        .IO(gpio_rtl_tri_io[12]),
        .O(gpio_rtl_tri_i_12),
        .T(gpio_rtl_tri_t_12));
  IOBUF gpio_rtl_tri_iobuf_13
       (.I(gpio_rtl_tri_o_13),
        .IO(gpio_rtl_tri_io[13]),
        .O(gpio_rtl_tri_i_13),
        .T(gpio_rtl_tri_t_13));
  IOBUF gpio_rtl_tri_iobuf_14
       (.I(gpio_rtl_tri_o_14),
        .IO(gpio_rtl_tri_io[14]),
        .O(gpio_rtl_tri_i_14),
        .T(gpio_rtl_tri_t_14));
  IOBUF gpio_rtl_tri_iobuf_15
       (.I(gpio_rtl_tri_o_15),
        .IO(gpio_rtl_tri_io[15]),
        .O(gpio_rtl_tri_i_15),
        .T(gpio_rtl_tri_t_15));
  IOBUF gpio_rtl_tri_iobuf_16
       (.I(gpio_rtl_tri_o_16),
        .IO(gpio_rtl_tri_io[16]),
        .O(gpio_rtl_tri_i_16),
        .T(gpio_rtl_tri_t_16));
  IOBUF gpio_rtl_tri_iobuf_17
       (.I(gpio_rtl_tri_o_17),
        .IO(gpio_rtl_tri_io[17]),
        .O(gpio_rtl_tri_i_17),
        .T(gpio_rtl_tri_t_17));
  IOBUF gpio_rtl_tri_iobuf_18
       (.I(gpio_rtl_tri_o_18),
        .IO(gpio_rtl_tri_io[18]),
        .O(gpio_rtl_tri_i_18),
        .T(gpio_rtl_tri_t_18));
  IOBUF gpio_rtl_tri_iobuf_19
       (.I(gpio_rtl_tri_o_19),
        .IO(gpio_rtl_tri_io[19]),
        .O(gpio_rtl_tri_i_19),
        .T(gpio_rtl_tri_t_19));
  IOBUF gpio_rtl_tri_iobuf_2
       (.I(gpio_rtl_tri_o_2),
        .IO(gpio_rtl_tri_io[2]),
        .O(gpio_rtl_tri_i_2),
        .T(gpio_rtl_tri_t_2));
  IOBUF gpio_rtl_tri_iobuf_20
       (.I(gpio_rtl_tri_o_20),
        .IO(gpio_rtl_tri_io[20]),
        .O(gpio_rtl_tri_i_20),
        .T(gpio_rtl_tri_t_20));
  IOBUF gpio_rtl_tri_iobuf_21
       (.I(gpio_rtl_tri_o_21),
        .IO(gpio_rtl_tri_io[21]),
        .O(gpio_rtl_tri_i_21),
        .T(gpio_rtl_tri_t_21));
  IOBUF gpio_rtl_tri_iobuf_22
       (.I(gpio_rtl_tri_o_22),
        .IO(gpio_rtl_tri_io[22]),
        .O(gpio_rtl_tri_i_22),
        .T(gpio_rtl_tri_t_22));
  IOBUF gpio_rtl_tri_iobuf_23
       (.I(gpio_rtl_tri_o_23),
        .IO(gpio_rtl_tri_io[23]),
        .O(gpio_rtl_tri_i_23),
        .T(gpio_rtl_tri_t_23));
  IOBUF gpio_rtl_tri_iobuf_24
       (.I(gpio_rtl_tri_o_24),
        .IO(gpio_rtl_tri_io[24]),
        .O(gpio_rtl_tri_i_24),
        .T(gpio_rtl_tri_t_24));
  IOBUF gpio_rtl_tri_iobuf_25
       (.I(gpio_rtl_tri_o_25),
        .IO(gpio_rtl_tri_io[25]),
        .O(gpio_rtl_tri_i_25),
        .T(gpio_rtl_tri_t_25));
  IOBUF gpio_rtl_tri_iobuf_26
       (.I(gpio_rtl_tri_o_26),
        .IO(gpio_rtl_tri_io[26]),
        .O(gpio_rtl_tri_i_26),
        .T(gpio_rtl_tri_t_26));
  IOBUF gpio_rtl_tri_iobuf_27
       (.I(gpio_rtl_tri_o_27),
        .IO(gpio_rtl_tri_io[27]),
        .O(gpio_rtl_tri_i_27),
        .T(gpio_rtl_tri_t_27));
  IOBUF gpio_rtl_tri_iobuf_28
       (.I(gpio_rtl_tri_o_28),
        .IO(gpio_rtl_tri_io[28]),
        .O(gpio_rtl_tri_i_28),
        .T(gpio_rtl_tri_t_28));
  IOBUF gpio_rtl_tri_iobuf_29
       (.I(gpio_rtl_tri_o_29),
        .IO(gpio_rtl_tri_io[29]),
        .O(gpio_rtl_tri_i_29),
        .T(gpio_rtl_tri_t_29));
  IOBUF gpio_rtl_tri_iobuf_3
       (.I(gpio_rtl_tri_o_3),
        .IO(gpio_rtl_tri_io[3]),
        .O(gpio_rtl_tri_i_3),
        .T(gpio_rtl_tri_t_3));
  IOBUF gpio_rtl_tri_iobuf_30
       (.I(gpio_rtl_tri_o_30),
        .IO(gpio_rtl_tri_io[30]),
        .O(gpio_rtl_tri_i_30),
        .T(gpio_rtl_tri_t_30));
  IOBUF gpio_rtl_tri_iobuf_31
       (.I(gpio_rtl_tri_o_31),
        .IO(gpio_rtl_tri_io[31]),
        .O(gpio_rtl_tri_i_31),
        .T(gpio_rtl_tri_t_31));
  IOBUF gpio_rtl_tri_iobuf_4
       (.I(gpio_rtl_tri_o_4),
        .IO(gpio_rtl_tri_io[4]),
        .O(gpio_rtl_tri_i_4),
        .T(gpio_rtl_tri_t_4));
  IOBUF gpio_rtl_tri_iobuf_5
       (.I(gpio_rtl_tri_o_5),
        .IO(gpio_rtl_tri_io[5]),
        .O(gpio_rtl_tri_i_5),
        .T(gpio_rtl_tri_t_5));
  IOBUF gpio_rtl_tri_iobuf_6
       (.I(gpio_rtl_tri_o_6),
        .IO(gpio_rtl_tri_io[6]),
        .O(gpio_rtl_tri_i_6),
        .T(gpio_rtl_tri_t_6));
  IOBUF gpio_rtl_tri_iobuf_7
       (.I(gpio_rtl_tri_o_7),
        .IO(gpio_rtl_tri_io[7]),
        .O(gpio_rtl_tri_i_7),
        .T(gpio_rtl_tri_t_7));
  IOBUF gpio_rtl_tri_iobuf_8
       (.I(gpio_rtl_tri_o_8),
        .IO(gpio_rtl_tri_io[8]),
        .O(gpio_rtl_tri_i_8),
        .T(gpio_rtl_tri_t_8));
  IOBUF gpio_rtl_tri_iobuf_9
       (.I(gpio_rtl_tri_o_9),
        .IO(gpio_rtl_tri_io[9]),
        .O(gpio_rtl_tri_i_9),
        .T(gpio_rtl_tri_t_9));
endmodule
