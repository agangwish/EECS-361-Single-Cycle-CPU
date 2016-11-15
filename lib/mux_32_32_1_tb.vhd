library ieee;
use ieee.std_logic_1164.all;


entity mux_32_32_1_tb is
end entity;

architecture behav of  mux_32_32_1_tb is

component mux32_32_1 is
  port (
	sel	  : in	std_logic_vector (4 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15 :	in	std_logic_vector (31 downto 0);
	src16,src17,src18, src19, src20, src21, src22, src23, src24, src25, src26, src27, src28, src29, src30, src31 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end component;

signal sel_tb : std_logic_vector(4 downto 0);

signal src0_tb, src1_tb, src2_tb, src3_tb, src4_tb, src5_tb, src6_tb, src7_tb, 
src8_tb, src9_tb, src10_tb, src11_tb, src12_tb, src13_tb, src14_tb, src15_tb,
src16_tb, src17_tb, src18_tb, src19_tb, src20_tb, src21_tb, src22_tb, src23_tb,
src24_tb, src25_tb, src26_tb, src27_tb, src28_tb, src29_tb, src30_tb, src31_tb,
z_tb : std_logic_vector (31 downto 0);

begin

dut : mux32_32_1 
port map (sel_tb, src0_tb, src1_tb, src2_tb, src3_tb, src4_tb, src5_tb, src6_tb, src7_tb, 
src8_tb, src9_tb, src10_tb, src11_tb, src12_tb, src13_tb, src14_tb, src15_tb, src16_tb, src17_tb, src18_tb, src19_tb, src20_tb, src21_tb, src22_tb, src23_tb,
src24_tb, src25_tb, src26_tb, src27_tb, src28_tb, src29_tb, src30_tb, src31_tb,
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

src16_tb <= X"00000010";
src17_tb <= X"00000011";
src18_tb <= X"00000012";
src19_tb <= X"00000013";
src20_tb <= X"00000014";
src21_tb <= X"00000015";
src22_tb <= X"00000016";
src23_tb <= X"00000017";
src24_tb <= X"00000018";
src25_tb <= X"00000019";
src26_tb <= X"0000001a";
src27_tb <= X"0000001b";
src28_tb <= X"0000001c";
src29_tb <= X"0000001d";
src30_tb <= X"0000001e";
src31_tb <= X"0000001f";

sel_tb <= "00000";  --0
wait for 1 ns;

sel_tb <= "00001";  --1
wait for 1 ns;

sel_tb <= "00010"; --2
wait for 1 ns;

sel_tb <= "00011"; --3
wait for 1 ns;
sel_tb <= "00100"; --4 
wait for 1 ns;
sel_tb <= "00101"; --5 
wait for 1 ns;
sel_tb <= "00110"; --6
wait for 1 ns;
sel_tb <= "00111"; --7
wait for 1 ns;
sel_tb <= "01000"; --8
wait for 1 ns;

sel_tb <= "01001"; --9
wait for 1 ns;

sel_tb <= "01010"; --10
wait for 1 ns;

sel_tb <= "01011"; --11
wait for 1 ns;

sel_tb <= "01100"; -- 12
wait for 1 ns;

sel_tb <= "01101"; -- 13
wait for 1 ns;
sel_tb <= "01110"; -- 14
wait for 1 ns;

sel_tb <= "01111"; -- 15
wait for 1 ns;

sel_tb <= "10000"; -- 16
wait for 1 ns;

sel_tb <= "10001"; -- 17
wait for 1 ns;

sel_tb <= "10010"; -- 18
wait for 1 ns;

sel_tb <= "10011"; -- 19
wait for 1 ns;

sel_tb <= "10100"; -- 20
wait for 1 ns;

sel_tb <= "10101"; -- 21
wait for 1 ns;

sel_tb <= "10110"; -- 22
wait for 1 ns;

sel_tb <= "10111"; -- 23
wait for 1 ns;

sel_tb <= "11000"; -- 24
wait for 1 ns;

sel_tb <= "11001"; -- 25
wait for 1 ns;

sel_tb <= "11010"; -- 26
wait for 1 ns;

sel_tb <= "11011"; -- 27
wait for 1 ns;

sel_tb <= "11100"; -- 28
wait for 1 ns;

sel_tb <= "11101"; -- 29
wait for 1 ns;

sel_tb <= "11110"; -- 30
wait for 1 ns;

sel_tb <= "11111"; -- 31
wait for 1 ns;





end process;

end behav;

