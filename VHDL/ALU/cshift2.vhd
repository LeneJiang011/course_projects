----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:13:22 06/10/2016 
-- Design Name: 
-- Module Name:    cshift2 - Behavioral 
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

entity cshift2 is
port(
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC;
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end cshift2;

architecture Behavioral of cshift2 is
SIGNAL S0: STD_LOGIC_VECTOR(15 DOWNTO 0);

COMPONENT bit_multiply
          port(
               A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC;
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	            );
end COMPONENT;

					
COMPONENT multi_left
          port(
               A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            n: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	            );
end COMPONENT;
begin
     B0_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B,
				  S=>S0
				  );
				  

				  
     L1_multi_left: multi_left
	  PORT MAP(
				  A=>S0,
				  n=>"001",
				  S=>S
				  );

end Behavioral;

