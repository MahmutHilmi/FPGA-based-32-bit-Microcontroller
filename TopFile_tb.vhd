library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Topfile_tb is
end Topfile_tb;

architecture Behavioral of Topfile_tb is

component TopFile is
  Port (Anode_Activate1 : out STD_LOGIC_VECTOR (3 downto 0);
LED_out1 : out STD_LOGIC_VECTOR (6 downto 0);
clk,reset : in std_logic;
outdata : out std_logic_vector(15 downto 0); -- used for the post synthesis sim
ALUOut : out std_logic_vector(15 downto 0)); -- used for the post synthesis sim
end component;

signal clk_t : std_logic := '0';
signal reset : std_logic := '0';
signal LED_out1 : std_logic_vector(6 downto 0);
signal Anode_Activate1 : std_logic_vector(3 downto 0);
signal outdata1 : std_logic_vector(15 downto 0);
signal ALUOut : std_logic_vector(15 downto 0);

begin
main: TopFile 
  Port map (clk => clk_t,
        reset => reset,
       LED_out1 => LED_out1,
       Anode_Activate1 => Anode_Activate1,
       outdata => outdata1,
      ALUOut => ALUOut
         );

stim_clk : process begin
    clk_t <= '0';
    wait for 10ns;
    clk_t <= '1';
    wait for 10ns;
end process;

stim_main : process begin
reset <= '1';
wait for 10ns;
reset <= '0';
wait for 500ns;

end process;
end Behavioral;