----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:39 05/23/2016 
-- Design Name: 
-- Module Name:    fifo - Behavioral 
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

entity fifo is
 port(
     clk : in std_logic;
     rst : in std_logic;
     wr_en, rd_en: in std_logic;
     dataout: out std_logic_vector(7 downto 0);
     datain: in std_logic_vector(7 downto 0);
     empty : out std_logic;
     full : out std_logic
 );


end fifo;

architecture Behavioral of fifo is

TYPE fifo_array is array(127 downto 0) of std_logic_vector(7 downto 0);
SIGNAL fifomemory: fifo_array;
TYPE state is (idle, ful, nul, wr_rd);
SIGNAL current_state, next_state: state;
SIGNAL wr_ptr, rd_ptr:std_logic_vector(7 downto 0) :="00000000";

begin

State_transform: process(clk, rst)
                   BEGIN 
                    if rst='1' then
                       current_state<=nul;
                    elsif rising_edge(clk) then
                       current_state<=next_state;
                   end if;
					  end process;

Implemention: process(current_state, next_state, wr_en, rd_en,wr_ptr,rd_ptr)
                BEGIN
	               case current_state is
		                 when nul=>
                                 if wr_en='1' then
				                        next_state<=wr_rd;
			                        else
                                    next_state<= nul;
			                        end if;
											
		                  when ful=>
                                  if rd_en='1' then
				                         next_state<=wr_rd;
                                  else
                                     next_state<=ful;
                                  end if;

		                  when wr_rd=>
			                           if (wr_ptr(6 downto 0) = rd_ptr(6 downto 0) and (wr_ptr(7) = not rd_ptr(7))) then
				                           next_state<=ful;
			                           elsif wr_ptr=rd_ptr then
				                           next_state<=nul;
			                           elsif (rd_en='0' and wr_en='0') then
				                           next_state<=idle;
			                           else 
			                              next_state <= wr_rd; 
			                           end if;
			
		                   when idle=>
                                    if (wr_en='1' or rd_en='1') then
				                            next_state<=wr_rd;
			                           else 
				                            next_state<=idle;
                                    end if;
	                  end case;
                  end process;


Output: process(clk,next_state,rst)
          begin 
	         if rst='1' then
		         wr_ptr<=x"00";
		         rd_ptr<=x"00";
	         elsif rising_edge(clk) then
		            case next_state is 
			              when nul=>
				                     dataout<=x"00";
				                     full<='0';
				                     empty<='1';
			              when ful=>
				                     dataout<=x"00";
				                     full<='1';
				                     empty<='0';
			              when wr_rd=>
				                       if (wr_en='1') then
					                        fifomemory(conv_integer(wr_ptr(6 downto 0)))<=datain;
					                        wr_ptr<=wr_ptr+'1';
				                       end if;	
				                       if (rd_en='1') then
					                        dataout<=fifomemory(conv_integer(rd_ptr(6 downto 0)));
					                        rd_ptr<=rd_ptr+'1';
				                        end if;
                                    full<='0';
                                    empty<='0';				
			               when others=>
				                         full <= '0'; 
				                         empty <='0';
				                         dataout<=x"00";
		               end case;
	           end if;
           end process;
				



end Behavioral;