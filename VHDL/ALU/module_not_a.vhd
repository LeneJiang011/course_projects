----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:05 06/06/2016 
-- Design Name: 
-- Module Name:    module_not_a - Behavioral 
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

entity module_not_a is
port(
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
end module_not_a;

architecture Behavioral of module_not_a is

COMPONENT not_a
          port(
			      a: in STD_LOGIC;
					s: out STD_LOGIC
					);
end COMPONENT;

begin
     Inst_not_a_0: not_a
	  PORT MAP(
	           a=>A(0),
				  s=>S(0)
				  );
				  
     Inst_not_a_1: not_a
	  PORT MAP(
	           a=>A(1),
				  s=>S(1)
				  );
				  
     Inst_not_a_2: not_a
	  PORT MAP(
	           a=>A(2),
				  s=>S(2)
				  );

     Inst_not_a_3: not_a
	  PORT MAP(
	           a=>A(3),
				  s=>S(3)
				  );
				  
     Inst_not_a_4: not_a
	  PORT MAP(
	           a=>A(4),
				  s=>S(4)
				  );
				  
     Inst_not_a_5: not_a
	  PORT MAP(
	           a=>A(5),
				  s=>S(5)
				  );
				  
     Inst_not_a_6: not_a
	  PORT MAP(
	           a=>A(6),
				  s=>S(6)
				  );

     Inst_not_a_7: not_a
	  PORT MAP(
	           a=>A(7),
				  s=>S(7)
				  );
end Behavioral;

