module logic_analyzer (
    input wire refclk,    // Clock
    input wire rst_n,  // Asynchronous reset active low
    input wire clkin1_p,  clkin1_n,            // lvds channel 1 clock input 
    input wire [3:0]   datain1_p, datain1_n           // lvds channel 1 data inputs

);

(* MARK_DEBUG = "TRUE" *) wire        match ;

          
serdes_7to1_ddr_rx_top rx(                  
    .reset              (~rst_n),
    .refclkin           (refclk),
    .clkin1_p           (clkin1_p),
    .clkin1_n           (clkin1_n),    
    .datain1_p          (datain1_p),   
    .datain1_n          (datain1_n),   
    .dummy              (match)) ;

endmodule