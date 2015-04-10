----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:39:03 04/10/2015 
-- Design Name: 
-- Module Name:    piso_sr_10 - Behavioral 
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

entity piso_sr_10 is
    Port ( clk : in  STD_LOGIC;
           ld_en : in  STD_LOGIC;
           pi : in  STD_LOGIC_VECTOR (9 downto 0);
           so : out  STD_LOGIC);
end piso_sr_10;

architecture Behavioral of piso_sr_10 is
	signal t   : std_logic;
	signal temp: std_logic_vector(9 downto 0);
	
begin
	process (clk, pi, load)
		begin
			if (load='1') then
				temp <= pi;
				
			elsif (CLK'event and CLK='1') then
				t <= temp(9);
				temp(9 downto 1) <= temp(8 downto 0);
				temp(0) <= '0';
				
			end if;
	end process;
	
	so <= t;

end Behavioral;

