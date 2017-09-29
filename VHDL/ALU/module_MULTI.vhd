----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:55 06/07/2016 
-- Design Name: 
-- Module Name:    module_MULTI - Behavioral 
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

entity module_MULTI is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  Cout: out STD_LOGIC;
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end module_MULTI;

architecture Behavioral of module_MULTI is
SIGNAL Cin: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL regc0,regc1,regc2, regs0,regs1,regs2: STD_LOGIC_VECTOR(15 DOWNTO 0);

COMPONENT multi_1
          port(
			      clk: in STD_LOGIC;
               A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	            Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT multi_2
          port(
               clk: in STD_LOGIC;
               A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT multi_3
          port(
			      clk: in STD_LOGIC;
               A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT multi_4
          port(
			      clk: in STD_LOGIC;
               A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC;
	            Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cout: out STD_LOGIC;
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;
					
begin
     Cin<="0000000000000000";

     A1_multi_1: multi_1
	  PORT MAP(
	           clk=>clk, 
              A=>A,
	           B=>B(2 DOWNTO 0),
	           Cin=>Cin, 
	           Cout=>regc0, 
	           S=>regs0
				  );
				  
	  A2_multi_2: multi_2
	  PORT MAP(
	           clk=>clk,
				  A=>A,
				  B=>B(4 DOWNTO 3),
				  Pre=>regs0,
				  Cin=>regc0,
				  Cout=>regc1,
				  S=>regs1
				  );
				  
	   A3_multi_3: multi_3
		PORT MAP(
		         clk=>clk,
					A=>A,
					B=>B(6 DOWNTO 5),
					Pre=>regs1,
					Cin=>regc1,
					Cout=>regc2,
					S=>regs2
					);
					
		A4_multi_4: multi_4
		PORT MAP(
		         clk=>clk,
					A=>A,
					B=>B(7),
					Pre=>regs2,
					Cin=>regc2,
					Cout=>Cout,
					S=>S
					);
				  
	  

end Behavioral;

