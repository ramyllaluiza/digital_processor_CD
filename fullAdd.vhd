library ieee;
use ieee.std_logic_1164.all;

entity fullAdd is
port(a, b, cin : in std_logic;
		s, co : out std_logic);
end fullAdd;

architecture behav of fullAdd is
begin
	
	s <= (a and b and cin) or (not a and not b and cin) or (not a and b and not cin) or (a and not b and not cin);
	co <= (b and cin) or (a and cin) or (a and b);
	
end architecture behav;