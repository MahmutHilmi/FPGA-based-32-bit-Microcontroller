library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture Behavioral of ProgramCounter_tb is

Component ProgramCounter is port(
address: in std_logic_vector(31 downto 0);
Reset, Clk: in std_logic;
PCResult: out std_logic_vector(31 downto 0));
end component;

signal Clk : std_logic := '0';
signal Reset : std_logic := '0';
signal address : std_logic_vector (31 downto 0);
signal PCResult : std_logic_vector (31 downto 0);

constant clock_period : time := 10 ns ;

begin

UUT: ProgramCounter port map(
address => address,
Reset => Reset, 
Clk => Clk,
PCResult => PCResult);


clock_process :process
   begin
  Clk <= '0';
  wait for clock_period;
  Clk <= '1';
  wait for clock_period;
   end process;

stim_proc: process
 begin
 
 address <= "10101010101010001010101010101000"; Reset <= '1'; wait for clock_period*2;
 address <= "10101010101010011111101010101000"; Reset <= '0'; wait for clock_period*2;
 address <= "10101010101010110010001010101000"; wait for clock_period*2;
 wait;
 end process;
end Behavioral;