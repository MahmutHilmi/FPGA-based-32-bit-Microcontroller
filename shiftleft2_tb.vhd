

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shiftleft2_tb is

end shiftleft2_tb;

architecture Behavioral of shiftleft2_tb is
component shiftleft2 is port(input : in std_logic_vector(31 downto 0);
output : out std_logic_vector(31 downto 0)
);
end component;
 signal input : std_logic_vector(31 downto 0);
 signal output : std_logic_vector(31 downto 0);
 
begin
uut : shiftleft2 port map (
 input => input,
 output => output);
 process
 begin
 input <= "00000000001100000000001100000000";
 wait for 20ns;
 input <= "00110000000000000000000000000011";
 wait;
 end process;

end Behavioral;
