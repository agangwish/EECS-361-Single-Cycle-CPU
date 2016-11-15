library ieee;
use ieee.std_logic_1164.all;


entity dec_32_tb is
end entity;

architecture behav of dec_32_tb is

component dec_32 is
port( src : in std_logic_vector (4 downto 0);
	z : out std_logic_vector (31 downto 0));
end component;


signal src_tb : std_logic_vector (4 downto 0);
signal z_tb : std_logic_vector (31 downto 0);

begin

dut: dec_32 
port map( src_tb, z_tb);

testbench: process begin


src_tb <= "00000";  --0
wait for 1 ns;

src_tb <= "00001";  --1
wait for 1 ns;

src_tb <= "00010"; --2
wait for 1 ns;

src_tb <= "00011"; --3
wait for 1 ns;
src_tb <= "00100"; --4 
wait for 1 ns;
src_tb <= "00101"; --5 
wait for 1 ns;
src_tb <= "00110"; --6
wait for 1 ns;
src_tb <= "00111"; --7
wait for 1 ns;
src_tb <= "01000"; --8
wait for 1 ns;

src_tb <= "01001"; --9
wait for 1 ns;

src_tb <= "01010"; --10
wait for 1 ns;

src_tb <= "01011"; --11
wait for 1 ns;

src_tb <= "01100"; -- 12
wait for 1 ns;

src_tb <= "01101"; -- 13
wait for 1 ns;
src_tb <= "01110"; -- 14
wait for 1 ns;

src_tb <= "01111"; -- 15
wait for 1 ns;

src_tb <= "10000"; -- 16
wait for 1 ns;

src_tb <= "10001"; -- 17
wait for 1 ns;

src_tb <= "10010"; -- 18
wait for 1 ns;

src_tb <= "10011"; -- 19
wait for 1 ns;

src_tb <= "10100"; -- 20
wait for 1 ns;

src_tb <= "10101"; -- 21
wait for 1 ns;

src_tb <= "10110"; -- 22
wait for 1 ns;

src_tb <= "10111"; -- 23
wait for 1 ns;

src_tb <= "11000"; -- 24
wait for 1 ns;

src_tb <= "11001"; -- 25
wait for 1 ns;

src_tb <= "11010"; -- 26
wait for 1 ns;

src_tb <= "11011"; -- 27
wait for 1 ns;

src_tb <= "11100"; -- 28
wait for 1 ns;

src_tb <= "11101"; -- 29
wait for 1 ns;

src_tb <= "11110"; -- 30
wait for 1 ns;

src_tb <= "11111"; -- 31
wait for 1 ns;

end process;
end behav;
