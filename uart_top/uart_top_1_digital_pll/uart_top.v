`timescale 1ns / 1ps

module uart_top(sys_clk,
                sys_rstn,
					 key_in,
					 key_in1,
                rs232_rx,
                rs232_tx,
					 led_out,
					 led1_out,
					 seg_en,
					 z,
					 digital
                );

input sys_clk;
input sys_rstn;

input key_in;
input key_in1;

input rs232_rx;
output rs232_tx;

output led_out;
output led1_out;

output[7:0] seg_en;

output[7:0] z;

output[7:0] digital;

wire bps_start1,bps_start2;
wire clk_bps1,clk_bps2;

wire clk;
 
wire[7:0] rx_data;
wire[7:0] s0;
wire[7:0] s1;
wire[7:0] s2;
wire[7:0] s3;
wire[7:0] s4;
wire[7:0] s5;
wire[7:0] s6;
wire[7:0] s7;

wire rx_int;

wire led_1;
wire led_2;
wire led;
wire led1;

assign digital=8'b0;

PLL_prj			  PLL_prj(
								.clk(sys_clk),
								.rst_n(sys_rstn),
								.clkc0(clk)
								);

								
key_debounce     key_debounce(
											.sys_clk(clk),
											.sys_rstn(sys_rstn),
											.key_in(key_in),
											.led_out(led_1)
										);
										
key_debounce_a     key_debounce_a(
											.sys_clk(clk),
											.sys_rstn(sys_rstn),
											.key_in(key_in1),
											.led_out(led_2)
										);
							
baud             baud_rx(   
                            .sys_clk(clk),
                            .sys_rstn(sys_rstn),
                            .bps_start(bps_start1),
                            .clk_bps(clk_bps1)
                        );
								
uart_rx         uart_rx(        
                            .sys_clk(clk),  
                            .sys_rstn(sys_rstn),
                            .rs232_rx(rs232_rx),
                            .rx_data(rx_data),
                            .rx_int(rx_int),
                            .clk_bps(clk_bps1),
                            .bps_start(bps_start1)
                        );

display			display(
									.led_1(led_1),
									.led_2(led_2),
									.led(led),
									.led_out(led_out),
									.led1(led1),
									.led1_out(led1_out)
							);
							
receive			receive(
									.sys_clk(clk),
									.rx_data(rx_data),
									.s0(s0),
									.s1(s1),
									.s2(s2),
									.s3(s3),
									.s4(s4),
									.s5(s5),
									.s6(s6),
									.s7(s7),
									.seg_en(seg_en)
							);
							
xkz_a				xkz_a(
									.clk(clk),
									.s0(s0),
									.s1(s1),
									.s2(s2),
									.s3(s3),
									.s4(s4),
									.s5(s5),
									.s6(s6),
									.s7(s7),
									.led(led),
									.led1(led1),
									.z(z)
							);
							
baud            baud_tx(    
                            .sys_clk(clk),
                            .sys_rstn(sys_rstn),
                            .bps_start(bps_start2),
                            .clk_bps(clk_bps2)
                        );

uart_tx         uart_tx(
                            .sys_clk(clk),
                            .sys_rstn(sys_rstn),
                            .rx_data(rx_data),
                            .rx_int(rx_int),
                            .rs232_tx(rs232_tx),
                            .clk_bps(clk_bps2),
                            .bps_start(bps_start2)
                        );
								
							

endmodule
