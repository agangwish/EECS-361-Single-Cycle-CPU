library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity NAL is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
pc_four, pc_branch : out std_logic_vector (31 downto 0));
end entity;


architecture struct of NAL is

component nor_gate_32_1 is
port (x : in std_logic_vector (31 downto 0);
z : out std_logic_vector (31 downto 0));
end component;


component alu_32 is 
	port (a, b : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(5 downto 0);
		result : out std_logic_vector(31 downto 0);
		carryout : out std_logic;
		overflow : out std_logic;
		zero : out std_logic
		);
end component;


component shifter 
	port(
		a : in std_logic_vector (31 downto 0);
		b : in std_logic_vector (4 downto 0);
		direction : in std_logic;
		result : out std_logic_vector (31 downto 0)
		);
end component shifter;

signal op:  std_logic_vector (5 downto 0);
signal address_out, address_temp: std_logic_vector (31 downto 0);
signal pc_branch_temp : std_logic_vector(31 downto 0);

begin

op <= "100000";


G0:for i in 0 to 31 generate begin


I0: if i < 16  generate begin
address_temp(i) <= instruction(i);
end generate;

I1: if i >= 16 generate begin
address_temp(i) <= instruction(15);  -- sign extension of immm
end generate;




end generate;



S0: shifter port map(address_temp, "00010", '0', address_out); -- address*4


C0: alu_32 port map(pc_in, x"00000004", op, pc_four);  -- PC <= PC + 4
C2: alu_32 port map(pc_in, x"00000004", op, pc_branch_temp); -- 1. PC_Branch <= PC + 4
C1: alu_32 port map(pc_branch_temp, address_out , op, pc_branch);  -- 2. PC <= PC + 4+  (ADDRESS*4)


end struct;




