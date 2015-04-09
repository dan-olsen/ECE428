library ieee;
use ieee.std_logic_1164.all;

entity dcm_prog is
  port(
    clk       : in std_logic;
    freq_sel  : in std_logic;
    prog_req  : in std_logic;
    prog_clk  : out std_logic;
    prog_en   : out std_logic;
    prog_data : out std_logic);
end dcm_prog;

architecture arch of dcm_prog is


end arch;
