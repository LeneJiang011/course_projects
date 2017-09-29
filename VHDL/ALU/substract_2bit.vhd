----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:17 06/10/2016 
-- Design Name: 
-- Module Name:    substract_2bit - Behavioral 
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

entity substract_2bit is
port(
     A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Cin:in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC_VECTOR(1 DOWNTO 0) 
	  );
end substract_2bit;

architecture Behavioral of substract_2bit is
SIGNAL reg:STD_LOGIC;

COMPONENT substract
     port(
	       A:in STD_LOGIC;
	       B:in STD_LOGIC;
	       Cin:in STD_LOGIC;
	       Cout:out STD_LOGIC;
	       s:out STD_LOGIC
			 );
end COMPONENT;
begin
     Inst_substract_0: substract
	  PORT MAP(
	           A=>A(0),
	           B=>B(0),
	           Cin=>Cin,
	           Cout=>reg,
	           s=>s(0)
	           );
	  
	  Inst_substract_1: substract
	  PORT MAP(
	           A=>A(1),
	           B=>B(1),
	           Cin=>reg,
	           Cout=>Cout,
	           s=>s(1)
	           );

end Behavioral;

