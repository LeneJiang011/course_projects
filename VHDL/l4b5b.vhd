----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:07 06/17/2016 
-- Design Name: 
-- Module Name:    l4b5b - Behavioral 
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

entity l4b5b is
port(
	  i_0:in STD_LOGIC;
	  i_1:in STD_LOGIC;
	  i_2:in STD_LOGIC;
	  i_3:in STD_LOGIC;
	  o_0:out STD_LOGIC;
	  o_1:out STD_LOGIC;
	  o_2:out STD_LOGIC;
	  o_3:out STD_LOGIC;
	  o_4:out STD_LOGIC		  
	);
end l4b5b;

architecture Behavioral of l4b5b is

begin
    o_0<=((i_0 NOR '0') NOR '0');
	 o_1<=(i_1 NOR i_0) OR (i_3 NOR (NOT i_2)) OR ((NOT i_3) NOR i_2) OR (i_1 NOR (NOT i_3));
	 o_2<=((i_1 NOR (((i_3 NOR i_2) NOR '0') NOR i_0)) NOR '0');
	 o_3<=((i_2 NOR (i_3 NOR i_1)) NOR '0');
	 o_4<=((((i_3 NOR ((i_1 NOR '0') NOR i_2)) NOR '0') NOR (((i_0 NOR i_2)NOR '0') NOR i_3)) NOR '0');

end Behavioral;

