--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:08 01/12/2019
-- Design Name:   
-- Module Name:   D:/TUGAS KULIAH/PKL LAPAN/UART/BCD/bcd_tb.vhd
-- Project Name:  BCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bcd
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
 
ENTITY bcd_tb IS
END bcd_tb;
 
ARCHITECTURE behavior OF bcd_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd
    PORT(
         clk : IN  std_logic;
         binary : IN  std_logic_vector(11 downto 0);
         ones : OUT  std_logic_vector(3 downto 0);
         tens : OUT  std_logic_vector(3 downto 0);
         hundreds : OUT  std_logic_vector(3 downto 0);
         thousands : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal binary : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal ones : std_logic_vector(3 downto 0);
   signal tens : std_logic_vector(3 downto 0);
   signal hundreds : std_logic_vector(3 downto 0);
   signal thousands : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          clk => clk,
          binary => binary,
          ones => ones,
          tens => tens,
          hundreds => hundreds,
          thousands => thousands
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
  	

      binary <= "101010101010";

      -- insert stimulus here 

      wait;
   end process;

END;
