`timescale 1ns / 1ps

module uart_tx(sys_clk,
                  sys_rstn,
                  rx_data,
                  rx_int,
                  rs232_tx,
                  clk_bps,
                  bps_start
            );

input sys_clk;
input sys_rstn;
input clk_bps;
input[7:0] rx_data;
input rx_int;
output rs232_tx;
output bps_start;

reg rx_int0,rx_int1,rx_int2;
reg[9:0] tx_data;
reg bps_start_r;
reg tx_en;
reg[3:0] num;
reg rs232_tx_r;
wire neg_rx_int;

always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn)
            begin
                rx_int0 <= 1'b0;
                rx_int1 <= 1'b0;
                rx_int2 <= 1'b0;
            end
        else 
            begin
                rx_int0 <= rx_int;
                rx_int1 <= rx_int0;
                rx_int2 <= rx_int1;
            end
    end
always @ (posedge sys_clk or negedge sys_rstn) 
    begin
        if(!sys_rstn) 
            begin
                bps_start_r <= 1'bz;
                tx_en <= 1'b0;
                tx_data <= 8'd0;
            end
        else if(neg_rx_int)
            begin   
                bps_start_r <= 1'b1;
                tx_data <= {1'b1,rx_data,1'b0}; 
                tx_en <= 1'b1;      
            end
        else if(num==4'd10)
            begin   
                bps_start_r <= 1'b0;
                tx_en <= 1'b0;
            end
    end
always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn) 
            begin
                num <= 4'd0;
                rs232_tx_r <= 1'b1;
            end
        else if(tx_en)
            begin
                if(clk_bps)
                    begin
                        num <= num+1'b1;
                        rs232_tx_r<=tx_data[num];
                    end
                else if(num==4'd10)
                    num <= 4'd0;    
            end
    end
assign neg_rx_int =  ~rx_int1 & rx_int2;
assign bps_start = bps_start_r;
assign rs232_tx = rs232_tx_r;

endmodule
