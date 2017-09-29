----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:45 04/25/2016 
-- Design Name: 
-- Module Name:    test_rom - Behavioral 
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_rom is
    Port ( 	clk	 		: in  STD_LOGIC;
				rst 			: in  STD_LOGIC;
				fifo_rst		: out std_logic;
				fifo_wr_en	: out std_logic;
				fifo_rd_en	: out std_logic;
				fifo_test_dout 	: out STD_LOGIC_VECTOR (7 downto 0)--fifo input
				
		   );
end test_rom;

architecture Behavioral of test_rom is
type fifo_ram is array(255 downto 0) of std_logic_vector(7 downto 0);
signal fifo_data:fifo_ram;
signal counter:std_logic_vector(11 downto 0);

begin
process(clk,rst)
begin
	if rst='1' then
		fifo_rst<='1';
		fifo_wr_en<='0';
		fifo_rd_en<='0';
		fifo_test_dout<=(others=>'0');
		counter<=(others=>'0');
		for i in 0 to 255 loop
			fifo_data(i)<=conv_std_logic_vector((i mod 128),8);
		end loop;
	elsif rising_edge(clk) then
		counter<=counter+1;
			if counter=x"001" then
					fifo_rst<='0';
			elsif counter>x"00A" and counter<=x"00f" then --write
					fifo_wr_en<='1';
					fifo_test_dout<=fifo_data(conv_integer(counter) mod 256);
			elsif counter=x"010" or counter=x"012" or counter=x"014" then --read and write
					fifo_wr_en<='0';
					fifo_rd_en<='1';
			elsif counter=x"011" or counter=x"013"  then --read and write
					fifo_wr_en<='1';
					fifo_test_dout<=fifo_data(conv_integer(counter)mod 256);
					fifo_rd_en<='0';
			elsif counter>x"014" and  counter<=x"140" then --write to full
					fifo_wr_en<='1';
					fifo_rd_en<='0';
					fifo_test_dout<=fifo_data(conv_integer(counter)mod 256);
			elsif counter>x"140"  then --read to null
					fifo_rd_en<='1';
					fifo_wr_en<='0';
			end if;
	end if;
				    				
end process;


end Behavioral;

