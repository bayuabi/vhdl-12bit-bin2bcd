--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:37 01/12/2019
-- Design Name:   
-- Module Name:   D:/TUGAS KULIAH/PKL LAPAN/UART/BCD/adc_tb.vhd
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
 
ENTITY adc_tb IS
END adc_tb;
 
ARCHITECTURE behavior OF adc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd
    PORT(
         clk : IN  std_logic;
         binary : IN  std_logic_vector(11 downto 0);
         satuan : OUT  std_logic_vector(3 downto 0);
         puluhan : OUT  std_logic_vector(3 downto 0);
         ratusan : OUT  std_logic_vector(3 downto 0);
         ribuan : OUT  std_logic_vector(3 downto 0);
         state_out : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal binary : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal satuan : std_logic_vector(3 downto 0);
   signal puluhan : std_logic_vector(3 downto 0);
   signal ratusan : std_logic_vector(3 downto 0);
   signal ribuan : std_logic_vector(3 downto 0);
   signal state_out : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd PORT MAP (
          clk => clk,
          binary => binary,
          satuan => satuan,
          puluhan => puluhan,
          ratusan => ratusan,
          ribuan => ribuan,
          state_out => state_out
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
      --wait for 100 ns;	

      binary <= "111111111111"; 

      wait;
   end process;

END;
