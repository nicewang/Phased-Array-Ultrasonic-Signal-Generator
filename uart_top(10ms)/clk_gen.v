`timescale 1ns / 1ps

module clk_gen(
		input clk,
		input rst,
		output reg clk_hwx
		);
		reg [9:0] cnt_hwx;
	
	parameter div_hwx = 10'd875;      //  1750/2=875
	         
		
	always @(posedge clk or negedge rst)
		begin
			if(~rst)
				cnt_hwx <= 0;
			else begin
				cnt_hwx <= cnt_hwx + 1;
				if(cnt_hwx == div_hwx -1)
				begin
					clk_hwx <= ~clk_hwx;
					cnt_hwx <= 0;
				end
			end	
		end
	
endmodule
	