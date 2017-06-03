/*-----------------------------------------------------
 File Name : thinpadNG_zynq_top.v
 Purpose :
 Creation Date : 27-02-2017
 Last Modified : Mon Feb 27 12:57:49 2017
 Created By : Jeasine Ma [jeasinema[at]gmail[dot]com]
-----------------------------------------------------*/
`ifndef __THINPADNG_ZYNQ_TOP_V__
`define __THINPADNG_ZYNQ_TOP_V__

//`default_nettype none

`timescale 1ns/1ns

module thinpadNG_zynq_top(/*autoarg*/
    //Inputs
    UART_1_rxd, done, initb, 

    //Outputs
    SPI0_MOSI_O, SPI0_SCLK_O, UART_1_txd, 
    clk_out1, clk_out2, emc_rtl_addr_wrap, emc_rtl_ben_wrap, 
    emc_rtl_ce_n_wrap, emc_rtl_oen_wrap, emc_rtl_wen_wrap, 
    progb, 
    clkin1_p,  clkin1_n, datain1_p, datain1_n,

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
    inout [19:0]emc_rtl_addr_wrap;
    inout [3:0]emc_rtl_ben_wrap;
    inout [0:0]emc_rtl_ce_n_wrap;
    inout [31:0]emc_rtl_dq_io;  // because of IOBUF, there is no need to wrap dq_io
    inout [0:0]emc_rtl_oen_wrap;
    inout emc_rtl_wen_wrap;
    inout [5:0]gpio_rtl_0_tri_io;
    inout [31:0]gpio_rtl_1_tri_io;
    inout [31:0]gpio_rtl_tri_io;
    input initb;
    output [0:0]progb;
    input clkin1_p,  clkin1_n;            // lvds channel 1 clock input
    input [3:0]   datain1_p, datain1_n;           // lvds channel 1 data inputs

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
    wire ps_perph_rstn;
    wire clk_serdes;
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
    wire [5:0]gpio_rtl_0_tri_io;
    wire [31:0]gpio_rtl_1_tri_io;
    wire [31:0]gpio_rtl_tri_io;
    wire initb;
    wire [0:0]progb;
    wire clkin1_p,  clkin1_n;            // lvds channel 1 clock input
    wire [3:0]   datain1_p, datain1_n;           // lvds channel 1 data inputs
    wire rxd_232;
    wire txd_232;
    wire [127:0]reg2port;
    wire la_fifo_aclk;
    wire la_fifo_aresetn;
    wire la_rst_n;
    wire [255:0]la_storage_axis_tdata;
    wire la_storage_axis_tlast;
    wire la_storage_axis_tready;
    wire la_storage_axis_tvalid;

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
    .bus_analyze_axis_tdata     (bus_analyze_axis_tdata),
    .bus_analyze_axis_tlast     (bus_analyze_axis_tlast),
    .bus_analyze_axis_tready    (bus_analyze_axis_tready),
    .bus_analyze_axis_tvalid    (bus_analyze_axis_tvalid),
    .bus_analyze_clk            (bus_analyze_clk),
    .bus_analyze_rst_n          (bus_analyze_rst_n),
    .la_fifo_aclk               (la_fifo_aclk),
    .la_fifo_aresetn            (la_fifo_aresetn),
    .la_rst_n                   (la_rst_n),
    .la_storage_axis_tdata      (la_storage_axis_tdata),
    .la_storage_axis_tlast      (la_storage_axis_tlast),
    .la_storage_axis_tready     (la_storage_axis_tready),
    .la_storage_axis_tvalid     (la_storage_axis_tvalid),
    .clk_serdes                 (clk_serdes),
    .ps_perph_rstn              (ps_perph_rstn),
    .clk_out1                   (clk_out1                       ), // output
    .clk_out2                   (clk_out2                       ), // output
    .done                       (done                           ), // input
    .emc_rtl_addr               (emc_rtl_addr[31:0]             ), // output
    .emc_rtl_ben                (emc_rtl_ben[3:0]               ), // output
    .emc_rtl_ce_n               (emc_rtl_ce_n[0:0]              ), // output
    .emc_rtl_dq_i               (emc_rtl_dq_i[31:0]             ), // inout
    .emc_rtl_dq_o               (emc_rtl_dq_o[31:0]             ), // inout
    .emc_rtl_dq_t               (emc_rtl_dq_t[31:0]             ), // inout
    .emc_rtl_oen                (emc_rtl_oen[0:0]               ), // output
    .emc_rtl_wen                (emc_rtl_wen                    ), // output
    .gpio_rtl_0_tri_io          (gpio_rtl_0_tri_io[5:0]         ), // inout
    .gpio_rtl_1_tri_io          (gpio_rtl_1_tri_io[31:0]        ), // inout
    .gpio_rtl_tri_io            (gpio_rtl_tri_io[31:0]          ), // inout
    .initb                      (initb                          ), // input
    .progb                      (progb[0:0]                     ), // output
    .reg2port                   (reg2port[127:0]                ), // output
    .rxd_232                    (rxd_232                        ), // input
    .txd_232                    (txd_232                        )  // output
);
    
    // User logic
    // high_impedence wrapper for axi_emc
    parameter ADDR_PINS_AMOUNT = 10'd20;
    parameter ADDR_PINS_OFFSET = 10'd2;
    parameter BE_PINS_AMOUNT = 10'd4;
    parameter IO_PINS_AMOUNT = 10'd32;

    reg io_enable;
    reg io_dir;
    reg bus_analyze_start;
    reg [20:0] bus_analyze_sample_cnt;
    wire [19:0]emc_rtl_addr_wrap;
    wire [3:0]emc_rtl_ben_wrap;
    wire [0:0]emc_rtl_ce_n_wrap;
    wire [0:0]emc_rtl_oen_wrap;
    wire emc_rtl_wen_wrap;

    always @(*) begin
        bus_analyze_sample_cnt <= reg2port[32+20:32];
        bus_analyze_start <= reg2port[32+31]; //MSB
        io_enable <= reg2port[0];  // 1 for enable
        io_dir <= (~emc_rtl_wen & emc_rtl_oen) ? 1'b1 : 1'b0; // 1 for output
    end
    
    generate
        genvar i;
        
        for (i = 0; i < ADDR_PINS_AMOUNT; i = i + 1) begin : gen2
            assign emc_rtl_addr_wrap[i] = io_enable ? emc_rtl_addr[i + ADDR_PINS_OFFSET] : 1'bz; 
        end
        
        for (i = 0; i < BE_PINS_AMOUNT; i = i + 1) begin : gen3
            assign emc_rtl_ben_wrap[i] = io_enable ? emc_rtl_ben[i] : 1'bz; 
        end  
        
        for (i = 0; i < IO_PINS_AMOUNT; i = i + 1) begin : gen4
            assign emc_rtl_dq_io[i] = (io_enable & ~emc_rtl_dq_t[i]) ? emc_rtl_dq_o[i] : 1'bz; 
            assign emc_rtl_dq_i[i] = emc_rtl_dq_io[i];
        end  
    endgenerate
    
    assign emc_rtl_ce_n_wrap = io_enable ? emc_rtl_ce_n : 1'bz; 
    assign emc_rtl_oen_wrap = io_enable ? emc_rtl_oen : 1'bz; 
    assign emc_rtl_wen_wrap = io_enable ? emc_rtl_wen : 1'bz; 
    
    /*
    reg [31:0] test_data;
    always@(posedge bus_analyze_clk)begin
        test_data <= test_data + bus_analyze_axis_tready;
        bus_analyze_axis_tvalid <= bus_analyze_axis_tready;
    end
    assign bus_analyze_axis_tdata = test_data;
    assign bus_analyze_axis_tlast = 0;
    */
    bus_analyze bus_analyzer(
        .clk(bus_analyze_clk),
        .rst_n(bus_analyze_rst_n),
    
        .ram_addr_in(emc_rtl_addr_wrap),
        .ram_dq_in(emc_rtl_dq_io),
        .ram_wr_n_in(emc_rtl_wen_wrap),
        .ram_rd_n_in(emc_rtl_oen_wrap),
        .ram_ce_n_in(emc_rtl_ce_n_wrap),
        .ram_be_n_in(emc_rtl_ben_wrap),

        .new_sample_cnt(bus_analyze_sample_cnt),
        .new_sample_valid(bus_analyze_start),

        .axis_data(bus_analyze_axis_tdata),
        .axis_valid(bus_analyze_axis_tvalid),
        .axis_ready(bus_analyze_axis_tready),
        .axis_tlast(bus_analyze_axis_tlast)

    );

    (* MARK_DEBUG = "TRUE" *) wire[2:0]  lock_level;
    (* MARK_DEBUG = "TRUE" *) wire[255:0] received_data;
    (* MARK_DEBUG = "TRUE" *) wire received_update;

    (* MARK_DEBUG = "TRUE" *) wire[48+3-1:0] acq_data_out;
    (* MARK_DEBUG = "TRUE" *) wire acq_data_valid;
    la_receiver_0 LA(
        .refclkin (clk_serdes),
        .reset    (~la_rst_n),
        .clkin1_p (clkin1_p),
        .clkin1_n (clkin1_n),
        .datain1_p(datain1_p),
        .datain1_n(datain1_n),
        .acq_data_out     (acq_data_out),
        .acq_data_valid   (acq_data_valid),
        .lock_level       (lock_level),
        .rx_pixel_clk     (la_fifo_aclk), //clock from module
        .raw_signal_result(received_data),
        .raw_signal_update(received_update)
    );

    la_storage_pack LApack(
        .rst_n                 (~la_rst_n),
        .la_fifo_aresetn       (la_fifo_aresetn),
        .la_storage_axis_tdata (la_storage_axis_tdata),
        .la_storage_axis_tlast (la_storage_axis_tlast),
        .la_storage_axis_tvalid(la_storage_axis_tvalid),
        .la_storage_axis_tready(la_storage_axis_tready),
        .lock_level            (lock_level),
        .acq_data              (acq_data_out),
        .acq_data_valid        (acq_data_valid),
        .clk                   (la_fifo_aclk)
    );

endmodule

`endif
