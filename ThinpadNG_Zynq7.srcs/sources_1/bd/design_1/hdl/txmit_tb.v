`timescale 1ns/1ns
module txmit_tb (
    
);

reg clk = 0;
reg rstn = 0;
reg[7:0] emc_rtl_dq_i;
reg cpld_emu_wrn = 1;
wire cpld_emu_tbre;

always #(90/2) clk = ~clk;
// always #(6510/2) clk = ~clk;

initial begin 
    repeat(10) @(negedge clk);
    rstn = 1;

    @(negedge clk);
    @(negedge clk);
    emc_rtl_dq_i = 8'h45;
    #100;
    cpld_emu_wrn = 0;
    #30000;
    emc_rtl_dq_i = 8'hXX;
    cpld_emu_wrn = 1;
end

reg [7:0] TxD_data,TxD_data0,TxD_data1;
reg [4:0] cpld_emu_wrn_sync;
reg TxD_start,tbre;

always @(posedge clk) begin : proc_Tx
    TxD_data0 <= emc_rtl_dq_i[7:0];
    TxD_data1 <= TxD_data0;

    cpld_emu_wrn_sync <= {cpld_emu_wrn_sync[3:0],cpld_emu_wrn};

    if(~cpld_emu_wrn_sync[1] & cpld_emu_wrn_sync[2])
        TxD_data <= TxD_data1;
    TxD_start <= cpld_emu_wrn_sync[1] & ~cpld_emu_wrn_sync[2];
end

always @(posedge clk or negedge cpld_emu_wrn) begin : proc_tbre
    if(~cpld_emu_wrn) begin
        tbre <= 0;
    end else begin
        tbre <= &cpld_emu_wrn_sync;
    end
end

assign cpld_emu_tbre = tbre;

async_transmitter #(.ClkFrequency(11059200),.Baud(9600)) 
    uart_t(
        .clk(clk),
        .tsre(cpld_emu_tsre),
        .TxD(cpld_emu_to16550),
        .TxD_start(TxD_start),
        .TxD_data(TxD_data)
    );
/*
txmit dut(
    .rst(rstn),
    .clk16x(clk),
    .wrn(wrn),
    .din(din)
);
*/

endmodule