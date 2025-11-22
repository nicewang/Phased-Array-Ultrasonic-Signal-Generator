library ieee;
use ieee.std_logic_1164.all;
--library unisim;
--use unisim.vcomponents.all;

entity xkz_a is
	port(clk: in std_logic;
		z: out std_logic_vector(7 downto 0));
end xkz_a;

architecture xkz_a_arch of xkz_a is
signal a:integer := 0;
--signal b:integer;
signal c:integer;
signal g:integer :=0;
signal h:integer :=0;

begin
	process(clk)
	begin
	if(clk'event and clk='1')then
	  a <= a+1;
		if(a = 499999)then
			a <= 0;
			c <= 1;
			--b <= b+1;
			--if(b = 7)then
		    --b <= 0;
		--end if;
		else
	   c <= 0;
		end if;
	end if;
	end process;
	
	process(clk,c,g)
	begin
		if(c=1 or g=1)then
			if(clk'event and clk='1')then
				if(h=10)then
					h <= 0;
					g <= 0;
				else
					g <= 1;
					h <= h+1;
				end if;
			end if;
		end if;
	end process;
	
	process(g)
	begin
		if(g = 1)then
			z <= "11111111";
		else
			z <= "00000000";
		end if;
	end process;
	
end xkz_a_arch;
