// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:la_receiver:1.4
// IP Revision: 5

(* X_CORE_INFO = "la_receiver,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "la_receiver_0,la_receiver,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module la_receiver_0 (
  acq_data_out,
  acq_data_valid,
  raw_signal_result,
  raw_signal_update,
  lock_level,
  rx_pixel_clk,
  sampler_idle,
  reset,
  refclkin,
  clkin1_p,
  clkin1_n,
  datain1_p,
  datain1_n
);

output wire [50 : 0] acq_data_out;
output wire acq_data_valid;
output wire [255 : 0] raw_signal_result;
output wire raw_signal_update;
output wire [2 : 0] lock_level;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rx_pixel_clk, ASSOCIATED_RESET reset" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 rx_pixel_clk CLK" *)
output wire rx_pixel_clk;
output wire sampler_idle;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME refclkin, ASSOCIATED_RESET reset" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 refclkin CLK" *)
input wire refclkin;
input wire clkin1_p;
input wire clkin1_n;
input wire [3 : 0] datain1_p;
input wire [3 : 0] datain1_n;

  la_receiver #(
    .CHANNEL(16),
    .DATA_BITS(16)
  ) inst (
    .acq_data_out(acq_data_out),
    .acq_data_valid(acq_data_valid),
    .raw_signal_result(raw_signal_result),
    .raw_signal_update(raw_signal_update),
    .lock_level(lock_level),
    .rx_pixel_clk(rx_pixel_clk),
    .sampler_idle(sampler_idle),
    .reset(reset),
    .refclkin(refclkin),
    .clkin1_p(clkin1_p),
    .clkin1_n(clkin1_n),
    .datain1_p(datain1_p),
    .datain1_n(datain1_n)
  );
endmodule
