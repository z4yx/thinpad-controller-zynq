module gen_tlast (
    input wire clk,    // Clock
    input wire rst_n,  // Asynchronous reset active low
    input wire sample_en,
    input wire[31:0] sample_cnt_reload,
    input wire tready,
    input wire tvalid,
    output wire tlast
);

reg [31:0] sample_counter;

assign tlast = (sample_counter == 1);

always @(posedge clk or negedge rst_n) begin : proc_sample_counter
    if(~rst_n) begin
        sample_counter <= 0;
    end else if(~sample_en) begin
        sample_counter <= sample_cnt_reload;
    end else if(tready & tvalid) begin 
        sample_counter <= tlast ? sample_cnt_reload : sample_counter-1;
    end
end

endmodule