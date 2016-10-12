----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:02 02/15/2016 
-- Design Name: 
-- Module Name:    mux8_16bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8_16bit is
    Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           s2 : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is

begin
z <= in0 after 5ns when s0 = '0' and s1 = '0' and s2 = '0' else
	  in1 after 5ns when s0 = '0' and s1 = '0' and s2  = '1' else
	  in2 after 5ns when s0 = '0' and s1 = '1' and s2  = '0' else
	  in3 after 5ns when s0 = '0' and s1 = '1' and s2 = '1' else
	  in4 after 5ns when s0 = '1' and s1 = '0' and s2 = '0' else
	  in5 after 5ns when s0 = '1' and s1 = '0' and s2 = '1' else
	  in6 after 5ns when s0 = '1' and s1 = '1' and s2 = '0' else
	  in7 after 5ns when s0 = '1' and s1 = '1' and s2 = '1' else
	  "0000000000000000" after 5ns;

end Behavioral;

