library ieee;
use ieee.std_logic_1164.all;

entity ID is
port(instruction : in std_logic_vector (31 downto 0);
control : out std_logic_vector (7 downto 0);
ALUop : out std_logic_vector (5 downto 0));
end entity;

architecture struct of ID is


component mux_8 is
port( sel : in std_logic;
src0, src1 : in std_logic_vector (7 downto 0);
z : out std_logic_vector (7 downto 0));
end component;

component mux_6 is
port( sel : in std_logic;
src0, src1 : in std_logic_vector (5 downto 0);
z : out std_logic_vector (5 downto 0));
end component;

component or_gate is
port( x,y : in std_logic;
z : out std_logic);
end component;

component nor_gate is
port( x,y : in std_logic;
z : out std_logic);
end component;



signal opcode, funct : std_logic_vector (5 downto 0);
signal op_zero, funct_zero  : std_logic;
signal temp_op_zero, temp_funct_zero : std_logic_vector (2 downto 0);
signal temp_op_zero1, temp_funct_zero1 : std_logic;
signal sll_check : std_logic;

signal decode_funct : std_logic_vector (5 downto 0);
signal decode_control : std_logic_vector (7 downto 0);
signal decode_sel : std_logic_vector (1 downto 0);
signal mux8_out, mux8_out1 : std_logic_vector (7 downto 0);
signal mux6_out, mux6_out1 : std_logic_vector (5 downto 0);


begin


-- check if opcode is zero, thus r-type
-- check if opcode and function are zero, then is SLL

opcode <= instruction (31 downto 26);
funct <= instruction (5 downto 0);

G0: for i in 0 to 2 generate begin

C0: or_gate port map(opcode(2*i), opcode(2*i+1), temp_op_zero(i));
C1: or_gate port map(funct(2*i), funct(2*i+1), temp_funct_zero(i));

end generate;


C2: or_gate port map(temp_op_zero(0), temp_op_zero(1), temp_op_zero1);
C3: nor_gate port map(temp_op_zero1, temp_op_zero(2), op_zero); -- if opcode is zero and instruction is r-type

C4: or_gate port map(temp_funct_zero(0), temp_funct_zero(1), temp_funct_zero1); 
C5:  nor_gate port map(temp_funct_zero1, temp_funct_zero(2), funct_zero);  -- if function is zero and sll is code


--make decode signals for i-type
decode_sel(0) <= opcode(3); -- check op(3) to see if sw or addi
decode_sel(1) <= opcode(5); -- check op(5) to see if lw or sw, if both 0 then branch


--make a 4-1 mux8

M0: mux_8 port map(decode_sel(0), "00000100", "01010101", mux8_out); --branch, addi
M1: mux_8 port map(decode_sel(0), "01110001", "01001001", mux8_out1); -- lw, sw
M2: mux_8 port map(decode_sel(1), mux8_out, mux8_out1, decode_control);

M3: mux_6 port map(decode_sel(0), "100010", "100000", mux6_out); -- sub, add
M4: mux_6 port map(decode_sel(0), "100000", "100000", mux6_out1); -- add, add
M5: mux_6 port map(decode_sel(1), mux6_out, mux6_out1, decode_funct);






D0: mux_8 port map(op_zero, decode_control, "10010000", control);  -- if op is all zeros then use r-type control
D1: mux_6 port map(op_zero, decode_funct, funct, ALUop);  -- if op is all zeros ALUop is funct
-- RegDst, ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, Jump, Extop


end struct;





