----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:22 06/09/2016 
-- Design Name: 
-- Module Name:    adder_full - Behavioral 
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

entity adder_full is
port(
     A:in STD_LOGIC;
	  B:in STD_LOGIC;
	  Cin:in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC
	  );
     
end adder_full;

architecture Behavioral of adder_full is

begin
     s<= A XOR B XOR Cin;
	  Cout<=(Cin AND (A XOR B)) OR (A AND B);

end Behavioral;

