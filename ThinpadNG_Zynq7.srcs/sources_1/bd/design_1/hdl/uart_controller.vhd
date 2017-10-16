--    File Name:  uart_controller.vhd
--      Version:  1.1
--         Date:  January 22, 2000
--        Model:  Uart_controller Chip
-- Dependencies:  txmit.hd, rcvr.vhd
--
--      Company:  Xilinx
--
--
--   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY 
--                WHATSOEVER AND XILINX SPECIFICALLY DISCLAIMS ANY 
--                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
--                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
--
--                Copyright (c) 2000 Xilinx, Inc.
--                All rights reserved


library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;
use ieee.std_logic_unsigned.all ;

entity uart_controller is
PORT (rst,clk,rxd,rdn,wrn : in std_logic;
data : in std_logic_vector(7 downto 0);
dout : out std_logic_vector(7 downto 0);
data_ready : out std_logic;
parity_error : out std_logic;
framing_error : out std_logic;
tbre : out std_logic;
tsre : out std_logic;
sdo : out std_logic;
ps2clock : in std_logic;
ps2data : in std_logic;
interconn7 : out std_logic;
interconn8 : out std_logic
);
end uart_controller;

architecture v1 of uart_controller is
signal sclk : std_logic;
component txmit 
port (rst,clk16x,wrn : in std_logic;
din : in std_logic_vector(7 downto 0);
tbre,tsre,sdo: out std_logic);
end component ;

component rcvr 
port (rst,clk16x,rxd,rdn : in std_logic;
data_ready, parity_error, framing_error : out std_logic;
dout : out std_logic_vector(7 downto 0));
end component ;

component clkcon
    Port ( rst,clk0 : in  STD_LOGIC;
           clk : out  STD_LOGIC);
end component;

begin
interconn7 <= ps2clock;
interconn8 <= ps2data;
u1 : txmit PORT MAP 
(rst => rst,
clk16x => sclk,
wrn => wrn,
din => data,
tbre => tbre,
tsre => tsre,
sdo => sdo);

u2 : rcvr PORT MAP  
(rst => rst,
clk16x => sclk,
rxd => rxd,
rdn => rdn,
data_ready => data_ready,
framing_error => framing_error,
parity_error => parity_error,
dout => dout) ;

u3:clkcon port map -- clock div 36
  (rst=>rst,
	clk0=>clk,
	clk=>sclk); -- sclk = 16x 9600
end v1 ;



