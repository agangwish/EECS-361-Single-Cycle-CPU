library ieee;
use ieee.std_logic_1164.all;



entity register_1bit_tb is 
end entity;


architecture behav of register_1bit_tb is 


component register_1bit is
port (clk, we, din : in std_logic;
dout  : out std_logic);
end component;


signal we_tb, din_tb, clk_tb, dout_tb : std_logic;

begin

dut: register_1bit 
port map(clk_tb, we_tb, din_tb, dout_tb);

testbench: process
begin 

clk_tb <= '0';
we_tb <= '1';
din_tb <= '1';
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '1';
din_tb <='0';
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '0';
din_tb <= '1';
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;


end process;
end behav;




