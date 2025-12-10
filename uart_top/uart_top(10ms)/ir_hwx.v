`timescale 1ns / 1ps

module ir_hwx(
		input clk,            //clk_hwx    
		input rst,           //reset
		input ir,            // 
      output reg[7:0] keyCode    //	
		);
		reg [3:0] state;
		reg [8:0] cnt;
		reg [4:0] cnt_dat;
		wire check_9ms;  // check leader 9ms time
		wire check_4ms;  // check leader 4.5ms time	
		wire low;        // check  data="0" time
		wire high;       // check  data="1" time
		reg ir_reg1;       //
		reg ir_reg2;
		wire ir_posedge;    //
		wire ir_negedge;
		reg [31:0] data;       //
		reg [7:0] keyCode_reg;
		
	parameter 	Idle 		= 4'b0001,	  //
				Lead_9ms 	= 4'b0010,    //
				Lead_4ms 	= 4'b0100,     //
				ReceiveCode = 4'b1000;     //


  assign check_9ms = ((217 < cnt) & (cnt < 297));  //257  
  assign check_4ms = ((88 < cnt) & (cnt < 168));   //128
  assign low  = ((22 < cnt) & (cnt < 42));         // 32
  assign high = ((54 < cnt) & (cnt < 74));        // 64
  assign ir_negedge = ir_reg2 & (~ir_reg1);
  assign ir_posedge = (~ir_reg2) & ir_reg1;
  
	always @(posedge clk or negedge rst)
		begin
			if(~rst)
				begin
					ir_reg1 <= 0;
					ir_reg2 <= 0;
				end
			else	
				begin
					ir_reg1 <= ir;
					ir_reg2 <= ir_reg1;
				end
		end
	
    always @(posedge clk or negedge rst)
		begin
			if(~rst) begin
				state <= Idle;
				keyCode_reg <= 8'hc0;
				cnt <= 0;
				cnt_dat <= 0;
				end		
			else  begin
				case(state)
				Idle: begin
					if(~ir_reg1) 
						begin
						  state <= Lead_9ms;
						  cnt <= 0;
						  cnt_dat <= 0;
						end	
					else state <= Idle;
					end
				Lead_9ms: begin
					cnt <= cnt + 1;
					if(ir_posedge)
						begin
							if(check_9ms)
								state <= Lead_4ms;
							else state <= Idle;
							cnt <= 0;
						end
					else state <= Lead_9ms;
					end  
				Lead_4ms: begin
					cnt <= cnt + 1;
					if(ir_negedge) 
					begin
						if(check_4ms)
							state <= ReceiveCode;
						else state <= Idle;
						cnt <= 0;
					end
					else state <= Lead_4ms;
					end 
				ReceiveCode: begin
						cnt <= cnt + 1;
						if(ir_negedge)
						begin
							if(low)
								data[cnt_dat] <= 0;
							else if(high) 
								data[cnt_dat] <= 1;
					        else state <= Idle;
							cnt <= 0;
							cnt_dat <= cnt_dat + 1;
							if(cnt_dat == 31) 
								begin
								state <= Idle;
								keyCode_reg <= data[23:16];
								end	
						end
						else state <= ReceiveCode;
						
					end
				endcase
			end
				
		end
	always @ (keyCode_reg)
	begin
		keyCode <= keyCode_reg; 
   end	
	endmodule	
		