library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PCAdder_tb is
end PCAdder_tb;

architecture Behavioral of PCAdder_tb is

component PCAdder is
Port ( 
PCResult: in std_logic_vector (31 downto 0);
PCAddResult: out std_logic_vector (31 downto 0)
);
end component;

signal PCResult: std_logic_vector (31 downto 0);
signal PCAddResult : std_logic_vector (31 downto 0);

begin

UUT: PCAdder port map(
PCResult => PCResult,
PCAddResult => PCAddResult
);

stim_proc: process
begin

PCResult <= "01010000010100000101000001011010"; wait for 20 ns;
PCResult <= "01110000010100000101000001011100"; wait for 20 ns;
PCResult <= "10110000010100000101000001010011"; wait for 20 ns;

wait;
end process;

end Behavioral;