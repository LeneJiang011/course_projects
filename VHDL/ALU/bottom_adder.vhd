----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:25:31 06/07/2016 
-- Design Name: 
-- Module Name:    bottom_adder - Behavioral 
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

entity bottom_adder is
port(
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cin: in STD_LOGIC;
	  Cout: out STD_LOGIC;
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end bottom_adder;

architecture Behavioral of bottom_adder is
SIGNAL regc0,regc1,regc2,regc3,regc4,regc5,regc6,regc7,regc8,regc9,regc10,regc11,regc12,regc13,regc14,regc15: STD_LOGIC;

COMPONENT full_adder_multi
          port(
			      A: in STD_LOGIC;
	            B: in STD_LOGIC;
	            Cin: in STD_LOGIC;
	            Cout: out STD_LOGIC;
	            S: out STD_LOGIC
					);
end COMPONENT;

begin
     A0_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(0),
				  B=>B(0),
				  Cin=>Cin,
				  Cout=>regc0,
				  S=>S(0)
				  );
				  
     A1_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(1),
				  B=>B(1),
				  Cin=>regc0,
				  Cout=>regc1,
				  S=>S(1)
				  );
				  
     A2_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(2),
				  B=>B(2),
				  Cin=>regc1,
				  Cout=>regc2,
				  S=>S(2)
				  );
				  
     A3_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(3),
				  B=>B(3),
				  Cin=>regc2,
				  Cout=>regc3,
				  S=>S(3)
				  );
				  
     A4_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(4),
				  B=>B(4),
				  Cin=>regc3,
				  Cout=>regc4,
				  S=>S(4)
				  );
				  
     A5_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(5),
				  B=>B(5),
				  Cin=>regc4,
				  Cout=>regc5,
				  S=>S(5)
				  );
				  
     A6_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(6),
				  B=>B(6),
				  Cin=>regc5,
				  Cout=>regc6,
				  S=>S(6)
				  );
				  
     A7_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(7),
				  B=>B(7),
				  Cin=>regc6,
				  Cout=>regc7,
				  S=>S(7)
				  );
				  
     A8_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(8),
				  B=>B(8),
				  Cin=>regc7,
				  Cout=>regc8,
				  S=>S(8)
				  );
				  
     A9_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(9),
				  B=>B(9),
				  Cin=>regc8,
				  Cout=>regc9,
				  S=>S(9)
				  );
				  
     A10_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(10),
				  B=>B(10),
				  Cin=>regc9,
				  Cout=>regc10,
				  S=>S(10)
				  );
				  
     A11_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(11),
				  B=>B(11),
				  Cin=>regc10,
				  Cout=>regc11,
				  S=>S(11)
				  );
				  
     A12_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(12),
				  B=>B(12),
				  Cin=>regc11,
				  Cout=>regc12,
				  S=>S(12)
				  );
				  
     A13_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(13),
				  B=>B(13),
				  Cin=>regc12,
				  Cout=>regc13,
				  S=>S(13)
				  );
				  
     A14_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(14),
				  B=>B(14),
				  Cin=>regc13,
				  Cout=>regc14,
				  S=>S(14)
				  );
				  
     A15_full_adder_multi: full_adder_multi
	  PORT MAP(
	           A=>A(15),
				  B=>B(15),
				  Cin=>regc14,
				  Cout=>Cout,
				  S=>S(15)
				  );


end Behavioral;

