`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 14:39:05
// Design Name: 
// Module Name: block_design_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module block_design_tb(

    );
wire tap_tck;
wire tap_tdi;
wire tap_tdo;
wire tap_tms;

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
wire done = 1;
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
wire clkin1_p,  clkin1_n;            // lvds channel 1 clock input
wire [3:0]   datain1_p, datain1_n;           // lvds channel 1 data inputs
wire cpld_emu_rdn;
wire cpld_emu_wrn;
wire cpld_emu_dataready;
wire cpld_emu_tbre;
wire cpld_emu_tsre;
wire cpld_emu_to16550;
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
wire vid_in_clk = 0;
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
//    .DDR_addr                   (DDR_addr[14:0]                 ), // inout
//    .DDR_ba                     (DDR_ba[2:0]                    ), // inout
//    .DDR_cas_n                  (DDR_cas_n                      ), // inout
//    .DDR_ck_n                   (DDR_ck_n                       ), // inout
//    .DDR_ck_p                   (DDR_ck_p                       ), // inout
//    .DDR_cke                    (DDR_cke                        ), // inout
//    .DDR_cs_n                   (DDR_cs_n                       ), // inout
//    .DDR_dm                     (DDR_dm[3:0]                    ), // inout
//    .DDR_dq                     (DDR_dq[31:0]                   ), // inout
//    .DDR_dqs_n                  (DDR_dqs_n[3:0]                 ), // inout
//    .DDR_dqs_p                  (DDR_dqs_p[3:0]                 ), // inout
//    .DDR_odt                    (DDR_odt                        ), // inout
//    .DDR_ras_n                  (DDR_ras_n                      ), // inout
//    .DDR_reset_n                (DDR_reset_n                    ), // inout
//    .DDR_we_n                   (DDR_we_n                       ), // inout
//    .FIXED_IO_ddr_vrn           (FIXED_IO_ddr_vrn               ), // inout
//    .FIXED_IO_ddr_vrp           (FIXED_IO_ddr_vrp               ), // inout
//    .FIXED_IO_mio               (FIXED_IO_mio[53:0]             ), // inout
//    .FIXED_IO_ps_clk            (FIXED_IO_ps_clk                ), // inout
//    .FIXED_IO_ps_porb           (FIXED_IO_ps_porb               ), // inout
//    .FIXED_IO_ps_srstb          (FIXED_IO_ps_srstb              ), // inout
//    .SPI0_MOSI_O                (SPI0_MOSI_O                    ), // output
//    .SPI0_SCLK_O                (SPI0_SCLK_O                    ), // output
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

reg [31:0] read_data;
reg [3:0] read_rasp;
    
initial begin
    block_design.design_1_i.ps7_0.inst.fpga_soft_reset(32'hff); // assert reset
    repeat(10) @(posedge block_design.design_1_i.processing_system7_0_FCLK_CLK0);
    block_design.design_1_i.ps7_0.inst.fpga_soft_reset(0);
    repeat(30) @(posedge block_design.design_1_i.processing_system7_0_FCLK_CLK0);
    
    block_design.design_1_i.ps7_0.inst.read_data(32'h4123_1000, 8'd4, read_data, read_rasp);
    block_design.design_1_i.ps7_0.inst.read_data(32'h4123_1004, 8'd4, read_data, read_rasp);
    block_design.design_1_i.ps7_0.inst.read_data(32'h4123_1008, 8'd4, read_data, read_rasp);
    block_design.design_1_i.ps7_0.inst.read_data(32'h4123_100C, 8'd4, read_data, read_rasp);
    
    block_design.design_1_i.ps7_0.inst.read_data(32'h4123_0000, 8'd4, read_data, read_rasp);


end
    
    
endmodule
