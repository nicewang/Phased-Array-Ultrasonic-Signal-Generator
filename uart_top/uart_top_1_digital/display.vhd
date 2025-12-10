library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity display is
	port(
		led_1: in std_logic;
		led_2: in std_logic;
		led: out std_logic;
		led_out: out std_logic;
		led1: out std_logic;
		led1_out: out std_logic);
end display;

architecture display_arch of display is
--signal a: std_logic:= '1';
begin
	
	process(led_1)
	begin
		if(led_1='0')then
			led <= '0';
			led_out <= '0';
		else
			led <= '1';
			led_out <= '1';
		end if;
	end process;
	
	process(led_2)
	begin
		if(led_2='0')then
			led1 <= '0';
			led1_out <= '0';
		else
			led1 <= '1';
			led1_out <= '1';
		end if;
	end process;
	
end display_arch;
