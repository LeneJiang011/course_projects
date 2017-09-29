----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:28 06/05/2016 
-- Design Name: 
-- Module Name:    dff_2bit_in - Behavioral 
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

entity dff_2bit_in is
port(
     clk: in STD_LOGIC;
     d: in STD_LOGIC_VECTOR(1 DOWNTO 0);
	  q: out STD_LOGIC_VECTOR(1 DOWNTO 0)
	  );
	  
end dff_2bit_in;

architecture Behavioral of dff_2bit_in is

begin
     process(clk)
	  begin
	  if(clk'event and clk='1') then
	  q<=d;
	  end if;
	  end process;
end Behavioral;

