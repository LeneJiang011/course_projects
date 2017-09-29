----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:29 06/17/2016 
-- Design Name: 
-- Module Name:    top_adder - Behavioral 
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

entity top_adder is
  port(
       A: IN STD_LOGIC_VECTOR (7 downto 1);
		 B: IN STD_LOGIC_VECTOR (7 downto 1);
		 C: OUT STD_LOGIC;
		 S: OUT STD_LOGIC_VECTOR (7 downto 0)
  );

end top_adder;

architecture Behavioral of top_adder is
signal c1,c2,c3,c4,c5,c6: STD_LOGIC;

    component appa_0
	           port(
	                s: OUT STD_LOGIC
	                );
	 end component;
	 
	 component appa_1
	           port(
	                a: IN STD_LOGIC;
	                b: IN STD_LOGIC;
	                s: OUT STD_LOGIC
	                );
	 end component;
	 
	 component adder
	           port(
	                a: IN STD_LOGIC;
                   b: IN STD_LOGIC;
                   c_in: IN STD_LOGIC;
	                c_out: OUT STD_LOGIC;
                   s: OUT STD_LOGIC
	                );
	 end component;

begin
	 c1<='0';
	 
    Inst_appa_0: appa_0 PORT MAP(
		s => S(0)
	 );
	 
	 
	 Inst_appa_1: appa_1 PORT MAP(
		a => A(1),
		b => B(1),
		s => S(1)
	 );
	 
	 Inst_adder2: adder PORT MAP(
		a => A(2),
		b => B(2),
		c_in => c1,
		c_out => c2,
		s => S(2)
	  );
	  
	  Inst_adder3: adder PORT MAP(
		a => A(3),
		b => B(3),
		c_in => c2,
		c_out => c3,
		s => S(3)
	  );
	  
	  Inst_adder4: adder PORT MAP(
		a => A(4),
		b => B(4),
		c_in => c3,
		c_out => c4,
		s => S(4)
	  );
	  
	  Inst_adder5: adder PORT MAP(
		a => A(5),
		b => B(5),
		c_in => c4,
		c_out => c5,
		s => S(5)
	  );
	  
	  Inst_adder6: adder PORT MAP(
		a => A(6),
		b => B(6),
		c_in => c5,
		c_out => c6,
		s => S(6)
	  );
	  
	  Inst_adder7: adder PORT MAP(
		a => A(7),
		b => B(7),
		c_in => c6,
		c_out => C,
		s => S(7)
	  );
	  
end Behavioral;

