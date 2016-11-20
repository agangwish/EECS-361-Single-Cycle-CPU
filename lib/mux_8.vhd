library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_n;

entity mux_8 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(7 downto 0);
	src1  : in  std_logic_vector(7 downto 0);
	z	    : out std_logic_vector(7 downto 0)
  );
end mux_8;

architecture structural of mux_8 is
begin
  mux_map: mux_n
	generic map (n => 8)
	port map (
	  sel => sel,
	  src0 => src0,
	  src1 => src1,
	  z => z);
end structural;

