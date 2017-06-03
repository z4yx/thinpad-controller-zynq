module bus_analyze (
    input wire clk,
    input wire rst_n,
    
    input wire[19:0] ram_addr_in,
    input wire[31:0] ram_dq_in,
    input wire ram_wr_n_in,
    input wire ram_rd_n_in,
    input wire ram_ce_n_in,
    input wire[3:0] ram_be_n_in,

    input wire[20:0] new_sample_cnt,
    input wire new_sample_valid,

    output wire[31:0] axis_data,
    output wire axis_valid,
    input wire axis_ready,
    output wire axis_tlast
);

wire[19:0] ram_addr_sync;
wire[31:0] ram_dq_sync;
wire ram_wr_n_sync;
wire ram_rd_n_sync;
wire ram_ce_n_sync;
wire[3:0] ram_be_n_sync;

wire[19:0] ram_addr;
wire[31:0] ram_dq;
wire ram_wr_n;
wire ram_rd_n;
wire ram_ce_n;
wire[3:0] ram_be_n;
wire addr_changed;

wire w_assert, r_assert;

signal_sync #(
    .DATA_WIDTH(20+32+3+4), 
    .SYNC_CYCLE(2)
)sync_inst(
    .clk     (clk),
    .data_in ({ram_addr_in, ram_dq_in, ram_wr_n_in, ram_rd_n_in, ram_ce_n_in, ram_be_n_in}),
    .data_out({ram_addr_sync, ram_dq_sync, ram_wr_n_sync, ram_rd_n_sync, ram_ce_n_sync, ram_be_n_sync})
);

signal_sync #(
    .DATA_WIDTH(32+3+4), 
    .SYNC_CYCLE(3)
)sync_inst2(
    .clk     (clk),
    .data_in ({ram_dq_sync, ram_wr_n_sync, ram_rd_n_sync, ram_ce_n_sync, ram_be_n_sync}),
    .data_out({ram_dq, ram_wr_n, ram_rd_n, ram_ce_n, ram_be_n})
);

transition_det #(
    .DATA_WIDTH(20)
)addr_t_det(
    .clk     (clk),
    .rst_n   (rst_n),
    .data_in (ram_addr_sync),
    .data_out(ram_addr),
    .changed (addr_changed)
);

ram_w_det #(
    .WRITE_CYCLE(2)
)w_det(
    .clk     (clk),
    .rst_n   (rst_n),
    .wr_n    (ram_wr_n),
    .ce_n    (ram_ce_n),
    .w_assert(w_assert)
);

ram_r_det #(
    .READ_CYCLE(2)
)r_det(
    .clk     (clk),
    .rst_n   (rst_n),
    .change_addr(addr_changed),
    .rd_n    (ram_rd_n),
    .ce_n    (ram_ce_n),
    .r_assert(r_assert)
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
    .clk     (clk),
    .data_in ({ram_addr, ram_dq, ram_be_n}),
    .data_out({record_addr,record_dq,record_be_n})
);

always @(posedge clk or negedge rst_n) begin : proc_oper
    if(~rst_n) begin
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

always @(posedge clk or negedge rst_n) begin : proc_write
    if(~rst_n) begin
        write_error <= 0;
        fifo_wreq <= 0;
    end else begin
        fifo_wreq <= (w_assert | r_assert) & sample_en;
        if(fifo_full && fifo_wreq)
            write_error <= 1;
    end
end

sample_fifo front_fifo(
    .clk(clk),
    .srst(~rst_n | new_sample_strobe),
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
    .rst_n   (rst_n),
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