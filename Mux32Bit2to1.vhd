library ieee;
use ieee.std_logic_1164.all; 

entity Mux32Bit2to1 is
  port (I0, I1 : in std_logic_vector (31 downto 0);
  s : in std_logic;
   f : out std_logic_vector (31 downto 0)); 
end Mux32Bit2to1;

architecture behaviour of Mux32Bit2to1 is 
begin
  process (I0, I1, s)
  begin
    if s = '0' then
      f <= I0;
    else
      f <= I1;
    end if;
  end process;
end behaviour;