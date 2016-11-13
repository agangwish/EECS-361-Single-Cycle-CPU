library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;


entity syncram_tb is
end entity;

architecture behav of syncram_tb is

component syncram is
  generic (
	mem_file : string
  );
  port (
	clk	: in std_logic;
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;


signal clk_tb, cs_tb, oe_tb, we_tb : std_logic;
signal addr_tb, din_tb, dout_tb : std_logic_vector (31 downto 0);


begin 
dut: syncram
generic map( mem_file => "data.txt")
port map (clk_tb, cs_tb, oe_tb, we_tb, addr_tb, din_tb, dout_tb);


testbench : process begin
clk_tb <= '0';
cs_tb <= '1';
oe_tb <= '1';
we_tb <= '0';
addr_tb <= X"00400020";
din_tb <= X"f0f0f0f0";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;
clk_tb <= '0';
addr_tb <= X"00400024";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;
end process;
end behav;




