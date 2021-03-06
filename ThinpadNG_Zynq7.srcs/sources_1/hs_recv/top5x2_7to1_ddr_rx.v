//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012-2015 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, All Rights Reserved.
//////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 1.2
//  \   \        Filename: top5x2_7to1_ddr_rx.v
//  /   /        Date Last Modified:  21JAN2015
// /___/   /\    Date Created: 30SEP2013
// \   \  /  \
//  \___\/\___\
// 
//Device: 	7-Series
//Purpose:  	DDR top level receiver example - 2 channels of 5-bits each
//
//Reference:	XAPP585
//    
//Revision History:
//    Rev 1.0 - First created (nicks)
//    Rev 1.1 - BUFG added to IDELAY reference clock
//    Rev 1.2 - Updated format (brandond)
//
////////////////////////////////////////////////////////////////////////////////
//
//  Disclaimer: 
//
//		This disclaimer is not a license and does not grant any rights to the materials 
//              distributed herewith. Except as otherwise provided in a valid license issued to you 
//              by Xilinx, and to the maximum extent permitted by applicable law: 
//              (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
//              AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
//              INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
//              FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
//              or tort, including negligence, or under any other theory of liability) for any loss or damage 
//              of any kind or nature related to, arising under or in connection with these materials, 
//              including for any direct, or any indirect, special, incidental, or consequential loss 
//              or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
//              as a result of any action brought by a third party) even if such damage or loss was 
//              reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
//  Critical Applications:
//
//		Xilinx products are not designed or intended to be fail-safe, or for use in any application 
//		requiring fail-safe performance, such as life-support or safety devices or systems, 
//		Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
//		or any other applications that could lead to death, personal injury, or severe property or 
//		environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
//		the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
//		to applicable laws and regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
//////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps

module top5x2_7to1_ddr_rx (
input		reset,					// reset (active high)
input		refclkin,				// Reference clock for input delay control
input		clkin1_p,  clkin1_n,			// lvds channel 1 clock input
input	[4:0]	datain1_p, datain1_n,			// lvds channel 1 data inputs
input		clkin2_p,  clkin2_n,			// lvds channel 2 clock input
input	[4:0]	datain2_p, datain2_n,			// lvds channel 2 data inputs
output	reg	dummy) ; 				// Dummy output for test

// Parameters

parameter integer     D = 5 ;				// Set the number of outputs per channel to be 5 in this example
parameter integer     N = 2 ;				// Set the number of channels to be 2 in this example

wire	[34:0]	rxd1 ;			
wire	[34:0]	rxd2 ;			
reg	[34:0]	old_rx1	;		
reg	[34:0]	old_rx2	;		
wire		refclkint ; 		
wire		rx_mmcm_lckdps ;		
wire	[1:0]	rx_mmcm_lckdpsbs ;	
wire		rx_pixel_clk ;		
wire	[1:0]	clkin_p ;			
wire	[1:0]	clkin_n ;			
wire	[9:0]	datain_p ;		
wire	[9:0]	datain_n ;		
wire	[69:0]	rxdall ;			
wire		delay_ready ;		
wire		rx_mmcm_lckd ;	

// 200 or 300 Mhz Generator Clock Input

IBUF iob_200m_in(
	.I    			(refclkin),
	.O         		(refclkint));

BUFG bufg_200_ref (
	.I 			(refclkint), 
	.O 			(refclkintbufg)) ;
	
IDELAYCTRL icontrol (              			// Instantiate input delay control block
	.REFCLK			(refclkintbufg),
	.RST			(reset),
	.RDY			(delay_ready));

// Input clock and data for 2 channels
	
assign clkin_p  = {clkin2_p, clkin1_p} ;
assign clkin_n  = {clkin2_n, clkin1_n} ;
assign datain_p = {datain2_p, datain1_p} ;
assign datain_n = {datain2_n, datain1_n} ;
	
n_x_serdes_1_to_7_mmcm_idelay_ddr #(
	.N			(2),
	.SAMPL_CLOCK		("BUFIO"),
	.INTER_CLOCK		("BUF_R"),
	.PIXEL_CLOCK		("BUF_G"),
	.USE_PLL		("FALSE"),
 	.HIGH_PERFORMANCE_MODE 	("FALSE"),
      	.D			(D),				// Number of data lines
      	.REF_FREQ		(200.0),			// Set idelay control reference frequency
      	.CLKIN_PERIOD		(6.600),			// Set input clock period
      	.MMCM_MODE		(1),				// Parameter to set multiplier for MMCM to get VCO in correct operating range. 1 multiplies input clock by 7, 2 multiplies clock by 14, etc
	.DIFF_TERM		("TRUE"),
	.DATA_FORMAT 		("PER_CLOCK"))  		// PER_CLOCK or PER_CHANL data formatting
rx0 (                      
	.clkin_p   		(clkin_p),
	.clkin_n   		(clkin_n),
	.datain_p     		(datain_p),
	.datain_n     		(datain_n),
	.enable_phase_detector	(1'b1),				// enable phase detector operation
	.enable_monitor		(1'b0),				// enables data eye monitoring
	.dcd_correct		(1'b0),				// enables clock duty cycle correction
	.rxclk    		(),
	.rxclk_d4    		(),				// intermediate clock, use with data monitoring logic
	.idelay_rdy		(delay_ready),
	.pixel_clk		(rx_pixel_clk),
	.reset     		(reset),
	.rx_mmcm_lckd		(rx_mmcm_lckd),
	.rx_mmcm_lckdps		(rx_mmcm_lckdps),
	.rx_mmcm_lckdpsbs	(rx_mmcm_lckdpsbs),
	.clk_data  		(),
	.rx_data		(rxdall),
	.bit_rate_value		(16'h1050),			// required bit rate value in BCD
	.bit_time_value		(),
	.status			(),
	.eye_info		(),				// data eye monitor per line
	.m_delay_1hot		(),				// sample point monitor per line
	.debug			()) ;				// debug bus

assign rxd1 = rxdall[34:0] ;
assign rxd2 = rxdall[69:35] ;

// Data checking for testing, user logic will go here

always @(posedge rx_pixel_clk) begin
	old_rx1 <= rxd1 ;
	old_rx2 <= rxd2 ;
	if (rx_mmcm_lckdpsbs[1] == 1'b0) begin
		dummy <= 1'b0 ;
	end
	else if (rxd1 == {old_rx1[33:0], old_rx1[34]} && rxd2 == {old_rx2[33:0], old_rx2[34]}) begin
		dummy <= 1'b1 ;
	end
	else begin
		dummy <= 1'b0 ;
	end
end
      	
endmodule