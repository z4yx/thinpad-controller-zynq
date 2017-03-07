//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
//Date        : Mon Mar  6 23:57:40 2017
//Host        : skyworks running 64-bit Ubuntu 16.04.1 LTS
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
