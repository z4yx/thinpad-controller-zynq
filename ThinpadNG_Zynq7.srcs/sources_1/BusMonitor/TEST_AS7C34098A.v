// Test Bentch for write

`include "AS7C34098A.v"

`timescale 1 ns/1 ps

module TEST_AS7C34098A;


`define tsim  20000


reg  OE_BAR,CE_BAR,WE_BAR,LB_BAR, UB_BAR;
wire [17:0] A;
wire [15:0] DIO;
reg [15:0] data_read;
reg [15:0] temp_data;
reg [17:0] ADDRESS;

AS7C34098A tb(A,DIO,OE_BAR,CE_BAR,WE_BAR,LB_BAR, UB_BAR);

initial
   begin
    $dumpvars(0,TEST_AS7C34098A);
   $timeformat(-9,1,"ns",10);
   $dumpfile("./TEST_AS7C34098A.vcd"); 

    #100;						/* deselect */
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00000;
        CE_BAR <= 1'b1;
        WE_BAR <= 1'b1;
        LB_BAR <= 1'b1;
        UB_BAR <= 1'b1; 
      temp_data <= 16'h0000;
							
  
  /*access WWRR  Ce/we Controlled write  */   /* twc write cycle = 10ns */
  
  
    #100; 
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00001;
    #1; CE_BAR <= 1'b0;
        LB_BAR <= 1'b0;
        UB_BAR <= 1'b0;
    #1; WE_BAR <= 1'b0;
    #1; temp_data <= 16'h0001;
    #6; CE_BAR <= 1'b1;
    							/* twc write cycle = 10ns */
    #1;
       OE_BAR <= 1'b1;  
       ADDRESS <= 18'h00002;
   #1; CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   #1; WE_BAR <= 1'b0;
   #1; temp_data <= 16'h0202;
   #6; WE_BAR <= 1'b1;
 							/* trc read cycle = 10ns */         
   #1;
       ADDRESS <= 18'h00001;
       WE_BAR <= 1'b1;
   #1; CE_BAR <= 1'b0;
   #1; OE_BAR <= 1'b0; 
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
  
  #10;							/* trc read cycle = 10ns */
       ADDRESS <= 18'h00002;
       WE_BAR <= 1'b1;
  #1;  CE_BAR <= 1'b0;
  #1;  OE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0; 
       

# 10;							/* deselect */
     ADDRESS <= 18'h00000;
     CE_BAR <= 1'b1;
     WE_BAR <= 1'b1;
     LB_BAR <= 1'b1;
     UB_BAR <= 1'b1;
     
  /*Address Initiating WWRR  */                  /* twc write cycle = 10ns */
  
  
    #100; 
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00003;
    #1; CE_BAR <= 1'b0;
        LB_BAR <= 1'b0;
        UB_BAR <= 1'b0;
    #1; WE_BAR <= 1'b0;
    #1; temp_data <= 16'h0003;
    #6; //CE_BAR <= 1'b1;
    							/* twc write cycle = 10ns */
    #1;
       OE_BAR <= 1'b1;  
       ADDRESS <= 18'h00004;
   #1; CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   #1; WE_BAR <= 1'b0;
   #1; temp_data <= 16'h0404;
   #6; //WE_BAR <= 1'b1;
 							/* trc read cycle = 10ns */         
   #1;
       ADDRESS <= 18'h00003;
       WE_BAR <= 1'b1;
   #1; CE_BAR <= 1'b0;
   #1; OE_BAR <= 1'b0; 
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
  
  #8;							/* trc read cycle = 10ns */
       ADDRESS <= 18'h00004;
       WE_BAR <= 1'b1;
  #1;  CE_BAR <= 1'b0;
  #1;  OE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0; 
       

# 8;							/* deselect */
     ADDRESS <= 18'h00000;
     CE_BAR <= 1'b1;
     WE_BAR <= 1'b1;
     LB_BAR <= 1'b1;
     UB_BAR <= 1'b1;

/*Address Initiating WRWR   OE Control read */
							/* twc write cycle = 10ns */
    #100; 
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00005;
    #1; CE_BAR <= 1'b0;
        LB_BAR <= 1'b0;
        UB_BAR <= 1'b0;
    #1; WE_BAR <= 1'b0;
    #1; temp_data <= 16'h0005;
    #6; CE_BAR <= 1'b1;
    							/* trc read cycle = 10ns */
   #1;
       ADDRESS <= 18'h00005;
       WE_BAR <= 1'b1;
   #1; CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   #7; OE_BAR <= 1'b0;    
   
   
   #10;                                                /* twc write cycle = 10ns */
       OE_BAR <= 1'b1;  
       ADDRESS <= 18'h00006;
   #1; CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   #1; WE_BAR <= 1'b0;
   #1; temp_data <= 16'h0606;
   #6; CE_BAR <= 1'b1;
 							/* trc read cycle = 10ns */         
            
  #1;
       ADDRESS <= 18'h00006;
       WE_BAR <= 1'b1;
  #1;  CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
  #7;  OE_BAR <= 1'b0; 
       

# 10;                            			/* deselect */
     ADDRESS <= 18'h00000;
     CE_BAR <= 1'b1;
     WE_BAR <= 1'b1;
     LB_BAR <= 1'b1;
     UB_BAR <= 1'b1;
     
 
 /*Data Initiating WRWR    */
 
 #100;						/* twc write cycle = 10ns */
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00000;
        CE_BAR <= 1'b1;
        WE_BAR <= 1'b1;
        LB_BAR <= 1'b1;
        UB_BAR <= 1'b1; 
      temp_data <= 16'h0000;
							/* twc write cycle = 10ns */
    #100; 
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00007;
    #1; CE_BAR <= 1'b0;
        LB_BAR <= 1'b0;
        UB_BAR <= 1'b0;
    #1; WE_BAR <= 1'b0;
    #1; temp_data <= 16'h0001;
    #1; temp_data <= 16'h0007;
    #5; CE_BAR <= 1'b1;
    							/* trc read cycle = 10ns */
   #1;
       ADDRESS <= 18'h00007;
       WE_BAR <= 1'b1;
   #1; CE_BAR <= 1'b0;
   #1; OE_BAR <= 1'b0; 
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   
   
   #10;
       OE_BAR <= 1'b1;  
       ADDRESS <= 18'h00008;
   #1; CE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0;
   #1; WE_BAR <= 1'b0;
   #1; temp_data <= 16'h0003;
   #1; temp_data <= 16'h0808;
   #5; CE_BAR <= 1'b1;
 							/* trc read cycle = 10ns */         
            
  #1;
       ADDRESS <= 18'h00008;
       WE_BAR <= 1'b1;
  #1;  CE_BAR <= 1'b0;
  #1;  OE_BAR <= 1'b0;
       LB_BAR <= 1'b0;
       UB_BAR <= 1'b0; 
       

# 10;
     ADDRESS <= 18'h00000;
     CE_BAR <= 1'b1;
     WE_BAR <= 1'b1;
     LB_BAR <= 1'b1;
     UB_BAR <= 1'b1;    


/*LB/UB Initiating WWRR    */

#100;						/* twc write cycle = 10ns */
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00000;
        CE_BAR <= 1'b1;
        WE_BAR <= 1'b1;
        LB_BAR <= 1'b1;
        UB_BAR <= 1'b1; 
      temp_data <= 16'h0000;
							/* twc write cycle = 10ns */
    #100; 
        OE_BAR <= 1'b1; 
        ADDRESS <= 18'h00009;
    #1; CE_BAR <= 1'b0;
    #1; WE_BAR <= 1'b0;
    #1; LB_BAR <= 1'b0;
        UB_BAR <= 1'b1;
    #1; temp_data <= 16'h0909;
    #6; CE_BAR <= 1'b1;
    							/* trc read cycle = 10ns */
    #1;
       OE_BAR <= 1'b1;  
       ADDRESS <= 18'h0000A;
   #1; CE_BAR <= 1'b0;
   #1; WE_BAR <= 1'b0;
   #1; LB_BAR <= 1'b1;
       UB_BAR <= 1'b0;
   #1; temp_data <= 16'h0A0A;
   #6; CE_BAR <= 1'b1;
 							/* trc read cycle = 10ns */         
   #1;
       ADDRESS <= 18'h00009;
       WE_BAR <= 1'b1;
   #1; CE_BAR <= 1'b0;
   #1; OE_BAR <= 1'b0; 
   #5; LB_BAR <= 1'b0;
       UB_BAR <= 1'b1;
  
  #10;
       ADDRESS <= 18'h0000A;
       WE_BAR <= 1'b1;
  #1;  CE_BAR <= 1'b0;
  #1;  OE_BAR <= 1'b0;
  #5;  LB_BAR <= 1'b1;
       UB_BAR <= 1'b0; 
       

# 10;
     ADDRESS <= 18'h00000;
     CE_BAR <= 1'b1;
     WE_BAR <= 1'b1;
     LB_BAR <= 1'b1;
     UB_BAR <= 1'b1;



  #200;
  data_read =  {tb.mem_array1[00001],tb.mem_array0[00001]};
  $display($time, "\t%h\n", data_read); 
  data_read =  {tb.mem_array1[00002],tb.mem_array0[00002]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00003],tb.mem_array0[00003]};
  $display($time, "\t%h\n", data_read); 
  data_read =  {tb.mem_array1[00004],tb.mem_array0[00004]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00005],tb.mem_array0[00005]};
  $display($time, "\t%h\n", data_read); 
  data_read =  {tb.mem_array1[00006],tb.mem_array0[00006]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00007],tb.mem_array0[00007]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00008],tb.mem_array0[00008]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00009],tb.mem_array0[00009]};
  $display($time, "\t%h\n", data_read);
  data_read =  {tb.mem_array1[00010],tb.mem_array0[00010]};
  $display($time, "\t%h\n", data_read);
     
   
end

 assign DIO = (OE_BAR) ? temp_data : 16'hz ; 
 assign A = ADDRESS; 

//******* simultion Finish by `tsim ***********
initial # `tsim $finish;

endmodule
