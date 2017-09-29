----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:43 06/08/2016 
-- Design Name: 
-- Module Name:    transfer8_16 - Behavioral 
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

entity transfer8_16 is
port(
     clk: in STD_LOGIC;
     Cout: in STD_LOGIC;
	  Pre: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
	  
end transfer8_16;

architecture Behavioral of transfer8_16 is


begin
     S<="0000000" & Cout & Pre;

end Behavioral;

