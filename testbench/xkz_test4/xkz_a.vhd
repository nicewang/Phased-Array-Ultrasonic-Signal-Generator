library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xkz_a is
	port(clk: in std_logic;
	   s0: in std_logic_vector(7 downto 0);
	   s1: in std_logic_vector(7 downto 0);
	   s2: in std_logic_vector(7 downto 0);
	   s3: in std_logic_vector(7 downto 0);
	   s4: in std_logic_vector(7 downto 0);
	   s5: in std_logic_vector(7 downto 0);
	   s6: in std_logic_vector(7 downto 0);
	   s7: in std_logic_vector(7 downto 0);
		led: in std_logic;
		z: out std_logic_vector(7 downto 0));
end xkz_a;

architecture xkz_a_arch of xkz_a is
signal a:integer := 0;
signal b:integer := 0;
signal c:std_logic_vector(7 downto 0) :="00000000";
--signal d:integer :=1;
--signal e:integer :=1;
signal g:std_logic_vector(7 downto 0) :="00000000";

TYPE matrix_index is array (7 downto 0) of integer;
signal d:matrix_index := (1,1,1,1,1,1,1,1);
signal e:matrix_index := (1,1,1,1,1,1,1,1);
signal h:matrix_index := (0,0,0,0,0,0,0,0);

