/*
    clk_frontend: 6ns/cycle

*/

`include "analyzer_defs.svh"
module bus_analyze (
    input logic clk,
    input logic clk_frontend,
    input logic rst_n,
    
    input logic[19:0] ram_addr_in,
    input logic[31:0] ram_dq_in,
    input logic ram_we_n_in,
    input logic ram_oe_n_in,
    input logic ram_ce_n_in,
    input logic[3:0] ram_be_n_in,

    input logic[20:0] new_sample_cnt,
    input logic new_sample_valid,

    output logic[127:0] axis_data,
    output logic axis_valid,
    input logic axis_ready,
    output logic axis_tlast
);

parameter CNT_WIDTH = 6;

logic rst_frontend;

signal_sync #(
    .SYNC_CYCLE(2)
) rst_sync(
    .clk     (clk_frontend),
    .data_in (~rst_n),
    .data_out(rst_frontend)
);

transition_info_if #(.SIG_WIDTH(20),.CNT_WIDTH(CNT_WIDTH)) 
    ram_addr(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(20))
    trans_addr(
    .data_in(ram_addr_in),
    .info(ram_addr)
);

transition_info_if #(.SIG_WIDTH(32),.CNT_WIDTH(CNT_WIDTH)) 
    ram_dq(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(32))
    trans_dq(
    .data_in(ram_dq_in),
    .info(ram_dq)
);

transition_info_if #(.SIG_WIDTH(1),.CNT_WIDTH(CNT_WIDTH)) 
    ram_we_n(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(1))
    trans_wr(
    .data_in(ram_we_n_in),
    .info(ram_we_n)
);

transition_info_if #(.SIG_WIDTH(1),.CNT_WIDTH(CNT_WIDTH)) 
    ram_oe_n(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(1))
    trans_rd(
    .data_in(ram_oe_n_in),
    .info(ram_oe_n)
);

transition_info_if #(.SIG_WIDTH(1),.CNT_WIDTH(CNT_WIDTH)) 
    ram_ce_n(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(1))
    trans_ce(
    .data_in(ram_ce_n_in),
    .info(ram_ce_n)
);

transition_info_if #(.SIG_WIDTH(4),.CNT_WIDTH(CNT_WIDTH)) 
    ram_be_n(clk_frontend, rst_frontend);
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(4))
    trans_be(
    .data_in(ram_be_n_in),
    .info(ram_be_n)
);

logic w_assert, r_assert;
transaction_timing_if #(.ADDR_WIDTH(20), .CNT_WIDTH(CNT_WIDTH)) w_timing();
transaction_timing_if #(.ADDR_WIDTH(20), .CNT_WIDTH(CNT_WIDTH)) r_timing();

fsm_read #(.ADDR_WIDTH(20)) read_analyze(
    .ram_addr,
    .ram_dq,
    .ram_we_n,
    .ram_oe_n,
    .ram_ce_n,
    .ram_be_n,
    .read_assert(r_assert),
    .timing(r_timing)
);

fsm_write #(.ADDR_WIDTH(20),.CNT_WIDTH(CNT_WIDTH)) write_analyze(
    .ram_addr,
    .ram_dq,
    .ram_we_n,
    .ram_oe_n,
    .ram_ce_n,
    .ram_be_n,
    .write_assert(w_assert),
    .timing(w_timing)
);

sram_analyze_record_t record;

always_ff @(posedge clk_frontend) begin
    record.op_read <= r_assert;
    record.op_write <= w_assert;
    record.resvd1 <= 0;
    record.resvd2 <= 0;
    record.const0 <= 0;
    if(w_assert)begin
        record.addr      <= w_timing.addr;
        record.dq        <= w_timing.data;
        record.be_n      <= w_timing.be_n;
        record.oe_n      <= w_timing.oe_n;
        record.ce_before <= w_timing.ce_before;
        record.oe_before <= w_timing.oe_before;
        record.be_before <= w_timing.be_before;
        record.we_before <= w_timing.we_before;
        record.data_before <= w_timing.data_before;
        record.addr_before <= w_timing.addr_before;
    end else if(r_assert)begin
        record.addr      <= r_timing.addr;
        record.dq        <= r_timing.data;
        record.be_n      <= r_timing.be_n;
        // record.oe_n      <= r_timing.oe_n;
        record.ce_before <= r_timing.ce_before;
        record.oe_before <= r_timing.oe_before;
        record.be_before <= r_timing.be_before;
        record.we_before <= r_timing.we_before;
        record.data_before <= r_timing.data_before;
        record.addr_before <= r_timing.addr_before;
    end
end

logic fifo_wreq;
logic fifo_full;
logic write_error;
logic sample_en;
logic sample_en_sync;

logic fifo_rreq;
logic fifo_empty;

logic [127:0] fifo_to_controller;
logic new_sample_change;
logic new_sample_valid_dly;
logic new_sample_strobe = new_sample_valid_dly & new_sample_change;
logic new_sample_valid_sync;
logic [20:0] new_sample_cnt_sync;

always_ff @(posedge clk_frontend) begin : proc_write
    if(rst_frontend) begin
        write_error <= 0;
        fifo_wreq <= 0;
    end else begin
        fifo_wreq <= (w_assert | r_assert) & sample_en_sync;
        if(fifo_full && fifo_wreq)
            write_error <= 1;
    end
end

signal_sync #(
    .SYNC_CYCLE(2)
) sync_sample_en(
    .clk     (clk_frontend),
    .data_in (sample_en),
    .data_out(sample_en_sync)
);

anaylzer_fifo front_fifo(
    .wr_clk(clk_frontend),
    .rd_clk(clk),
    .rst(~sample_en),
    .din(record),
    .dout(fifo_to_controller),
    .wr_en(fifo_wreq),
    .full(fifo_full),
    .rd_en(fifo_rreq),
    .empty(fifo_empty)
);

signal_sync #(
    .DATA_WIDTH(22), 
    .SYNC_CYCLE(2)
) sync_control(
    .clk     (clk),
    .data_in ({new_sample_cnt,new_sample_valid}),
    .data_out({new_sample_cnt_sync,new_sample_valid_sync})
);

transition_det new_sample(
    .clk     (clk),
    .rst     (~rst_n),
    .data_in (new_sample_valid_sync),
    .data_out(new_sample_valid_dly),
    .changing(),
    .changed (new_sample_change)
);

sample_ctl ctl(
    .clk              (clk),
    .rst_n            (rst_n),
    .sample_en        (sample_en),
    .new_sample_cnt   (new_sample_cnt_sync),
    .new_sample_strobe(new_sample_strobe),
    .fifo_data        (fifo_to_controller),
    .fifo_empty       (fifo_empty),
    .fifo_rreq        (fifo_rreq),
    .axis_data        (axis_data),
    .axis_valid       (axis_valid),
    .axis_ready       (axis_ready),
    .axis_tlast       (axis_tlast)
);

endmodule
