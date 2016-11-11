library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity my_test is
end my_test;

architecture behavioral of my_test is
signal a : std_logic;
signal b : std_logic;
signal carryin : std_logic;
signal less : std_logic;
signal op : std_logic_vector(5 downto 0);
signal result : std_logic;
signal carryout : std_logic;

begin
  test_comp : entity alu_1
	port map (
	  a => a,
	b => b,
	carryin => carryin,
	less => less,
	op => op,
	result => result,
	carryout => carryout
	);
  testbench : process
  begin
	a <= '0';
	b <= '1';
	carryin <= '0';
	op <= "100000";
	less <= '0';
	wait for 10 ns;
	assert result = '1' report "0 + 1 Sum" severity error;
        assert carryout = '0' report "0 + 1 Carry" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '1';
	carryin <= '0';
	op <= "100000";
	wait for 10 ns;
	assert result = '0' report "1 + 1 Sum" severity error;
        assert carryout = '1' report "1 + 1 Carry" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '1';
	carryin <= '1';
	op <= "100000";
	wait for 10 ns;
	assert result = '1' report "1 + 1 Sum (ci)" severity error;
        assert carryout = '1' report "1 + 1 Carry (ci)" severity error;
	wait for 10 ns;

	a <= '0';
	b <= '0';
	carryin <= '0';
	op <= "100100";
	wait for 10 ns;
	assert result = '0' report "0 AND 0" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '0';
	carryin <= '0';
	op <= "100100";
	wait for 10 ns;
	assert result = '0' report "1 AND 0" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '1';
	carryin <= '1';
	op <= "100100";
	wait for 10 ns;
	assert result = '1' report "1 AND 1" severity error;
	wait for 10 ns;

	a <= '0';
	b <= '0';
	carryin <= '0';
	op <= "100101";
	wait for 10 ns;
	assert result = '0' report "0 OR 0" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '1';
	carryin <= '0';
	op <= "100101";
	wait for 10 ns;
	assert result = '1' report "1 OR 1" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '0';
	carryin <= '1';
	op <= "100101";
	wait for 10 ns;
	assert result = '1' report "1 OR 0" severity error;
	wait for 10 ns;

	a <= '1';
	b <= '0';
	carryin <= '1';
	op <= "100110";
	wait for 10 ns;
	assert result = '1' report "1 XOR 0" severity error;
	wait for 10 ns;
	a <= '1';
	b <= '1';
	carryin <= '1';
	op <= "100110";
	wait for 10 ns;
	assert result = '0' report "1 XOR 1" severity error;
	wait for 10 ns;
	a <= '0';
	b <= '0';
	carryin <= '1';
	op <= "100110";
	wait for 10 ns;
	assert result = '0' report "0 XOR 0" severity error;
	wait for 10 ns;
	
	wait;
  end process;
end behavioral;