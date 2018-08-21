
`timescale 1 ns / 1 ps

	module rgb8to24_v1_0
	(
        input wire[7:0]rgb_in,
        output wire[23:0]rgb_out
	);
    
    assign rgb_out = {
                {4{rgb_out[1:0]}}, //B
                rgb_out[4:2], rgb_out[4:2], rgb_out[4:3], //G
                rgb_out[7:5], rgb_out[7:5], rgb_out[7:6]  //R
            };

	endmodule
