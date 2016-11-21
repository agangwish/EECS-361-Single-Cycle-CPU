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
	pc : in std_logic_vector (31 downto 0);
	pc_out : out std_logic_vector (31 downto 0);
	rt, rs, rd : out std_logic_vector (4 downto 0);
	imm16 : out std_logic_vector (15 downto 0);
	shamt : out std_logic_vector (4 downto 0);
	instruction : std_logic_vector (31 downto 0));
end component;

signal clk_tb, cs_tb, oe_tb, we_tb : std_logic;
signal addr_tb, din_tb, instruction_tb : std_logic_vector (31 downto 0);
signal pc_tb, pc_out_tb : std_logic_vector (31 downto 0);
signal rt_tb, rs_tb, rd_tb : std_logic_vector (4 downto 0);
signal imm16_tb : std_logic_vector (15 downto 0);
signal shamt_tb : std_logic_vector (4 downto 0);


begin

dut : fetch
generic map (mem_file => "bills_branch.dat")
port map(clk_tb, pc_tb, pc_out_tb, rt_tb, rs_tb, rd_tb, imm16_tb, shamt_tb, instruction_tb);

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


