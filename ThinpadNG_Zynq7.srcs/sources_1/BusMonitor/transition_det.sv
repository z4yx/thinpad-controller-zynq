module transition_det (
    clk,
    rst,
    data_in,
    data_out,
    changed,
    changing
);

parameter DATA_WIDTH = 1;

input logic clk;
input logic rst;
input logic [DATA_WIDTH-1:0] data_in;
output logic [DATA_WIDTH-1:0] data_out;
output logic changed;
output logic changing;

logic [DATA_WIDTH-1:0] data_buf[0:1];

always_ff @(posedge clk) begin : proc_changed
    if(rst) begin
        changed <= 0;
        changing <= 0;
        data_out <= 0;
        data_buf[1] <= 0;
        data_buf[0] <= 0;
    end else begin
        data_out <= data_buf[1];
        data_buf[1] <= data_buf[0];
        data_buf[0] <= data_in;
        changing <= (data_buf[1] != data_buf[0]);
        changed <= changing;
    end
end

endmodule
