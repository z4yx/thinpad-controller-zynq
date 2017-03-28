`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/28 10:46:58
// Design Name: 
// Module Name: sample_ctl_tb
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


module sample_ctl_tb(

    );

parameter DATA_CNT_TOTAL = 1000;

reg clk = 0;
reg rst_n = 0;

wire[31:0] fifo_to_controller;
reg [64:0] fifo_din=0;
reg fifo_wreq = 0;
wire fifo_full;
wire fifo_rreq;
wire fifo_empty;

wire[31:0] axis_data;
wire axis_valid;
reg axis_ready = 0;
wire axis_tlast;

reg[20:0] new_sample_cnt;
reg new_sample_strobe = 0;

sample_fifo front_fifo(
    .clk(clk),
    .srst(~rst_n),
    .din(fifo_din),
    .dout(fifo_to_controller),
    .wr_en(fifo_wreq),
    .full(fifo_full),
    .rd_en(fifo_rreq),
    .empty(fifo_empty)
);

sample_ctl dut(
    .clk              (clk),
    .rst_n            (rst_n),
    .sample_en        (sample_en),
    .new_sample_cnt   (new_sample_cnt),
    .new_sample_strobe(new_sample_strobe),
    .fifo_data        (fifo_to_controller),
    .fifo_empty       (fifo_empty),
    .fifo_rreq        (fifo_rreq),
    .axis_data        (axis_data),
    .axis_valid       (axis_valid),
    .axis_ready       (axis_ready),
    .axis_tlast       (axis_tlast)
);

always #5 clk = ~clk;

initial begin : fifo_w
    integer i;
    wait(rst_n==1);
    i = 1;
    forever begin 
        @(posedge clk);
        #1;
        fifo_din = i<<32 | (i+1);
        if(($random()&7)==0)begin
            fifo_wreq = 1;
            i = i+2;
        end else begin 
            fifo_wreq = 0;
        end
    end
end

always@(posedge clk)
begin 
    #1 axis_ready <= ($random()&3)!=0;
end

integer last_out = 0;
always@(posedge clk)
begin 
    if(axis_valid & axis_ready)begin 
        $display("%x",axis_data);
        if(axis_data > DATA_CNT_TOTAL)
            $stop;
        if(axis_data != last_out+1)
            $stop;
        last_out = axis_data;
    end
end


initial begin 
    repeat(5) @(posedge clk);
    #1 rst_n = 1;
end

initial begin 
    wait(rst_n==1);
    @(posedge clk);
    #1;
    new_sample_cnt = DATA_CNT_TOTAL;
    new_sample_strobe = 1;
    @(posedge clk);
    #1;
    new_sample_strobe = 0;
end

endmodule
