library ieee;
use ieee.std_logic_1164.all;

package bus_array_pkg is
        type bus_array is array(15 downto 0) of std_logic_vector(15 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.bus_array_pkg.all;

entity mux16_1 is
	port(
		A		: bus_array;
		en		: in std_logic;
		S		: in std_logic_vector(3 downto 0);
		Z		: out std_logic_vector(15 downto 0));
end mux16_1;

architecture main of mux16_1 is
	type tmp_array is array(0 to 15) of std_logic_vector(15 downto 0);
begin
	PROCESS(en) IS
	BEGIN
		IF(en = '1') THEN
			Z <= A(conv_integer(unsigned(S)));
		ELSE
			Z <= "0000000000000000";
		END IF;
	END PROCESS;

end architecture main;