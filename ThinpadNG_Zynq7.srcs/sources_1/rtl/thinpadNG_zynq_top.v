/*-----------------------------------------------------
 File Name : thinpadNG_zynq_top.v
 Purpose :
 Creation Date : 27-02-2017
 Last Modified : Mon Feb 27 12:57:49 2017
 Created By : Jeasine Ma [jeasinema[at]gmail[dot]com]
-----------------------------------------------------*/
`ifndef __THINPADNG_ZYNQ_TOP_V__
`define __THINPADNG_ZYNQ_TOP_V__

`define HS_DIFF_IN
`define EN_CPLD_UART

`default_nettype none

`timescale 1ns/1ns

module thinpadNG_zynq_top #(
    parameter thinpad_rev = 3 // override in project settings
)
(/*autoarg*/
    //Inputs
    UART_1_rxd, done, initb, 
    dvi_clk, dvi_hs, dvi_vs, dvi_de, dvi_d,
`ifdef EN_CPLD_UART
    cpld_emu_rdn, cpld_emu_wrn,
`endif
    tap_tdo,

    //Outputs
    SPI0_MOSI_O, SPI0_SCLK_O, UART_1_txd, 
    clk_out1, clk_out2, emc_rtl_addr_wrap, emc_rtl_ben_wrap, 
    emc_rtl_ce_n_wrap, emc_rtl_oen_wrap, emc_rtl_wen_wrap, 
    progb, 
`ifdef EN_CPLD_UART
    cpld_emu_tbre, cpld_emu_tsre, cpld_emu_dataready,
`endif
`ifdef HS_DIFF_IN
    clkin1_p,  clkin1_n, datain1_p, datain1_n,
`endif
    tap_tck,    tap_tdi,    tap_tms, // tck=aclk/8

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
    input dvi_clk;
    input dvi_de,dvi_vs,dvi_hs;
    input [7:0]dvi_d;
`ifdef HS_DIFF_IN
    input clkin1_p,  clkin1_n;            // lvds channel 1 clock input
    input [3:0]   datain1_p, datain1_n;           // lvds channel 1 data inputs
`endif
`ifdef EN_CPLD_UART
    input cpld_emu_rdn;
    input cpld_emu_wrn;
    output cpld_emu_dataready;
    output cpld_emu_tbre;
    output cpld_emu_tsre;
`endif
    output wire tap_tck;
    output wire tap_tdi;
    input  wire tap_tdo;
    output wire tap_tms;

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
    wire [127:0]bus_analyze_axis_tdata;
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
    wire dvi_clk;
    wire dvi_de,dvi_vs,dvi_hs;
`ifdef HS_DIFF_IN
    wire clkin1_p,  clkin1_n;            // lvds channel 1 clock input
    wire [3:0]   datain1_p, datain1_n;           // lvds channel 1 data inputs
`endif
`ifdef EN_CPLD_UART
    wire cpld_emu_rdn;
    wire cpld_emu_wrn;
    wire cpld_emu_dataready;
    wire cpld_emu_tbre;
    wire cpld_emu_tsre;
    wire cpld_emu_to16550;
`else
    wire cpld_emu_to16550 = 1'b1;
`endif
    wire cpld_emu_from16550;
    wire [7:0]cpld_emu_data_o;
    wire [127:0]reg2port;
    wire [256+32-1:0]port2reg;
    wire la_fifo_aclk;
    wire la_fifo_aresetn;
    wire la_rst_n;
    wire la_rx_rst_n;
    wire [255:0]la_storage_axis_tdata;
    wire la_storage_axis_tlast;
    wire la_storage_axis_tready;
    wire la_storage_axis_tvalid;

    wire [31:0]gpio_sw_i;
    wire [31:0]gpio_sw_o;
    wire [31:0]gpio_sw_t;
    wire [23:0]pp_data_i;
    wire [23:0]pp_data_o;
    wire [23:0]pp_data_t;
    wire pp_rd, pp_rs, pp_wr;

    wire vid_overflow, vtc_locked;
    wire [9:0]vid_fifo_count;
    wire vid_in_clk;
    (* IOB = "true" *) reg [7:0]vid_io_in_data;
    (* IOB = "true" *) reg vid_io_in_hsync;
    (* IOB = "true" *) reg vid_io_in_vsync;
    (* IOB = "true" *) reg vid_io_in_active_video;
    wire vid_axis_rst_n;
    wire [7:0]vid_axis_tdata;
    wire vid_axis_tlast;
    wire vid_axis_tready;
    wire [0:0]vid_axis_tuser;
    wire vid_axis_tvalid;

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
    .gpio_rtl_tri_io            (gpio_rtl_tri_io[31:0]          ), // inout
    .gpio_sw_i                  (gpio_sw_i),
    .gpio_sw_o                  (gpio_sw_o),
    .gpio_sw_t                  (gpio_sw_t),
    .pp_csel                (),
    .pp_nrst                (),
    .pp_data_i              (pp_data_i),
    .pp_data_o              (pp_data_o),
    .pp_data_t              (pp_data_t),
    .pp_rd                  (pp_rd),
    .pp_rs                  (pp_rs),
    .pp_wr                  (pp_wr),
    .vid_overflow           (vid_overflow),
    .vid_fifo_count         (vid_fifo_count),
    .vtc_locked             (vtc_locked),
    .vid_in_clk             (vid_in_clk),
    .vid_timing_in_hsync        (vid_io_in_hsync),
    .vid_timing_in_vsync        (vid_io_in_vsync),
    .vid_timing_in_active_video (vid_io_in_active_video),
    .vid_axis_rst_n            (vid_axis_rst_n),
    .vid_axis_tdata            (vid_axis_tdata),
    .vid_axis_tlast            (vid_axis_tlast),
    .vid_axis_tready           (vid_axis_tready),
    .vid_axis_tuser            (vid_axis_tuser),
    .vid_axis_tvalid           (vid_axis_tvalid),
    .initb                      (initb                          ), // input
    .progb                      (progb[0:0]                     ), // output
    .tap_tck_0                  (tap_tck),
    .tap_tdi_0                  (tap_tdi),
    .tap_tdo_0                  (tap_tdo),
    .tap_tms_0                  (tap_tms),
    .reg2port                   (reg2port[127:0]                ), // output
    .port2reg                   (port2reg),
    .UART_CPLD_ctsn             (1'b0),
    .UART_CPLD_dcdn             (1'b0),
    .UART_CPLD_dsrn             (1'b0),
    .UART_CPLD_ri               (1'b1), //actually rin
    .UART_CPLD_rxd              (cpld_emu_to16550),
    .UART_CPLD_txd              (cpld_emu_from16550)
);
    
    // User logic
    // high_impedence wrapper for axi_emc
    localparam ADDR_PINS_AMOUNT = 10'd20;
    localparam ADDR_PINS_OFFSET = 10'd2;
    localparam BE_PINS_AMOUNT = 10'd4;
    localparam IO_PINS_AMOUNT = 10'd32;
    genvar i;

    reg capture_start_in;
    reg io_enable;
    reg io_dir;
    reg bus_analyze_start;
    reg [20:0] bus_analyze_sample_cnt;

    reg lactl_storage_enable,lactl_clear_overflow;
    reg [23-5-1:0] lactl_sample_cnt; // 2^18 * 32Byte(256bit) = 8MB

    wire [19:0]emc_rtl_addr_wrap;
    wire [3:0]emc_rtl_ben_wrap;
    wire [0:0]emc_rtl_ce_n_wrap;
    wire [0:0]emc_rtl_oen_wrap;
    wire emc_rtl_wen_wrap;

    wire[31:0] status_reg;

    // alt-mode of DIP switch pins 
    generate 
        for (i = 0; i < 32; i=i+1) begin
            assign gpio_sw_i[i] = gpio_rtl_1_tri_io[i];
            if(i < 24)begin 
                assign pp_data_i[i] = gpio_rtl_1_tri_io[i];
                assign gpio_rtl_1_tri_io[i] = gpio_sw_t[i] ?
                    (pp_data_t[i] ? 1'bz : pp_data_o[i]) :
                    gpio_sw_o[i];
            end else if (i < 29) begin 
                assign gpio_rtl_1_tri_io[i] = gpio_sw_t[i] ? 1'bz : gpio_sw_o[i];
            end else if (i == 29) begin 
                assign gpio_rtl_1_tri_io[i] = gpio_sw_t[i] ?
                    (io_enable ? pp_rs: 1'bz) :
                    gpio_sw_o[i];
            end else if (i == 30) begin 
                assign gpio_rtl_1_tri_io[i] = gpio_sw_t[i] ?
                    (io_enable ? pp_rd: 1'bz) :
                    gpio_sw_o[i];
            end else if (i == 31) begin 
                assign gpio_rtl_1_tri_io[i] = gpio_sw_t[i] ?
                    (io_enable ? pp_wr: 1'bz) :
                    gpio_sw_o[i];
            end
        end
    endgenerate

    always @(*) begin
        /* LA length register */
        lactl_sample_cnt <= reg2port[96 +: 18];
        /* LA control register */
        lactl_clear_overflow <= reg2port[64+1];
        lactl_storage_enable <= reg2port[64+0];
        /* Bus analyzer register */
        bus_analyze_sample_cnt <= reg2port[32+20:32];
        bus_analyze_start <= reg2port[32+31]; //MSB
        /* I/O control register */
        capture_start_in <= reg2port[1]; // active high
        io_enable <= reg2port[0];  // 1 for enable
        io_dir <= (~emc_rtl_wen & emc_rtl_oen) ? 1'b1 : 1'b0; // 1 for output
    end
    
    wire [7:0] ram_bus_mux;
    wire cpld_oe;
    generate
        
        for (i = 0; i < ADDR_PINS_AMOUNT; i = i + 1) begin : gen2
            assign emc_rtl_addr_wrap[i] = io_enable ? emc_rtl_addr[i + ADDR_PINS_OFFSET] : 1'bz; 
        end
        
        for (i = 0; i < BE_PINS_AMOUNT; i = i + 1) begin : gen3
            assign emc_rtl_ben_wrap[i] = io_enable ? emc_rtl_ben[i] : 1'bz; 
        end  
        
        for (i = 0; i < IO_PINS_AMOUNT; i = i + 1) begin : gen4
            if(i < 8)begin
                assign ram_bus_mux[i] = cpld_oe ? cpld_emu_data_o[i] : emc_rtl_dq_o[i];
                assign emc_rtl_dq_io[i] = (cpld_oe | (io_enable & ~emc_rtl_dq_t[i])) ? ram_bus_mux[i] : 1'bz;
            end else begin
                assign emc_rtl_dq_io[i] = (io_enable & ~emc_rtl_dq_t[i]) ? emc_rtl_dq_o[i] : 1'bz; 
            end
            assign emc_rtl_dq_i[i] = emc_rtl_dq_io[i];
        end  
    endgenerate
    
    assign emc_rtl_ce_n_wrap = io_enable ? emc_rtl_ce_n : 1'bz; 
    assign emc_rtl_oen_wrap = io_enable ? emc_rtl_oen : 1'bz; 
    assign emc_rtl_wen_wrap = io_enable ? emc_rtl_wen : 1'bz; 

    assign vid_in_clk = ~dvi_clk;
    always @(negedge dvi_clk) begin : proc_vid
        vid_io_in_active_video <= dvi_de;
        vid_io_in_vsync <= dvi_vs;
        vid_io_in_hsync <= dvi_hs;
        vid_io_in_data <= dvi_d;
    end

    wire image_capture_reset_n;
    xpm_cdc_async_rst #(
      .DEST_SYNC_FF    (2), // integer; range: 2-10
      .INIT_SYNC_FF    (0), // integer; 0=disable simulation init values, 1=enable simulation init values
      .RST_ACTIVE_HIGH (0)  // integer; 0=active low reset, 1=active high reset
    ) reset_of_image_capture (
      .src_arst  (vtc_locked),
      .dest_clk  (vid_in_clk),
      .dest_arst (image_capture_reset_n)
    );

    image_capture capture(
        .start     (capture_start_in),
        .pixel     (vid_io_in_data),
        .hs        (vid_io_in_hsync),
        .vs        (vid_io_in_vsync),
        .de        (vid_io_in_active_video),
        .axis_valid(vid_axis_tvalid),
        .axis_last (vid_axis_tlast),
        .axis_user (vid_axis_tuser),
        .axis_data (vid_axis_tdata),
        .reset_o_n (vid_axis_rst_n),
        .rst_n     (image_capture_reset_n),
        .clk       (vid_in_clk)
    );
    
    wire pll_bus_analyzer_locked, clk_frontend;
    wire bus_analyzer_ovf;
    clk_bus_analyzer pll_bus_analyzer(
        .clk_in1(bus_analyze_clk),
        .clk_out1(clk_frontend),
        .resetn(bus_analyze_rst_n),
        .locked(pll_bus_analyzer_locked)
    );
    bus_analyze bus_analyzer(
        .clk(bus_analyze_clk),     //100M
        .clk_frontend(clk_frontend), //250M
        .rst_n(pll_bus_analyzer_locked),
    
        .ram_addr_in(emc_rtl_addr_wrap),
        .ram_dq_in(emc_rtl_dq_io),
        .ram_we_n_in(emc_rtl_wen_wrap),
        .ram_oe_n_in(emc_rtl_oen_wrap),
        .ram_ce_n_in(emc_rtl_ce_n_wrap),
        .ram_be_n_in(emc_rtl_ben_wrap),

        .new_sample_cnt(bus_analyze_sample_cnt),
        .new_sample_valid(bus_analyze_start),
        .fifo_overflow(bus_analyzer_ovf),

        .axis_data(bus_analyze_axis_tdata),
        .axis_valid(bus_analyze_axis_tvalid),
        .axis_ready(bus_analyze_axis_tready),
        .axis_tlast(bus_analyze_axis_tlast)

    );

    wire xvc_present;
    assign xvc_present = (thinpad_rev>=3) ? 1'b1 : 1'b0;

    wire la_exist;
    wire[2:0]  lock_level;
    wire sampler_idle;
    wire la_storage_overflow;
    wire[255:0] received_data;
    wire received_update;

    wire[48+3-1:0] acq_data_out;
    wire acq_data_valid;

`ifdef HS_DIFF_IN
generate
    if(thinpad_rev>2) begin
        assign la_exist = 1'b1;
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
            .sampler_idle     (sampler_idle),
            .rx_pixel_clk     (la_fifo_aclk), //clock from module
            .raw_signal_result(received_data),
            .raw_signal_update(received_update)
        );
    end
