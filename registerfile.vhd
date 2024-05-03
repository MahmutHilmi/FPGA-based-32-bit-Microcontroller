library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RegisterFile is
Port ( 
ReadRegister1 : in std_logic_vector (4 downto 0);
ReadRegister2 : in std_logic_vector (4 downto 0);
WriteRegister : in std_logic_vector (4 downto 0);
WriteData : in std_logic_vector (31 downto 0);
RegWrite : in std_logic;
RegWrite2 : in std_logic;
CLK : in std_logic;
ReadData1 : out std_logic_vector (31 downto 0);
ReadData2 : out std_logic_vector (31 downto 0)
);
end RegisterFile;

architecture behavioral of RegisterFile is
  type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
  signal registers : registerFile:= (others => (others => '0'));
  
begin
  regFile : process (CLK) is
  begin
    if (CLK'event and CLK = '1') then
      if RegWrite = '1' then
         registers(to_integer(unsigned(WriteRegister))) <= WriteData;  
      end if;
    end if;
    if (CLK'event and CLK = '0') then
      if RegWrite2 = '0' then
         ReadData1 <= registers(to_integer(unsigned(ReadRegister1)));
         ReadData2 <= registers(to_integer(unsigned(ReadRegister2))); 
      else
         ReadData1 <= registers(to_integer(unsigned(ReadRegister2)));
         ReadData2 <= registers(to_integer(unsigned(ReadRegister1)));
      end if; 
    end if;
  end process;
end behavioral;