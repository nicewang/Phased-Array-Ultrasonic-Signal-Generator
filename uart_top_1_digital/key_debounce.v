module key_debounce(sys_clk          ,
					sys_rstn         ,
					key_in           ,
					led_out
					);

input               sys_clk          ;
input               sys_rstn         ;
input               key_in           ;
output              led_out          ;

reg                 led_out          ;
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
			led_out<=1'b1;
		else if(key_low)
			led_out<=~led_out;
		else
			led_out<=led_out;
	end
endmodule
