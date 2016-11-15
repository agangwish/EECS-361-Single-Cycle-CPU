library ieee;
use ieee.std_logic_1164.all;

entity mux32_32_1 is
  port (
	sel	  : in	std_logic_vector (4 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15 :	in	std_logic_vector (31 downto 0);
	src16,src17,src18, src19, src20, src21, src22, src23, src24, src25, src26, src27, src28, src29, src30, src31 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0)
  );
end mux32_32_1;


architecture structural of mux32_32_1 is


component mux32_161 is
  port (
	sel	  : in	std_logic_vector (3 downto 0);
	src0,src1,src2,src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15 :	in	std_logic_vector (31 downto 0);
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

mux0: mux32_161 port map(sel (3 downto 0), src0, src1, src2, src3, src4, src5, src6, src7, src8, src9, src10, src11, src12, src13, src14, src15, temp);
mux1: mux32_161 port map(sel (3 downto 0), src16, src17,src18, src19, src20, src21, src22, src23, src24, src25, src26, src27, src28, src29, src30, src31, temp1);
mux2: mux_32 port map (sel(4), temp, temp1, z);



end structural;