----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:18 06/05/2016 
-- Design Name: 
-- Module Name:    adder_2bit2 - Behavioral 
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

entity adder_2bit2 is
port(
     A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Cin:in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC_VECTOR(1 DOWNTO 0) 
	  );
end adder_2bit2;

architecture Behavioral of adder_2bit2 is
SIGNAL reg:STD_LOGIC;

COMPONENT full_adder
     port(
	       A:in STD_LOGIC;
	       B:in STD_LOGIC;
	       Cin:in STD_LOGIC;
	       Cout:out STD_LOGIC;
	       s:out STD_LOGIC
			 );
end COMPONENT;
begin
     Inst_full_adder_0: full_adder 
	  PORT MAP(
	           A=>A(0),
	           B=>B(0),
	           Cin=>Cin,
	           Cout=>reg,
	           s=>s(0)
	           );
	  
	  Inst_full_adder_1:full_adder 
	  PORT MAP(
	           A=>A(1),
	           B=>B(1),
	           Cin=>reg,
	           Cout=>Cout,
	           s=>s(1)
	           );


end Behavioral;

