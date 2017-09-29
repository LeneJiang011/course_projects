----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:38:38 06/07/2016 
-- Design Name: 
-- Module Name:    multi_2 - Behavioral 
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

---- L: multi_2 and multi_3 are somehow alike ----
entity multi_2 is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);     --- the results(as S) of previous full adder
	  Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_2;

architecture Behavioral of multi_2 is
SIGNAL S3,S4: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S3_3,S4_4: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S3_3_3,S4_4_4: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL regc,regc0,regc1,regs: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL c,dout: STD_LOGIC_VECTOR(15 DOWNTO 0);


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

COMPONENT singlemodified10
          port(
			      clk: in STD_LOGIC;
					A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
					S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

COMPONENT singlemodified11
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

begin
----------------------------------------------------------------------------------------------------
     B3_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(0),
				  S=>S3
				  );
				  
	  B4_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(1),
				  S=>S4
				  );
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
      L3_multi_left: multi_left
		PORT MAP(
					A=>S3,
					n=>"011",
					S=>S3_3
					);
					
	   L4_multi_left: multi_left
		PORT MAP(
					A=>S4,
					n=>"100",
					S=>S4_4
					);
					
--------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

      M10_singlemodified10: singlemodified10
		PORT MAP(
		         clk=>clk,
					A=>S3_3,
					S=>S3_3_3
					);
					
		M11_singlemodified11: singlemodified11
		PORT MAP(
		         clk=>clk,
					A=>S4_4,
					S=>S4_4_4
					);


     U2_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>Pre,
				  B=>S3_3_3,
				  Cin=>Cin,
				  Cout=>regc0,
				  S=>regs
				  );
				  
	  LU3_multi_left: multi_left
	  PORT MAP(
	           A=>regc0,
				  n=>"001",
				  S=>regc1
				  );
				  
	  U3_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>regs,
				  B=>S4_4_4,
				  Cin=>regc1,
				  Cout=>regc,
				  S=>dout
				  );
				  
	  LU4_multi_left: multi_left
	  PORT MAP(
	           A=>regc,
				  n=>"001",
				  S=>c
				  );
				  
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
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

