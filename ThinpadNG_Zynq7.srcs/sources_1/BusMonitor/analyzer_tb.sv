`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/28 10:30:57
// Design Name: 
// Module Name: analyzer_tb
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


`include "analyzer_defs.svh"
`default_nettype none
module analyzer_tb(

    );

parameter DATA_CNT_TOTAL = 1000;

reg rst_n = 0;
reg clk_frontend = 0;
reg clk_amba = 0;
reg clk_ramctl = 0;

reg[20:0] new_sample_cnt;
reg new_sample_valid = 0;

wire[127:0] axis_data;
wire axis_valid;
wire axis_ready=1;
wire axis_tlast;

wire[31:0] base_ram_data, base_ram_data_o;
wire[19:0] base_ram_address;
wire[1:0] dummy_addr;
wire base_ram_we_n;
wire base_ram_oe_n;
wire base_ram_ce_n=0;
wire[3:0] base_ram_be;

reg [23:0]ibus_ram_address;
wire [31:0]ibus_ram_rddata;
reg [31:0]ibus_ram_wrdata;
reg [3:0]ibus_ram_byteenable=0;
reg ibus_ram_read=0;
reg ibus_ram_write=0;

reg [23:0]dbus_ram_address;
wire [31:0]dbus_ram_rddata;
reg [31:0]dbus_ram_wrdata;
reg [3:0]dbus_ram_byteenable=0;
reg dbus_ram_read=0;
reg dbus_ram_write=0;

assign base_ram_data = base_ram_oe_n ? base_ram_data_o : {32{1'bz}};

AS7C34098A base1(/*autoinst*/
            .DataIO(base_ram_data[15:0]),
            .Address(base_ram_address[17:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(~base_ram_be[0]),
            .UB_n(~base_ram_be[1]));
AS7C34098A base2(/*autoinst*/
            .DataIO(base_ram_data[31:16]),
            .Address(base_ram_address[17:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(~base_ram_be[2]),
            .UB_n(~base_ram_be[3]));
two_port ram_ctl(/*autoinst*/
           .ram_data_i(base_ram_data),
           .ram_data_o(base_ram_data_o),
           .ram_address({base_ram_address,dummy_addr}),
           .ram_wr_n(base_ram_we_n),
           .ram_rd_n(base_ram_oe_n),
           .dataenable(base_ram_be),
           
           .rst_n(rst_n),
           .clk2x(clk_ramctl),

           .address1(ibus_ram_address),
           .wrdata1(ibus_ram_wrdata),
           .rd1(ibus_ram_read),
           .wr1(ibus_ram_write),
           .dataenable1(ibus_ram_byteenable),
           .rddata1(ibus_ram_rddata),
           .rddata2(dbus_ram_rddata),
           .address2(dbus_ram_address),
           .wrdata2(dbus_ram_wrdata),
           .rd2(dbus_ram_read),
           .wr2(dbus_ram_write),
           .dataenable2(dbus_ram_byteenable));

bus_analyze analyzer(
    .clk             (clk_amba),
    .clk_frontend    (clk_frontend),
    .rst_n           (rst_n),
    .ram_addr_in     (base_ram_address),
    .ram_dq_in       (base_ram_data),
    .ram_we_n_in     (base_ram_we_n),
    .ram_oe_n_in     (base_ram_oe_n),
    .ram_ce_n_in     (base_ram_ce_n),
    .ram_be_n_in     (~base_ram_be),
    .new_sample_cnt  (new_sample_cnt),
    .new_sample_valid(new_sample_valid),
    .axis_data       (axis_data),
    .axis_valid      (axis_valid),
    .axis_ready      (axis_ready),
    .axis_tlast      (axis_tlast)
);

always #5  clk_amba = ~clk_amba; // 100M
always #2  clk_frontend = ~clk_frontend; // 250M
always #15 clk_ramctl = ~clk_ramctl; // 30M

initial begin : gen
    integer i;
    wait(rst_n==1);
    repeat(10) @(negedge clk_ramctl);
    i = 0;
    forever begin 
        ibus_ram_address = {i,2'b0};
        ibus_ram_byteenable = $random()&4'hf;
        ibus_ram_read = 1;
        i = i+1;
        dbus_ram_address = {i,2'b0};//($random()&8'hff)<<2;
        dbus_ram_write = $random()&1;
        dbus_ram_read = ~dbus_ram_write;
        dbus_ram_byteenable = $random()&4'hf;
        dbus_ram_wrdata = $random();
        repeat(1) @(negedge clk_ramctl);
    end
end

initial begin 
    repeat(5) @(posedge clk_amba);
    #1 rst_n = 1;
end

sram_analyze_record_t last_out = 0;
reg[20:0] cnt = 0;
event finished;
always@(posedge clk_amba)
begin 
    if(axis_valid & axis_ready)begin 
        cnt = cnt+1;
        last_out = axis_data;
        if(cnt == DATA_CNT_TOTAL)begin 
            $display("test end");
            if(~axis_tlast)begin
                $error("tlast not high");
                $stop;
            end
            -> finished;
        end
        else if(cnt > DATA_CNT_TOTAL) begin
            $stop;
        end 
        else begin 
            if(axis_tlast)
                $stop;
        end
    end
end

initial begin 
    wait(rst_n==1);
    repeat(10) @(negedge clk_amba);
    @(negedge clk_amba);
    new_sample_cnt = DATA_CNT_TOTAL;
    new_sample_valid = 1;
    @(finished);
    new_sample_valid = 0;
    cnt = 0;
    @(negedge clk_amba);
    new_sample_cnt = DATA_CNT_TOTAL;
    new_sample_valid = 1;
    @(negedge clk_amba);
    new_sample_valid = 0;
end

endmodule
