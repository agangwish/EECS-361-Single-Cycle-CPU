library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

entity FETCH_tb is 
end entity;

architecture behav of FETCH_tb is 

component fetch is 
generic (
	mem_file : string
  );
port( 
	clk 	: in std_logic;
	dout  :	out std_logic_vector(31 downto 0);
	pc : in std_logic_vector (31 downto 0);
	pc_four : out std_logic_vector (31 downto 0);
	pc_branch : out std_logic_vector (31 downto 0));
end component;

signal clk_tb, cs_tb, oe_tb, we_tb : std_logic;
signal addr_tb, din_tb, dout_tb : std_logic_vector (31 downto 0);
signal pc_tb, pc_four_tb, pc_branch_tb : std_logic_vector (31 downto 0);


begin

dut : fetch
generic map (mem_file => "bills_branch.dat")
port map(clk_tb, dout_tb, pc_tb, pc_four_tb, pc_branch_tb);

testbench : process begin
clk_tb <= '0';
cs_tb <= '1';
oe_tb <= '1';
we_tb <= '0';

pc_tb <= X"00400020";
wait for 1 ns;
clk_tb <= '1';

wait for 1 ns;



end process;
end behav;


