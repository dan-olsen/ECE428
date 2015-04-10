----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:36:10 04/10/2015 
-- Design Name: 
-- Module Name:    dcm_prog - Behavioral 
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

entity dcm_prog is
    Port ( clk : in  STD_LOGIC;
           freq_sel : in  STD_LOGIC;
           prog_req : in  STD_LOGIC;
           prog_clk : out  STD_LOGIC;
           prog_en : out  STD_LOGIC;
           prog_data : out  STD_LOGIC);
end dcm_prog;

architecture Behavioral of dcm_prog is

begin


end Behavioral;