endgenerate
`endif
    signal_sync #(.SYNC_CYCLE(2)) la_rx_rst_sync(
        .clk(la_fifo_aclk),
        .data_in(la_rst_n),
        .data_out(la_rx_rst_n)
    );
    la_storage_pack LApack(
        .rst_n                 (la_rx_rst_n),
        .la_fifo_aresetn       (la_fifo_aresetn),
        .la_storage_axis_tdata (la_storage_axis_tdata),
        .la_storage_axis_tlast (la_storage_axis_tlast),
        .la_storage_axis_tvalid(la_storage_axis_tvalid),
        .la_storage_axis_tready(la_storage_axis_tready),
        .lock_level            (lock_level),
        .la_overflow           (la_storage_overflow),
        .ctl_storage_enable    (lactl_storage_enable),
        .ctl_clear_overflow    (lactl_clear_overflow),
        .ctl_sample_cnt        (lactl_sample_cnt),
        .acq_data              (acq_data_out),
        .acq_data_valid        (acq_data_valid),
        .clk                   (la_fifo_aclk)
    );

    wire [2:0] thinpad_rev_fixed = thinpad_rev;

    assign status_reg = {xvc_present,thinpad_rev_fixed,4'b0,
                        5'b0,bus_analyzer_ovf,vid_fifo_count,
                        vtc_locked,vid_overflow,la_exist,sampler_idle,la_storage_overflow,lock_level};
    assign port2reg = {received_data, status_reg};

    
`ifdef EN_CPLD_UART
    /*
    wire cpld_clk, cpld_locked;
    clk_wiz_0 uart_clk(.clk_in1(clk_out1),.clk_out1(cpld_clk),.resetn(ps_perph_rstn),.locked(cpld_locked));

    uart_controller cpld_emu(
        .data(emc_rtl_dq_i[7:0]),
        .dout(cpld_emu_data_o),
        .rst(cpld_locked),
        .clk(cpld_clk), // 5529600Hz
        .rxd(cpld_emu_from16550),
        .rdn(cpld_emu_rdn_sync),
        .wrn(cpld_emu_wrn),
        .data_ready(cpld_emu_dataready),
        .parity_error(),
        .framing_error(),
        .tbre(cpld_emu_tbre),
        .tsre(cpld_emu_tsre),
        .sdo(cpld_emu_to16550)
    );
    */
    

    PULLUP pullup_wrn (.O(cpld_emu_wrn));
    PULLUP pullup_rdn (.O(cpld_emu_rdn));

    reg [7:0] TxD_data,TxD_data0,TxD_data1;
    reg [2:0] cpld_emu_wrn_sync;
    reg [2:0] cpld_emu_rdn_sync;
    reg wrn_rise,tbre;
    reg data_ready;
    wire uart_rx_flag;
    
    assign cpld_emu_dataready = data_ready;
    assign cpld_oe = ~cpld_emu_rdn;

    always @(posedge bus_analyze_clk) begin : proc_Tx
        TxD_data0 <= emc_rtl_dq_i[7:0];
        TxD_data1 <= TxD_data0;

        cpld_emu_rdn_sync <= {cpld_emu_rdn_sync[1:0],cpld_emu_rdn};
        cpld_emu_wrn_sync <= {cpld_emu_wrn_sync[1:0],cpld_emu_wrn};

        if(~cpld_emu_wrn_sync[1] & cpld_emu_wrn_sync[2])
            TxD_data <= TxD_data1;
        wrn_rise <= cpld_emu_wrn_sync[1] & ~cpld_emu_wrn_sync[2];
        
        if(~cpld_emu_rdn_sync[1] & cpld_emu_rdn_sync[2]) //rdn_fall
            data_ready <= 1'b0;
        else if(uart_rx_flag)
            data_ready <= 1'b1;
    end

    reg [7:0] TxD_data_sync;
    wire tx_en, rx_ack;

    always @(posedge clk_out2) begin
        TxD_data_sync <= TxD_data;
    end

    always @(posedge clk_out2 or negedge cpld_emu_wrn) begin : proc_tbre
        if(~cpld_emu_wrn) begin
            tbre <= 0;
        end else if(!cpld_emu_tsre) begin
            tbre <= 1;
        end
    end

    assign cpld_emu_tbre = tbre;

    flag_sync tx_flag(
        .clkA        (bus_analyze_clk),
        .clkB        (clk_out2),
        .FlagIn_clkA (wrn_rise),
        .FlagOut_clkB(tx_en),
        .a_rst_n     (ps_perph_rstn),
        .b_rst_n     (ps_perph_rstn)
    );

    flag_sync rx_flag(
        .clkA        (clk_out2),
        .clkB        (bus_analyze_clk),
        .FlagIn_clkA (rx_ack),
        .FlagOut_clkB(uart_rx_flag),
        .a_rst_n     (ps_perph_rstn),
        .b_rst_n     (ps_perph_rstn)
    );

    async_receiver #(.ClkFrequency(11059200),.Baud(9600))
        uart_r(
            .clk(clk_out2),
            .rdn(~rx_ack),
            .RxD(cpld_emu_from16550),
            .RxD_data_ready(rx_ack),
            .RxD_data(cpld_emu_data_o)
        );
    async_transmitter #(.ClkFrequency(11059200),.Baud(9600))
        uart_t(
            .clk(clk_out2),
            .tsre(cpld_emu_tsre),
            .TxD(cpld_emu_to16550),
            .TxD_start(tx_en),
            .TxD_data(TxD_data_sync)
        );

`endif
        
endmodule

`default_nettype wire
`endif
