----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:51:59 06/07/2016 
-- Design Name: 
-- Module Name:    multi_1 - Behavioral 
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

--- L: multi_1 ----
entity multi_1 is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	  Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_1;

architecture Behavioral of multi_1 is

SIGNAL S0,S1,S2: STD_LOGIC_VECTOR(15 DOWNTO 0);                                              --store multiplied results
SIGNAL S1_1,S2_2: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL regc,regc0,regc1,regs: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL dout,c: STD_LOGIC_VECTOR(15 DOWNTO 0);

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


-------------------------------------------------------TRANSFER--------------------------------------------------------------------------------------
     B0_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(0),
				  S=>S0
				  );
				  
     B1_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(1),
				  S=>S1
				  );
				  
     B2_bit_multiply: bit_multiply
	  PORT MAP(
	           A=>A,
				  B=>B(2),
				  S=>S2
				  );
--------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SHIFT-------------------------------------------------------------------------------------
				  
     L1_multi_left: multi_left
	  PORT MAP(
				  A=>S1,
				  n=>"001",
				  S=>S1_1
				  );
				  
     L2_multi_left: multi_left
	  PORT MAP(
				  A=>S2,
				  n=>"010",
				  S=>S2_2
				  );
-------------------------------------------------------------------------------------------------------------------------------------------------------

     U0_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>S0,
				  B=>S1_1,
				  Cin=>Cin,
				  Cout=>regc0,
				  S=>regs
				  );
				  
	  LU1_multi_left: multi_left
	  PORT MAP(
	           A=>regc0,
				  n=>"001",
				  S=>regc1
				  );
				  
	  U1_multi_full_adder: multi_full_adder
	  PORT MAP(
	           A=>regs,
				  B=>S2_2,
				  Cin=>regc1,
				  Cout=>regc,
				  S=>dout
				  );
	  
	  LU2_multi_left: multi_left
	  PORT MAP(
	           A=>regc,
				  n=>"001",
				  S=>c
				  );
				  
-------------------------------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------------------------------					

	  
end Behavioral;

