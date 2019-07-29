
`timescale 1 ns / 1 ps

	module axi_register_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
        parameter integer PORT_TO_REG_WIDTH     = 256+32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here
        output wire [127:0] reg2port,
        input wire [PORT_TO_REG_WIDTH-1:0] port2reg,
        input wire [31:0] transition_det_in,
        output reg axi_register_irq,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
	wire transition_irq_clear;
	reg transition_irq_flag;
// Instantiation of Axi Bus Interface S00_AXI
	axi_register_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.PORT_TO_REG_WIDTH(PORT_TO_REG_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_register_v1_0_S00_AXI_inst (
        .REG_TO_PORT(reg2port),
        .PORT_TO_REG(port2reg),
        .transition_irq_flag(transition_irq_flag),
        .transition_irq_clear(transition_irq_clear),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
	reg [31:0] transition_sync [0:1];
	reg transition;
	always@(posedge s00_axi_aclk) begin
	   transition_sync[1] <= transition_sync[0];
	   transition_sync[0] <= transition_det_in;
	   transition <= transition_sync[1] != transition_sync[0];
	end
	always@(posedge s00_axi_aclk) begin
        if(~s00_axi_aresetn)begin
           axi_register_irq <= 0;
           transition_irq_flag <= 0;
        end else begin
            if(transition_irq_clear) begin
                transition_irq_flag <= 1'b0;
                axi_register_irq <= 1'b0;
            end
            else if(transition) begin
                transition_irq_flag <= 1'b1;
                axi_register_irq <= 1'b1;
            end
        end
	end

	// User logic ends

	endmodule
