library ieee;
use ieee.std_logic_1164.all;

entity dcm is
  port(
    clk_in   : in std_logic;
    freq_sel : in std_logic;
    prog_req : in std_logic;
    clk_out  : out std_logic;
    prog_done: out std_logic;
    locked   : out std_logic);
end dcm;

architecture arch of dcm is


end arch;
