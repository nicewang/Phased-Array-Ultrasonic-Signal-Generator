`timescale 1ns / 1ps

module uart_top(sys_clk,
                sys_rstn,
					 key_in,
					 ir,
                rs232_rx,
                rs232_tx,
					 led_out,
					 seg_en,
					 digital,
					 z
                );

input sys_clk;
input sys_rstn;

input key_in;

input ir;

input rs232_rx;
output rs232_tx;

output led_out;

output seg_en;

output[7:0] digital;

output[7:0] z;

wire bps_start1,bps_start2;
wire clk_bps1,clk_bps2;

wire clk;

wire[7:0] rx_data;
wire[7:0] keyCode;
wire[7:0] s;

wire rx_int;

wire led_1;
wire[1:0] led_2;
wire led;

wire clk_hwx;

assign seg_en = 0;

PLL_prj			  PLL_prj(
								.clk(sys_clk),
								.rst_n(sys_rstn),
								.clkc0(clk)
								);

key_debounce     key_debounce(
											.sys_clk(clk),
											.sys_rstn(sys_rstn),
											.key_in(key_in),
											.led_1(led_1)
										);
									
clk_gen			  clk_gen(
											.clk(clk),
											.rst(sys_rstn),
											.clk_hwx(clk_hwx)
								);
							
ir_hwx			  ir_hwx(
											.clk(clk_hwx),
											.rst(sys_rstn),
											.ir(ir),
											.keyCode(keyCode)
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

switch			switch(
									.rx_data(rx_data),
									.keyCode(keyCode),
									.led_2(led_2)
							);
							
code				code(
									.rx_data(rx_data),
									.keyCode(keyCode),
									.s(s)
						);

display			display(
									.led_1(led_1),
									.led_2(led_2),
									.s(s),
									.led(led),
									.led_out(led_out),
									.digital(digital)
							);
							
xkz_a				xkz_a(
									.clk(clk),
									.s(s),
									.led(led),
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
