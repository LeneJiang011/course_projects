----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:19 06/11/2016 
-- Design Name: 
-- Module Name:    singlemodified11 - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity singlemodified11 is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end singlemodified11;

architecture Behavioral of singlemodified11 is


begin
     process(clk,A)
	  begin
	  if (clk'event and clk='1') then
	  S<=A;
	  
	  end if;
	  end process;


end Behavioral;

