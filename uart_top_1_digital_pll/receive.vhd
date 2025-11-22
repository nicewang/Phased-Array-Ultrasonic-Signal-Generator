library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity receive is
	port(sys_clk: in std_logic;
		rx_data: in std_logic_vector(7 downto 0);
	   s0: out std_logic_vector(7 downto 0);
	   s1: out std_logic_vector(7 downto 0);
		s2: out std_logic_vector(7 downto 0);
	   s3: out std_logic_vector(7 downto 0);
	   s4: out std_logic_vector(7 downto 0);
	   s5: out std_logic_vector(7 downto 0);
	   s6: out std_logic_vector(7 downto 0);
	   s7: out std_logic_vector(7 downto 0);
		seg_en: out std_logic_vector(7 downto 0));
end receive;

architecture receive_arch of receive is
signal i : integer := 0;
--signal rx_data1 : std_logic_vector(7 downto 0) := "00000000";
--signal rx_data2 : std_logic_vector(7 downto 0) := "00000000";
signal s01 : std_logic_vector(7 downto 0) := "00110000";
signal s11 : std_logic_vector(7 downto 0) := "00110000";
signal s21 : std_logic_vector(7 downto 0) := "00110000";
signal s31 : std_logic_vector(7 downto 0) := "00110000";
signal s41 : std_logic_vector(7 downto 0) := "00110000";
signal s51 : std_logic_vector(7 downto 0) := "00110000";
signal s61 : std_logic_vector(7 downto 0) := "00110000";
signal s71 : std_logic_vector(7 downto 0) := "00110000";
signal seg_en1 : std_logic_vector(7 downto 0) := "11111110";
begin
	
	process(rx_data)
	begin
		if(rx_data="01100001")then
			i <= 0;
			seg_en1 <= "11111110";
			seg_en <= seg_en1;
		elsif(rx_data="01100010")then
			i <= 1;
			seg_en1 <= "11111101";
			seg_en <= seg_en1;
		elsif(rx_data="01100011")then
			i <= 2;
			seg_en1 <= "11111011";
			seg_en <= seg_en1;
		elsif(rx_data="01100100")then
			i <= 3;
			seg_en1 <= "11110111";
			seg_en <= seg_en1;
		elsif(rx_data="01100101")then
			i <= 4;
			seg_en1 <= "11101111";
			seg_en <= seg_en1;
		elsif(rx_data="01100110")then
			i <= 5;
			seg_en1 <= "11011111";
			seg_en <= seg_en1;
		elsif(rx_data="01100111")then
			i <= 6;
			seg_en1 <= "10111111";
			seg_en <= seg_en1;
		elsif(rx_data="01101000")then
			i <= 7;
			seg_en1 <= "01111111";
			seg_en <= seg_en1;
		else
			seg_en1 <= "11111111";
			seg_en <= seg_en1;
		end if;
	end process;
	
	process(rx_data,i)
	begin
		if(rx_data = "00110000" or rx_data = "00110001" or rx_data = "00110010" or rx_data = "00110011"
		or rx_data = "00110100" or rx_data = "00110101" or rx_data = "00110110" or rx_data = "00110111" 
		or rx_data = "00111000" or rx_data = "00111001")then
			if(i=0)then
				s01 <= rx_data;
			elsif(i=1)then
				s11 <= rx_data;
			elsif(i=2)then
				s21 <= rx_data;
			elsif(i=3)then
				s31 <= rx_data;
			elsif(i=4)then
				s41 <= rx_data;
			elsif(i=5)then
				s51 <= rx_data;
			elsif(i=6)then
				s61 <= rx_data;
			else
				s71 <= rx_data;
			end if;
		end if;
	end process;
	
	process(s01,s11,s21,s31,s41,s51,s61,s71)
	begin
		s0 <= s01;
		s1 <= s11;
		s2 <= s21;
		s3 <= s31;
		s4 <= s41;
		s5 <= s51;
		s6 <= s61;
		s7 <= s71;
	end process;
	
end receive_arch;
