`timescale 1ns / 1ps

module baud(sys_clk,
            sys_rstn,
            bps_start,
            clk_bps
            );

input sys_clk;
input sys_rstn;
input bps_start;
output clk_bps;  

`define     BPS_PARA        5207
`define     BPS_PARA_2      2603

reg[12:0] cnt;
reg clk_bps_r;

always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn)
            cnt <= 13'd0;
        else if((cnt == `BPS_PARA) || !bps_start)
            cnt <= 13'd0;   
        else
            cnt <= cnt+1'b1;
    end
always @ (posedge sys_clk or negedge sys_rstn)
    begin
        if(!sys_rstn)
            clk_bps_r <= 1'b0;
        else if(cnt == `BPS_PARA_2)
            clk_bps_r <= 1'b1;
        else 
            clk_bps_r <= 1'b0;
    end

assign clk_bps = clk_bps_r;

endmodule
