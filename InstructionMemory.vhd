library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the Instruction Memory of the MIPS Processor
entity InstructionMemory is
port ( 
  Address: in std_logic_vector(31 downto 0);
  Instruction: out  std_logic_vector(31 downto 0)
);
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type RAM is array (0 to 127 ) of std_logic_vector(31 downto 0);

signal memory : RAM := ( 
                         x"2010000e",	
                         x"2011000f",	
                         x"2012001d",	
                         x"2013fff1",	
                         x"02324020",	
                         x"02504024",	
                         x"72114002",	
                         x"02504025",	
                         x"36080010",	
                         x"02124022",
                         x"72604021",	
                         x"72404020",	
                         x"0211402a",	
                         x"0230402a",	
                         x"00114080",	 
                         x"001240c2",
                         others => x"00000000"
                         );	
begin 

    Instruction <= memory(to_integer(unsigned(Address(8 downto 2))));


end Behavioral;