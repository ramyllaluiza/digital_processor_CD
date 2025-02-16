library ieee;
use ieee.std_logic_1164.all;

package bus_array_pkg31 is
        type bus_array31 is array(2 downto 0) of std_logic_vector(15 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.bus_array_pkg31.all;

entity mux3_1 is
	port(
		A		: bus_array31;
		S		: in std_logic_vector(1 downto 0);
		Z		: out std_logic_vector(15 downto 0));
end mux3_1;

architecture main of mux3_1 is
	type tmp_array is array(0 to 2) of std_logic_vector(15 downto 0);
begin
	PROCESS IS
	BEGIN
			Z <= A(conv_integer(unsigned(S)));
	END PROCESS;

end architecture main;