begin
  
  process(led,s0)
  begin
	if(led='1')then
		case s0 is
		when "00110000" => d(0) <= 1;
		when "00110001" => d(0) <= 2;
		when "00110010" => d(0) <= 3;
		when "00110011" => d(0) <= 4;
		when "00110100" => d(0) <= 5;
		when "00110101" => d(0) <= 6;
		when "00110110" => d(0) <= 7;
		when "00110111" => d(0) <= 8;
		when "00111000" => d(0) <= 9;
		when "00111001" => d(0) <= 10;
		when others => d(0) <= 1;
		end case;
	else
		case s0 is
		when "00110000" => e(0) <= 1;
		when "00110001" => e(0) <= 2;
		when "00110010" => e(0) <= 3;
		when "00110011" => e(0) <= 4;
		when "00110100" => e(0) <= 5;
		when "00110101" => e(0) <= 6;
		when "00110110" => e(0) <= 7;
		when "00110111" => e(0) <= 8;
		when "00111000" => e(0) <= 9;
		when "00111001" => e(0) <= 10;
		when others => e(0) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s1)
  begin
	if(led='1')then
		case s1 is
		when "00110000" => d(1) <= 1;
		when "00110001" => d(1) <= 2;
		when "00110010" => d(1) <= 3;
		when "00110011" => d(1) <= 4;
		when "00110100" => d(1) <= 5;
		when "00110101" => d(1) <= 6;
		when "00110110" => d(1) <= 7;
		when "00110111" => d(1) <= 8;
		when "00111000" => d(1) <= 9;
		when "00111001" => d(1) <= 10;
		when others => d(1) <= 1;
		end case;
	else
		case s1 is
		when "00110000" => e(1) <= 1;
		when "00110001" => e(1) <= 2;
		when "00110010" => e(1) <= 3;
		when "00110011" => e(1) <= 4;
		when "00110100" => e(1) <= 5;
		when "00110101" => e(1) <= 6;
		when "00110110" => e(1) <= 7;
		when "00110111" => e(1) <= 8;
		when "00111000" => e(1) <= 9;
		when "00111001" => e(1) <= 10;
		when others => e(1) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s2)
  begin
	if(led='1')then
		case s2 is
		when "00110000" => d(2) <= 1;
		when "00110001" => d(2) <= 2;
		when "00110010" => d(2) <= 3;
		when "00110011" => d(2) <= 4;
		when "00110100" => d(2) <= 5;
		when "00110101" => d(2) <= 6;
		when "00110110" => d(2) <= 7;
		when "00110111" => d(2) <= 8;
		when "00111000" => d(2) <= 9;
		when "00111001" => d(2) <= 10;
		when others => d(2) <= 1;
		end case;
	else
		case s2 is
		when "00110000" => e(2) <= 1;
		when "00110001" => e(2) <= 2;
		when "00110010" => e(2) <= 3;
		when "00110011" => e(2) <= 4;
		when "00110100" => e(2) <= 5;
		when "00110101" => e(2) <= 6;
		when "00110110" => e(2) <= 7;
		when "00110111" => e(2) <= 8;
		when "00111000" => e(2) <= 9;
		when "00111001" => e(2) <= 10;
		when others => e(2) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s3)
  begin
	if(led='1')then
		case s3 is
		when "00110000" => d(3) <= 1;
		when "00110001" => d(3) <= 2;
		when "00110010" => d(3) <= 3;
		when "00110011" => d(3) <= 4;
		when "00110100" => d(3) <= 5;
		when "00110101" => d(3) <= 6;
		when "00110110" => d(3) <= 7;
		when "00110111" => d(3) <= 8;
		when "00111000" => d(3) <= 9;
		when "00111001" => d(3) <= 10;
		when others => d(3) <= 1;
		end case;
	else
		case s3 is
		when "00110000" => e(3) <= 1;
		when "00110001" => e(3) <= 2;
		when "00110010" => e(3) <= 3;
		when "00110011" => e(3) <= 4;
		when "00110100" => e(3) <= 5;
		when "00110101" => e(3) <= 6;
		when "00110110" => e(3) <= 7;
		when "00110111" => e(3) <= 8;
		when "00111000" => e(3) <= 9;
		when "00111001" => e(3) <= 10;
		when others => e(3) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s4)
  begin
	if(led='1')then
		case s4 is
		when "00110000" => d(4) <= 1;
		when "00110001" => d(4) <= 2;
		when "00110010" => d(4) <= 3;
		when "00110011" => d(4) <= 4;
		when "00110100" => d(4) <= 5;
		when "00110101" => d(4) <= 6;
		when "00110110" => d(4) <= 7;
		when "00110111" => d(4) <= 8;
		when "00111000" => d(4) <= 9;
		when "00111001" => d(4) <= 10;
		when others => d(4) <= 1;
		end case;
	else
		case s4 is
		when "00110000" => e(4) <= 1;
		when "00110001" => e(4) <= 2;
		when "00110010" => e(4) <= 3;
		when "00110011" => e(4) <= 4;
		when "00110100" => e(4) <= 5;
		when "00110101" => e(4) <= 6;
		when "00110110" => e(4) <= 7;
		when "00110111" => e(4) <= 8;
		when "00111000" => e(4) <= 9;
		when "00111001" => e(4) <= 10;
		when others => e(4) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s5)
  begin
	if(led='1')then
		case s5 is
		when "00110000" => d(5) <= 1;
		when "00110001" => d(5) <= 2;
		when "00110010" => d(5) <= 3;
		when "00110011" => d(5) <= 4;
		when "00110100" => d(5) <= 5;
		when "00110101" => d(5) <= 6;
		when "00110110" => d(5) <= 7;
		when "00110111" => d(5) <= 8;
		when "00111000" => d(5) <= 9;
		when "00111001" => d(5) <= 10;
		when others => d(5) <= 1;
		end case;
	else
		case s5 is
		when "00110000" => e(5) <= 1;
		when "00110001" => e(5) <= 2;
		when "00110010" => e(5) <= 3;
		when "00110011" => e(5) <= 4;
		when "00110100" => e(5) <= 5;
		when "00110101" => e(5) <= 6;
		when "00110110" => e(5) <= 7;
		when "00110111" => e(5) <= 8;
		when "00111000" => e(5) <= 9;
		when "00111001" => e(5) <= 10;
		when others => e(5) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s6)
  begin
	if(led='1')then
		case s6 is
		when "00110000" => d(6) <= 1;
		when "00110001" => d(6) <= 2;
		when "00110010" => d(6) <= 3;
		when "00110011" => d(6) <= 4;
		when "00110100" => d(6) <= 5;
		when "00110101" => d(6) <= 6;
		when "00110110" => d(6) <= 7;
		when "00110111" => d(6) <= 8;
		when "00111000" => d(6) <= 9;
		when "00111001" => d(6) <= 10;
		when others => d(6) <= 1;
		end case;
	else
		case s6 is
		when "00110000" => e(6) <= 1;
		when "00110001" => e(6) <= 2;
		when "00110010" => e(6) <= 3;
		when "00110011" => e(6) <= 4;
		when "00110100" => e(6) <= 5;
		when "00110101" => e(6) <= 6;
		when "00110110" => e(6) <= 7;
		when "00110111" => e(6) <= 8;
		when "00111000" => e(6) <= 9;
		when "00111001" => e(6) <= 10;
		when others => e(6) <= 1;
		end case;
	end if;
  end process;
  
  process(led,s7)
  begin
	if(led='1')then
		case s7 is
		when "00110000" => d(7) <= 1;
		when "00110001" => d(7) <= 2;
		when "00110010" => d(7) <= 3;
		when "00110011" => d(7) <= 4;
		when "00110100" => d(7) <= 5;
		when "00110101" => d(7) <= 6;
		when "00110110" => d(7) <= 7;
		when "00110111" => d(7) <= 8;
		when "00111000" => d(7) <= 9;
		when "00111001" => d(7) <= 10;
		when others => d(7) <= 1;
		end case;
	else
		case s7 is
		when "00110000" => e(7) <= 1;
		when "00110001" => e(7) <= 2;
		when "00110010" => e(7) <= 3;
		when "00110011" => e(7) <= 4;
		when "00110100" => e(7) <= 5;
		when "00110101" => e(7) <= 6;
		when "00110110" => e(7) <= 7;
		when "00110111" => e(7) <= 8;
		when "00111000" => e(7) <= 9;
		when "00111001" => e(7) <= 10;
		when others => e(7) <= 1;
		end case;
	end if;
  end process;
  
	process(clk)
	begin
	if(clk'event and clk='1')then
	  a <= a+1;
		if(a >= d(b))then
			a <= 0;
			b <= b+1;
			c(b) <= '1';
			if(b = 7)then
		    b <= 0;
			end if;
		else
			c(b) <= '0';
			if(b >=1)then
			 c(b-1) <= '0';
			else
			 c(7) <= '0';
			end if;
		end if;
	end if;
	end process;
	
	process(clk,c(0),g(0),e(0))
	begin
		if(c(0)='1' or g(0)='1')then
			if(clk'event and clk='1')then
				if(h(0)>=e(0))then
					h(0) <= 0;
					g(0) <= '0';
				else
					g(0) <= '1';
					h(0) <= h(0)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(1),g(1),e(1))
	begin
		if(c(1)='1' or g(1)='1')then
			if(clk'event and clk='1')then
				if(h(1)>=e(1))then
					h(1) <= 0;
					g(1) <= '0';
				else
					g(1) <= '1';
					h(1) <= h(1)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(2),g(2),e(2))
	begin
		if(c(2)='1' or g(2)='1')then
			if(clk'event and clk='1')then
				if(h(2)>=e(2))then
					h(2) <= 0;
					g(2) <= '0';
				else
					g(2) <= '1';
					h(2) <= h(2)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(3),g(3),e(3))
	begin
		if(c(3)='1' or g(3)='1')then
			if(clk'event and clk='1')then
				if(h(3)>=e(3))then
					h(3) <= 0;
					g(3) <= '0';
				else
					g(3) <= '1';
					h(3) <= h(3)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(4),g(4),e(4))
	begin
		if(c(4)='1' or g(4)='1')then
			if(clk'event and clk='1')then
				if(h(4)>=e(4))then
					h(4) <= 0;
					g(4) <= '0';
				else
					g(4) <= '1';
					h(4) <= h(4)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(5),g(5),e(5))
	begin
		if(c(5)='1' or g(5)='1')then
			if(clk'event and clk='1')then
				if(h(5)>=e(5))then
					h(5) <= 0;
					g(5) <= '0';
				else
					g(5) <= '1';
					h(5) <= h(5)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(6),g(6),e(6))
	begin
		if(c(6)='1' or g(6)='1')then
			if(clk'event and clk='1')then
				if(h(6)>=e(6))then
					h(6) <= 0;
					g(6) <= '0';
				else
					g(6) <= '1';
					h(6) <= h(6)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,c(7),g(7),e(7))
	begin
		if(c(7)='1' or g(7)='1')then
			if(clk'event and clk='1')then
				if(h(7)>=e(7))then
					h(7) <= 0;
					g(7) <= '0';
				else
					g(7) <= '1';
					h(7) <= h(7)+1;
				end if;
			end if;
		end if;
	end process;
	
	process(g(0))
	begin
		if(g(0) = '1')then
			z(0) <= '1';
		else
			z(0) <= '0';
		end if;
	end process;
	
	process(g(1))
	begin
		if(g(1) = '1')then
			z(1) <= '1';
		else
			z(1) <= '0';
		end if;
	end process;
	
	process(g(2))
	begin
		if(g(2) = '1')then
			z(2) <= '1';
		else
			z(2) <= '0';
		end if;
	end process;
	
	process(g(3))
	begin
		if(g(3) = '1')then
			z(3) <= '1';
		else
			z(3) <= '0';
		end if;
	end process;
	
	process(g(4))
	begin
		if(g(4) = '1')then
			z(4) <= '1';
		else
			z(4) <= '0';
		end if;
	end process;
	
	process(g(5))
	begin
		if(g(5) = '1')then
			z(5) <= '1';
		else
			z(5) <= '0';
		end if;
	end process;
	
	process(g(6))
	begin
		if(g(6) = '1')then
			z(6) <= '1';
		else
			z(6) <= '0';
		end if;
	end process;
	
	process(g(7))
	begin
		if(g(7) = '1')then
			z(7) <= '1';
		else
			z(7) <= '0';
		end if;
	end process;
	
end xkz_a_arch;
