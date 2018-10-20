`include "analyzer_defs.svh"
module anaylzer_fifo(
    input  logic wr_clk,
    input  logic rd_clk,
    input  logic rst,
    input  logic[127:0] din,
    output logic[127:0] dout,
    input  logic wr_en,
    output logic full,
    input  logic rd_en,
    output logic empty
);

// xpm_fifo_async: Asynchronous FIFO
// Xilinx Parameterized Macro, Version 2016.4
xpm_fifo_async # (
.FIFO_MEMORY_TYPE ("block"), //string; "auto", "block", or "distributed";
.ECC_MODE ("no_ecc"), //string; "no_ecc" or "en_ecc";
.RELATED_CLOCKS (0), //positive integer; 0 or 1
.FIFO_WRITE_DEPTH (512), //positive integer
.WRITE_DATA_WIDTH (128), //positive integer
.WR_DATA_COUNT_WIDTH (9), //positive integer
.PROG_FULL_THRESH (10), //positive integer
.FULL_RESET_VALUE (0), //positive integer; 0 or 1
.READ_MODE ("std"), //string; "std" or "fwft";
.FIFO_READ_LATENCY (1), //positive integer;
.READ_DATA_WIDTH (128), //positive integer
.RD_DATA_COUNT_WIDTH (9), //positive integer
.PROG_EMPTY_THRESH (10), //positive integer
.DOUT_RESET_VALUE ("0"), //string
.CDC_SYNC_STAGES (2), //positive integer
.WAKEUP_TIME (0) //positive integer; 0 or 2;
) xpm_fifo_async_inst (
.rst,
.wr_clk (wr_clk),
.wr_en (wr_en),
.din (din),
.full (full),
.overflow (),
.wr_rst_busy (),
.rd_clk (rd_clk),
.rd_en (rd_en),
.dout (dout),
.empty (empty),
.underflow (),
.rd_rst_busy (),
.prog_full (),
.wr_data_count (),
.prog_empty (),
.rd_data_count (),
.sleep (1'b0),
.injectsbiterr (1'b0),
.injectdbiterr (1'b0),
.sbiterr (),
.dbiterr ()
);
// End of xpm_fifo_async instance declaration

endmodule
