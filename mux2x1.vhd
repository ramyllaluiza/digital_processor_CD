library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
port(i0, i1, s0 : in std_logic;
		d : out std_logic);
end mux2x1;

architecture behav of mux2x1 is
begin
	
	with s0 select
		d <= i0 when '0',
		i1 when '1';
	
end architecture behav;