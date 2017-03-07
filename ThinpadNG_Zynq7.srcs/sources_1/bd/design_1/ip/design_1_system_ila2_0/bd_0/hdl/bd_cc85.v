//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1733598 Wed Dec 14 22:35:42 MST 2016
//Date        : Mon Mar  6 23:57:44 2017
//Host        : skyworks running 64-bit Ubuntu 16.04.1 LTS
//Command     : generate_target bd_cc85.bd
//Design      : bd_cc85
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_cc85,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_cc85,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1_system_ila2_0.hwdef" *) 
module bd_cc85
   (clk,
    probe0);
  input clk;
  input [2:0]probe0;

  wire clk_1;
  wire [2:0]probe0_1;

  assign clk_1 = clk;
  assign probe0_1 = probe0[2:0];
  bd_cc85_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(probe0_1));
endmodule
