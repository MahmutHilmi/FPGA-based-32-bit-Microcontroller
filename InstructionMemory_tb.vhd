
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory_tb is
end InstructionMemory_tb;

architecture Behavioral of InstructionMemory_tb is

component InstructionMemory is port(
Address: in std_logic_vector(31 downto 0) := (others => '0'); --input
Instruction: out std_logic_vector(31 downto 0)
); --output
end component;


signal Address: std_logic_vector(31 downto 0) := (others => '0');
signal Instruction_t: std_logic_vector(31 downto 0);


constant clock_period : time := 10 ns ;
begin

UUT: InstructionMemory port map (
  Address=> Address,
  Instruction=> Instruction_t
  
);

stim_proc : process
begin

for I in 0 to 15 loop
Address <= std_logic_vector(to_unsigned(I*4,32));
wait for 2*clock_period;
end loop;
end process;

end Behavioral;