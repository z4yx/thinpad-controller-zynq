
`include "analyzer_defs.svh"
module fsm_read(
    transition_info_if.sink ram_addr,
    transition_info_if.sink ram_dq,
    transition_info_if.sink ram_we_n,
    transition_info_if.sink ram_oe_n,
    transition_info_if.sink ram_ce_n,
    transition_info_if.sink ram_be_n,
    transaction_timing_if.src timing,
    output logic read_assert
);

parameter ADDR_WIDTH = 20;
parameter CNT_WIDTH = 4;
parameter CYCLE_tAA = 2;
parameter CYCLE_tDOE = 1;
parameter CYCLE_tBA = 1;
parameter CYCLE_tACE = 2;

logic addr_satisfied, we_satisfied;
logic oe_satisfied, ce_satisfied;
logic be_satisfied;
logic clk, rst;
logic all_satisfied, all_satisfied_last;

assign clk = ram_addr.clk;
assign rst = ram_addr.rst;

assign read_assert = all_satisfied & ~all_satisfied_last;
assign timing.data = ram_dq.data;
assign timing.next_be_n = ram_be_n.data;
assign timing.next_we_n = ram_we_n.data;
assign timing.next_ce_n = ram_ce_n.data;
assign timing.oe_n = 0;
assign timing.next_oe_n = ram_oe_n.data;
assign timing.data_before = 0;

always_ff @(posedge clk)begin
    timing.addr <= ram_addr.data;
    timing.be_n <= ram_be_n.data;
    timing.ce_before <= ram_ce_n.count;
    timing.oe_before <= ram_oe_n.count;
    timing.be_before <= ram_be_n.count;
    timing.we_before <= ram_we_n.count;
    timing.addr_before <= ram_addr.count;
end

assign all_satisfied =
    addr_satisfied & we_satisfied & be_satisfied & oe_satisfied & ce_satisfied;
always_ff @(posedge clk) begin
    if(rst)begin
        addr_satisfied <= 1'b0;
        we_satisfied <= 1'b0;
        be_satisfied <= 1'b0;
        oe_satisfied <= 1'b0;
        ce_satisfied <= 1'b0;
        all_satisfied_last <= 1'b0;
    end else begin
        addr_satisfied <= ram_addr.count>=CYCLE_tAA-1;
        we_satisfied <= ram_we_n.count>=CYCLE_tBA-1 && ram_we_n.data==1'b1;
        be_satisfied <= ram_be_n.count>=CYCLE_tBA-1 && (&ram_be_n.data)==1'b0;
        oe_satisfied <= ram_oe_n.count>=CYCLE_tDOE-1 && ram_oe_n.data==1'b0;
        ce_satisfied <= ram_ce_n.count>=CYCLE_tACE-1 && ram_ce_n.data==1'b0;
        all_satisfied_last <= all_satisfied;
    end
end

endmodule
