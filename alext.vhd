library ieee;
use ieee.std_logic_1164.all;

entity alext is
	Port(
		s1, s0 	: in std_logic;
		A, B 		: in std_logic_vector(15 downto 0);
		IA, IB	: out std_logic_vector(15 downto 0));
end alext;

architecture behav of alext is
	
component barrelShift is
	Port(
		A, B 	: in std_logic_vector(15 downto 0);
		S  	: out std_logic_vector(15 downto 0));
end component;
	
begin
	u0	: barrelShift port map(A => A, B => B, S => IA);
	process(s1, s0)
	begin
		if (s1 = s0) then
			if(s1 = '0') then
				IA <= A;
			end if;
			IB <= "0000000000000000";
		else
			IB <= B;
			IA <= A;
		end if;
	end process;
	
end behav;