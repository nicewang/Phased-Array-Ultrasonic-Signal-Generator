module key_debounce(sys_clk          ,
					sys_rstn         ,
					key_in           ,
					led_1              
					);

input               sys_clk          ;
input               sys_rstn         ;
input               key_in           ;
output				  led_1              ;

reg                 led_1          ;
reg                 led					 ;
reg      [19:0]     delay_cnt        ;
wire                key_scan         ;
wire                key_low          ;
reg                 key_samp         ;
reg                 key_samp_r       ;
reg                 key_rst          ;
reg                 key_rst_r        ; 
 
always@(posedge sys_clk or negedge sys_rstn)        
	begin
		if(!sys_rstn)
			key_samp<=1'b1;
		else
			key_samp<=key_in;
	end
always@(posedge sys_clk or negedge sys_rstn)        
	begin
		if(!sys_rstn)
			key_samp_r<=1'b1;
		else
			key_samp_r<=key_samp;
	end
assign key_scan=key_samp_r&(~key_samp);

always@(posedge sys_clk or negedge sys_rstn) 
	begin
		if(!sys_rstn)
			delay_cnt<=20'h0;
		else if(key_scan)
			delay_cnt<=20'h0;
		else
			delay_cnt<=delay_cnt+1'b1;
	end
always@(posedge sys_clk or negedge sys_rstn)        
	begin
		if(!sys_rstn)
			key_rst<=1'b1;
		else if(delay_cnt==20'hfffff)
			key_rst<=key_in;
	end
always@(posedge sys_clk or negedge sys_rstn)        
	begin
		if(!sys_rstn)
			key_rst_r<=1'b1;
		else
			key_rst_r<=key_rst;
	end
assign key_low=key_rst_r&(~key_rst);

always@(posedge sys_clk or negedge sys_rstn) 
	begin
		if(!sys_rstn)
		begin
			led_1<=1'b1;
		end
		//else if(key_low)
		//begin
			//led_1<=~led_1;
		//end
		else
		begin
			//led_1<=led_1;
			led_1<=key_low;
		end
	end	
endmodule
