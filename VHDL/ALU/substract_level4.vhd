----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:40 06/10/2016 
-- Design Name: 
-- Module Name:    substract_level4 - Behavioral 
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

entity substract_level4 is
port(
     clk:in STD_LOGIC;
     A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Cin: in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	  );
end substract_level4;

architecture Behavioral of substract_level4 is
SIGNAL s0,A0,A1,A2,B0,B1,B2: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL reg: STD_LOGIC;

COMPONENT substract_2bit
          port(
			      A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	            Cin:in STD_LOGIC;
	            Cout:out STD_LOGIC;
	            s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
               );
end COMPONENT;

COMPONENT dff
          port(
               clk:in STD_LOGIC;
               d:in STD_LOGIC;
               q:out STD_LOGIC
               );
end COMPONENT;

COMPONENT dff_2bit
          port(
               clk:in STD_LOGIC;
               d:in STD_LOGIC_VECTOR(1 DOWNTO 0);
               q:out STD_LOGIC_VECTOR(1 DOWNTO 0)
               );
end COMPONENT;			
begin
     Inst_dff_2bit_a0: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>A,
				  q=>A0
				  );

     Inst_dff_2bit_a1: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>A0,
				  q=>A1
				  );
				  
     Inst_dff_2bit_a2: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>A1,
				  q=>A2
				  );
				  
     Inst_dff_2bit_b0: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>B,
				  q=>B0
				  );
				  
     Inst_dff_2bit_b1: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>B0,
				  q=>B1
				  );
				  
     Inst_dff_2bit_b2: dff_2bit
	  PORT MAP(
	           clk=>clk,
				  d=>B1,
				  q=>B2
				  );
				  
		Inst_substract_2bit: substract_2bit
		PORT MAP(
		         A=>A2,
					B=>B2,
					Cin=>Cin,
					Cout=>reg,
					s=>s0
					);
					
		Inst_dff: dff
		PORT MAP(
		         clk=>clk,
					d=>reg,
					q=>Cout
					);
					
		Inst_dff_2bit_0: dff_2bit
		PORT MAP(
		         clk=>clk,
					d=>s0,
					q=>s
					);
					


end Behavioral;

