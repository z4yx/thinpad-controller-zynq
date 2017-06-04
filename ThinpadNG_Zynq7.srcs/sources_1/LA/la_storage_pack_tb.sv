`timescale 1ns/1ps
module la_storage_pack_tb (
    
);

reg clk = 0;
reg la_rst_n = 0;
reg lactl_storage_enable = 0;
reg lactl_clear_overflow = 0;
reg[20:0] lactl_sample_cnt = 0;

reg[48+3-1:0] acq_data_out;
reg acq_data_valid = 0;

la_storage_pack dut(
    .rst_n                 (la_rst_n),
    .la_fifo_aresetn       (),
    .la_storage_axis_tdata (),
    .la_storage_axis_tlast (),
    .la_storage_axis_tvalid(),
    .la_storage_axis_tready(1'b1),
    .lock_level            (3'b111),
    .ctl_storage_enable    (lactl_storage_enable),
    .ctl_clear_overflow    (lactl_clear_overflow),
    .ctl_sample_cnt        (lactl_sample_cnt),
    .acq_data              (acq_data_out),
    .acq_data_valid        (acq_data_valid),
    .clk                   (clk)
);

always #5 clk = ~clk;
initial begin 
    repeat(10) @(negedge clk);
    la_rst_n = 1;
    repeat(10) @(negedge clk);
    lactl_sample_cnt = 7;
    @(negedge clk);
    lactl_storage_enable = 1;
    repeat(100) @(negedge clk);
    lactl_storage_enable = 0;
end

initial begin 
    wait(la_rst_n==1'b1);
    repeat(1000)begin 
        @(negedge clk);
        acq_data_out <= $urandom();
        acq_data_valid <= $urandom()&1;
    end
end



endmodule