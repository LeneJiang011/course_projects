----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:15:00 06/07/2016 
-- Design Name: 
-- Module Name:    multi_full_adder - Behavioral 
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

-- L: 16 bit full adder--
entity multi_full_adder is
port(
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  B: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cin: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Cout: out STD_LOGIC_VECTOR(15 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end multi_full_adder;

architecture Behavioral of multi_full_adder is

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

     U0_adder: full_adder_multi
	  PORT MAP(
	           A=>A(0),
				  B=>B(0),
				  Cin=>Cin(0),
				  Cout=>Cout(0),
				  S=>S(0)
				  );
				  
     U1_adder: full_adder_multi
	  PORT MAP(
	           A=>A(1),
				  B=>B(1),
				  Cin=>Cin(1),
				  Cout=>Cout(1),
				  S=>S(1)
				  );
				  
     U2_adder: full_adder_multi
	  PORT MAP(
	           A=>A(2),
				  B=>B(2),
				  Cin=>Cin(2),
				  Cout=>Cout(2),
				  S=>S(2)
				  );

     U3_adder: full_adder_multi
	  PORT MAP(
	           A=>A(3),
				  B=>B(3),
				  Cin=>Cin(3),
				  Cout=>Cout(3),
				  S=>S(3)
				  );
				  
     U4_adder: full_adder_multi
	  PORT MAP(
	           A=>A(4),
				  B=>B(4),
				  Cin=>Cin(4),
				  Cout=>Cout(4),
				  S=>S(4)
				  );
				  
     U5_adder: full_adder_multi
	  PORT MAP(
	           A=>A(5),
				  B=>B(5),
				  Cin=>Cin(5),
				  Cout=>Cout(5),
				  S=>S(5)
				  );

     U6_adder: full_adder_multi
	  PORT MAP(
	           A=>A(6),
				  B=>B(6),
				  Cin=>Cin(6),
				  Cout=>Cout(6),
				  S=>S(6)
				  );

     U7_adder: full_adder_multi
	  PORT MAP(
	           A=>A(7),
				  B=>B(7),
				  Cin=>Cin(7),
				  Cout=>Cout(7),
				  S=>S(7)
				  );
				  
     U8_adder: full_adder_multi
	  PORT MAP(
	           A=>A(8),
				  B=>B(8),
				  Cin=>Cin(8),
				  Cout=>Cout(8),
				  S=>S(8)
				  );
				  
     U9_adder: full_adder_multi
	  PORT MAP(
	           A=>A(9),
				  B=>B(9),
				  Cin=>Cin(9),
				  Cout=>Cout(9),
				  S=>S(9)
				  );
				  
     U10_adder: full_adder_multi
	  PORT MAP(
	           A=>A(10),
				  B=>B(10),
				  Cin=>Cin(10),
				  Cout=>Cout(10),
				  S=>S(10)
				  );

     U11_adder: full_adder_multi
	  PORT MAP(
	           A=>A(11),
				  B=>B(11),
				  Cin=>Cin(11),
				  Cout=>Cout(11),
				  S=>S(11)
				  );

     U12_adder: full_adder_multi
	  PORT MAP(
	           A=>A(12),
				  B=>B(12),
				  Cin=>Cin(12),
				  Cout=>Cout(12),
				  S=>S(12)
				  );
				  
     U13_adder: full_adder_multi
	  PORT MAP(
	           A=>A(13),
				  B=>B(13),
				  Cin=>Cin(13),
				  Cout=>Cout(13),
				  S=>S(13)
				  );
				  
     U14_adder: full_adder_multi
	  PORT MAP(
	           A=>A(14),
				  B=>B(14),
				  Cin=>Cin(14),
				  Cout=>Cout(14),
				  S=>S(14)
				  );
				  
     U15_adder: full_adder_multi
	  PORT MAP(
	           A=>A(15),
				  B=>B(15),
				  Cin=>Cin(15),
				  Cout=>Cout(15),
				  S=>S(15)
				  );

end Behavioral;

