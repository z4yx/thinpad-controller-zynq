module image_capture (
    input wire clk,    // Clock
    input wire rst_n,  // Asynchronous reset active low
    
    output reg reset_o_n,

    input wire start,

    input wire [7:0] pixel,
    input wire hs, //active low
    input wire de, //active high
    input wire vs, //active low

    output wire axis_valid,
    output wire axis_last, // EOL
    output wire axis_user, // SOF
    output wire [63:0] axis_data
);

(*mark_debug = "true" *) reg [2:0] state;
(*mark_debug = "true" *) reg start_sync;
reg start_sync0;

always @(posedge clk) begin : proc_start
    if(~rst_n) begin
        start_sync0 <= 0;
        start_sync <= 0;
    end else begin
        start_sync <= start_sync0;
        start_sync0 <= start;
    end
end

reg hs_inactive_pol, vs_inactive_pol;

always @(posedge clk) begin : proc_inactive
    if(de)begin
        hs_inactive_pol <= hs;
        vs_inactive_pol <= vs;
    end
end

always @(posedge clk) begin : proc_state
    if(~rst_n) begin
        state <= 0;
    end else begin
        case (state)
            3'h0: if(start_sync) state <= 3'h1;
            3'h1: if(!start_sync) state <= 3'h2;
            3'h2: if(vs^vs_inactive_pol) state <= 3'h3;
            3'h3: if(vs==vs_inactive_pol) state <= 3'h4; //frame begin
            3'h4: state <= 3'h5;
            3'h5: if(vs^vs_inactive_pol) state <= 3'h6; //frame end
            3'h6: state <= 3'h0;
            default : state <= 3'h0;
        endcase
    end
end

wire end_of_frame, start_of_frame;
assign end_of_frame = (state == 3'h6);
assign start_of_frame = (state == 3'h4);

always @(posedge clk) begin : proc_reset_o_n
    if(~rst_n) begin
        reset_o_n <= 0;
    end else if(state==3'h3) begin
        reset_o_n <= 0;
    end else begin 
        reset_o_n <= 1;
    end
end

reg valid_in_data;
reg[7:0] buffer_input;
always @(posedge clk) begin : proc_in_buffer
    if(~rst_n) begin
        valid_in_data <= 0;
    end else begin
        buffer_input <= pixel;
        valid_in_data <= (state == 3'h5 && de);
    end
end


reg [7:0] output_buf;
reg output_buf_valid;
reg sof_flag, sof_pending;

always @(posedge clk) begin
    if(~rst_n) begin
        sof_pending <= 0;
    end else if(start_of_frame) begin 
        sof_pending <= 1;
    end else if(sof_flag) begin 
        sof_pending <= 0;
    end
end

always @(posedge clk) begin
    if(~rst_n) begin
        sof_flag <= 0;
    end else if(sof_flag) begin 
        sof_flag <= 0;
    end else if(sof_pending && valid_in_data) begin 
        sof_flag <= 1;
    end
end

always @(posedge clk) begin : proc_output_buf
    if(~rst_n) begin
        output_buf_valid <= 0;
    end else begin 
        output_buf_valid <= valid_in_data;
        output_buf <= buffer_input;
    end
end

assign axis_last = output_buf_valid & ~valid_in_data;
assign axis_data = output_buf;
assign axis_valid = output_buf_valid;
assign axis_user = sof_flag;

endmodule