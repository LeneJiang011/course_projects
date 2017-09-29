----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:11 06/11/2016 
-- Design Name: 
-- Module Name:    singlemodified - Behavioral 
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

entity singlemodified is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  n: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end singlemodified;

architecture Behavioral of singlemodified is


begin

     process(clk)
	  begin
	  if (clk'event and clk='1') then
     S<=A;	  
	  end if;

	  end process;

				  
		  
				  
end Behavioral;

