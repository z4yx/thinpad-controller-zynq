//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Fri Nov 18 21:07:40 2016
//Host        : lightField-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target bd_384c_wrapper.bd
//Design      : bd_384c_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_384c_wrapper
   (clk,
    probe0);
  input clk;
  input [0:0]probe0;

  wire clk;
  wire [0:0]probe0;

  bd_384c bd_384c_i
       (.clk(clk),
        .probe0(probe0));
endmodule
