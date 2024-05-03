library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Controller_tb is
end Controller_tb;

architecture Behavioral of Controller_tb is

component Controller is 
port(opcode: in std_logic_vector (5 downto 0);
func : in std_logic_vector (5 downto 0);
ALUSrc,RegDst,RegWrite,RegWrite2,MemRead,MemWrite,MemtoReg,PCSrc : out std_logic; 
ALUOp : out std_logic_vector (3 downto 0)
);
end component;

signal opcode : std_logic_vector(5 downto 0):= (others => '0');
signal func : std_logic_vector (5 downto 0) := (others => '0');
signal ALUSrc,RegDst,RegWrite,RegWrite2,MemRead,MemWrite,MemtoReg,PCSrc : std_logic;
signal ALUOp : std_logic_vector (3 downto 0); 

begin
uut : Controller port map (
opcode => opcode,
func => func,
ALUSrc => ALUSrc,
RegDst => RegDst,
RegWrite => RegWrite,
RegWrite2 => RegWrite2,
MemRead => MemRead,
MemWrite => MemWrite,
MemtoReg => MemtoReg,
PCSrc => PCSrc,
AlUOp => ALUOp
);
 process 
 begin
 wait for 10 ns;
 
 opcode <= "000000" ; -- add
  func <= "100000" ;
 wait for 5ns;
 opcode <= "000000" ; -- sub
  func <= "100010" ;
 wait for 5ns;
  opcode <= "011100" ; -- mul
  func <= "000010" ;
 wait for 5ns;
  opcode <= "000000" ; -- and
  func <= "100100" ;
 wait for 5ns;
  opcode <= "000000" ; -- or 
  func <= "100101" ;
 wait for 5ns;
  opcode <= "000000" ; -- slt
  func <= "101010" ;
 wait for 5ns;
  opcode <= "000000" ; -- set equal
  func <= "111001" ;
 wait for 5ns;
  opcode <= "000000" ; -- set not equal
  func <= "111010" ;
 wait for 5ns;
  opcode <= "000000" ; -- sll
  func <= "000000" ;
 wait for 5ns;
  opcode <= "000000" ; -- srl
  func <= "000010" ;
 wait for 5ns;
  opcode <= "000000" ; --rotrv
  func <= "000110" ;
 wait for 5ns;
   opcode <= "011100"; -- clo
 func <= "100001";
 wait for 5ns;
   opcode <= "011100" ; -- clz
  func <= "100000" ;
 wait for 5ns;
 opcode <= "001000" ;
 wait for 5ns;
 opcode <= "001101" ;
 wait;
end process;

end Behavioral;