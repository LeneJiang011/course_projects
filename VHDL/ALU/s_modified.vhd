----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:01:46 06/07/2016 
-- Design Name: 
-- Module Name:    s_modified - Behavioral 
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
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

---- L: add dff to the first bit (as y3x7, y4x7)---
entity s_modified is
port(
     clk: in STD_LOGIC;
     A: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	  n: in STD_LOGIC_VECTOR(2 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(15 DOWNTO 0)
	  );
end s_modified;

architecture Behavioral of s_modified is
SIGNAL de: STD_LOGIC;
SIGNAL A_modified: STD_LOGIC_VECTOR(15 DOWNTO 0);

COMPONENT dff
          port(
			      clk: in STD_LOGIC;
					d: in STD_LOGIC;
					q: out STD_LOGIC
					);
end COMPONENT;

begin
     A_modified<=A;
     process(A)
	  begin
     CASE n IS
	       when "001" => 
			              S(15 DOWNTO 9)<= A(15 DOWNTO 9)
							  if (clk'event and clk='1') then
							      A_modified(8)<=de;
									S<= A_modified;
							  end if;
			 when "010" => 
			              de<=A(9);
							  if (clk'event and clk='1') then
							      A_modified(9)<=de;
									S<= A_modified;
							  end if;			 
			 when "011" => 
			              de<=A(10);
							  if (clk'event and clk='1') then
							      A_modified(10)<=de;
									S<= A_modified;
							  end if;
			 when "100" => 
			              de<=A(11);
							  if (clk'event and clk='1') then
							      A_modified(11)<=de;
									S<= A_modified;
							  end if;
			 when "101" =>
			              de<=A(12);
							  if (clk'event and clk='1') then
							      A_modified(12)<=de;
									S<= A_modified;
							  end if;
			 when "110" => 
			              de<=A(13);
							  if (clk'event and clk='1') then
							      A_modified(13)<=de;
									S<= A_modified;
							  end if;
			 when "111" => 
			              de<=A(14);
							  if (clk'event and clk='1') then
							      A_modified(14)<=de;
									S<= A_modified;
							  end if;
			 when others => S<="0000000000000000";
		end CASE;
		end process;
		

end Behavioral;

