library ieee;
use ieee.std_logic_1164.all;


entity mux_32_161_tb is
end entity;

architecture behav of  mux_32_161_tb is

component mux32_161 is
  port (
	sel	  : in	std_logic_vector (3 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end component;

signal sel_tb : std_logic_vector(3 downto 0);

signal src0_tb, src1_tb, src2_tb, src3_tb, src4_tb, src5_tb, src6_tb, src7_tb, 
src8_tb, src9_tb, src10_tb, src11_tb, src12_tb, src13_tb, src14_tb, src15_tb,
z_tb : std_logic_vector (31 downto 0);

begin

dut : mux32_161 
port map (sel_tb, src0_tb, src1_tb, src2_tb, src3_tb, src4_tb, src5_tb, src6_tb, src7_tb, 
src8_tb, src9_tb, src10_tb, src11_tb, src12_tb, src13_tb, src14_tb, src15_tb,
z_tb);

testbench : process 
begin

src0_tb <= X"00000000";
src1_tb <= X"00000001";
src2_tb <= X"00000002";
src3_tb <= X"00000003";
src4_tb <= X"00000004";
src5_tb <= X"00000005";
src6_tb <= X"00000006";
src7_tb <= X"00000007";
src8_tb <= X"00000008";
src9_tb <= X"00000009";
src10_tb <= X"0000000A";
src11_tb <= X"0000000b";
src12_tb <= X"0000000c";
src13_tb <= X"0000000d";
src14_tb <= X"0000000e";
src15_tb <= X"0000000f";

sel_tb <= X"0";
wait for 5 ns;

sel_tb <= X"1";
wait for 5 ns;

sel_tb <= X"2";
wait for 5 ns;

sel_tb <= X"3";
wait for 5 ns;
sel_tb <= X"4";
wait for 5 ns;
sel_tb <= X"5";
wait for 5 ns;
sel_tb <= X"6";
wait for 5 ns;
sel_tb <= X"7";
wait for 5 ns;
sel_tb <= X"8";
wait for 5 ns;

sel_tb <= X"9";
wait for 5 ns;

sel_tb <= X"a";
wait for 5 ns;

sel_tb <= X"b";
wait for 5 ns;

sel_tb <= X"c";
wait for 5 ns;

sel_tb <= X"d";
wait for 5 ns;
sel_tb <= X"e";
wait for 5 ns;

end process;

end behav;

