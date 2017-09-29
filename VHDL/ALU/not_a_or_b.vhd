----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:54 06/06/2016 
-- Design Name: 
-- Module Name:    not_a_or_b - Behavioral 
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

entity not_a_or_b is
port(
     a: in STD_LOGIC;
	  b: in STD_LOGIC;
	  s: out STD_LOGIC
	  );
end not_a_or_b;

architecture Behavioral of not_a_or_b is

begin
s<=NOT (a OR b);

end Behavioral;

