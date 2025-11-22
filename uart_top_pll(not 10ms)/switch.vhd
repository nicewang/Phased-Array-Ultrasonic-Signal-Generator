library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity switch is
	port(
		rx_data: in std_logic_vector(7 downto 0);
		keyCode: in std_logic_vector(7 downto 0);
		led_2: out std_logic_vector(1 downto 0));
end switch;

architecture switch_arch of switch is
begin
	process(rx_data,keyCode)
	begin
		if(rx_data="00110000" or rx_data="00110001" or rx_data="00110010" or rx_data="00110011" or
		rx_data="00110100" or rx_data="00110101" or rx_data="00110110" or rx_data="00110111" or 
		rx_data="00111000" or rx_data="00111001" or rx_data="01100001" or rx_data="01100010")then
			if(rx_data="01100001")then
				led_2 <= "11";
			elsif(rx_data="01100010")then
				led_2 <= "00";
			else
				led_2 <= "01";
			end if;
		else
			if(keyCode="01000101")then
				led_2 <= "11";
			elsif(keyCode="01000111")then
				led_2 <= "00";
			else
				led_2 <= "01";
			end if;
		end if;
	end process;
end switch_arch;
