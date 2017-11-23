module ram_w_det (
    input wire clk,    // Clock
    input wire rst_n,  // Asynchronous reset active low

    // input wire change_addr,
    // input wire change_data,
    // input wire change_wr,
    // input wire change_ce,

    input wire wr_n,
    input wire ce_n,

    output reg w_assert
);

parameter WRITE_CYCLE = 2;

`define STATE_IDLE    0
`define STATE_W_CYCLE 1

reg [2:0] state;
reg [$clog2(WRITE_CYCLE):0] cnt_write_cyc;
wire write_en;

assign write_en = ~wr_n & ~ce_n;

always @(posedge clk or negedge rst_n) begin : proc_cnt_write_cyc
    if(~rst_n) begin
        cnt_write_cyc <= 0;
    end else begin
        if(~write_en)
            cnt_write_cyc <= 0;
        else
            cnt_write_cyc <= (&cnt_write_cyc) ? cnt_write_cyc : cnt_write_cyc+1;
    end
end

always @(posedge clk or negedge rst_n) begin : proc_ram_w
    if(~rst_n) begin
        state <= `STATE_IDLE;
    end else begin
        w_assert <= 0;
        case (state)
            `STATE_IDLE: begin 
                if(write_en)
                    state <= `STATE_W_CYCLE;
            end
            `STATE_W_CYCLE: begin 
                if(~write_en) begin
                    state <= `STATE_IDLE;
                    if(cnt_write_cyc >= WRITE_CYCLE)begin
                        w_assert <= 1;
                    end 
                end
            end
            default : /* default */;
        endcase
    end
end

endmodule