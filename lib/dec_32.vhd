library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.dec_n;

entity dec_32 is
  port (
	src : in std_logic_vector (4 downto 0);
	z : out std_logic_vector (31 downto 0));
end dec_32;

architecture structural of dec_32 is
begin
  dec_map: dec_n
	generic map (n => 5)
	port map (src => src, z => z);
end structural;
