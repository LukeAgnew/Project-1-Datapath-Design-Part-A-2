library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_3_to_8 is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           D0 : out  STD_LOGIC;
           D1 : out  STD_LOGIC;
           D2 : out  STD_LOGIC;
           D3 : out  STD_LOGIC;
           D4 : out  STD_LOGIC;
           D5 : out  STD_LOGIC;
           D6 : out  STD_LOGIC;
           D7 : out  STD_LOGIC);
end decoder_3_to_8;

architecture dataflow_1 of decoder_3_to_8 is

signal not_A0, not_A1, not_A2:std_logic;
begin
	not_A0 <= not A0;
	not_A1 <= not A1;
	not_A2 <= not A2;
	
	D0 <=  (not_A0 and not_A1 and not_A2) after 5ns;
	D1 <=  (A0 and not_A1 and not_A2) after 5ns;
	D2 <=  (not_A0 and A1 and not_A2) after 5ns;
	D3 <=  (A0 and A1 and not_A2) after 5ns;
	D4 <=  (not_A0 and not_A1 and A2) after 5ns;
	D5 <=  (A0 and not_A1 and A2) after 5ns;
	D6 <=  (not_A0 and A1 and A2) after 5ns;
	D7 <=  (A0 and A1 and A2) after 5ns;

end dataflow_1;

