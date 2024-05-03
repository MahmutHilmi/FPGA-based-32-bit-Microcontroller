

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity registerfile_tb is
--  Port ( );
end registerfile_tb;

architecture Behavioral of registerfile_tb is
component registerfile is 
port(CLK : in std_logic;
ReadRegister1 : in std_logic_vector (4 downto 0);
ReadRegister2 : in std_logic_vector (4 downto 0);
WriteRegister : in std_logic_vector (4 downto 0);
WriteData : in std_logic_vector (31 downto 0);
RegWrite : in std_logic;
RegWrite2 : in std_logic;
ReadData1 : out std_logic_vector (31 downto 0);
ReadData2 : out std_logic_vector (31 downto 0)
);
end component;
signal CLK : std_logic := '0';
signal ReadRegister1 : std_logic_vector (4 downto 0) := (others => '0');
signal ReadRegister2 : std_logic_vector (4 downto 0) := (others => '0');
signal WriteRegister : std_logic_vector (4 downto 0) := (others => '0');
signal WriteData : std_logic_vector (31 downto 0) := (others => '0');
signal RegWrite : std_logic := '0';
signal RegWrite2 : std_logic := '0';
signal ReadData1 : std_logic_vector (31 downto 0);
signal ReadData2 : std_logic_vector (31 downto 0);
constant clock_period : time := 10 ns ;
begin
uut : registerfile port map (
ReadRegister1 => ReadRegister1,
ReadRegister2 => ReadRegister2,
WriteRegister => WriteRegister,
WriteData => WriteData,
RegWrite => RegWrite,
RegWrite2 => RegWrite2,
ReadData1 => ReadData1,
ReadData2 => ReadData2,
CLK => CLK
);
clock_process :process
   begin
  CLK <= '0';
  wait for clock_period;
  CLK <= '1';
  wait for clock_period;
   end process;
process begin
ReadRegister1 <= "00001"; ReadRegister2 <= "00011"; RegWrite <= '1'; RegWrite2 <= '0'; WriteRegister <= "00001"; WriteData <= x"1012011d"; wait for clock_period*2.5; 
ReadRegister1 <= "00100"; ReadRegister2 <= "00011"; RegWrite <= '1'; RegWrite2 <= '0'; WriteRegister <= "00010"; WriteData <= x"2012001d"; wait for clock_period*2.5; 
ReadRegister1 <= "00111"; ReadRegister2 <= "00011"; RegWrite <= '1'; RegWrite2 <= '0'; WriteRegister <= "00011"; WriteData <= x"2012111d"; wait for clock_period*2.5; 
ReadRegister1 <= "00010"; ReadRegister2 <= "00001"; RegWrite <= '0'; RegWrite2 <= '1'; WriteRegister <= "00100"; WriteData <= x"2212111d"; wait for clock_period*2.5;
ReadRegister1 <= "01110"; ReadRegister2 <= "00011"; RegWrite <= '0'; RegWrite2 <= '1'; WriteRegister <= "00101"; WriteData <= x"2012111d"; wait for clock_period*2.5; 
--ReadRegister1 <= "01111"; ReadRegister2 <= "00110"; RegWrite <= "10"; WriteRegister <= "01111"; WriteData <= x"2011111d"; wait for clock_period*2.5; 
wait;
end process;
end Behavioral;
