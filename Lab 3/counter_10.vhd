library ieee;
use ieee.std_logic_1164.all;

entity counter_10 is
  port(
    clk_in   : in std_logic;
    freq_sel : in std_logic;
    prog_sel : in std_logic;
    clk_out  : out std_logic;
    prog_done: out std_logic;
    locked   : out std_logic);
end counter_10;

architecture arch of counter_10 is


end arch;
