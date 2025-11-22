--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:58 04/06/2015
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/xkz/TestBench.vhd
-- Project Name:  xkz
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xkz
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench_b IS
END TestBench_b;
 
ARCHITECTURE behavior OF TestBench_b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xkz_a
    PORT(
         clk : IN  std_logic;
         s: IN std_logic_vector(7 downto 0);
	       led: IN std_logic;
         z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic;
   signal s : std_logic_vector(7 downto 0);
	 signal led : std_logic;

 	--Outputs
   signal z : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xkz_a PORT MAP (
          clk => clk,
          s => s,
          led => led,
          z => z
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- s process
   s_process: process
   begin		
     s <= "00110001";
     wait for clk_period/2;
     wait for clk_period;
     s <= "00110000";
     wait for clk_period*5;
     s <= "00110001";
     wait for clk_period*3;
     s <= "00110010";
     wait for clk_period*3;
     s <= "00110011";
     wait for clk_period*4;
     s <= "00110100";
     wait for clk_period*4;
     s <= "00110101";
     wait for clk_period*4;
     s <= "00110110";
     wait for clk_period*4;
     s <= "00110111";
     wait for clk_period*4;
     s <= "00111000";
     wait for clk_period*4;
     s <= "00111001";
     wait for clk_period*4;
     s <= "00110000";
     wait for clk_period*10000;
   end process;
   
   --led_process
   led_process:process
   begin
     led <= '1';
     wait for clk_period/2;
     wait for clk_period;
     led <= '0';
     wait for clk_period*10000;
   end process;

END;
