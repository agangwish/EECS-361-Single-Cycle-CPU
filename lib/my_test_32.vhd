library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity my_test_32 is
end my_test_32;

architecture behavioral of my_test_32 is
signal a : std_logic_vector(31 downto 0);
signal b : std_logic_vector(31 downto 0);
signal op : std_logic_vector(5 downto 0);
signal shamt : std_logic_vector(4 downto 0);
signal result : std_logic_vector(31 downto 0);
signal carryout : std_logic;
signal overflow : std_logic;
signal zero : std_logic;

begin
  test_comp : entity alu_32
	port map (
		a => a,
		b => b,
		op => op,
		shamt => shamt,
		result => result,
		carryout => carryout,
		overflow => overflow,
		zero => zero
		);
  testbench : process
  begin
	a <= "01010101010101010101010101010101";
	b <= "00110011001100110011001100110011";
	shamt <= "00000";
	op <= "100000";
	wait for 5 ns;
	assert result = "10001000100010001000100010001000" report "ADDITION 1" severity error;
        assert carryout = '0' report "ADDITION 1" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000001";
	op <= "100000";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "ADDITION 2" severity error;
        assert carryout = '1' report "ADDITION 2 c" severity error;
	wait for 5 ns;

	a <= "10101010101010101010101010101010";
	b <= "00010001000100010001000100010001";
	op <= "100000";
	wait for 5 ns;
	assert result = "10111011101110111011101110111011" report "ADDITION 3" severity error;
	wait for 5 ns;

	a <= "00011100110011101110011101000101";
	b <= "00000001110110011011100111001101";
	op <= "100010";
	wait for 5 ns;
	assert result = "00011010111101010010110101111000" report "SUBTRACTION 1R" severity error;
        assert carryout = '1' report "SUBTRACTION 1C" severity error;
	wait for 5 ns;

	a <= "01111111111111111111111111111111";
	b <= "01111111111111111111111111111111";
	op <= "100010";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "SUBTRACTION 2R" severity error;
	assert zero = '1' report "ZERO" severity error;
	wait for 5 ns;

	a <= "00000000000000000000000000000000";
	b <= "00000000000000000000000000000001";
	op <= "100010";
	wait for 5 ns;
	assert result = "11111111111111111111111111111111" report "SUBTRACTION 3R" severity error;
	wait for 5 ns;

	a <= "01010101010101010101010101010101";
	b <= "00110011001100110011001100110011";
	op <= "100100";
	wait for 5 ns;
	assert result = "00010001000100010001000100010001" report "AND 1" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000000";
	op <= "100100";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "AND 2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "11111111111111111111111111111111";
	op <= "100100";
	wait for 5 ns;
	assert result = "11111111111111111111111111111111" report "AND 3" severity error;
	wait for 5 ns;

	a <= "01010101010101010101010101010101";
	b <= "00110011001100110011001100110011";
	op <= "100110";
	wait for 5 ns;
	assert result = "01100110011001100110011001100110" report "XOR 1" severity error;
	wait for 5 ns;

	a <= "00000000000000000000000000000000";
	b <= "11111111111111111111111111111111";
	op <= "100110";
	wait for 5 ns;
	assert result = "11111111111111111111111111111111" report "XOR 2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "11111111111111111111111111111111";
	op <= "100110";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "XOR 3" severity error;
	assert zero = '1' report "ZERO1" severity error;
	wait for 5 ns;

	a <= "01010101010101010101010101010101";
	b <= "00110011001100110011001100110011";
	op <= "100101";
	wait for 5 ns;
	assert result = "01110111011101110111011101110111" report "OR 1" severity error;
	wait for 5 ns;

	a <= "00000000000000000000000000000000";
	b <= "11111111111111111111111111111111";
	op <= "100101";
	wait for 5 ns;
	assert result = "11111111111111111111111111111111" report "OR 2" severity error;
	wait for 5 ns;

	a <= "00000000000000000000000000000000";
	b <= "00000000000000000000000000000000";
	op <= "100101";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "OR 3" severity error;
	assert zero = '1' report "ZERO2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000010";
	shamt <= "00010";
	op <= "000010";
	wait for 5 ns;
	assert result = "00111111111111111111111111111111" report "SRL1" severity error;
	wait for 5 ns;

	a <= "01100011011000100110011010110001";
	b <= "00000000000000000000000000000101";
	op <= "000010";
	shamt <= "00101";
	wait for 5 ns;
	assert result = "00000011000110110001001100110101" report "SRL2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000011111";
	op <= "000010";
	shamt <= "11111";
	wait for 5 ns;
	assert result = "00000000000000000000000000000001" report "SRL3" severity error;
	wait for 5 ns;

	a <= "00111111111111111111111111111111";
	shamt <= "00010";
	op <= "000000";
	wait for 5 ns;
	assert result = "11111111111111111111111111111100" report "SLL1" severity error;
	wait for 5 ns;

	a <= "01100011011000100110011010110001";
	shamt <= "00101";
	op <= "000000";
	wait for 5 ns;
	assert result = "01101100010011001101011000100000" report "SLL2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	shamt <= "11111";
	op <= "000000";
	wait for 5 ns;
	assert result = "10000000000000000000000000000000" report "SLL3" severity error;
	wait for 5 ns;

	a <= "00011100110011101110011101000101";
	b <= "00000001110110011011100111001101";
	op <= "101010";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "SLT1" severity error;
	wait for 5 ns;

	a <= "00000001110110011011100111001101";
	b <= "00011100110011101110011101000101";
	op <= "101010";
	wait for 5 ns;
	assert result = "00000000000000000000000000000001" report "SLT2" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000001";
	op <= "101010";
	wait for 5 ns;
	assert result = "00000000000000000000000000000001" report "SLT3" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000001";
	op <= "101011";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "SLTU1" severity error;
	wait for 5 ns;

	a <= "00000001110110011011100111001101";
	b <= "00011100110011101110011101000101";
	op <= "101011";
	wait for 5 ns;
	assert result = "00000000000000000000000000000001" report "SLTU2" severity error;
	wait for 5 ns;
	

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000001";
	op <= "100000";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "ADDU1" severity error;
	assert carryout = '1' report "adduc1" severity error;
	assert overflow = '0' report "addu01" severity error;
	wait for 5 ns;

	a <= "11111111111111111111111111111111";
	b <= "00000000000000000000000000000001";
	op <= "100001";
	wait for 5 ns;
	assert result = "00000000000000000000000000000000" report "ADDU2" severity error;
	assert carryout = '1' report "adduc2" severity error;
	assert overflow = '1' report "addu02" severity error;
	wait for 5 ns;

	a <= "00000000000000000000000000000010";
	b <= "00000000000000000000000000000011";
	op <= "100010";
	wait for 5 ns;
	wait for 5 ns;

	
	wait;
  end process;
end behavioral;