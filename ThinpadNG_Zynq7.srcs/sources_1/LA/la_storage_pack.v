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
            acq_data_valid);

input wire clk;
input wire rst_n;
output reg la_fifo_aresetn;
output reg [255:0]la_storage_axis_tdata;
output wire la_storage_axis_tlast;
output reg la_storage_axis_tvalid;
input wire la_storage_axis_tready;

input wire[2:0]  lock_level;
input wire[48+3-1:0] acq_data;
input wire acq_data_valid;

reg[4:0] selector;
reg [51*5-1:0]tmp_data;
(* MARK_DEBUG = "TRUE" *) reg la_overflow;

assign la_storage_axis_tlast = 0;

always @(posedge clk or negedge rst_n) begin : proc_la_fifo_aresetn
    if(~rst_n) begin
        la_fifo_aresetn <= 0;
    end else begin
        la_fifo_aresetn <= lock_level[2];
    end
end

always @(posedge clk or negedge rst_n) begin : proc_selector
    if(~rst_n) begin
        selector <= 5'b1;
    end else if(acq_data_valid) begin
        selector <= {selector[3:0],selector[4]};
    end
end

always @(posedge clk or negedge rst_n) begin : proc_tvalid
    if(~rst_n) begin
        la_storage_axis_tvalid <= 0;
    end else begin
        la_storage_axis_tvalid <= acq_data_valid & selector[4];
    end
end

always @(posedge clk or negedge rst_n) begin : proc_la_overflow
    if(~rst_n) begin
        la_overflow <= 0;
    end else if(la_storage_axis_tvalid && ~la_storage_axis_tready) begin
        la_overflow <= 1;
    end
end

integer i;
always @(posedge clk or negedge rst_n) begin : proc_tdata
    if(~rst_n) begin
        tmp_data <= 0;
    end else if(acq_data_valid) begin
        for (i = 0; i < 5; i=i+1) begin
            if(selector[i])
                tmp_data[51*i +: 51] <= acq_data;
        end
        tmp_data <= {selector[3:0],selector[4]};
    end
end

endmodule