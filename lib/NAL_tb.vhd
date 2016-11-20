library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity NAL_tb is
end entity;

architecture behav of NAL_tb is

component NAL is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
zero, carryout : in std_logic;
pc_out: out std_logic_vector (31 downto 0));
end component;

signal pc_in_tb, instruction_tb, pc_out_tb : std_logic_vector (31 downto 0);
signal opcode_tb : std_logic_vector (5 downto 0);
signal branch_tb, zero_tb, carryout_tb : std_logic;


begin

dut : NAL port map (pc_in_tb, instruction_tb, zero_tb, carryout_tb, pc_out_tb);

testbench : process begin


pc_in_tb <= X"00400020";
instruction_tb <= X"1cc00003"; --bgtz
zero_tb <=  '0';
carryout_tb <= '0';
wait for 1 ns;
zero_tb <= '1';
wait for 1 ns;
carryout_tb <= '1';
wait for 1 ns;
zero_tb <= '0';

wait for 1 ns;

pc_in_tb <= X"00400020";
instruction_tb <= X"10c00003"; -- beq
zero_tb <=  '0';
carryout_tb <= '0';
wait for 1 ns;
zero_tb <= '1';
wait for 1 ns;
carryout_tb <= '1';
wait for 1 ns;
zero_tb <= '0';

wait for 1 ns;

pc_in_tb <= X"00400020"; 
instruction_tb <= X"14c00003";
zero_tb <=  '0';
carryout_tb <= '0';
wait for 1 ns;
zero_tb <= '1';
wait for 1 ns;
carryout_tb <= '1';
wait for 1 ns;
zero_tb <= '0';

wait for 1 ns;


end process;
end behav;