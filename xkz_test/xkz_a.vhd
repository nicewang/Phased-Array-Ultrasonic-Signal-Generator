library ieee;
use ieee.std_logic_1164.all;
--library unisim;
--use unisim.vcomponents.all;

entity xkz_a is
	port(clk: in std_logic;
	   s: in std_logic_vector(7 downto 0);
		led: in std_logic;
		z: out std_logic_vector(7 downto 0));
end xkz_a;

architecture xkz_a_arch of xkz_a is
signal a:integer := 0;
signal b:integer := 0;
signal c:integer;
signal d:integer :=1;
signal e:integer :=1;
signal g:integer :=0;
signal h:integer :=0;

begin
  process(led,s)
  begin
	if(led='1')then
		case s is
		when "00110000" => d <= 1;
		when "00110001" => d <= 2;
		when "00110010" => d <= 3;
		when "00110011" => d <= 4;
		when "00110100" => d <= 5;
		when "00110101" => d <= 6;
		when "00110110" => d <= 7;
		when "00110111" => d <= 8;
		when "00111000" => d <= 9;
		when "00111001" => d <= 10;
		when others => d <= 1;
		end case;
	else
		case s is
		when "00110000" => e <= 1;
		when "00110001" => e <= 2;
		when "00110010" => e <= 3;
		when "00110011" => e <= 4;
		when "00110100" => e <= 5;
		when "00110101" => e <= 6;
		when "00110110" => e <= 7;
		when "00110111" => e <= 8;
		when "00111000" => e <= 9;
		when "00111001" => e <= 10;
		when others => e <= 1;
		end case;
	end if;
  end process;
	process(clk)
	begin
	if(clk'event and clk='1')then
	  a <= a+1;
		if(a = d)then
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
	process(clk,c,g,e)
	begin
		if(c=1 or g=1)then
			if(clk'event and clk='1')then
				if(h=e)then
					h <= 0;
					g <= 0;
				else
					g <= 1;
					h <= h+1;
				end if;
			end if;
		end if;
	end process;
	process(b,g)
	begin
		if(g = 1)then
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
end xkz_a_arch;
