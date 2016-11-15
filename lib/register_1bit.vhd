library ieee;
use ieee.std_logic_1164.all;


entity register_1bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
end entity;



architecture struct of register_1bit is

component dffr is
  port (
	clk	: in  std_logic;
	d	: in  std_logic;
	q	: out std_logic
  );
end component;


component mux is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	z	  : out std_logic
  );
end component;

signal mux_last, dff_in, dff_out : std_logic;

begin


C0: mux port map(we, mux_last, din, dff_in);
C1: dffr port map(clk, dff_in, dff_out);
mux_last <= dff_out;
dout <= dff_out;



end struct;
