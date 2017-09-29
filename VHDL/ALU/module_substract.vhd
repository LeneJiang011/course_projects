----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:28 06/08/2016 
-- Design Name: 
-- Module Name:    module_substract - Behavioral 
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

entity module_substract is
port(
     clk: in STD_LOGIC;
	  A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end module_substract;

architecture Behavioral of module_substract is
SIGNAL Cin,c0,c1,c2,c3: STD_LOGIC;
SIGNAL Cout: STD_LOGIC;
SIGNAL Sout: STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT substract_level1
          port(	    
               clk:in STD_LOGIC;
               A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Cin: in STD_LOGIC;
	            Cout:out STD_LOGIC;
	            s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT substract_level2
          port(	    
               clk:in STD_LOGIC;
               A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Cin: in STD_LOGIC;
	            Cout:out STD_LOGIC;
	            s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT substract_level3
          port(	    
               clk:in STD_LOGIC;
               A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Cin: in STD_LOGIC;
	            Cout:out STD_LOGIC;
	            s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT substract_level4
          port(	    
               clk:in STD_LOGIC;
               A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Cin: in STD_LOGIC;
	            Cout:out STD_LOGIC;
	            s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT substract_8_16
          port(
					Cout: in STD_LOGIC;
					Pre: in STD_LOGIC_VECTOR(7 DOWNTO 0);
					S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

begin
     Cin<='1';
     Inst_substract_level1: substract_level1
	  PORT MAP(
	           clk=>clk,
	           A=>A(1 DOWNTO 0),
				  B=>B(1 DOWNTO 0),
				  Cin=>Cin,
				  Cout=>c0,
				  s=>Sout(1 DOWNTO 0)
				  );

		Inst_substract_level2: substract_level2
		PORT MAP(
		         clk=>clk,
		         A=>A(3 DOWNTO 2),
					B=>B(3 DOWNTO 2),
					Cin=>c0,
					Cout=>c1,
					s=>Sout(3 DOWNTO 2)
					);
					
		Inst_substract_level3: substract_level3
		PORT MAP(
		         clk=>clk,
					A=>A(5 DOWNTO 4),
					B=>B(5 DOWNTO 4),
					Cin=>c1,
					Cout=>c2,
					s=>Sout(5 DOWNTO 4)
					);
					
		Inst_substract_level4: substract_level4
		PORT MAP(
		         clk=>clk,
					A=>A(7 DOWNTO 6),
					B=>B(7 DOWNTO 6),
					Cin=>c2,
					Cout=>c3,
					s=>Sout(7 DOWNTO 6)
					);
					
		Inst_substract_8_16: substract_8_16
		PORT MAP(
					Cout=>c3,
					Pre=>Sout,
					S=>S
					);


end Behavioral;

