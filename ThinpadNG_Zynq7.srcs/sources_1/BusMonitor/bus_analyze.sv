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

parameter CNT_WIDTH = 4;

logic rst_frontend;

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
signal_preprocess #(.CNT_WIDTH(CNT_WIDTH),.SIG_WIDTH(1))
    trans_be(
    .data_in(ram_be_n_in),
    .info(ram_be_n)
);

logic w_assert, r_assert;
transaction_timing_if w_timing, r_timing;

fsm_read read_analyze(
    .ram_addr,
    .ram_dq,
    .ram_we_n,
    .ram_oe_n,
    .ram_ce_n,
    .ram_be_n,
    .timing(r_timing)
);

reg[3:0] oper;
wire[19:0] record_addr;
wire[31:0] record_dq;
wire[3:0] record_be_n;
wire[31:0] fifo_to_controller;
reg fifo_wreq;
wire fifo_full;
wire fifo_rreq;
wire fifo_empty;
wire sample_en;


signal_sync #(
    .DATA_WIDTH(20+32+4), 
    .SYNC_CYCLE(3)
)delay_cyc(
    .clk     (clk_frontend),
    .data_in ({ram_addr, ram_dq, ram_be_n}),
    .data_out({record_addr,record_dq,record_be_n})
);

always @(posedge clk_frontend) begin : proc_oper
    if(rst_frontend) begin
        oper <= 0;
    end else if(w_assert) begin
        oper <= 1;
    end else if(r_assert) begin
        oper <= 2;
    end else begin 
        oper <= 0;
    end
end

reg write_error;
wire new_sample_change;
wire new_sample_valid_dly;
wire new_sample_strobe = new_sample_valid_dly & new_sample_change;
wire new_sample_valid_sync;
wire [20:0] new_sample_cnt_sync;
wire sample_en_sync;

always @(posedge clk_frontend) begin : proc_write
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

sample_fifo front_fifo(
    .wr_clk(clk_frontend),
    .rd_clk(clk),
    .rst(~sample_en),
    .din({4'b0, record_addr, record_be_n, oper, record_dq}),
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
