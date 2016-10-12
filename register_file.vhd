library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_file is
    Port ( src_s0_A : in  STD_LOGIC;
           src_s1_A : in  STD_LOGIC;
           src_s2_A : in  STD_LOGIC;
			  src_s0_B : in  STD_LOGIC;
           src_s1_B : in  STD_LOGIC;
           src_s2_B : in  STD_LOGIC;
           des_A0 : in  STD_LOGIC;
           des_A1 : in  STD_LOGIC;
           des_A2 : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  load_write : in STD_LOGIC;
           d_data : in  STD_LOGIC_VECTOR (15 downto 0);
			  a_data : out STD_LOGIC_VECTOR (15 downto 0);
			  b_data : out STD_LOGIC_VECTOR (15 downto 0)
          );
end register_file;

architecture Behavioral of register_file is
COMPONENT reg16
PORT(
		D:in STD_LOGIC_VECTOR(15 downto 0);
		load: in STD_LOGIC;
		Clk: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(15 downto 0)
	  );
END COMPONENT;

COMPONENT decoder_3_to_8
PORT(
			A0 : in STD_LOGIC;
			A1 : in STD_LOGIC;
			A2 : in STD_LOGIC;
			D0 : out  STD_LOGIC;
         D1 : out  STD_LOGIC;
         D2 : out  STD_LOGIC;
         D3 : out  STD_LOGIC;
			D4 : out  STD_LOGIC;
			D5 : out  STD_LOGIC;
			D6 : out  STD_LOGIC;
			D7 : out  STD_LOGIC
		);
END COMPONENT;

COMPONENT mux8_16bit
PORT(		  
			in0 : in  STD_LOGIC_VECTOR (15 downto 0);
         in1 : in  STD_LOGIC_VECTOR (15 downto 0);
         in2 : in  STD_LOGIC_VECTOR (15 downto 0);
         in3 : in  STD_LOGIC_VECTOR (15 downto 0);
			in4 : in  STD_LOGIC_VECTOR (15 downto 0);
			in5 : in  STD_LOGIC_VECTOR (15 downto 0);
			in6 : in  STD_LOGIC_VECTOR (15 downto 0);
			in7 : in  STD_LOGIC_VECTOR (15 downto 0);
         s0 : in  STD_LOGIC;
         s1 : in  STD_LOGIC;
			s2 : in STD_LOGIC;
         z : out  STD_LOGIC_VECTOR (15 downto 0)
	);
END COMPONENT;

signal load_reg0,load_reg1,load_reg2,load_reg3,load_reg4,load_reg5,load_reg6,load_reg7: std_logic;
signal reg0_q,reg1_q,reg2_q,reg3_q,reg4_q,reg5_q,reg6_q,reg7_q,intermediate_A_data,
intermediate_B_data :std_logic_vector(15 downto 0);


begin

reg00: reg16 PORT MAP(
			D => d_data,
			load => (load_reg0 and load_write),
			Clk => Clk,
			Q => reg0_q
);			

reg01: reg16 PORT MAP(
			D => d_data,
			load => (load_reg1 and load_write),
			Clk => Clk,
			Q => reg1_q
);		

reg02: reg16 PORT MAP(
			D => d_data,
			load => (load_reg2 and load_write),
			Clk => Clk,
			Q => reg2_q
);		

reg03: reg16 PORT MAP(
			D => d_data,
			load => (load_reg3 and load_write),
			Clk => Clk,
			Q => reg3_q
);		

reg04: reg16 PORT MAP(
			D => d_data,
			load => (load_reg4 and load_write),
			Clk => Clk,
			Q => reg4_q
);	
	
reg05: reg16 PORT MAP(
			D => d_data,
			load => (load_reg5 and load_write),
			Clk => Clk,
			Q => reg5_q
);

reg06: reg16 PORT MAP(
			D => d_data,
			load => (load_reg6 and load_write),
			Clk => Clk,
			Q => reg6_q
);		

reg07: reg16 PORT MAP(
			D => d_data,
			load => (load_reg7 and load_write),
			Clk => Clk,
			Q => reg7_q
);		

des_decoder_3_to_8: decoder_3_to_8 PORT MAP(
		A0 => des_A0,
		A1 => des_A1,
		A2 => des_A2,
		D0 => load_reg0,
		D1 => load_reg1,
		D2 => load_reg2,
		D3 => load_reg3,		D4 => load_reg4,
		D5 => load_reg5,
		D6 => load_reg6,
		D7 => load_reg7
);

Inst_mux8_16bit_A: mux8_16bit PORT MAP(
			in0 => reg0_q,
			in1 => reg1_q,
			in2 => reg2_q,
			in3 => reg3_q,
			in4 => reg4_q,
			in5 => reg5_q,
			in6 => reg6_q,
			in7 => reg7_q,
			s0 => src_s0_A,
			s1 => src_s1_A,
			s2 => src_s2_A,
			z => intermediate_A_data
);

Inst_mux8_16bit_B: mux8_16bit PORT MAP(
			in0 => reg0_q,
			in1 => reg1_q,
			in2 => reg2_q,
			in3 => reg3_q,
			in4 => reg4_q,
			in5 => reg5_q,
			in6 => reg6_q,
			in7 => reg7_q,
			s0 => src_s0_B,
			s1 => src_s1_B,
			s2 => src_s2_B,
			z => intermediate_B_data
);

--reg0 <= reg0_q;
--reg1 <= reg1_q;
--reg2 <= reg2_q;
--reg3 <= reg3_q;
--reg4 <= reg4_q;
--reg5 <= reg5_q;
--reg6 <= reg6_q;
--reg7 <= reg7_q;
a_data <= intermediate_A_data;
b_data <= intermediate_B_data;

end Behavioral;

