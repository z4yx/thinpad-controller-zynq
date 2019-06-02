
`timescale 1 ns / 1 ps

    module zynq_dna_usr_data_v1_0
    (
        // Users to add ports here


        // APB Bus i/f
        input  wire [31:0] APB_paddr,
        input  wire        APB_psel,
        input  wire        APB_penable,
        input  wire        APB_pwrite,
        input  wire [31:0] APB_pwdata,
        output wire        APB_pready,
        output reg  [31:0] APB_prdata,
        output wire        APB_pslverr,
        // User ports ends
        // Do not modify the ports beyond this line


        // Ports of Axi Slave Bus Interface APB
        input wire  APB_aclk,
        input wire  APB_aresetn
    );
    
    reg core_ready;
    reg [5:0] dna_counter;
    reg [2:0] reg_sel;
	reg [31:0] build_date, build_time;
    reg [63:0] device_dna;
    wire [31:0] from_usr_access;
    wire dna_read, dna_shift, dna_q;

    USR_ACCESSE2 ua_inst(.DATA(from_usr_access));
    DNA_PORT#(
        .SIM_DNA_VALUE(57'h100000000000001)// 57-bit DNA value for simulation
    )
    DNA_PORT_inst(
        .DOUT(dna_q),//1-bitoutput:DNAoutputdata.
        .CLK(APB_aclk),//1-bitinput:Clockinput.
        .DIN(1'b0),//1-bitinput:Userdatainputpin.
        .READ(dna_read),//1-bitinput:ActivehighloadDNA,activelowreadinput.
        .SHIFT(dna_shift)//1-bitinput:Activehighshiftenableinput.
    );

    assign APB_pslverr = 0;
    assign APB_pready = core_ready;
    assign dna_read = ~(|dna_counter); // dna_counter == 0
    assign dna_shift = (|dna_counter) & ~(&dna_counter); // 0 < dna_counter < all-ones

    always @(posedge APB_aclk, negedge APB_aresetn) begin
        if(~APB_aresetn) begin
            core_ready <= 1'b0;
            dna_counter <= 6'h0;
            device_dna <= 64'h0;
        end else begin
            if(dna_counter >= 1 && dna_counter <= 57)
                device_dna <= {device_dna[0+:63], dna_q};
            if(dna_counter == 57)
                core_ready <= 1'b1;
            if(~(&dna_counter))
                dna_counter <= dna_counter + 1;
        end
    end

    always @(posedge APB_aclk) begin
        if(APB_psel) begin
            reg_sel <= APB_paddr[2 +: 3];
        end else begin
        end
    end

    always @(posedge APB_aclk) begin
        build_date <= {
            8'h0,
            2'b00,from_usr_access[22:17],
            4'h0,from_usr_access[26:23],
            3'h0,from_usr_access[31:27]
        };
        build_time <= {
            8'h0,
            3'h0,from_usr_access[16:12],
            2'b00,from_usr_access[11:6],
            2'b00,from_usr_access[5:0]
        };
    end

    always @(*) begin
        case(reg_sel)
            3'h0: APB_prdata <= build_date;
            3'h1: APB_prdata <= build_time;
            3'h2: APB_prdata <= device_dna[0+:32];
            3'h3: APB_prdata <= device_dna[32+:32];
            default: APB_prdata <= 32'h0;
        endcase
    end

    endmodule
