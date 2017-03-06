//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Mon Feb 27 13:15:22 2017
//Host        : lightField-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target bd_cc85_wrapper.bd
//Design      : bd_cc85_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_cc85_wrapper
   (clk,
    probe0);
  input clk;
  input [2:0]probe0;

  wire clk;
  wire [2:0]probe0;

  bd_cc85 bd_cc85_i
       (.clk(clk),
        .probe0(probe0));
endmodule
