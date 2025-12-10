`timescale 1ns / 1ps

module uart_rx(sys_clk,
               sys_rstn,
               rs232_rx,
               rx_data,
               rx_int,
               clk_bps,
               bps_start
            );

input sys_clk;
input sys_rstn;
input rs232_rx;
input clk_bps;
output bps_start;
output[7:0] rx_data;
output rx_int;

reg rs232_rx0,rs232_rx1,rs232_rx2,rs232_rx3;
reg bps_start_r;
reg[3:0] num;
reg rx_int;
reg[7:0] rx_data_r;
reg[7:0] rx_temp_data;
wire neg_rs232_rx;

always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn) 
            begin
                rs232_rx0 <= 1'b0;
                rs232_rx1 <= 1'b0;
                rs232_rx2 <= 1'b0;
                rs232_rx3 <= 1'b0;
            end
        else 
            begin
                rs232_rx0 <= rs232_rx;
                rs232_rx1 <= rs232_rx0;
                rs232_rx2 <= rs232_rx1;
                rs232_rx3 <= rs232_rx2;
            end
    end
always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn) 
            begin
                bps_start_r <= 1'bz;
                rx_int <= 1'b0;
            end
        else if(neg_rs232_rx) 
            begin       
                bps_start_r <= 1'b1;
                rx_int <= 1'b1;         
            end
        else if(num==4'd9)
            begin                    
                bps_start_r <= 1'b0;
                rx_int <= 1'b0;
            end
    end
always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn)
            begin
                rx_temp_data <= 8'd0;
                num <= 4'd0;
                rx_data_r <= 8'd0;
            end
        else if(rx_int)
            begin   
                if(clk_bps)
                    begin
                        num <= num+1'b1;
                        if(num<=4'd8)
                        rx_temp_data[num-1]<=rs232_rx;
                    end
                else if(num == 4'd9)
                    begin
                        num <= 4'd0;
                        rx_data_r <= rx_temp_data;
                    end
            end
        end
assign neg_rs232_rx = rs232_rx3 & rs232_rx2 & ~rs232_rx1 & ~rs232_rx0;
assign bps_start = bps_start_r;
assign rx_data = rx_data_r;
endmodule
