module transition_det (
    clk,
    rst,
    data_in,
    data_out,
    changed,
    changing
);

parameter DATA_WIDTH = 1;

input wire clk;
input wire rst;
input wire [DATA_WIDTH-1:0] data_in;
output reg [DATA_WIDTH-1:0] data_out;
output reg changed;
output reg changing;

reg [DATA_WIDTH-1:0] data_buf[0:1];

always @(posedge clk) begin : proc_changed
    if(rst) begin
        changed <= 0;
        changing <= 0;
        data_out <= data_in;
        data_buf[1] <= data_in;
        data_buf[0] <= data_in;
    end else begin
        data_out <= data_buf[1];
        data_buf[1] <= data_buf[0];
        data_buf[0] <= data_in;
        changing <= (data_buf[1] != data_buf[0]);
        changed <= changing;
    end
end

endmodule
