library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU32Bit1_tb IS
END ALU32Bit1_tb;

ARCHITECTURE ALU32Bit1 OF ALU32Bit1_tb IS 


    COMPONENT ALU32Bit1
    PORT(
          A,B : in std_logic_vector(31 downto 0); --input operands
        ALUControl : in std_logic_vector(3 downto 0); --Operation to be performed
        ALUResult : out std_logic_vector(31 downto 0);  --output of ALU
          ZERO : out std_logic
        );
    END COMPONENT;


   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUControl : std_logic_vector(3 downto 0) := (others => '0');

    --Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   signal ZERO : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

   --constant <InOp>_period : time := 10 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut: ALU32Bit1 PORT MAP (
          A => A,
          B => B,
          ALUControl => ALUControl,
          ALUResult => ALUResult,
          ZERO => ZERO
        );

   -- Stimulus process
   stim_proc: process
   begin        
      -- hold reset state for 100 ns. 

      -- insert stimulus here 
        --test normal operations
        A  <= "00000000000000000000000001011001"; --9 in decimal
        B  <= "00000000000000000000000100100010"; --2 in decimal
        ALUControl <= "0000";  wait for 100  ns;    --Addition
        ALUControl <= "0001";  wait for 100  ns;    --subtraction
        ALUControl <= "0010";  wait for 100  ns;    --Multiplication
        ALUControl <= "0011";  wait for 100  ns;    --and
        ALUControl <= "0100";  wait for 100  ns;    --or
        ALUControl <= "0101";  wait for 100  ns;    --set less than
        ALUControl <= "0110";  wait for 100  ns;    --set equal
        ALUControl <= "0111";  wait for 100  ns;    --set not equal
        ALUControl <= "1000";  wait for 100  ns;    --left shift
        ALUControl <= "1001";  wait for 100  ns;    --right shift
        ALUControl <= "1010";  wait for 100  ns;    --rotate right
        -- test SLT the other way around
        --InRegB  <= "00000000000000000000000000010011"; --19 in decimal
        -- InRegA  <= "00000000000000000000000000001100"; --12 in decimal
        -- InOp <= "111";  wait for 100  ns;    --Bitwise SLT of A and B
        -- test Branch equal  that substraction is 0 and zero is 1
        -- InRegA  <= "00000000000000000000000000001011"; --11 in decimal
        -- InRegB  <= "00000000000000000000000000001011"; --11 in decimal
        -- InOp <= "110";  wait for 100  ns;    --substract A and B
      wait;
   end process;
END;