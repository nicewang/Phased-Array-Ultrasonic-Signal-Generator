module PLL_prj(
		clk,
		rst_n,
		clkc0
);
input clk;      //50M
input rst_n;    //rest
output  clkc0;  //200M
wire  locked;

PLL_ctrl	PLL_ctrl_inst (
	.areset ( !rst_n ),
	.inclk0 ( clk),
	.c0 ( clkc0),
	.locked ( locked )
	);

endmodule 
