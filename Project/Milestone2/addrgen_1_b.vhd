
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity addrgen_1_b is
port (

  clk : in std_logic ;
  cnt2 : out std_logic_vector(17 DOWNTO 0);
  enb : out std_logic ;
  vde : in std_logic ;
  Hcnt   : in NATURAL ;
  Vcnt   : in NATURAL ; 
  reset : in std_logic 
);

end addrgen_1_b;

architecture Behavioral of addrgen_1_b is

begin


end Behavioral;