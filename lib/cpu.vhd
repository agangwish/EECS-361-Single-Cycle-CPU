library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity CPU is
	generic (
		data_file : string
  	);
end CPU;

architecture structure of CPU is

component alu_32 is 
	port (a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(5 downto 0);
		result : out std_logic_vector(31 downto 0);
		carryout : out std_logic;
		overflow : out std_logic;
		zero : out std_logic
		);
end component alu_32;

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

component syncram is
  generic (
	mem_file : string
  );
  port (
	clk	: in std_logic;
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;

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

component extender is
port ( x: in std_logic_vector (15 downto 0);
	z: out std_logic_vector (31 downto 0));
end component;

signal clk, RegWr, RegDst, carryout, overflow, zero, ALUsrc, MemWr, MemtoReg : std_logic;
signal instruction, busA, busB, busW, instrExt, aluB, aluResult, dOut, pc, pc_four, pc_branch : std_logic_vector(31 downto 0);
signal Rw, Rt, Rs, Rd : std_logic_vector(4 downto 0);
signal ALUctrl : std_logic_vector(5 downto 0);

begin

	REG: register_32bit_32 port map (clk, RegWr, Rw, Rs, Rt, busW, busA, busB);
	MUX1: mux_n 
		generic map (n => 5)
		port map (RegDst, Rt, Rd, Rw);
	EXT: extender port map (instruction(15 downto 0), instrExt);
	MUX2: mux_32 port map (ALUsrc, busB, instrExt, aluB); 
	ALU: alu_32 port map (busA, aluB, ALUctrl, ALUresult, carryout, overflow, zero);
	DMEM: syncram
		generic map (mem_file => data_file)
		port map(clk, '1', '1', MemWr, ALUresult, busB, dOut);
	MUX3: mux_32 port map (MemtoReg, ALUresult, dOut, busW);
	IFETCH: fetch
		generic map (mem_file => data_file)
		port map(clk, instruction, pc, pc_four, pc_branch);
	R1: Rt <= instruction(25 downto 21);
	R2: Rs <= instruction(20 downto 16);
	R3: Rd <= instruction(15 downto 11);

end structure;
