################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name la_fifo_aclk -period 10 [get_ports la_fifo_aclk]
create_clock -name vid_in_clk -period 6.667 [get_ports vid_in_clk]
create_clock -name ps7_0_FCLK_CLK0 -period 20 [get_pins ps7_0/FCLK_CLK0]
create_clock -name ps7_0_FCLK_CLK1 -period 10 [get_pins ps7_0/FCLK_CLK1]
create_clock -name ps7_0_FCLK_CLK2 -period 5 [get_pins ps7_0/FCLK_CLK2]
create_clock -name ps7_0_FCLK_CLK3 -period 100 [get_pins ps7_0/FCLK_CLK3]

################################################################################