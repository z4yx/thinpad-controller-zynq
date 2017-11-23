module ram_r_det (
    input wire clk,    // Clock
    input wire rst_n,  // Asynchronous reset active low

    input wire change_addr,
    // input wire change_data,
    // input wire change_wr,
    // input wire change_ce,

    input wire rd_n,
    input wire ce_n,

    output reg r_assert
);

parameter READ_CYCLE = 2;

`define STATE_IDLE    0
`define STATE_R_CYCLE 1

reg [2:0] state;
reg [$clog2(READ_CYCLE):0] cnt_read_cyc;
wire read_en;

assign read_en = ~rd_n & ~ce_n;

always @(posedge clk or negedge rst_n) begin : proc_cnt_read_cyc
    if(~rst_n) begin
        cnt_read_cyc <= 0;
    end else begin
        if(~read_en|change_addr)
            cnt_read_cyc <= 0;
        else
            cnt_read_cyc <= (&cnt_read_cyc) ? cnt_read_cyc : cnt_read_cyc+1;
    end
end

always @(posedge clk or negedge rst_n) begin : proc_ram_w
    if(~rst_n) begin
        state <= `STATE_IDLE;
    end else begin
        r_assert <= 0;
        case (state)
            `STATE_IDLE: begin 
                if(read_en)
                    state <= `STATE_R_CYCLE;
            end
            `STATE_R_CYCLE: begin 
                if(~read_en|change_addr) begin
                    if(~read_en)begin
                        state <= `STATE_IDLE;
                    end
                    if(cnt_read_cyc >= READ_CYCLE)begin
                        r_assert <= 1;
                    end 
                end
            end
            default : /* default */;
        endcase
    end
end

endmodule