`include "analyzer_defs.svh"
module fsm_write(
    transition_info_if.sink ram_addr,
    transition_info_if.sink ram_dq,
    transition_info_if.sink ram_we_n,
    transition_info_if.sink ram_oe_n,
    transition_info_if.sink ram_ce_n,
    transition_info_if.sink ram_be_n,
    transaction_timing_if.src timing,
    output logic write_assert
);

parameter ADDR_WIDTH = 20;
parameter CNT_WIDTH = 4;

logic [CNT_WIDTH-1:0] ce_before_buf;
logic [CNT_WIDTH-1:0] oe_before_buf;
logic [CNT_WIDTH-1:0] be_before_buf;
logic [CNT_WIDTH-1:0] we_before_buf;
logic [CNT_WIDTH-1:0] data_before_buf;
logic [CNT_WIDTH-1:0] addr_before_buf;
logic [3:0] be_buf;
logic oe_buf;
logic [31:0] dq_buf;
logic [ADDR_WIDTH-1:0] addr_buf;

logic data_prepare_state;
logic ce_controlled;
logic we_controlled;
logic be_controlled;
logic be_rising_bits;

always_ff @(posedge ram_addr.clk)begin
    ce_before_buf <= ram_ce_n.count;
    oe_before_buf <= ram_oe_n.count;
    be_before_buf <= ram_be_n.count;
    we_before_buf <= ram_we_n.count;
    data_before_buf <= ram_dq.count;
    addr_before_buf <= ram_addr.count;
    be_buf <= ram_be_n.data;
    oe_buf <= ram_oe_n.data;
    dq_buf <= ram_dq.data;
    addr_buf <= ram_addr.data;

    data_prepare_state <=
        ~ram_ce_n.data & ~ram_we_n.data & ~(&ram_be_n.data);
end

assign ce_controlled = ram_ce_n.changed & data_prepare_state;
assign we_controlled = ram_we_n.changed & data_prepare_state;
assign be_controlled = be_rising_bits & data_prepare_state;
assign be_rising_bits = |((ram_be_n.data^be_buf)&ram_be_n.data);

always_ff @(posedge ram_addr.clk)begin
    timing.ce_before <= ce_before_buf;
    timing.oe_before <= oe_before_buf;
    timing.be_before <= be_before_buf;
    timing.we_before <= we_before_buf;
    timing.data_before <= data_before_buf;
    timing.addr_before <= addr_before_buf;
    timing.be_n <= be_buf;
    timing.next_be_n <= ram_be_n.data;
    timing.next_we_n <= ram_we_n.data;
    timing.next_ce_n <= ram_ce_n.data;
    timing.oe_n <= oe_buf;
    timing.next_oe_n <= ram_oe_n.data;
    timing.addr <= addr_buf;
    timing.data <= dq_buf;

    write_assert <= ce_controlled | we_controlled | be_controlled;
end

endmodule
