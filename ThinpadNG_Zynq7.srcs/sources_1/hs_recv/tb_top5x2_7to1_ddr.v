//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012-2015 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, All Rights Reserved.
//////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 1.2
//  \   \        Filename: tb_top5x2_7to1_ddr.v
//  /   /        Date Last Modified:  21JAN2015
// /___/   /\    Date Created: 2SEP2011
// \   \  /  \
//  \___\/\___\
// 
//Device: 	7-Series
//Purpose:  	ddr top level receiver example - 2 channels of 5-bits each
//
//Reference:	XAPP585
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
`timescale 1 ps / 1ps

module tb_top5x2_7to1_ddr () ;

reg 		clk200 ;
wire 		pixelclock_n ;
reg 		pixelclock_p ;
wire		clkout1_p ;
wire 		clkout1_n ;
wire		clkout2_p ;
wire 		clkout2_n ;
reg 		reset ;
wire	[4:0]	dataout1_p ;
wire 	[4:0]	dataout1_n ;
wire	[4:0]	dataout2_p ;
wire 	[4:0]	dataout2_n ;
wire		match ;

initial clk200 = 0 ;
initial pixelclock_p = 0 ;

always #(2500) clk200 = ~clk200 ;

always #(3300) pixelclock_p = ~pixelclock_p ;
assign pixelclock_n = ~pixelclock_p ;

initial
begin
reset = 1'b1 ;
#150000
reset = 1'b0;
end

top5x2_7to1_ddr_tx tx(
	.freqgen_p			(pixelclock_p),  
	.freqgen_n			(pixelclock_n),
	.reset				(reset),
	.clkout1_p			(clkout1_p),  
	.clkout1_n			(clkout1_n),
	.dataout1_p			(dataout1_p), 
	.dataout1_n			(dataout1_n),
	.clkout2_p			(clkout2_p),  
	.clkout2_n			(clkout2_n),
	.dataout2_p			(dataout2_p), 
	.dataout2_n			(dataout2_n)) ;
                                        
top5x2_7to1_ddr_rx rx(                  
	.reset				(reset),
	.refclkin			(clk200),
	.clkin1_p                       (clkout1_p),
	.clkin1_n			(clkout1_n),	
	.datain1_p               	(dataout1_p),	
	.datain1_n			(dataout1_n),	
	.clkin2_p                	(clkout2_p),	
	.clkin2_n			(clkout2_n),	
	.datain2_p               	(dataout2_p),	
	.datain2_n			(dataout2_n),	
	.dummy	 			(match)) ;

endmodule


