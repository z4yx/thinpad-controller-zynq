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

xpm_cdc_array_single #(
  .DEST_SYNC_FF   (2), // integer; range: 2-10
  .INIT_SYNC_FF   (0), // integer; 0=disable simulation init values, 1=enable simulation init values
  .SIM_ASSERT_CHK (0), // integer; 0=disable simulation messages, 1=enable simulation messages
  .SRC_INPUT_REG  (0), // integer; 0=do not register input, 1=register input
  .WIDTH          (SIG_WIDTH)  // integer; range: 1-1024
) sig_sync (
  .src_in   (data_in),
  .dest_clk (clk),
  .dest_out (synced)
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
    .rst(reset_counter|rst),
    .count(info.count)
);

    
endmodule
