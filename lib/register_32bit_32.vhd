library ieee;
use ieee.std_logic_1164.all;

entity register_32bit_32 is
port(
clk :in std_logic;
we: in std_logic;
rw : in std_logic_vector(4 downto 0);
ra : in std_logic_vector(4 downto 0);
rb : in std_logic_vector(4 downto 0);
busw : in  std_logic_vector(31 downto 0);
busa : out  std_logic_vector(31 downto 0);
busb : out  std_logic_vector(31 downto 0));
end entity;


architecture struct of register_32bit_32 is

component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;


component mux32_32_1 is
  port (
	sel	  : in	std_logic_vector (4 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15 :	in	std_logic_vector (31 downto 0);
	src16,src17,src18, src19, src20, src21, src22, src23, src24, src25, src26, src27, src28, src29, src30, src31 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end component;

component dec_32 is
port( src : in std_logic_vector (4 downto 0);
	z : out std_logic_vector (31 downto 0));
end component;

component and_gate is
port ( x,y : in std_logic;
z : out std_logic);
end component;

type vector_array is array (0 to 31) of std_logic_vector(31 downto 0);

signal decoder_out, and_out : std_logic_vector (31 downto 0);
signal reg_out : vector_array;

begin


C0: dec_32 port map (rw, decoder_out);

G0: for i in 0 to 31 generate begin

C2: and_gate port map(decoder_out(i), we, and_out(i));

C1: register_32bit port map (clk, and_out(i), busw, reg_out(i));

end generate;

C2: mux32_32_1 port map (ra, reg_out(0), reg_out(1), reg_out(2), reg_out(3), reg_out(4), reg_out(5),
reg_out(6), reg_out(7), reg_out(8), reg_out(9), reg_out(10), reg_out(11), reg_out(12), reg_out(13), reg_out(14), reg_out(15),
reg_out(16), reg_out(17), reg_out(18), reg_out(19), reg_out(20), reg_out(21), reg_out(22), reg_out(23), reg_out(24), 
reg_out(25), reg_out(26), reg_out(27), reg_out(28), reg_out(29), reg_out(30), reg_out(31),
busa);

C3: mux32_32_1 port map (rb, reg_out(0), reg_out(1), reg_out(2), reg_out(3), reg_out(4), reg_out(5),
reg_out(6), reg_out(7), reg_out(8), reg_out(9), reg_out(10), reg_out(11), reg_out(12), reg_out(13), reg_out(14), reg_out(15),
reg_out(16), reg_out(17), reg_out(18), reg_out(19), reg_out(20), reg_out(21), reg_out(22), reg_out(23), reg_out(24), 
reg_out(25), reg_out(26), reg_out(27), reg_out(28), reg_out(29), reg_out(30), reg_out(31),
busb);

end struct;














