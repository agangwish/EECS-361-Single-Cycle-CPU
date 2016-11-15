library ieee;
use ieee.std_logic_1164.all;

entity mux_32_4_1_tb is
end entity;


architecture behav of mux_32_4_1_tb is

component mux32_4_1 is 

  port (
	sel	  : in	std_logic_vector (1 downto 0);
	src0,src1,src2,src3 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end component;

signal sel_tb : std_logic_vector (1 downto 0);
signal src0_tb, src1_tb, src2_tb, src3_tb, z_tb : std_logic_vector (31 downto 0);

begin

dut : mux32_4_1 
port map( sel_tb, src0_tb, src1_tb, src2_tb, src3_tb, z_tb);

testbench : process begin

src0_tb <= X"00000000";
src1_tb <= X"00000001";
src2_tb <= X"00000002";
src3_tb <= X"00000003";

sel_tb <= "00";
wait for 5 ns;

sel_tb <= "01";
wait for 5 ns;
sel_tb <= "10";
wait for 5 ns;
sel_tb <= "11";
wait for 5 ns;
end process;
end behav;

