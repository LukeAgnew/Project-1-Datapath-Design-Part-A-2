library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16bit is
    Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux2_16bit;

architecture Behavioral of mux2_16bit is

begin
z <= in0 after 5ns when s = '0' else
	  in1 after 5ns when s = '1' else
	  "0000000000000000" after 1ns;

end Behavioral;

