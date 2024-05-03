

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignExtension_tb is
end SignExtension_tb;

architecture Behavioral of SignExtension_tb is
component SignExtension is port(
input : in std_logic_vector(15 downto 0);
output : out std_logic_vector(31 downto 0);
RegWrite2 : in std_logic );
end component;
signal input : std_logic_vector(15 downto 0);
signal output : std_logic_vector(31 downto 0);
signal RegWrite2 : std_logic;
begin
UUT : SignExtension port map (
input => input,
output => output,
Regwrite2 => RegWrite2);
process begin
 input <= "0101010101010101";
 Regwrite2 <= '0';
wait for 100 ns ;
 input <= "1101111111010101";
 Regwrite2 <= '1';
wait;
end process;
end Behavioral;
