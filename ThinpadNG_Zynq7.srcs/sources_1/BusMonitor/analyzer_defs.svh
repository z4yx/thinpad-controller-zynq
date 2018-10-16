`ifndef ANALYZER_DEFS_HEADER
`define ANALYZER_DEFS_HEADER

interface transition_info_if #(SIG_WIDTH=1,CNT_WIDTH=4) (input clk, input rst);

logic [SIG_WIDTH-1:0] data;
logic changed;
logic [CNT_WIDTH-1:0] count;

modport src(input clk, rst, output changed, count, data);
modport sink(input clk, rst, changed, count, data);

endinterface

interface transaction_timing_if #(ADDR_WIDTH=20,CNT_WIDTH=4);

logic [31:0] data;
logic [ADDR_WIDTH-1:0] addr;

logic [CNT_WIDTH-1:0] ce_before, oe_before, be_before, we_before, data_before, addr_before;

modport src(output data, addr, ce_before, oe_before, be_before, we_before, data_before, addr_before);
modport sink(input data, addr, ce_before, oe_before, be_before, we_before, data_before, addr_before);

endinterface

`endif
