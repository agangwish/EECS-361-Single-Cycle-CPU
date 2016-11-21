library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;


entity CPU_tb is
end entity;

architecture behav of CPU_tb is



component CPU is
	generic (
		data_file : string
  	);
port (clk : in std_logic;
      pc_init : in std_logic);
end component;


signal clk_tb, pc_init_tb : std_logic;
signal mem_file : string (26 downto 1);


begin

dut : CPU generic map (data_file => "sort_corrected_branch.dat") port map(clk_tb, pc_init_tb);

testbench: process begin

clk_tb <= '0';

pc_init_tb <='1';

wait for 2 ns;

clk_tb <= '1';



wait for 2 ns;

clk_tb <= '0';


wait for 2 ns;

clk_tb <= '1';
pc_init_tb <= '0';

wait for 2 ns;


G0: for i in 0 to 100 loop

clk_tb <= '0';

wait for 2 ns;

clk_tb <= '1';


wait for 2 ns;


end loop;

end process;

end behav;




