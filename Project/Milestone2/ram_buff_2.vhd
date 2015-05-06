
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;


entity ram_buff_2 is
port
	(
	data_in  : in std_logic_vector(4 DOWNTO 0);
	pclk     : in std_logic;
	pclk_180 : in std_logic;
	data_out : out std_logic_vector(4 DOWNTO 0);
	reset    :  in std_logic ;
	Hcnt_I   : in NATURAL ;
	Vcnt_I   : in NATURAL ;
	RAM_SAVE_I : in std_logic_vector(0 downto 0);
	ena_1    : in std_logic
	);

end ram_buff_2;

architecture Behavioral of ram_buff_2 is

signal enb,ena_12 : std_logic ;
signal wea     : std_logic_vector(0 downto 0);
signal addra, addrb : std_logic_vector (17 DOWNTO 0);


begin


--BUFGCE_inst : BUFGCE
--port map (
--O => clk_mem1, -- 1-bit output Clock buffer output
--CE => CE, -- 1-bit input Clock buffer select
--I => pclk -- 1-bit input Clock buffer input (S=0)
--);


	RAM2 : Entity work.ram_2
	port map (
	
    clka   => pclk,
    ena    => ena_1,
	 enb    => ena_1,
    wea    => wea,
    addra  => addra,
    dina   => data_in,
    clkb   => pclk_180,
    addrb  => addrb,
    doutb  => data_out
	);

addrgen_2_a : entity work.addrgen_2_a
port map (

		 clk      => pclk ,
		 vde      => ena_1,
		 reset    => reset ,
		 wea      => wea,
		 ena      => ena_12,
		 Hcnt	    => HCnt_I,
		 Vcnt     => VCnt_I,
		 RAM_SAVE => RAM_SAVE_I ,
		 cnt1     => addra  
);


addrgen_2_b : entity work.addrgen_2_b
port map (

		 clk     => pclk_180 ,
		 vde     => ena_1 ,
		 reset   => reset ,
		 enb     => enb,
		 Hcnt	    => HCnt_I,
		 Vcnt     => VCnt_I,
		 cnt2    => addrb  
);


end Behavioral;

