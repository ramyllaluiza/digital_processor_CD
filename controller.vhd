library ieee;
use ieee.std_logic_1164.all;

entity controller is
port(	RF_Rp_zero	: in bit;
		E : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		IR : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PC_ld, PC_clr, PC_inc, I_rd, IR_ld, D_rd, D_wr, RF_s1, RF_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd, alu_s1, alu_s0: out bit;
		NE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		D_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		RF_W_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		RF_W_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		RF_Rp_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		RF_Rq_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end controller;

architecture behav of controller is

signal opcode, RA, RB, RC : STD_LOGIC_VECTOR(3 DOWNTO 0);


begin
	opcode <= IR(15) & IR(14) & IR(13) & IR(12); 
	RA <= IR(11) & IR(10) & IR(9) & IR(8);
	RB <= IR(7) & IR(6) & IR(5) & IR(4);  
	RC <= IR(3) & IR(2) & IR(1) & IR(0); 

	process (E, IR, RF_Rp_zero)  
	  begin
		 case E is
			when "0000" =>
				(PC_ld => '1', PC_clr => '1', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0001");
			when "0001" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '1', I_rd => '1', IR_ld => '1', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0010");
			when "0010" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0';
				IF opcode = "0000" THEN
					NE <= "0011";
				ELSE IF opcode = "0001" THEN
					NE <= "0100";
				ELSE IF opcode = "0010" THEN
					NE <= "0101";
				ELSE IF opcode = "0011" THEN
					NE <= "0110";
				ELSE IF opcode = "0100" THEN
					NE <= "0111";
				ELSE IF opcode = "0101" THEN
					NE <= "1000";
				ELSE
					NE <= "1010";
				END IF;
				END IF;
				END IF;
				END IF;
				END IF;
				END IF;);
			
			when "0011" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '1', D_wr=> '0', RF_s1=> '0', RF_s0=> '1', RF_W_wr=> '1', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0001", D_addr <= "00000000" & RB & RC, RF_W_addr => RA);
			when "0100" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '1', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '1', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0001", D_addr <= "00000000" & RB & RC, RF_Rp_addr => RA);
			when "0101" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '1', RF_Rp_rd=> '1', RF_Rq_rd=> '1', alu_s1=> '0', alu_s0=> '1', NE <= "0001", RF_W_addr => RA, RF_Rp_addr => RB, RF_Rq_addr => RC);	
			when "0110" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '1', RF_s0=> '0', RF_W_wr=> '1', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0001", RF_W_data <= "00000000" & RB & RC, RF_W_addr => RA);
			when "0111" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '1', RF_Rp_rd=> '1', RF_Rq_rd=> '1', alu_s1=> '1', alu_s0=> '0', NE <= "0001", RF_W_addr => RA, RF_Rp_addr => RB, RF_Rq_addr => RC);
			when "1000" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '1', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', RF_Rp_addr => RA;
				IF RF_Rp_zero = '0' THEN
					NE <= "0001";
				ELSE
					NE <= "1001";
				END IF;);
			
			when "1001" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0001");
			when "1010" =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '1', RF_Rp_rd=> '1', RF_Rq_rd=> '1', alu_s1=> '1', alu_s0=> '1', NE <= "0001", RF_W_addr => RC, RF_Rp_addr => RA, RF_Rq_addr => RB);
			when others =>
				(PC_ld => '0', PC_clr => '0', PC_inc => '0', I_rd => '0', IR_ld => '0', D_rd=> '0', D_wr=> '0', RF_s1=> '0', RF_s0=> '0', RF_W_wr=> '0', RF_Rp_rd=> '0', RF_Rq_rd=> '0', alu_s1=> '0', alu_s0=> '0', NE <= "0000");      
		 end case;
	end process;
	
end architecture behav;