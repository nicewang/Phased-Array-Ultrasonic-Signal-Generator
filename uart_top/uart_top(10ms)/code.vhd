library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity code is
	port(
		--sys_rstn: in std_logic;
		rx_data: in std_logic_vector(7 downto 0);
		keyCode: in std_logic_vector(7 downto 0);
		s: out std_logic_vector(7 downto 0));
end code;

architecture code_arch of code is
--signal a : std_logic := '0';
begin
	
	--process(sys_rstn)
	--begin
		--if(sys_rstn'event and sys_rstn='0')then
			--s <= "00110000";
		--end if;
	--end process;
	
	process(rx_data,keyCode)
	begin
		if(rx_data="00110000" or rx_data="00110001" or rx_data="00110010" or rx_data="00110011" or
		rx_data="00110100" or rx_data="00110101" or rx_data="00110110" or rx_data="00110111" or 
		rx_data="00111000" or rx_data="00111001" or rx_data="01100001" or rx_data="01100010")then
			if(rx_data= "00110000")then
				s <= "00110000";
			elsif(rx_data="00110001")then
				s <= "00110001";
			elsif(rx_data="00110010")then
				s <= "00110010";
			elsif(rx_data="00110011")then
				s <= "00110011";
			elsif(rx_data="00110100")then
				s <= "00110100";
			elsif(rx_data="00110101")then
				s <= "00110101";
			elsif(rx_data="00110110")then
				s <= "00110110";
			elsif(rx_data="00110111")then
				s <= "00110111";
			elsif(rx_data="00111000")then
				s <= "00111000";
			elsif(rx_data="00111001")then
				s <= "00111001";
			else
				s <= "00110000";
			end if;
		else
			if(keyCode= "00010110")then
				s <= "00110000";
			elsif(keyCode="00001100")then
				s <= "00110001";
			elsif(keyCode="00011000")then
				s <= "00110010";
			elsif(keyCode="01011110")then
				s <= "00110011";
			elsif(keyCode="00001000")then
				s <= "00110100";
			elsif(keyCode="00011100")then
				s <= "00110101";
			elsif(keyCode="01011010")then
				s <= "00110110";
			elsif(keyCode="01000010")then
				s <= "00110111";
			elsif(keyCode="01010010")then
				s <= "00111000";
			elsif(keyCode="01001010")then
				s <= "00111001";
			else
				s <= "00110000";
			end if;
		end if;
	end process;
	
end code_arch;
