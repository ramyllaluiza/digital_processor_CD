LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ROM IS
PORT(
           clock : IN STD_LOGIC; 
           rom_enable : IN STD_LOGIC;
           address : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           data_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END ROM;
ARCHITECTURE behav OF ROM IS
     TYPE rom_type IS ARRAY(0 to 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    
     CONSTANT mem: rom_type :=
           ( 1 => "0000000100010000", -- Aloca um dado no endereço 2
             2 => "0000001000000100", -- Aloca um dado no endereço 3
             3 => "0000001100001000", -- Aloca um dado no endereço 4
				 4 => "0110000100100100", -- Aloca um dado no endereço 2
             5 => "0001010000000000", -- Aloca um dado no endereço 3
             6 => "0010010000100011", -- Aloca um dado no endereço 4
				 7 => "0001010000000001", -- Aloca um dado no endereço 2
             8 => "0100010000110010", -- Aloca um dado no endereço 3
             9 => "0101000000000100", -- Aloca um dado no endereço 4
				13 => "0001010000000010", -- Aloca um dado no endereço 4
            others => "0000000000000000"  -- Aloca 0 no outros endereços
            );

BEGIN

PROCESS(clock) IS
BEGIN
    IF (RISING_EDGE(clock) AND rom_enable = '1') THEN
           data_output <= mem(conv_integer(unsigned(address)));
    END IF;
END PROCESS;
END behav;