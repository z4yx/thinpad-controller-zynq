`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/01 17:11:47
// Design Name: 
// Module Name: tb
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


module tb();

reg clk = 0;
reg rst_n = 0;
reg [31:0] APB_paddr = 0;
reg        APB_psel = 0;
reg        APB_penable = 0;
reg        APB_pwrite = 0;
reg [31:0] APB_pwdata = 0;
wire        APB_pready;

always #5 clk = ~clk;


zynq_dna_usr_data_v1_0 dut(
    .APB_aclk(clk),
    .APB_aresetn(rst_n),

    .APB_paddr(APB_paddr),
    .APB_psel(APB_psel),
    .APB_penable(APB_penable),
    .APB_pwrite(APB_pwrite),
    .APB_pwdata(APB_pwdata),
    .APB_pready(APB_pready)
);

initial begin
    repeat(5) @(negedge clk);
    rst_n = 1;

    @(negedge clk);
    APB_paddr <= (2 << 2);
    APB_psel <= 1;
    @(negedge clk);
    APB_penable <= 1;
    wait(APB_pready == 1'b1);
    @(negedge clk);
    APB_penable <= 0;
    APB_psel <= 0;
end
endmodule
