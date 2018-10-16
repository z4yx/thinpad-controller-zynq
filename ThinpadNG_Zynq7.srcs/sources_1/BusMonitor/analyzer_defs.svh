`ifndef ANALYZER_DEFS_HEADER
`define ANALYZER_DEFS_HEADER

interface transition_info_if #(SIG_WIDTH=1,CNT_WIDTH=4) (input clk, input rst);

logic [SIG_WIDTH-1:0] data;
logic changed;
logic [CNT_WIDTH-1:0] count;

modport src(input clk, rst, output changed, count, data);
modport sink(input clk, rst, changed, count, data);

endinterface

interface transaction_timing_if #(ADDR_WIDTH=20,CNT_WIDTH=4) ();

logic [31:0] data;
logic [ADDR_WIDTH-1:0] addr;
logic [3:0] be_n;
logic oe_n;

logic [CNT_WIDTH-1:0] ce_before, oe_before, be_before, we_before, data_before, addr_before;

modport src(output data, addr, be_n, oe_n, ce_before, oe_before, be_before, we_before, data_before, addr_before);
modport sink(input data, addr, be_n, oe_n, ce_before, oe_before, be_before, we_before, data_before, addr_before);

endinterface

typedef struct packed {
    logic op_read;
    logic op_write;
    logic [3:0] resvd1;
    logic [19:0] addr;
    logic [5:0] ce_before;
    // ---------- 32bit ----------
    logic [26:0] resvd2;
    logic [3:0] be_n;
    logic oe_n;
    // ---------- 32bit ----------
    logic [1:0] const0;
    logic [5:0] oe_before;
    logic [5:0] be_before;
    logic [5:0] we_before;
    logic [5:0] data_before;
    logic [5:0] addr_before;
    // ---------- 32bit ----------
    logic [31:0] dq;
}sram_analyze_record_t;

`endif
