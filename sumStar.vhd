library ieee;
use ieee.std_logic_1164.all;

entity sumStar is
	port(
		A, B			: in std_logic_vector(15 downto 0);
		Q				: out std_logic_vector(15 downto 0));
end sumStar;

architecture behav of sumStar is
begin

	Q <= std_logic_vector(conv_integer(unsigned(A)) + conv_integer(unsigned(B)) -1);

end architecture behav;
