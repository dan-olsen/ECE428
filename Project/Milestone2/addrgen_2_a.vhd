
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity addrgen_2_a is
port (

  clk : in std_logic ;
  wea : out std_logic_vector(0 downto 0);
  ena : out std_logic ;
  cnt1 : out std_logic_vector(17 DOWNTO 0);
  vde : in std_logic ;
  Hcnt   : in NATURAL ;
  Vcnt   : in NATURAL ; 
  RAM_SAVE : in std_logic_vector(0 downto 0);
  reset : in std_logic 
);

end addrgen_2_a;

architecture Behavioral of addrgen_2_a is
signal cnt : std_logic_vector(17 DOWNTO 0);
signal addr1	: natural := 1;
begin

	ADDRCNT_PROC: process (CLK)
   begin
      if Rising_Edge(CLK) then
		 if reset = '1' then 
		   addr1 <= 1;
		else
		 if vde = '1' then 
		 if (RAM_SAVE = "1")then
		 		if (addr1 = 153600 or addr1 >153600) then                    
					wea   <= "0";
				 elsif (Hcnt = 639 and Vcnt = 479 ) then
			      addr1 <= 1 ;
					wea   <= "1";
				  else
					addr1 <= addr1 + 1;
					wea   <= "1";
				end if;
			elsif (RAM_SAVE = "0") then
			  if (Hcnt = 639 and Vcnt = 479 ) then
			    addr1 <= 1 ;
				 wea   <= "1";
				else
				if (addr1 = 153600 or addr1 >153600) then                    
					wea   <= "1";
					addr1 <= 1 ;
				else
					addr1 <= addr1 + 1;
					wea   <= "1";
				end if;
			end if ;
       end if ;
	  end if ;
	 end if;
	end if ;
  end process;
	
cnt <=conv_std_logic_vector(addr1 ,18);
cnt1 <= cnt ;
end Behavioral;