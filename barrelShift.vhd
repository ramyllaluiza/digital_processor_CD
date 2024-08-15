library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity barrelShift is
	Port(
		A, B 	: in std_logic_vector(15 downto 0);
		S  	: out std_logic_vector(15 downto 0));
end barrelShift;

architecture behav of barrelShift is

signal atemp : std_logic_vector(15 downto 0);

begin

atemp <= A;

process is
	variable i : integer := 0;
   begin
		IF (conv_integer(unsigned(B)) < 16) THEN
		
        
	
        while (i < conv_integer(unsigned(B))) loop
				atemp(0) <= atemp(1);
				atemp(1) <= atemp(2);
				atemp(2) <= atemp(3);
				atemp(3) <= atemp(4);
				atemp(4) <= atemp(5);
				atemp(5) <= atemp(6);
				atemp(6) <= atemp(7);
				atemp(7) <= atemp(8);
				atemp(8) <= atemp(9);
				atemp(9) <= atemp(10);
				atemp(10)<= atemp(11);
				atemp(11)<= atemp(12);
				atemp(12)<= atemp(13);
				atemp(13)<= atemp(14);
				atemp(14)<= atemp(15);
				atemp(15)<= '0';
            i := i + 1;
        end loop;
        wait;
		ELSE
			atemp <= "0000000000000000";
		END IF;
    end process;
	 
	 
	 S <= atemp;

end behav;