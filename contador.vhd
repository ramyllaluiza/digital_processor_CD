

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.bus_array_pkg31.all;

entity contador is
port( clr, it, ld, clk : in bit;
		inData	        : in std_logic_vector(15 downto 0);
		outData	  		  : out std_logic_vector(15 downto 0));
end contador;

architecture behav of contador is

	component reg16 is
		Port(
		clk, load	: in std_logic;
		D				: in std_logic_vector(15 downto 0);
		Q				: out std_logic_vector(15 downto 0));
		end component;
		
	component some is
		Port(
		A, B : in bit_vector(15 downto 0);
	   sub  : in bit;
	   cout : out bit;
	   S    : out bit_vector(15 downto 0));
		end component;
		
		component mux3_1 is
		Port(
		A		: bus_array31;
		S		: in std_logic_vector(1 downto 0);
		Z		: out std_logic_vector(15 downto 0));
		end component;

		type tmp_array is array(0 to 2) of std_logic_vector(15 downto 0);
		signal outMux : bit_vector(15 downto 0);
		signal inMux: tmp_array;
		signal load : std_logic;
		signal outt : bit_vector(15 downto 0);
		signal s : bit_vector(1 downto 0);
		
begin
		process is
			begin
				if clr then
					load<='1';
					s<="00";
				else if it then
					load<='1';
					s<="01";
				else if ld then
					load<='1';
					s<="10";
				else
					load<='0';
				end if;
				end if;
				end if;
		end process;
		inMux(0)<= "0000000000000000";
		inMux(2)<=inData;
		u3 : mux3_1 port map(A=>inMux, S=>s, Z=>outMux);
		u0 : reg16 port map(clk=>clk, load=>load, D=>outMux, Q=>outt);
		u1 : some port map(A=>outt, B=>"0000000000000001", sub=>'0',cout,S=>inMux(1));
		outData<=outt;
		
end architecture behav;