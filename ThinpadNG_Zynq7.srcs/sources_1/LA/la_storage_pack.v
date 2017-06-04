module la_storage_pack (
/*autoport*/
//output
            la_fifo_aresetn,
            la_storage_axis_tdata,
            la_storage_axis_tlast,
            la_storage_axis_tvalid,
//input
            clk,
            rst_n,
            la_storage_axis_tready,
            lock_level,
            acq_data,
            acq_data_valid,
            ctl_storage_enable,
            ctl_clear_overflow,
            ctl_sample_cnt);

input wire clk;
input wire rst_n;
output reg la_fifo_aresetn;
output wire [255:0]la_storage_axis_tdata;
output wire la_storage_axis_tlast;
output reg la_storage_axis_tvalid;
input wire la_storage_axis_tready;

input wire[2:0]  lock_level;
input wire[48+3-1:0] acq_data;
input wire acq_data_valid;

input wire ctl_storage_enable;
input wire ctl_clear_overflow;
input wire[17:0] ctl_sample_cnt;

reg[48+3-1:0] acq_data_dly1;
reg acq_data_valid_dly1;

reg[4:0] selector;
reg [51*5-1:0]tmp_data;
(* MARK_DEBUG = "TRUE" *) reg la_overflow;
wire ctl_storage_enable_sync;
wire ctl_clear_overflow_sync;
wire[17:0] ctl_sample_cnt_sync;

assign la_storage_axis_tdata = {1'b0,tmp_data};

signal_sync #(
    .DATA_WIDTH(2), 
    .SYNC_CYCLE(2)
) sync_control(
    .clk     (clk),
    .data_in ({ctl_clear_overflow,ctl_storage_enable}),
    .data_out({ctl_clear_overflow_sync,ctl_storage_enable_sync})
);

signal_sync #(
    .DATA_WIDTH(18), 
    .SYNC_CYCLE(2)
) sync_cnt(
    .clk     (clk),
    .data_in (ctl_sample_cnt),
    .data_out(ctl_sample_cnt_sync)
);

gen_tlast tl(
    .rst_n            (rst_n),
    .sample_en        (ctl_storage_enable_sync),
    .sample_cnt_reload({14'b0,ctl_sample_cnt_sync}),
    .tready           (la_storage_axis_tready),
    .tvalid           (la_storage_axis_tvalid),
    .tlast            (la_storage_axis_tlast),
    .clk              (clk)
);

always @(posedge clk or negedge rst_n) begin : proc_acq_data_dly1
    if(~rst_n) begin
        acq_data_dly1 <= 0;
        acq_data_valid_dly1 <= 0;
    end else begin
        acq_data_dly1 <= acq_data;
        acq_data_valid_dly1 <= ctl_storage_enable_sync & acq_data_valid & (acq_data[2:0] != 0); //filter out NOP packet
    end
end

always @(posedge clk or negedge rst_n) begin : proc_la_fifo_aresetn
    if(~rst_n) begin
        la_fifo_aresetn <= 0;
    end else begin
        la_fifo_aresetn <= ctl_storage_enable_sync;
    end
end

always @(posedge clk or negedge rst_n) begin : proc_selector
    if(~rst_n) begin
        selector <= 5'b1;
    end else if(!ctl_storage_enable_sync) begin
        selector <= 5'b1;
    end else if(acq_data_valid_dly1) begin
        selector <= {selector[3:0],selector[4]};
    end
end

always @(posedge clk or negedge rst_n) begin : proc_tvalid
    if(~rst_n) begin
        la_storage_axis_tvalid <= 0;
    end else begin
        la_storage_axis_tvalid <= acq_data_valid_dly1 & selector[4];
    end
end

always @(posedge clk or negedge rst_n) begin : proc_la_overflow
    if(~rst_n) begin
        la_overflow <= 0;
    end else if(ctl_clear_overflow_sync)begin
        la_overflow <= 0;
    end else if(la_storage_axis_tvalid && ~la_storage_axis_tready) begin
        la_overflow <= 1;
    end
end

integer i;
always @(posedge clk or negedge rst_n) begin : proc_tdata
    if(~rst_n) begin
        tmp_data <= 0;
    end else if(acq_data_valid_dly1) begin
        for (i = 0; i < 5; i=i+1) begin
            if(selector[i])
                tmp_data[51*i +: 51] <= acq_data_dly1;
        end
    end
end

endmodule