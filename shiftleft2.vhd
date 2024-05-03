
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shiftleft2 is
Port ( input : in std_logic_vector(31 downto 0);
output : out std_logic_vector(31 downto 0));
end shiftleft2;

architecture Behavioral of shiftleft2 is
constant n : natural := 2;
begin
output <= std_logic_vector(unsigned(input) sll n) ;
end Behavioral;
