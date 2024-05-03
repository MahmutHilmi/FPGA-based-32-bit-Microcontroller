
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_tb is
--  Port ( );
end adder_tb;

architecture Behavioral of adder_tb is
component adder is 
port( A,B : in std_logic_vector(31 downto 0);
 addresult : out std_logic_vector(31 downto 0));
 end component;
 signal A,B : std_logic_vector (31 downto 0);
 signal addresult : std_logic_vector(31 downto 0);
begin

uut : adder port map (
A => A,
B => B,
addresult => addresult);
process 
begin 
A <= "01000000000000000101000001011010"; 
B<= "01110000010100000101000001011100"; wait for 20 ns;
A <= "00000000000000000000000000001011"; 
B <= "00000000000000000000000000001111"; wait for 20 ns;
A <= "00000000010101100101000001011100"; 
B <= "00000000010101000101000001010011"; wait;
end process;

end Behavioral;
