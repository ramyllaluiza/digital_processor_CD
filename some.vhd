library ieee;
use ieee.std_logic_1164.all;

entity some is
port(A, B : in std_logic_vector(15 downto 0);
	  sub : in std_logic;
	  cout : out std_logic;
	  S : out std_logic_vector(15 downto 0));
end some;

architecture behav of some is

signal CO : std_logic_vector(14 downto 0);
signal SM : std_logic_vector(15 downto 0);


component fullAdd
port(a, b, cin : in std_logic;
		s, co    : out std_logic);
end component;

component mux2x1 is
port(i0, i1, s0 : in std_logic;
		d 			 : out std_logic);
end component;


begin 
	u0 : mux2x1 port map(i0 => B(0), i1 => not B(0), s0 => sub, d => SM(0));
	u1 : mux2x1 port map(i0 => B(1), i1 => not B(1), s0 => sub, d => SM(1));
	u2 : mux2x1 port map(i0 => B(2), i1 => not B(2), s0 => sub, d => SM(2));
	u3 : mux2x1 port map(i0 => B(3), i1 => not B(3), s0 => sub, d => SM(3));
	u4 : mux2x1 port map(i0 => B(4), i1 => not B(4), s0 => sub, d => SM(4));
	u5 : mux2x1 port map(i0 => B(5), i1 => not B(5), s0 => sub, d => SM(5));
	u6 : mux2x1 port map(i0 => B(6), i1 => not B(6), s0 => sub, d => SM(6));
	u7 : mux2x1 port map(i0 => B(7), i1 => not B(7), s0 => sub, d => SM(7));
	u8 : mux2x1 port map(i0 => B(8), i1 => not B(8), s0 => sub, d => SM(8));
	u9 : mux2x1 port map(i0 => B(9), i1 => not B(9), s0 => sub, d => SM(9));
	u10: mux2x1 port map(i0 => B(10), i1 => not B(10), s0 => sub, d => SM(10));
	u11: mux2x1 port map(i0 => B(11), i1 => not B(11), s0 => sub, d => SM(11));
	u12: mux2x1 port map(i0 => B(12), i1 => not B(12), s0 => sub, d => SM(12));
	u13: mux2x1 port map(i0 => B(13), i1 => not B(13), s0 => sub, d => SM(13));
	u14: mux2x1 port map(i0 => B(14), i1 => not B(14), s0 => sub, d => SM(14));
	u15: mux2x1 port map(i0 => B(15), i1 => not B(15), s0 => sub, d => SM(15));

	u16 : fullAdd port map(a => A(0), b => SM(0), cin => sub, s => S(0), co => CO(0));
	u17 : fullAdd port map(a => A(1), b => SM(1), cin => CO(0), s => S(1), co => CO(1));
	u18 : fullAdd port map(a => A(2), b => SM(2), cin => CO(1), s => S(2), co => CO(2));
	u19 : fullAdd port map(a => A(3), b => SM(3), cin => CO(2), s => S(3), co => CO(3));
	u20 : fullAdd port map(a => A(4), b => SM(4), cin => CO(3), s => S(4), co => CO(4));
	u21 : fullAdd port map(a => A(5), b => SM(5), cin => CO(4), s => S(5), co => CO(5));
	u22 : fullAdd port map(a => A(6), b => SM(6), cin => CO(5), s => S(6), co => CO(6));
	u23 : fullAdd port map(a => A(7), b => SM(7), cin => CO(6), s => S(7), co => CO(7));
	u24 : fullAdd port map(a => A(8), b => SM(8), cin => CO(7), s => S(8), co => CO(8));
	u25 : fullAdd port map(a => A(9), b => SM(9), cin => CO(8), s => S(9), co => CO(9));
	u26 : fullAdd port map(a => A(10), b => SM(10), cin => CO(9), s => S(10), co => CO(10));
	u27 : fullAdd port map(a => A(11), b => SM(11), cin => CO(10), s => S(11), co => CO(11));
	u28 : fullAdd port map(a => A(12), b => SM(12), cin => CO(11), s => S(12), co => CO(12));
	u29 : fullAdd port map(a => A(13), b => SM(13), cin => CO(12), s => S(13), co => CO(13));
	u30 : fullAdd port map(a => A(14), b => SM(14), cin => CO(13), s => S(14), co => CO(14));
	u31 : fullAdd port map(a => A(15), b => SM(15), cin => CO(14), s => S(15), co => cout);

	
	
end architecture behav;