----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:38 06/17/2016 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is
port(
     a: IN STD_LOGIC;
     b: IN STD_LOGIC;
     c_in: IN STD_LOGIC;
	  c_out: OUT STD_LOGIC;
     s: OUT STD_LOGIC
     );

end adder;

architecture Behavioral of adder is

begin
     c_out<=(a AND c_in) OR (b AND c_in) OR (a AND b);
	  s<=a XOR b XOR c_in;


end Behavioral;

