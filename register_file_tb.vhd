LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         src_s0_A : IN  std_logic;
         src_s1_A : IN  std_logic;
         src_s2_A : IN  std_logic;
         src_s0_B : IN  std_logic;
         src_s1_B : IN  std_logic;
         src_s2_B : IN  std_logic;
         des_A0 : IN  std_logic;
         des_A1 : IN  std_logic;
         des_A2 : IN  std_logic;
         Clk : IN  std_logic;
         load_write : IN  std_logic;
         d_data : IN  std_logic_vector(15 downto 0);
         a_data : OUT  std_logic_vector(15 downto 0);
         b_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;  

   --Inputs
   signal src_s0_A : std_logic := '0';
   signal src_s1_A : std_logic := '0';
   signal src_s2_A : std_logic := '0';
   signal src_s0_B : std_logic := '0';
   signal src_s1_B : std_logic := '0';
   signal src_s2_B : std_logic := '0';
   signal des_A0 : std_logic := '0';
   signal des_A1 : std_logic := '0';
   signal des_A2 : std_logic := '0';
   signal Clk : std_logic := '0';
   signal load_write : std_logic := '0';
   signal d_data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal a_data : std_logic_vector(15 downto 0);
   signal b_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          src_s0_A => src_s0_A,
          src_s1_A => src_s1_A,
          src_s2_A => src_s2_A,
          src_s0_B => src_s0_B,
          src_s1_B => src_s1_B,
          src_s2_B => src_s2_B,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          Clk => Clk,
          load_write => load_write,
          d_data => d_data,
          a_data => a_data,
          b_data => b_data
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
		src_s0_A <= '0';
      src_s1_A <= '0';
      src_s2_A <= '0';
      src_s0_B <= '0'; 
      src_s1_B <= '0';
      src_s2_B <= '0'; 
      des_A0 <= '0';
      des_A1 <= '0';
      des_A2 <= '0';
      load_write <= '0';
      d_data <= X"21A3";
      
      wait for 100 ns;	
		
		src_s0_A <= '1';
      src_s1_A <= '0';
      src_s2_A <= '0';
      src_s0_B <= '1'; 
      src_s1_B <= '0';
      src_s2_B <= '1'; 
      des_A0 <= '1';
      des_A1 <= '1';
      des_A2 <= '0';
      load_write <= '1';    
      d_data <= X"8EB0";
      
		wait for 100 ns;
		
		src_s0_A <= '0';
      src_s1_A <= '1';
      src_s2_A <= '1';
      src_s0_B <= '0'; 
      src_s1_B <= '1';
      src_s2_B <= '1'; 
      des_A0 <= '0';
      des_A1 <= '1';
      des_A2 <= '1';
      load_write <= '1';
      d_data <= X"A07F";
     
      wait for 100 ns;	
				
      wait for Clk_period*10;

      wait;
   end process;

END;
