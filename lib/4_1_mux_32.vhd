library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_n;

entity 4_1_mux32 is
  port (
	sel	  : in	std_logic_vector (1 downto 0);
	src0,src1,src2,src3 :	in	std_logic_vector (31 downto 0);
	z : out std_logic_vector (31 downto 0);
  );
end 4_1_mux32;

signal temp, temp1 : std_logic_vector (31 downto 0);

architecture structural of mux is

mux0: mux port map(sel(0), src0, src1, temp);
mux1: mux port map(sel(0), src2, src3, temp1);
mux2: mux port map (sel(1), temp, temp1, z);



end structural;
