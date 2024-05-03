library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_memory_tb is
end data_memory_tb;

architecture Behavioral of data_memory_tb is

component data_memory is
Port (
Address, WriteData : in std_logic_vector (31 downto 0);
MemWrite: in std_logic;
MemRead: in std_logic;
clk : in std_logic;
ReadData: out std_logic_vector (31 downto 0)
);
end component;

signal MemWrite, MemRead : std_logic;
signal Address, WriteData, ReadData : std_logic_vector (31 downto 0);
signal clk : std_logic := '0';

constant clock_period : time := 10 ns ;

begin

UUT: data_memory port map(
Address => Address,
WriteData => WriteData,
clk => clk,
ReadData => ReadData,
MemWrite => MemWrite,
MemRead => MemRead
);

clock_process :process
   begin
  clk <= '0';
  wait for clock_period;
  clk <= '1';
  wait for clock_period;
   end process;
   
   stim_proc: process
 begin
 
--ReadRegister1 <= "00010"; ReadRegister2 <= "00100"; RegWrite <= '1';  wait for clock_period*2;
Address <= "01010000010100000101000001010000";  MemWrite <= '0'; MemRead <= '0'; WriteData <= "01010000111111110000101001010000"; wait for clock_period*2;
Address <= "01010000010100000101000001010000";  MemWrite <= '1'; MemRead <= '0'; WriteData <= "01010000111111110000101001010000"; wait for clock_period*2;  
Address <= "01010000010100000101000001010000";  MemWrite <= '0'; MemRead <= '1'; WriteData <= "01010000111111110000101001010000"; wait for clock_period*2;
Address <= "01010000010100000101000001010000";  MemWrite <= '1'; MemRead <= '0'; WriteData <= "01010000111111110000101001010000"; wait for clock_period*2;
Address <= "01010000010100000101000001010000";  MemWrite <= '0'; MemRead <= '1'; WriteData <= "01010000111111111111101001010000"; wait for clock_period*2;

 wait;
 end process;

end Behavioral;