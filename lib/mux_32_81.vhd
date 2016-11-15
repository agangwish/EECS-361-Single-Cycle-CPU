library ieee;
use ieee.std_logic_1164.all;

entity mux32_81 is
  port (
	sel	  : in	std_logic_vector (2 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end mux32_81;



architecture structural of mux32_81 is


component mux32_4_1 is
  port (
	sel	  : in	std_logic_vector (1 downto 0);
	src0,src1,src2,src3 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end component;

component mux_32 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component;

signal temp, temp1 : std_logic_vector (31 downto 0);
begin

mux0: mux32_4_1 port map(sel (1 downto 0), src0, src1, src2, src3, temp);
mux1: mux32_4_1 port map(sel (1 downto 0), src4, src5, src6, src7, temp1);
mux2: mux_32 port map (sel(2), temp, temp1, z);



end structural;