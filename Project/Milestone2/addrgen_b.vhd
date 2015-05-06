
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity addrgen_b is
port (

  clk : in std_logic ;
  cnt2 : out std_logic_vector(18 DOWNTO 0);
  enb : out std_logic ;
  vde : in std_logic ;
  reset : in std_logic 
);

end addrgen_b;

architecture Behavioral of addrgen_b is
signal cnt : std_logic_vector(18 DOWNTO 0);
signal addr1	: natural := 0;
begin

	ADDRCNT_PROC: process (CLK)
   begin
      if Rising_Edge(CLK) then
		  if (reset = '1') then 
		   addr1 <= 0 ;
			else
			if vde = '1' then 
			if (addr1 = 153599) then                    
					addr1 <= 0;
				else
					addr1 <= addr1 + 1;
				end if;
		    end if ;
			end if ;
      end if;
   end process;
enb <= '1';
cnt <=conv_std_logic_vector(addr1 ,19);
cnt2 <= cnt ;
end Behavioral;