
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignExtension is
port(
input : in std_logic_vector(15 downto 0);
output : out std_logic_vector(31 downto 0);
RegWrite2 : in std_logic);
end SignExtension;

architecture Behavioral of SignExtension is
begin
process(input) begin 
if Regwrite2 = '0' then 
  if input(15) = '1' then 
      output(31 downto 16) <= (others => '1');
      output(15 downto 0) <= input;
      else 
      output(31 downto 16) <= (others => '0');
      output(15 downto 0) <= input;
  end if;
  else 
  output(4 downto 0) <= input(10 downto 6); -- zero extension
  output(31 downto 5) <= (others => '0');
  end if;
end process;
end Behavioral;
