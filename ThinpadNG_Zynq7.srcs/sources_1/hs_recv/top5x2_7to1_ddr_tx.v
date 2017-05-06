//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012-2015 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, All Rights Reserved.
//////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 1.2
//  \   \        Filename: top5x2_7to1_ddr_tx.v
//  /   /        Date Last Modified:  21JAN2015
// /___/   /\    Date Created: 2SEP2011
// \   \  /  \
//  \___\/\___\
// 
//Device: 	7-Series
//Purpose:  	DDR top level transmitter example - 2 channels of 5-bits each
//
//Reference:	XAPP585.pdf
//    
//Revision History:
//    Rev 1.0 - First created (nicks)
//    Rev 1.2 - Updated format (brandond)
//////////////////////////////////////////////////////////////////////////////
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

module top5x2_7to1_ddr_tx (
input		freqgen_p,  freqgen_n,			// pixel rate frequency generator clock input
input		reset,					// reset (active high)
output		clkout1_p,  clkout1_n,			// lvds channel 1 clock output
output	[4:0]	dataout1_p, dataout1_n,			// lvds channel 1 data outputs
output		clkout2_p,  clkout2_n,			// lvds channel 2 clock output
output	[4:0]	dataout2_p, dataout2_n) ;		// lvds channel 2 data outputs

// Parameters 

parameter integer     D = 5 ;				// Set the number of outputs per channel to be 5 in this example
parameter integer     N = 2 ;				// Set the number of channels to be 2 in this example

// Parameter for clock generation

parameter [6:0] TX_CLK_GEN   = 7'b1100001 ;		// Transmit a constant to make a 3:4 clock, two ticks in advance of bit0 of the data word
//parameter [6:0] TX_CLK_GEN   = 7'b1100011 ;		// OR Transmit a constant to make a 4:3 clock, two ticks in advance of bit0 of the data word
				
reg	[34:0]	txd1 ;				
wire	[34:0]	txd2 ;				
wire	[69:0]	txdata ;				
wire		tx_pixel_clk ;		
wire		tx_bufpll_lckd ; 		
wire		tx_bufg_pll_x1 ; 		
wire		txclk ;			
wire		txclk_div ;			
wire		not_tx_mmcm_lckd ;	
wire	[1:0]	clkout_p ;		
wire	[1:0]	clkout_n ;		
wire	[9:0]	dataout_p ;		
wire	[9:0]	dataout_n ;		
wire		tx_mmcm_lckd ;
	
// Clock Input

clock_generator_pll_7_to_1_diff_ddr #(
	.DIFF_TERM		("TRUE"),
	.PIXEL_CLOCK		("BUF_G"),
	.INTER_CLOCK 		("BUF_G"),
	.TX_CLOCK		("BUF_G"),
	.USE_PLL		("FALSE"),
	.MMCM_MODE		(1),				// Parameter to set multiplier for MMCM to get VCO in correct operating range. 1 multiplies input clock by 7, 2 multiplies clock by 14, etc
	.CLKIN_PERIOD 		(6.600))
clkgen (                        
	.reset			(reset),
	.clkin_p		(freqgen_p),
	.clkin_n		(freqgen_n),
	.txclk			(txclk),
	.txclk_div		(txclk_div),
	.pixel_clk		(tx_pixel_clk),
	.status			(),
	.mmcm_lckd		(tx_mmcm_lckd)) ;

assign not_tx_mmcm_lckd = ~tx_mmcm_lckd ;

// Transmitter Logic for N D-bit channels

// combine channel transmitter data

assign txdata = {txd2, txd1} ;

n_x_serdes_7_to_1_diff_ddr #(
      	.D			(D),
      	.N			(N),				// 2 channels
	.DATA_FORMAT 		("PER_CLOCK")) 			// PER_CLOCK or PER_CHANL data formatting
dataout (                      
	.dataout_p  		(dataout_p),
	.dataout_n  		(dataout_n),
	.clkout_p  		(clkout_p),
	.clkout_n  		(clkout_n),
	.txclk    		(txclk),
	.txclk_div    		(txclk_div),
	.pixel_clk		(tx_pixel_clk),
	.reset   		(not_tx_mmcm_lckd),
	.clk_pattern  		(TX_CLK_GEN),			// Transmit a constant to make the clock
	.datain  		(txdata));

// assign data to appropriate outputs

assign dataout1_p = dataout_p[4:0] ;	assign dataout1_n = dataout_n[4:0] ;
assign clkout1_p = clkout_p[0] ;	assign clkout1_n = clkout_n[0] ;
	                                
assign dataout2_p = dataout_p[9:5] ;	assign dataout2_n = dataout_n[9:5] ;
assign clkout2_p = clkout_p[1] ;	assign clkout2_n = clkout_n[1] ;

// 'walking one' Data generation for testing, user logic will go here

always @ (posedge tx_pixel_clk) begin
	if (tx_mmcm_lckd == 1'b0) begin
		txd1 <= 35'b00000000000000000000000000000000001 ;
	end else begin
		txd1 <= {$random(),$random()};//{txd1[33:0], txd1[34]} ;
	end 
end
      	
assign txd2 = txd1 ;
      
endmodule