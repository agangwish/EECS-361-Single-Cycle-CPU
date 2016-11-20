library ieee;
use ieee.std_logic_1164.all;


entity Decode_tb is
end entity;

architecture behav of Decode_tb is


component ID is
port(instruction : in std_logic_vector (31 downto 0);
control : out std_logic_vector (7 downto 0);
ALUop : out std_logic_vector (5 downto 0));
end component;


signal instruction_tb : std_logic_vector (31 downto 0);
signal control_tb : std_logic_vector (7 downto 0);
signal ALUop_tb :std_logic_vector (5 downto 0);

begin

dut : ID port map(instruction_tb, control_tb, ALUop_tb);

testbench : process begin 

instruction_tb <= X"20050001";
wait for 1 ns;
instruction_tb <= X"00421400";
wait for 1 ns;
instruction_tb <= X"00c33022";
wait for 1 ns;

end process;
end behav;