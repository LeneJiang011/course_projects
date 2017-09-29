----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:49:17 06/10/2016 
-- Design Name: 
-- Module Name:    substract_level1 - Behavioral 
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

entity substract_level1 is
port(
     clk:in STD_LOGIC;
     A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Cin: in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	  );
end substract_level1;

architecture Behavioral of substract_level1 is
SIGNAL reg: STD_LOGIC;
SIGNAL s0,s1,s2,s3: STD_LOGIC_VECTOR(1 DOWNTO 0);

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
     Inst_substract_2bit: substract_2bit
	  PORT MAP(
	           A=>A,
				  B=>B,
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
					q=>s1
					);
		
		Inst_dff_2bit_1: dff_2bit
		PORT MAP(
		         clk=>clk,
					d=>s1,
					q=>s2
					);
					
		Inst_dff_2bit_2: dff_2bit
		PORT MAP(
		         clk=>clk,
					d=>s2,
					q=>s3
					);
					
		Inst_dff_2bit_3: dff_2bit
		PORT MAP(
		         clk=>clk,
					d=>s3,
					q=>s
					);
				

end Behavioral;

