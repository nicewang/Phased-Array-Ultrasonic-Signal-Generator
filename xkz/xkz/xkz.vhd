library ieee;
use ieee.std_logic_1164.all;
--library unisim;
--use unisim.vcomponents.all;

entity xkz is
	port(clk: in std_logic;
		z: out std_logic_vector(7 downto 0));
end xkz;

architecture xkz_arch of xkz is
signal a:integer := 0;
signal b:integer := 0;
signal c:integer;
begin
	process(clk)
	begin
	if(clk'event and clk='1')then
	  a <= a+1;
		if(a = 9)then
			a <= 0;
			c <= 1;
			b <= b+1;
			if(b = 7)then
		    b <= 0;
		end if;
		else
	  c <= 0;
		end if;
	end if;
	end process;
	process(b,c)
	begin
		if(c = 1)then
			case b is
			when 0 => z <= "10000000";
			when 1 => z <= "01000000";
			when 2 => z <= "00100000";
			when 3 => z <= "00010000";
			when 4 => z <= "00001000";
			when 5 => z <= "00000100";
			when 6 => z <= "00000010";
			when others => z<="00000001";
			end case;
		else
			z <= "00000000";
		end if;
	end process;
end xkz_arch;
