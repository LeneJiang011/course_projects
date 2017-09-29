----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:30 06/06/2016 
-- Design Name: 
-- Module Name:    bit_multiply - Behavioral 
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


-- L: multiply as y0x0, transfer 8 bits to 16 bits
entity bit_multiply is
port(
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC;
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
	  
end bit_multiply;

architecture Behavioral of bit_multiply is
SIGNAL s0: STD_LOGIC_VECTOR(15 DOWNTO 0);

begin  

     s0<="00000000" & A;
     G1: for i in 0 to 15 generate
	          S(i)<=B AND s0(i);
         end generate;

end Behavioral;

