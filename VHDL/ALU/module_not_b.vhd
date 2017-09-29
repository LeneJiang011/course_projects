----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:34 06/06/2016 
-- Design Name: 
-- Module Name:    module_not_b - Behavioral 
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

entity module_not_b is
port(
     B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
end module_not_b;

architecture Behavioral of module_not_b is
COMPONENT not_b
          port(
			      b: in STD_LOGIC;
					s: out STD_LOGIC
					);
end COMPONENT;
begin
     Inst_not_b_0: not_b
	  PORT MAP(
	           b=>B(0),
				  s=>S(0)
				  );
				  
     Inst_not_b_1: not_b
	  PORT MAP(
	           b=>B(1),
				  s=>S(1)
				  );
				  
     Inst_not_b_2: not_b
	  PORT MAP(
	           b=>B(2),
				  s=>S(2)
				  );

     Inst_not_b_3: not_b
	  PORT MAP(
	           b=>B(3),
				  s=>S(3)
				  );
				  
     Inst_not_b_4: not_b
	  PORT MAP(
	           b=>B(4),
				  s=>S(4)
				  );
				  
     Inst_not_b_5: not_b
	  PORT MAP(
	           b=>B(5),
				  s=>S(5)
				  );
				  
     Inst_not_b_6: not_b
	  PORT MAP(
	           b=>B(6),
				  s=>S(6)
				  );

     Inst_not_b_7: not_b
	  PORT MAP(
	           b=>B(7),
				  s=>S(7)
				  );


end Behavioral;

