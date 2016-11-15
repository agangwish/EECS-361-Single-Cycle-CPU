library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;


--INSTRUCTION FETCH UNIT -----------------------------
-- INCLUDES OUTPUTS OF NEXT ADDRESS LOGIC (NAL)- -------

entity fetch is
 generic (
	mem_file : string
  );
port( 
	clk 	: in std_logic;
	dout  :	out std_logic_vector(31 downto 0);
	pc : in std_logic_vector (31 downto 0);
	pc_four : out std_logic_vector (31 downto 0);
	pc_branch : out std_logic_vector (31 downto 0));
end fetch;


architecture struct of fetch is 


-- INSTRUCTION MEMORY -----------------------
component syncram is
  generic (
	mem_file : string
  );
  port (
	clk	: in std_logic;
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;



-- Next Address Logic ------------------

component NAL is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
pc_four, pc_branch : out std_logic_vector (31 downto 0));
end component;


signal mem_out : std_logic_vector (31 downto 0);  -- INSTRUCTION MEMORY OUT

begin 


C0: syncram generic map(mem_file)
port map(clk, '1', '1', '0', pc, X"00000000", mem_out);
dout <= mem_out;

C1: NAL port map (pc, mem_out , pc_four, pc_branch);


end struct;



