library ieee;
use ieee.std_logic_1164.all;

entity alu is
	Port(
		s1, s0 	: in std_logic;
		A, B 		: in std_logic_vector(15 downto 0);
		S			: out std_logic_vector(15 downto 0));
end alu;

architecture behav of alu is

	signal IA, IB 	: std_logic_vector(15 downto 0);
	signal Cin, Cout		: std_logic;
	
	component alext is
		Port(
		s1, s0 	: in std_logic;
		A, B 		: in std_logic_vector(15 downto 0);
		IA, IB	: out std_logic_vector(15 downto 0));
		end component;
	
	component some is
		port(A, B : in std_logic_vector(15 downto 0);
		  sub : in std_logic;
		  cout : out std_logic;
		  S : out std_logic_vector(15 downto 0));
		end component;

	
begin

	-- extensão AL
	u0 : alext port map(s1=>s1, s0=>s0, A=>A, B=>B, IA=>IA, IB=>IB);
	
	cin <= s1 AND (not s0);
	
	-- Somador de 6 bits
	
	w0 : some port map(A=>IA, B=>IB, sub=>Cin, cout=>Cout, S=>S);
	
end behav;