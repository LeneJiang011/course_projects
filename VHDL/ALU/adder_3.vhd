----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:35:38 06/05/2016 
-- Design Name: 
-- Module Name:    adder_3 - Behavioral 
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

entity adder_3 is
port(
     clk:in STD_LOGIC;
     A:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  B:in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  Cin: in STD_LOGIC;
	  Cout:out STD_LOGIC;
	  s:out STD_LOGIC_VECTOR(1 DOWNTO 0)
	  );
end adder_3;

architecture Behavioral of adder_3 is
SIGNAL A0,B0,A1,B1,s0,s1: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL reg: STD_LOGIC;

COMPONENT adder_2bit
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
				  
		Inst_adder_2bit: adder_2bit
		PORT MAP(
		         A=>A1,
					B=>B1,
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
					q=>s
					);


end Behavioral;

