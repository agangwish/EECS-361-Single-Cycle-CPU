library ieee;
use ieee.std_logic_1164.all;



entity register_32bit_tb is 
end entity;


architecture behav of register_32bit_tb is 


component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;


signal we_tb, clk_tb : std_logic;
signal din_tb, dout_tb : std_logic_vector (31 downto 0);

begin

dut: register_32bit 
port map(clk_tb, we_tb, din_tb, dout_tb);

testbench: process
begin 

clk_tb <= '0';
we_tb <= '1';
din_tb <= X"00000001";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '1';
din_tb <= X"00000002";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '0';
din_tb <= X"00000003";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

end process;
end behav;
