----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:57 06/07/2016 
-- Design Name: 
-- Module Name:    multi_4 - Behavioral 
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

--- L: multi_4 has a special bottom_adder, to do the bottom add---
entity multi_4 is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC;
	  Pre: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cout: out STD_LOGIC;
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_4;

architecture Behavioral of multi_4 is
SIGNAL S1: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL S7,S7_7,S7_7_7,S7_7_7_7,S7_7_7_7_7: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL regc,regc0,regs: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL cout0: STD_LOGIC;

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

COMPONENT singlemodified14
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

COMPONENT bottom_adder
          port(
               A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	            Cin: in STD_LOGIC;
	            Cout: out STD_LOGIC;
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	            );
end COMPONENT;

COMPONENT dff
          port(
			      clk: in STD_LOGIC;
					d: in STD_LOGIC;
					q: out STD_LOGIC
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

     B7_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B,
				  S=>S7
				  );
				  
      L7_multi_left: multi_left
		PORT MAP(
					A=>S7,
					n=>"111",
					S=>S7_7
					);
					
      M14_1_singlemodified14: singlemodified14
		PORT MAP(
		         clk=>clk,
					A=>S7_7,
					S=>S7_7_7
					);
					
		M14_2_singlemodified14: singlemodified14
		PORT MAP(
		         clk=>clk,
					A=>S7_7_7,
					S=>S7_7_7_7
					);
					
      M14_3_singlemodified14: singlemodified14
		PORT MAP(
		         clk=>clk,
					A=>S7_7_7_7,
					S=>S7_7_7_7_7
					);
----------------------------------------------------------					
-------------------------------------------------------------					 
      U6_multi_full_adder: multi_full_adder
	   PORT MAP(
	            A=>Pre,
				   B=>S7_7_7_7_7,
				   Cin=>Cin,
				   Cout=>regc0,
				   S=>regs
				   );
					 
	   LU7_multi_left: multi_left
	   PORT MAP(
	            A=>regc0,
				   n=>"001",
				   S=>regc
				   );

      A7_bottom_adder: bottom_adder
		PORT MAP(
		         A=>regc,
					B=>regs,
					Cin=>'0',
					Cout=>cout0,
					S=>S1
					);
					
      D0_dff: dff
		PORT MAP(
		         clk=>clk,
					d=>cout0,
					q=>Cout
					);
					
      D1_module_dff: module_dff
		PORT MAP(
		         clk=>clk,
					D=>S1,
					Q=>S
					);



end Behavioral;

