LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg16_tb IS
END reg16_tb;
 
ARCHITECTURE behavior OF reg16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         Clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16 PORT MAP (
          D => D,
          load => load,
          Clk => Clk,
          Q => Q
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		D <= X"ffff";
		load <= '0';
	
      wait for 100 ns;	
		
		load <= '1';
		
		wait for 100 ns;
		
		D <= X"e2f7";
		load <= '1';

      wait for Clk_period*10;

      wait;
   end process;

END;
