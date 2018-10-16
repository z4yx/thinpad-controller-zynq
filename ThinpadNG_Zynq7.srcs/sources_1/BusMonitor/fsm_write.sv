`include "analyzer_defs.svh"
module fsm_write(
    transition_info_if.sink ram_addr,
    transition_info_if.sink ram_dq,
    transition_info_if.sink ram_wr_n,
    transition_info_if.sink ram_rd_n,
    transition_info_if.sink ram_ce_n,
    transition_info_if.sink ram_be_n,
    transaction_timing_if.src timing
);
    
endmodule