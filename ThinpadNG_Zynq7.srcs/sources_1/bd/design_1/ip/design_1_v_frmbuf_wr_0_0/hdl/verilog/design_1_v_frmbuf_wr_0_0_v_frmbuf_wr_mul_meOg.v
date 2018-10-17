
`timescale 1 ns / 1 ps

  module design_1_v_frmbuf_wr_0_0_v_frmbuf_wr_mul_meOg_DSP48_1(a, b, p);
input [16 - 1 : 0] a; // synthesis attribute keep a "true"
input [14 - 1 : 0] b; // synthesis attribute keep b "true"
output [30 - 1 : 0] p; // synthesis attribute keep p "true"

assign p = $unsigned (a) * $unsigned (b);

endmodule

`timescale 1 ns / 1 ps
module design_1_v_frmbuf_wr_0_0_v_frmbuf_wr_mul_meOg(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



design_1_v_frmbuf_wr_0_0_v_frmbuf_wr_mul_meOg_DSP48_1 design_1_v_frmbuf_wr_0_0_v_frmbuf_wr_mul_meOg_DSP48_1_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
