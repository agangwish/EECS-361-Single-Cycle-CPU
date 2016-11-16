library ieee;
use ieee.std_logic_1164.all;

entity extender is
port ( x: in std_logic_vector (15 downto 0);
z : out std_logic_vector (31 downto 0));
end entity;

architecture struct of extender is 

begin

G0: for i in 0 to 31 generate begin


G1: if i < 16 generate begin
z(i) <= x(i);
end generate;

G2: if i > 15 generate begin
z(i) <= x(15);
end generate;


end generate;
end struct;
