LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder_3_to_8_tb IS
END decoder_3_to_8_tb;
 
ARCHITECTURE behavior OF decoder_3_to_8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_3_to_8
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         D0 : OUT  std_logic;
         D1 : OUT  std_logic;
         D2 : OUT  std_logic;
         D3 : OUT  std_logic;
         D4 : OUT  std_logic;
         D5 : OUT  std_logic;
         D6 : OUT  std_logic;
         D7 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';

 	--Outputs
   signal D0 : std_logic;
   signal D1 : std_logic;
   signal D2 : std_logic;
   signal D3 : std_logic;
   signal D4 : std_logic;
   signal D5 : std_logic;
   signal D6 : std_logic;
   signal D7 : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_3_to_8 PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          D4 => D4,
          D5 => D5,
          D6 => D6,
          D7 => D7
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		A0 <=	'1';
		A1 <= '0';
		A2 <= '1';

      wait for 100 ns;	
		
		A0 <=	'0';
		A1 <= '1';
		A2 <= '0';
		
		wait for 100 ns;
		
		A0 <=	'1';
		A1 <= '1';
		A2 <= '1';     

		-- insert stimulus here 

      wait;
   end process;

END;
