----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:36 06/06/2016 
-- Design Name: 
-- Module Name:    left_c - Behavioral 
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

entity left_c is
port(
     clk: in STD_LOGIC;
	  A: in STD_LOGIC_VECTOR(7 DOWNTO 0); 
	  B: in STD_LOGIC_VECTOR(7 DOWNTO 0);
	  ctrl: STD_LOGIC_VECTOR(3 DOWNTO 0);
	  S: out STD_LOGIC_VECTOR(7 DOWNTO 0)
	  );
end left_c;

architecture Behavioral of left_c is
SIGNAL B0: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL B1: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL dir: STD_LOGIC;
SIGNAL n: integer;
SIGNAL dout: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL d: INTEGER;

begin 
     dir<=ctrl(0);

     
     process(clk,n,dir)
	  begin
	  if (B(2)='1') then
	     B0<=B(1 DOWNTO 0) + '1';
        B1<='1' & B0;
	  elsif (B(2)='0') then
	     B0<=B(1 DOWNTO 0) + '1';
        B1<='0' & B0;
	  end if;
	  if (clk'event and clk='1') then
     d<= conv_integer(B1);
	  
	  if dir='0' then
	     dout<= A((8-d) DOWNTO 0) & A(7 DOWNTO (7-d));
		  elsif dir='1' then
		        dout<= A((d-1) DOWNTO 0) & A(7 DOWNTO d);
				  end if;
	  S<= dout;
	  end if;
	  end process;
	   
end Behavioral;

