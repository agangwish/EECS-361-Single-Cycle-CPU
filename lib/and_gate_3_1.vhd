library ieee;
use ieee.std_logic_1164.all;

entity and_gate_3_1 is
port (x : in std_logic_vector (2 downto 0);
z : out std_logic);
end entity;

architecture struct of and_gate_3_1 is 

component and_gate is
port(x,y : in std_logic;
z: out std_logic);
end component;


signal and_temp: std_logic;


begin

C0: and_gate port map(x(0), x(1), and_temp);
C1: and_gate port map(and_temp, x(2), z);

end struct;