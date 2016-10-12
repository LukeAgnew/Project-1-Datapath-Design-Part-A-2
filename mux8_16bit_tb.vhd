LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux8_16bit_tb IS
END mux8_16bit_tb;
 
ARCHITECTURE behavior OF mux8_16bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16bit
    PORT(
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
         in7 : IN  std_logic_vector(15 downto 0);
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         s2 : IN  std_logic;
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal in3 : std_logic_vector(15 downto 0) := (others => '0');
   signal in4 : std_logic_vector(15 downto 0) := (others => '0');
   signal in5 : std_logic_vector(15 downto 0) := (others => '0');
   signal in6 : std_logic_vector(15 downto 0) := (others => '0');
   signal in7 : std_logic_vector(15 downto 0) := (others => '0');
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal s2 : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(15 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16bit PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          s0 => s0,
          s1 => s1,
          s2 => s2,
          z => z
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		in0 <=	X"df23";
		in1 <=	X"f87d";
		in2 <=	X"ffff";
		in3 <=	X"90ac";
		in4 <=	X"7ef6";
		in5 <=	X"f91a";
		in6 <=	X"3cd4";
		in7 <=	X"b4a2";
		
		s0 <= '0';
		s1 <= '0';
		s2 <= '0';
	
      wait for 100 ns;	

      s0 <= '0';
		s1 <= '0';
		s2 <= '1';
		
		wait for 100 ns;
		
		s0 <= '0';
		s1 <= '1';
		s2 <= '0';
		
		wait for 100 ns;
		
		s0 <= '0';
		s1 <= '1';
		s2 <= '1';
		
		wait for 100 ns;
		
		s0 <= '1';
		s1 <= '0';
		s2 <= '0';
		
		wait for 100 ns;
		
		s0 <= '1';
		s1 <= '0';
		s2 <= '1';
		
		wait for 100 ns;
		
		s0 <= '1';
		s1 <= '1';
		s2 <= '0';
		
		wait for 100 ns;
		
		s0 <= '1';
		s1 <= '1';
		s2 <= '1';

      wait;
   end process;

END;
