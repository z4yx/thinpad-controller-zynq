//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Sun Feb 26 20:33:23 2017
//Host        : lightField-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target bd_0cd4.bd
//Design      : bd_0cd4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0cd4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0cd4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "design_1_system_ila3_0.hwdef" *) 
module bd_0cd4
   (clk,
    probe0);
  input clk;
  input [2:0]probe0;

  wire clk_1;
  wire [2:0]probe0_1;

  assign clk_1 = clk;
  assign probe0_1 = probe0[2:0];
  bd_0cd4_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(probe0_1));
endmodule
