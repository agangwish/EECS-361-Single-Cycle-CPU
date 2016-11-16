library ieee;
use ieee.std_logic_1164.all;

entity register_32bit_32_tb is
end entity;

architecture behav of register_32bit_32_tb is




component register_32bit_32 is
port(
clk :in std_logic;
we: in std_logic;
rw : in std_logic_vector(4 downto 0);
ra : in std_logic_vector(4 downto 0);
rb : in std_logic_vector(4 downto 0);
busw : in  std_logic_vector(31 downto 0);
busa : out  std_logic_vector(31 downto 0);
busb : out  std_logic_vector(31 downto 0));
 end component;


signal clk_tb, we_tb : std_logic;
signal rw_tb, ra_tb, rb_tb : std_logic_vector (4 downto 0);
signal busw_tb, busa_tb, busb_tb : std_logic_vector (31 downto 0);


begin

dut: register_32bit_32 port map(clk_tb, we_tb, rw_tb, ra_tb, rb_tb, busw_tb, busa_tb, busb_tb);

testbench: process begin


clk_tb <= '0';
we_tb <= '1';
rw_tb <= "00000";
ra_tb <= "00000";
rb_tb <= "00001";
busw_tb <= X"00000000";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '1';
rw_tb <= "00001";
ra_tb <= "00000";
rb_tb <= "00001";
busw_tb <= X"00000001";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '0';
rw_tb <= "00001";
ra_tb <= "00000";
rb_tb <= "00001";
busw_tb <= X"00000002";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <='0';
we_tb <='1';
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

end process;
end behav;











