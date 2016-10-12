LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux2_16bit_tb IS
END mux2_16bit_tb;
 
ARCHITECTURE behavior OF mux2_16bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         s : IN  std_logic;
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_16bit PORT MAP (
          in0 => in0,
          in1 => in1,
          s => s,
          z => z
        );
		  
   -- Stimulus process
   stim_proc: process
   begin

		in0 <= 	X"fe5c";
		in1 <= X"ffff";	
		
		s <= '0';
      wait for 100 ns;	
		
		s <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
