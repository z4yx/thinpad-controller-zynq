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
typedef struct packed{
    logic[31:0] dq_o;
    logic[19:0] a;
    logic wen;
    logic oen;
    logic cen;
    logic[3:0] ben;
}sram_pin_t;
module analyzer_tb(

    );

parameter DATA_CNT_TOTAL = 1000;
parameter FRONTEND_CLK_PS = 4000;

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

reg host_selected=0;
wire[31:0] dq;
sram_pin_t t1,t2,s1;
assign dq = s1.oen ? s1.dq_o : {32{1'bz}};
wire[1:0] dummy_addr;

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

AS7C34098A base1(/*autoinst*/
            .DataIO(dq[15:0]),
            .Address(s1.a[17:0]),
            .OE_n(s1.oen),
            .CE_n(s1.cen),
            .WE_n(s1.wen),
            .LB_n(s1.ben[0]),
            .UB_n(s1.ben[1]));
AS7C34098A base2(/*autoinst*/
            .DataIO(dq[31:16]),
            .Address(s1.a[17:0]),
            .OE_n(s1.oen),
            .CE_n(s1.cen),
            .WE_n(s1.wen),
            .LB_n(s1.ben[2]),
            .UB_n(s1.ben[3]));

assign t1.cen = 1'b0;
two_port ram_ctl(/*autoinst*/
           .ram_data_i(dq),
           .ram_data_o(t1.dq_o),
           .ram_address({t1.a,dummy_addr}),
           .ram_wr_n(t1.wen),
           .ram_rd_n(t1.oen),
           .ram_be_n(t1.ben),

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

bus_analyze #(.CLK_FRONTEND_CYCLE_PS(FRONTEND_CLK_PS)) analyzer(
    .clk             (clk_amba),
    .clk_frontend    (clk_frontend),
    .rst_n           (rst_n),
    .ram_addr_in     (s1.a),
    .ram_dq_in       (dq),
    .ram_we_n_in     (s1.wen),
    .ram_oe_n_in     (s1.oen),
    .ram_ce_n_in     (s1.cen),
    .ram_be_n_in     (s1.ben),
    .new_sample_cnt  (new_sample_cnt),
    .new_sample_valid(new_sample_valid),
    .axis_data       (axis_data),
    .axis_valid      (axis_valid),
    .axis_ready      (axis_ready),
    .axis_tlast      (axis_tlast)
);

always_comb begin
    if(host_selected == 0)
        s1 = t1;
    else
        s1 = t2;
    
end

always #5  clk_amba = ~clk_amba; // 100M
always #(FRONTEND_CLK_PS/2000)  clk_frontend = ~clk_frontend; // 250M
always #15 clk_ramctl = ~clk_ramctl; // 30M

initial begin : gen
    integer i;
    wait(rst_n==1);
    i = 0;
    repeat(8) begin // regular access tests
        ibus_ram_address = {i,2'b0};
        ibus_ram_byteenable = $random()&4'hf;
        ibus_ram_read = 1;
        i = i+1;
        dbus_ram_address = {i,2'b0};//($random()&8'hff)<<2;
        dbus_ram_write = 1;//$random()&1;
        dbus_ram_read = ~dbus_ram_write;
        dbus_ram_byteenable = $random()&4'hf;
        dbus_ram_wrdata = $random();
        repeat(4) @(negedge clk_ramctl);
    end

    t2 = 0;
    t2 = ~t2; // fill all "1"
    host_selected = 1;
    repeat(1000)begin 
        if($random()%100>87)begin 
            t2.dq_o = $random();
        end
        if($random()%100>87)begin 
            t2.a = $random();
        end
        if($random()%100>87)begin 
            t2.ben = $random();
        end
        if($random()%100>87)begin 
            t2.wen ^= 1;
        end
        if($random()%100>87)begin 
            t2.oen ^= 1;
        end
        if($random()%100>87)begin 
            t2.cen ^= 1;
        end
        #1;
    end
end

initial begin 
    repeat(5) @(posedge clk_ramctl);
    #1 rst_n = 1;
end

sram_analyze_record_t rec = 0;
reg[20:0] cnt = 0;
event finished;

task print_record();
    automatic reg [7:0] tmp;
    automatic reg [15:0] ns,off;
    ns = FRONTEND_CLK_PS/1000;
    if(rec.op_write == rec.op_read)
        $stop;
    tmp = rec.op_read ? 8'h52 : 8'h57;
    off = rec.op_read ? 0 : 1;
    $display("%0t: %h %c %b %h",$time,rec.addr,tmp,rec.be_n,rec.dq);
    $display("    ce:%0d oe:%0d be:%0d we:%0d dq:%0d a:%0d",
        (rec.ce_before+off)*ns, (rec.oe_before+off)*ns, (rec.be_before+off)*ns,
        (rec.we_before+off)*ns, (rec.data_before+off)*ns, (rec.addr_before+off)*ns);
endtask
always@(posedge clk_amba)
begin 
    if(axis_valid & axis_ready)begin 
        cnt = cnt+1;
        rec = axis_data;
        print_record();
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
