----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:00 06/06/2016 
-- Design Name: 
-- Module Name:    module_a_or_b - Behavioral 
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

entity module_a_or_b is
port(
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
end module_a_or_b;

architecture Behavioral of module_a_or_b is

COMPONENT a_or_b
          port(
			      a: in STD_LOGIC;
					b: in STD_LOGIC;
					s: out STD_LOGIC
					);
end COMPONENT;

begin
     Inst_a_or_b_0: a_or_b
	  PORT MAP(
	           a=>A(0),
				  b=>B(0),
				  s=>S(0)
				  );
				  
     Inst_a_or_b_1: a_or_b
	  PORT MAP(
	           a=>A(1),
				  b=>B(1),
				  s=>S(1)
				  );
				  
     Inst_a_or_b_2: a_or_b
	  PORT MAP(
	           a=>A(2),
				  b=>B(2),
				  s=>S(2)
				  );
				  
     Inst_a_or_b_3: a_or_b
	  PORT MAP(
	           a=>A(3),
				  b=>B(3),
				  s=>S(3)
				  );
				  
     Inst_a_or_b_4: a_or_b
	  PORT MAP(
	           a=>A(4),
				  b=>B(4),
				  s=>S(4)
				  );
				  
     Inst_a_or_b_5: a_or_b
	  PORT MAP(
	           a=>A(5),
				  b=>B(5),
				  s=>S(5)
				  );

     Inst_a_or_b_6: a_or_b
	  PORT MAP(
	           a=>A(6),
				  b=>B(6),
				  s=>S(6)
				  );
				  
     Inst_a_or_b_7: a_or_b
	  PORT MAP(
	           a=>A(7),
				  b=>B(7),
				  s=>S(7)
				  );



end Behavioral;

