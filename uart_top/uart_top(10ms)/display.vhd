library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity display is
	port(
		led_1: in std_logic;
		led_2: in std_logic_vector(1 downto 0);
		s: in std_logic_vector(7 downto 0);
		led: out std_logic;
		led_out: out std_logic;
		digital: out std_logic_vector(7 downto 0));
end display;

architecture display_arch of display is
signal a: std_logic:= '1';
begin
	
	process(led_2,led_1,a)
	begin
		if(led_2="00")then
			a <= '0';
		elsif(led_2="11")then
			a <= '1';
		else
			if(led_1='1')then
				a <= not a;
			end if;
		end if;
	end process;
	
	process(a,s)
	begin
		if(a='1')then
			led <= '1';
			led_out <= '1';
			case s is
			when "00110000" => digital <= "11000000";
			when "00110001" => digital <= "11111001";
			when "00110010" => digital <= "10100100";
			when "00110011" => digital <= "10110000";
			when "00110100" => digital <= "10011001";
			when "00110101" => digital <= "10010010";
			when "00110110" => digital <= "10000010";
			when "00110111" => digital <= "11111000";
			when "00111000" => digital <= "10000000";
			when "00111001" => digital <= "10010000";
			when others => digital <= "11000000";
			end case;
		else
			led <= '0';
			led_out <= '0';
			case s is
			when "00110000" => digital <= "11000000";
			when "00110001" => digital <= "11111001";
			when "00110010" => digital <= "10100100";
			when "00110011" => digital <= "10110000";
			when "00110100" => digital <= "10011001";
			when "00110101" => digital <= "10010010";
			when "00110110" => digital <= "10000010";
			when "00110111" => digital <= "11111000";
			when "00111000" => digital <= "10000000";
			when "00111001" => digital <= "10010000";
			when others => digital <= "11000000";
			end case;
		end if;
	end process;
end display_arch;
