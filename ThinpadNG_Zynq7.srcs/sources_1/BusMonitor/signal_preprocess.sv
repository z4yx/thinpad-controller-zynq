/*

        +---+
data_out    |
            +-----------+

            +---+
changed     |   |
        +---+   +-------+

        +---+---+---+---+
count     X | 0 | 1 | 2
        +---+---+---+---+

*/
`include "analyzer_defs.svh"
module signal_preprocess(
    data_in,
    info
);

parameter SIG_WIDTH = 1;
parameter CNT_WIDTH = 4;

input logic [SIG_WIDTH-1:0] data_in;
transition_info_if.src info;

logic clk, rst;
logic [SIG_WIDTH-1:0] synced;
logic reset_counter;

assign clk = info.clk;
assign rst = info.rst;

signal_sync #(
    .DATA_WIDTH(SIG_WIDTH), 
    .SYNC_CYCLE(1)
)sync_inst(
    .clk,
    .data_in,
    .data_out(synced)
);

transition_det #(
    .DATA_WIDTH(SIG_WIDTH)
)det_inst(
    .clk,
    .rst,
    .data_in(synced),
    .data_out(info.data),
    .changed(info.changed),
    .changing(reset_counter)
);

stable_counter #(
    .CNT_WIDTH(CNT_WIDTH)
)cnt_inst(
    .clk,
    .rst(reset_counter),
    .count(info.count)
);

    
endmodule
