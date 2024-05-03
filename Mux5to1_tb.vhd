library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux5to1_tb is
end Mux5to1_tb;

architecture Behavioral of Mux5to1_tb is
Component Mux5to1 is port(
I0, I1 : in std_logic_vector (4 downto 0);
  s : in std_logic;
   f : out std_logic_vector (4 downto 0));
end component;
signal I0_t : std_logic_vector(4 downto 0);
signal I1_t : std_logic_vector(4 downto 0);
signal s_t : std_logic := '0';
signal f_t : std_logic_vector(4 downto 0);
begin
UUT : Mux5to1 port map(
I0 => I0_t,
I1 => I1_t,
s => s_t,
f => f_t);
process begin 
I0_t <= "11111";
I1_t <= "00000";
s_t <= '0';
wait for 100 ns;
I0_t <= "11111";
I1_t <= "00000";
s_t <= '1';
wait;
end process;
end Behavioral;