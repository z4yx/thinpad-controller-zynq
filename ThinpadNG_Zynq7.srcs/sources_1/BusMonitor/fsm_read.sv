
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
parameter CYCLE_tAA = 2;
parameter CYCLE_tDOE = 1;
parameter CYCLE_tBA = 1;
parameter CYCLE_tACE = 2;

logic addr_satisfied, we_satisfied;
logic oe_satisfied, ce_satisfied;
logic be_satisfied;
logic [31:0] dq_buf;
logic [ADDR_WIDTH-1:0] addr_buf;
logic [3:0] be_buf;
logic clk, rst;
logic all_satisfied, all_satisfied_last;

assign clk = ram_addr.clk;
assign rst = ram_addr.rst;

assign addr_satisfied = ram_addr.count>=CYCLE_tAA;
assign we_satisfied = ram_we_n.count>=CYCLE_tBA && ram_we_n.data==1'b1;
assign be_satisfied = ram_be_n.count>=CYCLE_tBA && (&ram_be_n.data)==1'b0;
assign oe_satisfied = ram_oe_n.count>=CYCLE_tDOE && ram_oe_n.data==1'b0;
assign ce_satisfied = ram_ce_n.count>=CYCLE_tACE && ram_ce_n.data==1'b0;

assign read_assert = all_satisfied & ~all_satisfied_last;
assign timing.addr = addr_buf;
assign timing.data = dq_buf;
assign timing.be_n = be_buf;

assign timing.ce_before = ram_ce_n.count;
assign timing.oe_before = 0;
assign timing.oe_before = ram_oe_n.count;
assign timing.be_before = ram_be_n.count;
assign timing.we_before = ram_we_n.count;
assign timing.data_before = 0;
assign timing.addr_before = ram_addr.count;

always_ff @(posedge clk)begin
    dq_buf <= ram_dq.data;
    addr_buf <= ram_addr.data;
    be_buf <= ram_be_n.data;
end

always_ff @(posedge clk) begin
    if(rst)begin
        all_satisfied <= 1'b0;
        all_satisfied_last <= 1'b0;
    end else begin
        all_satisfied <=
            addr_satisfied & we_satisfied & be_satisfied & oe_satisfied & ce_satisfied;
        all_satisfied_last <= all_satisfied;
    end
end

endmodule
