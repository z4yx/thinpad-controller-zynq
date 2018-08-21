module sample_ctl (
    input wire clk,
    input wire rst_n,
    
    output reg sample_en,
    input wire[20:0] new_sample_cnt,
    input wire new_sample_strobe,

    input wire[31:0] fifo_data,
    input wire fifo_empty,
    output wire fifo_rreq,

    output reg[31:0] axis_data,
    output wire axis_valid,
    input wire axis_ready,
    output wire axis_tlast
);

reg [20:0] sample_cnt;

reg fifo_valid;
reg axis_valid_;
reg int_valid[0:1];
reg [31:0] int_data[0:1];

assign axis_tlast  = (sample_cnt == 1);
assign fifo_rreq = axis_ready & ~fifo_empty;
assign axis_valid = axis_valid_ & sample_en;

always @(posedge clk or negedge rst_n) begin : proc_buf
    if(~rst_n) begin
        fifo_valid <= 0;
        int_valid[0] <= 0;
        int_valid[1] <= 0;
    end else begin
        if(axis_ready)begin 
            fifo_valid <= fifo_rreq;
            int_valid[0] <= fifo_valid;
            int_valid[1] <= int_valid[0];
            axis_valid_ <= int_valid[1];
            int_data[0] <= fifo_data;
            int_data[1] <= int_data[0];
            axis_data <= int_data[1];
        end else begin 
            // axis_valid_ <= 0;
        end
    end
end

always @(posedge clk or negedge rst_n) begin : proc_sample_en
    if(~rst_n) begin
        sample_en <= 0;
    end else if(axis_ready & axis_valid) begin
        sample_en <= ~axis_tlast;
    end else if(new_sample_strobe) begin 
        sample_en <= 1;
    end
end

always @(posedge clk or negedge rst_n) begin : proc_sample_cnt
    if(~rst_n) begin
        sample_cnt <= 0;
    end else if(new_sample_strobe) begin 
        sample_cnt <= new_sample_cnt;
    end else if(axis_ready & axis_valid) begin
        sample_cnt <= sample_cnt - 1;
    end
end

endmodule