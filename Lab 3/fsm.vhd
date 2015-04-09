library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port(
    clk       : in std_logic;
    freq_sel  : in std_logic;
    prog_req  : in std_logic;
    load_en   : out std_logic;
    prog_en   : out std_logic);
end fsm;

architecture arch of fsm is


end arch;
