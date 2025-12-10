library ieee;
use ieee.std_logic_1164.all;
--library unisim;
--use unisim.vcomponents.all;

entity xkz_b is
	port(clk: in std_logic;
	  s5: in std_logic;
	  s2: in std_logic;
	  wavelength: in std_logic_vector(8 downto 0);
		z: out std_logic_vector(7 downto 0));
end xkz_b;

architecture xkz_b_arch of xkz_b is
signal a:integer := 0;
signal b:integer := 0;
signal c:integer;
signal d:integer := 0;
signal e:integer;
begin
  process(wavelength)
  begin
    case wavelength is
    when "000000001" => e <= 0;
		when "000000010" => e <= 1;
		when "000000100" => e <= 2;
		when "000001000" => e <= 3;
		when "000010000" => e <= 4;
		when "000100000" => e <= 5;
		when "001000000" => e <= 6;
		when "010000000" => e <= 7;
		when "100000000" => e <= 8;
		when others => e <= 0;
		end case;
  end process;
  process(s5,s2)
  begin
    if(s5 = '1' and s2 = '0')then
      d <= 1;
    elsif(s5 = '0' and s2 = '1')then
      d <= 4;
    else
      d <= 9;
    end if;
  end process;
	process(clk)
	begin
	if(clk'event and clk='1')then
	  a <= a+1;
			if(a = d)then
			 b <= b+1;
			 a <= 0;
			 if(b = 7)then
		      b <= 0;
		   end if;
		  end if;
	end if;
	end process;
	process(a,d,e)
	begin
	  if(a >= d-e-1 and a < d)then
	   c <= 1;
	  else
	   c <= 0;
	  end if;
	end process;
	process(b,c)
	begin
		if(c = 1)then
			case b is
			when 0 => z <= "01111111";
			when 1 => z <= "10111111";
			when 2 => z <= "11011111";
			when 3 => z <= "11101111";
			when 4 => z <= "11110111";
			when 5 => z <= "11111011";
			when 6 => z <= "11111101";
			when others => z<="11111110";
			end case;
		else
			z <= "11111111";
		end if;
	end process;
end xkz_b_arch;
