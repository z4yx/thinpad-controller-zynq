/*-----------------------------------------------------
 File Name : thinpadNG_zynq_top.v
 Purpose :
 Creation Date : 27-02-2017
 Last Modified : Mon Feb 27 12:57:49 2017
 Created By : Jeasine Ma [jeasinema[at]gmail[dot]com]
-----------------------------------------------------*/
`ifndef __THINPADNG_ZYNQ_TOP_V__
`define __THINPADNG_ZYNQ_TOP_V__

`default_nettype none

`timescale 1ns/1ns

module thinpadNG_zynq_top(/*autoarg*/
    //Inputs
    UART_1_rxd, done, initb, rxd_232, 

    //Outputs
    SPI0_MOSI_O, SPI0_SCLK_O, UART_1_txd, 
    clk_out1, clk_out2, emc_rtl_addr, emc_rtl_ben, 
    emc_rtl_ce_n, emc_rtl_oen, emc_rtl_wen, 
    progb, txd_232, 

    //Inouts
    DDR_addr, DDR_ba, DDR_cas_n, DDR_ck_n, 
    DDR_ck_p, DDR_cke, DDR_cs_n, DDR_dm, 
    DDR_dq, DDR_dqs_n, DDR_dqs_p, DDR_odt, 
    DDR_ras_n, DDR_reset_n, DDR_we_n, FIXED_IO_ddr_vrn, 
    FIXED_IO_ddr_vrp, FIXED_IO_mio, FIXED_IO_ps_clk, 
    FIXED_IO_ps_porb, FIXED_IO_ps_srstb, 
    emc_rtl_dq_io, gpio_rtl_0_tri_io, gpio_rtl_1_tri_io, 
    gpio_rtl_tri_io
);

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
    output clk_out1;
    output clk_out2;
    input done;
    output [31:0]emc_rtl_addr;
    output [3:0]emc_rtl_ben;
    output [0:0]emc_rtl_ce_n;
    inout [31:0]emc_rtl_dq_io;
    output [0:0]emc_rtl_oen;
    output emc_rtl_wen;
    inout [5:0]gpio_rtl_0_tri_io;
    inout [31:0]gpio_rtl_1_tri_io;
    inout [31:0]gpio_rtl_tri_io;
    input initb;
    output [0:0]progb;
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
    wire clk_out1;
    wire clk_out2;
    wire done;
    wire [31:0]emc_rtl_addr;
    wire emc_rtl_adv_ldn;
    wire [3:0]emc_rtl_ben;
    wire [0:0]emc_rtl_ce;
    wire [0:0]emc_rtl_ce_n;
    wire emc_rtl_clken;
    wire emc_rtl_cre;
    wire [31:0]emc_rtl_dq_io;
    wire emc_rtl_lbon;
    wire [0:0]emc_rtl_oen;
    wire [3:0]emc_rtl_qwen;
    wire emc_rtl_rnw;
    wire emc_rtl_rpn;
    wire [0:0]emc_rtl_wait;
    wire emc_rtl_wen;
    wire [5:0]gpio_rtl_0_tri_io;
    wire [31:0]gpio_rtl_1_tri_io;
    wire [31:0]gpio_rtl_tri_io;
    wire initb;
    wire [0:0]progb;
    wire rxd_232;
    wire txd_232;

    design_1_wrapper block_design(/*autoinst*/
    .DDR_addr                   (DDR_addr[14:0]                 ), // inout
    .DDR_ba                     (DDR_ba[2:0]                    ), // inout
    .DDR_cas_n                  (DDR_cas_n                      ), // inout
    .DDR_ck_n                   (DDR_ck_n                       ), // inout
    .DDR_ck_p                   (DDR_ck_p                       ), // inout
    .DDR_cke                    (DDR_cke                        ), // inout
    .DDR_cs_n                   (DDR_cs_n                       ), // inout
    .DDR_dm                     (DDR_dm[3:0]                    ), // inout
    .DDR_dq                     (DDR_dq[31:0]                   ), // inout
    .DDR_dqs_n                  (DDR_dqs_n[3:0]                 ), // inout
    .DDR_dqs_p                  (DDR_dqs_p[3:0]                 ), // inout
    .DDR_odt                    (DDR_odt                        ), // inout
    .DDR_ras_n                  (DDR_ras_n                      ), // inout
    .DDR_reset_n                (DDR_reset_n                    ), // inout
    .DDR_we_n                   (DDR_we_n                       ), // inout
    .FIXED_IO_ddr_vrn           (FIXED_IO_ddr_vrn               ), // inout
    .FIXED_IO_ddr_vrp           (FIXED_IO_ddr_vrp               ), // inout
    .FIXED_IO_mio               (FIXED_IO_mio[53:0]             ), // inout
    .FIXED_IO_ps_clk            (FIXED_IO_ps_clk                ), // inout
    .FIXED_IO_ps_porb           (FIXED_IO_ps_porb               ), // inout
    .FIXED_IO_ps_srstb          (FIXED_IO_ps_srstb              ), // inout
    .SPI0_MOSI_O                (SPI0_MOSI_O                    ), // output
    .SPI0_SCLK_O                (SPI0_SCLK_O                    ), // output
    .UART_1_rxd                 (UART_1_rxd                     ), // input
    .UART_1_txd                 (UART_1_txd                     ), // output
    .clk_out1                   (clk_out1                       ), // output
    .clk_out2                   (clk_out2                       ), // output
    .done                       (done                           ), // input
    .emc_rtl_addr               (emc_rtl_addr[31:0]             ), // output
    .emc_rtl_adv_ldn            (emc_rtl_adv_ldn                ), // output
    .emc_rtl_ben                (emc_rtl_ben[3:0]               ), // output
    .emc_rtl_ce                 (emc_rtl_ce[0:0]                ), // output
    .emc_rtl_ce_n               (emc_rtl_ce_n[0:0]              ), // output
    .emc_rtl_clken              (emc_rtl_clken                  ), // output
    .emc_rtl_cre                (emc_rtl_cre                    ), // output
    .emc_rtl_dq_io              (emc_rtl_dq_io[31:0]            ), // inout
    .emc_rtl_lbon               (emc_rtl_lbon                   ), // output
    .emc_rtl_oen                (emc_rtl_oen[0:0]               ), // output
    .emc_rtl_qwen               (emc_rtl_qwen[3:0]              ), // output
    .emc_rtl_rnw                (emc_rtl_rnw                    ), // output
    .emc_rtl_rpn                (emc_rtl_rpn                    ), // output
    .emc_rtl_wait               (emc_rtl_wait[0:0]              ), // input
    .emc_rtl_wen                (emc_rtl_wen                    ), // output
    .gpio_rtl_0_tri_io          (gpio_rtl_0_tri_io[5:0]         ), // inout
    .gpio_rtl_1_tri_io          (gpio_rtl_1_tri_io[31:0]        ), // inout
    .gpio_rtl_tri_io            (gpio_rtl_tri_io[31:0]          ), // inout
    .initb                      (initb                          ), // input
    .progb                      (progb[0:0]                     ), // output
    .rxd_232                    (rxd_232                        ), // input
    .txd_232                    (txd_232                        )  // output
);

endmodule

`endif
