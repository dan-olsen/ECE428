----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:58 03/27/2013 
-- Design Name: 
-- Module Name:    Motion_detect - Behavioral 
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;

entity Motion_detect is
port (
			Pclk : in std_logic ;
			async_rst : in std_logic ;
			VtcVde : in std_logic ;
			ram_sel : in std_logic_vector(0 downto 0);
			p_data_out  :  out std_logic_vector(4 downto 0);
			FbRdData : in std_logic_vector(16-1 downto 0);
			data_en_dvi : out std_logic ;
			ram_out_1  : in std_logic_vector(4 downto 0);
			ram_out_2  : in std_logic_vector(4 downto 0);
			VtcHCnt : in Natural ;
			VtcVCnt : in Natural ;
			thr : out std_logic_vector(0 downto 0);														--- threshold level controlling the led
			SW_I : in STD_LOGIC_VECTOR(7 downto 0)
		);
end Motion_detect;

architecture Behavioral of Motion_detect is

signal 	Vde_Dvi : std_logic;
signal	ram_out, ram_out_sub : std_logic_vector(4 downto 0);
signal   add1 : std_logic_vector(20 downto 0);                		--- adding the difference between pixels
signal   thr1 : std_logic_vector(0 downto 0);
begin


----------------------------------------------------------------------------------

VDEdelay_inst : FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => vde_dvi, -- Data output
C => Pclk, -- Clock input
CE => '1', -- Clock enable input
R => '0', -- Synchronous reset input
D => VtcVde -- Data input
);

----------------------------------------------------------------------------------


process (Pclk)
begin

if (ram_sel= "1" ) then 

p_data_out <= ram_out ;
data_en_dvi <= vde_dvi ;               -- 1 clock cycle delayed video enable

else

p_data_out <= FbRdData(15 downto 11) ;
data_en_dvi <= VtcVde ;
end if ;

if (SW_I(3 downto 3)= "1") then
ram_out <= ram_out_sub ;							-- background subtraction result
elsif (SW_I(1 downto 1)= "1") then
ram_out <= ram_out_1 ;                       -- frame 1
elsif (SW_I(2 downto 2)= "1") then 
ram_out <= ram_out_2 ;								-- frame 2

end if ;
end process ;   



end Behavioral;

