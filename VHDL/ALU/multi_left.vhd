----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:20:17 06/07/2016 
-- Design Name: 
-- Module Name:    multi_left - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


----L: shift control, shift bits are controlled by n----
entity multi_left is
port(
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  n: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_left;

architecture Behavioral of multi_left is

begin
     process(A)
	  begin
     CASE n IS
	       when "001" => S<=A(14 DOWNTO 0) & A(15);
			 when "010" => S<=A(13 DOWNTO 0) & A(15 DOWNTO 14);
			 when "011" => S<=A(12 DOWNTO 0) & A(15 DOWNTO 13);
			 when "100" => S<=A(11 DOWNTO 0) & A(15 DOWNTO 12);
			 when "101" => S<=A(10 DOWNTO 0) & A(15 DOWNTO 11);
			 when "110" => S<=A(9 DOWNTO 0) & A(15 DOWNTO 10);
			 when "111" => S<=A(8 DOWNTO 0) & A(15 DOWNTO 9);
			 when others => S<="0000000000000000";
		end CASE;
		end process;

end Behavioral;

