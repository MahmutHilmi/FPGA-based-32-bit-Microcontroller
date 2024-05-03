library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter is
Port ( 
address: in std_logic_vector(31 downto 0);
Reset, Clk: in std_logic;
PCResult: out std_logic_vector(31 downto 0)
);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

 process(Reset,Clk)
        begin
          if (Reset = '1') then
            PCResult <= (others => '0');
          elsif (Clk'event and Clk = '1') then
            PCResult <= address;
          end if;
         end process;

end Behavioral;