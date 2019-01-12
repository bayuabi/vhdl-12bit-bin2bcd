library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd is
	Port(
		clk : in STD_LOGIC;
		binary : in STD_LOGIC_VECTOR(11 downto 0);
		ones, tens, hundreds, thousands : out STD_LOGIC_VECTOR(3 downto 0) := "0000" 
	);
end bcd;

architecture Behavioral of bcd is

signal bcd : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal temp : STD_LOGIC_VECTOR(11 downto 0);
type state is (idle, check, shift, save);
signal state_sig : state := idle;
signal cnt : integer range 0  to 11 := 0;

begin
	process(clk)
	begin
		if rising_edge(clk) then
			case state_sig is
				when idle =>
					temp <= binary;
					ones <= (others => '0');
					tens <= (others => '0');
					hundreds <= (others => '0');
					thousands <= (others => '0');
					bcd <= (others => '0');
					state_sig <= check;
				when check =>
					--ones
					if bcd(3 downto 0) > "0100" then
						bcd(3 downto 0) <= bcd(3 downto 0) + "0011";
					end if;
					--tens
					if bcd(7 downto 4) > "0100" then
						bcd(7 downto 4) <= bcd(7 downto 4) + "0011";
					end if;
					--hundreds
					if bcd(11 downto 8) > "0100" then
						bcd(11 downto 8) <= bcd(11 downto 8) + "0011";
					end if;
					--thousands
					if bcd(15 downto 12) > "0100" then
						bcd(15 downto 12) <= bcd(15 downto 12) + "0011";
					end if;
					state_sig <= shift;
				when shift =>
					if cnt <= 10 then 
						cnt <= cnt + 1;
						state_sig <= check;
						bcd <= bcd(14 downto 0) & temp(11);
						temp <= temp(10 downto 0) & '0';
					else 
						bcd <= bcd(14 downto 0) & temp(11);
						temp <= temp(10 downto 0) & '0';
						cnt <= 0;
						state_sig <= save;
					end if;
				when save =>
					ones <= bcd(3 downto 0);
					tens <= bcd(7 downto 4);
					hundreds <= bcd(11 downto 8);
					thousands <= bcd(15 downto 12);	
					state_sig <= idle;
			end case;
		end if;
	end process;
end Behavioral;
