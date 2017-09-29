----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:34 05/23/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
port( clk,reset: in std_logic;
      dout: out std_logic_vector(7 downto 0);
		nul_flag, ful_flag: out std_logic
);
end top;

architecture Behavioral of top is
COMPONENT fifo
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		wr_en : IN std_logic;
		rd_en : IN std_logic;
		datain : IN std_logic_vector(7 downto 0);          
		dataout : OUT std_logic_vector(7 downto 0);
		empty : OUT std_logic;
		full : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT test_rom
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;          
		fifo_rst : OUT std_logic;
		fifo_wr_en : OUT std_logic;
		fifo_rd_en : OUT std_logic;
		fifo_test_dout : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

SIGNAL fifo_rsts, fifo_wr_ens, fifo_rd_ens: std_logic;
SIGNAL fifo_dins: std_logic_vector(7 downto 0);
	
begin
	Inst_fifo: fifo PORT MAP(
		clk => clk,
		rst => fifo_rsts,
		wr_en =>fifo_wr_ens,
		rd_en => fifo_rd_ens,
		dataout => dout,
		datain => fifo_dins,
		empty => nul_flag,
		full => ful_flag
	);
	
	Inst_test_rom: test_rom PORT MAP(
		clk => clk,
		rst => reset,
		fifo_rst =>fifo_rsts,
		fifo_wr_en => fifo_wr_ens,
		fifo_rd_en => fifo_rd_ens,
		fifo_test_dout =>fifo_dins 
	);

end Behavioral;