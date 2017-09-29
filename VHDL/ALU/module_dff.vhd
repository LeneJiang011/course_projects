----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:18 06/07/2016 
-- Design Name: 
-- Module Name:    module_dff - Behavioral 
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


---- L: 16 bit dff---
entity module_dff is
port(
     clk: in STD_LOGIC;
     D: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  Q: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end module_dff;

architecture Behavioral of module_dff is

COMPONENT dff
          port(
			      clk: in STD_LOGIC;
					d: in STD_LOGIC;
					q: out STD_LOGIC
					);
end COMPONENT;

begin
	  
     D0_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(0),
				  q=>Q(0)
				  );
				  
     D1_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(1),
				  q=>Q(1)
				  );

     D2_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(2),
				  q=>Q(2)
				  );
				  
     D3_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(3),
				  q=>Q(3)
				  );
				  
     D4_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(4),
				  q=>Q(4)
				  );
				  
				  
     D5_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(5),
				  q=>Q(5)
				  );

     D6_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(6),
				  q=>Q(6)
				  );

     D7_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(7),
				  q=>Q(7)
				  );
				  
     D8_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(8),
				  q=>Q(8)
				  );

     D9_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(9),
				  q=>Q(9)
				  );

     D10_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(10),
				  q=>Q(10)
				  );

     D11_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(11),
				  q=>Q(11)
				  );
				  
     D12_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(12),
				  q=>Q(12)
				  );
				  
     D13_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(13),
				  q=>Q(13)
				  );
				  
     D14_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(14),
				  q=>Q(14)
				  );

     D15_dff: dff
	  PORT MAP(
	           clk=>clk,
				  d=>D(15),
				  q=>Q(15)
				  );
				  

end Behavioral;

