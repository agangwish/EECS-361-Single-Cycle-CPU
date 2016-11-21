library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity CPU is
	generic (
		data_file : string
  	);
port (clk : in std_logic;
      pc_init : in std_logic);
end CPU;

architecture structure of CPU is

component alu_32 is 
	port (a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(5 downto 0);
		shamt : in std_logic_vector (4 downto 0);
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
	pc : in std_logic_vector (31 downto 0);
	rt, rs, rd : out std_logic_vector (4 downto 0);
	imm16 : out std_logic_vector (15 downto 0);
	shamt : out std_logic_vector (4 downto 0);
	instruction : out std_logic_vector (31 downto 0));
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

component sram is
  generic (
	mem_file : string
  );
  port (
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
	op :in std_logic;
	z: out std_logic_vector (31 downto 0));
end component;


component NAL is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
zero, carryout : in std_logic;
pc_out: out std_logic_vector (31 downto 0);
pc_init : in std_logic);
end component;

component mux_32 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component;

component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;

component ID is
port(instruction : in std_logic_vector (31 downto 0);
control : out std_logic_vector (7 downto 0);
ALUop : out std_logic_vector (5 downto 0));
end component;


signal carryout, overflow, zero : std_logic;
signal instruction, busA, busB, busW, instrExt, aluB, ALUresult, dOut, pc_next : std_logic_vector(31 downto 0);
signal Rw_out, Rt, Rs, Rd : std_logic_vector(4 downto 0);
signal ALUop : std_logic_vector(5 downto 0);
signal pc_reg, pc_reg_out : std_logic_vector (31 downto 0);
signal imm16 : std_logic_vector (15 downto 0);
signal control : std_logic_vector (7 downto 0);
signal shamt : std_logic_vector (4 downto 0);
signal busB_out : std_logic_vector(31 downto 0);
signal not_WE : std_logic;
signal clk_not : std_logic;

begin

	PC_Initialization: mux_32 port map(pc_init, pc_next, X"00400020", pc_reg); -- choose between X"00400020" or calcualted next PC

	PC_Register : register_32bit port map(clk, '1', pc_reg, pc_reg_out);-- register latch to hold next pc

	IFETCH: fetch generic map(data_file) 
	port map(clk, pc_reg_out, Rt, Rs, Rd, imm16, shamt, instruction); -- instruction fetch

	CONTROL_GENERATE: ID port map(instruction, control, ALUop); -- generate control signals
	-- order is RegDst, ALUSrc, MemReg, RegWr, MemWr, Branch, Jump, Extop
	


	MUX1: mux_n 
		generic map (n => 5)
		port map (control(7), Rt, Rd, Rw_out);  -- choose between Rt and Rd for Rw

	REG: register_32bit_32 port map (clk, control(4), Rw_out, Rs, Rt, busW, busA, busB); -- 32 bit register, MemREg
	

	EXT: extender port map (instruction(15 downto 0), control(0), instrExt); -- extender for imm16 field


	MUX2: mux_32 port map (control(6), busB, instrExt, aluB); --select ALUSrc from imm16 or busb, control is ALUSrc

	ALU: alu_32 port map (busA, aluB, ALUop, shamt, ALUresult, carryout, overflow, zero); -- perform ALU op


	NextAddress: NAL port map(pc_reg_out, instruction, zero, carryout, pc_next, pc_init); -- next address logic



	NOT_WE_GENERATE : not_gate port map(control(3), not_WE); -- make WE and OE opposites
	NOT_CLK_GEN : not_gate port map(clk, clk_not);
	DMEM: syncram
		generic map (data_file)
		port map( clk_not, '1', not_WE, control(3), ALUresult, busB, dOut);  -- data memory, control is MemWrite


	MUX3: mux_32 port map (control(5), ALUresult, dOut, busW);  -- select ALU_out or Mem_out, control is MemReg
	

end structure;
