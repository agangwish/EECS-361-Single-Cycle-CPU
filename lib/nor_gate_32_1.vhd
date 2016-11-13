library ieee;
use ieee.std_logic_1164.all;
use work.eecs361;
use work.eecs361_gates;


--NOR GATE 32-BIT INPUT, 1-BIT OUTPUT -----------------------
-- USEFUL AS A ZERO COMPARISON UNIT--------------------------

entity nor_gate_32_1 is
port(
x: in std_logic_vector (31 downto 0); 
z: out std_logic);
end entity;

architecture struct of nor_gate_32_1 is


-- 1 BIT INPUT OR GATE-------------------
component or_gate is
port(
x, y : in std_logic;
z : out std_logic);
end component;


--1 BIT INPUT NOR GATE ------------------
component nor_gate is
port(
x, y : in std_logic;
z : out std_logic);
end component;

-- 1 BIT INPUT NOT GATE -----------------
component not_gate is
port(
x: in std_logic;
z : out std_logic);
end component;


--INTERMEDIATE SIGNALS ----------------------
signal row0 : std_logic_vector (15 downto 0); -- OR OF EACH PAIR OF BITS
signal row1 : std_logic_vector (7 downto 0);  -- OR OF OUTPUT OF EACH PAIR OF BITS
signal row2 : std_logic_vector (3 downto 0);  -- ALGORITHM CONTINUES, HAS LOG2(32) TOTAL ROWS
signal row3 : std_logic_vector (1 downto 0);  -- FINAL ROW IS OUTPUT OF GATE
signal tempz : std_logic;
begin

G0: for i in 0 to 15 generate begin  -- INDEX FOR NOR GATE ALGORITHM

C0: or_gate port map(x(2*i), x((2*i)+1), row0(i));  -- FIRST OR 

G1: if i < 8 generate begin
C1: or_gate port map(row0(2*i), row0((2*i)+1), row1(i)); -- SECOND OR
end generate;


G2: if i < 4 generate begin
C2: or_gate port map(row1(2*i), row1((2*i)+1), row2(i)); -- THIRD OR
end generate;

G3: if i < 2 generate begin
C3: or_gate port map(row2(2*i), row2((2*i)+1), row3(i)); -- FOURTH OR
end generate;

end generate;

C4: or_gate port map(row3(0), row3(1), tempz); -- LAST OR, FINAL OUTPUT
C5: not_gate port map(tempz, z);  -- NOR <= NOT(OR)

end struct;


