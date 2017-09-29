----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:36 06/08/2016 
-- Design Name: 
-- Module Name:    module_shift - Behavioral 
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

entity module_shift is
port(
     clk: in STD_LOGIC;
	  A: in STD_LOGIC_VECTOR(7 DOWNTO 0); 
	  B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  ctrl: STD_LOGIC_VECTOR(3 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(1 DOWNTO 0)
	  );
end module_shift;

architecture Behavioral of module_shift is
SIGNAL sout: STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT left_c
          port(
			      clk: in STD_LOGIC;
	            A: in STD_LOGIC_VECTOR(7 DOWNTO 0); 
	            B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            ctrl: STD_LOGIC_VECTOR(3 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(7 DOWNTO 0)
					);
end COMPONENT;

COMPONENT transfer8_16
          port(
			      clk: in STD_LOGIC;
               Cout: in STD_LOGIC;
	            Pre: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	            S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
					);
end COMPONENT;

begin 
     Le_left_c: left_c
	  PORT MAP(
	           clk=>clk,
				  A=>A,
				  B=>B,
				  ctrl=>ctrl,
				  S=>sout
				  );
				  
     T1_transfer8_16: transfer8_16
	  PORT MAP(
	           clk=>clk,
				  Cout=>'0',
				  Pre=>sout,
				  S=>S
				  );


end Behavioral;

