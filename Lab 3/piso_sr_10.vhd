library ieee;
use ieee.std_logic_1164.all;

entity piso_sr_10 is
  port(
    clk,load  : in std_logic;
    pi        : in std_logic_vector(9 downto 0);
    so        : out std_logic);
end piso_sr_10;

architecture arch of piso_sr_10 is
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
end arch;
