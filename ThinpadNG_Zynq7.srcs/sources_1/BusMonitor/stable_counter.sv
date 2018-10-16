module stable_counter (
    clk,
    rst,
    count
);

parameter CNT_WIDTH = 4;

input logic clk;
input logic rst;
output logic [CNT_WIDTH-1:0] count;

always_ff @(posedge clk) begin : proc_count
    if(rst) begin
        count <= 0;
    end else if(!(&count)) begin
        count <= count + 1;
    end
end

endmodule
