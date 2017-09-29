----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:12 06/07/2016 
-- Design Name: 
-- Module Name:    multi_3 - Behavioral 
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

entity multi_3 is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_3;

architecture Behavioral of multi_3 is
SIGNAL S5,S6: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S5_5,S6_6: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S5_5_5,S6_6_6: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S5_5_5_5,S6_6_6_6: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL regc,regc0,regc1,regs: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL c,dout: STD_LOGIC_VECTOR(15 DOWNTO 0);
--------------------------------------------------------------------
COMPONENT bit_multiply
          port(
			      A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            B: in STD_LOGIC;
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT multi_left
          port(
               A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            n: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	            );
end COMPONENT;			

COMPONENT singlemodified12
          port(
			      clk: in STD_LOGIC;
					A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
					S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT singlemodified13
          port(
			      clk: in STD_LOGIC;
					A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
					S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT multi_full_adder
          port(
			      A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT module_dff
          port(
			      clk: in STD_LOGIC;
               D: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Q: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;
--------------------------------------------------------------------

begin
---------------------------------------------------------------------
     B5_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(0),
				  S=>S5
				  );
				  
	  B6_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(1),
				  S=>S6
				  );
-----------------------------------------------------------------------
      L5_multi_left: multi_left
		PORT MAP(
					A=>S5,
					n=>"101",
					S=>S5_5
					);
					
	   L6_multi_left: multi_left
		PORT MAP(
					A=>S6,
					n=>"110",
					S=>S6_6
					);
-------------------------------------------------------------------------
-------------------------------------------------------------------------
      M12_1_singlemodified12: singlemodified12
		PORT MAP(
		         clk=>clk,
					A=>S5_5,
					S=>S5_5_5
					);
					
		M12_2_singlemodified12: singlemodified12
		PORT MAP(
		         clk=>clk,
					A=>S5_5_5,
					S=>S5_5_5_5
					);
					
      M13_1_singlemodified13: singlemodified13
		PORT MAP(
		         clk=>clk,
					A=>S6_6,
					S=>S6_6_6
					);
					
		M13_2_singlemodified13: singlemodified13
		PORT MAP(
		         clk=>clk,
					A=>S6_6_6,
					S=>S6_6_6_6
					);
					
----------------------------------------------------------------------------
					
     U4_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>Pre,
				  B=>S5_5_5_5,
				  Cin=>Cin,
				  Cout=>regc0,
				  S=>regs
				  );
				  
	  LU5_multi_left: multi_left
	  PORT MAP(
	           A=>regc0,
				  n=>"001",
				  S=>regc1
				  );
				  
	  U5_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>regs,
				  B=>S6_6_6_6,
				  Cin=>regc1,
				  Cout=>regc,
				  S=>dout
				  );
				  
	  LU6_multi_left: multi_left
	  PORT MAP(
	           A=>regc,
				  n=>"001",
				  S=>c
				  );
				  
--------------------------------------------------------------------------
      D0_module_dff: module_dff
		PORT MAP(
		         clk=>clk,
					D=>c,
					Q=>Cout
					);
					
		D1_module_dff: module_dff
		PORT MAP(
		         clk=>clk,
					D=>dout,
					Q=>S
					);

end Behavioral;

