library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity NAL_tb is
end entity;

architecture behav of NAL_tb is

component NAL is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
pc_four, pc_branch : out std_logic_vector (31 downto 0));
end component;

signal pc_in_tb, instruction_tb, pc_four_tb, pc_branch_tb : std_logic_vector (31 downto 0);


begin

dut : NAL port map (pc_in_tb, instruction_tb, pc_four_tb, pc_branch_tb);

testbench : process begin


pc_in_tb <= X"00400020";
instruction_tb <= X"20050001";
wait for 1 ns;

end process;
end behav;