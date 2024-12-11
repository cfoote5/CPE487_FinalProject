library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity decoder is
  Port (  digit1,digit2,digit3,digit4,digit5,digit6,digit7,digit8: in std_logic_vector   (3 downto 0);
  WhichDisplay : in std_logic_vector (2 downto 0);
  segments: out std_logic_vector (7 downto 0)
 );
end decoder;

architecture Behavioral of decoder is

type display is array (0 to 9) of std_logic_vector (6 downto 0);
constant converter : display :=
		("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000",
		 "0000000","0010000");
		 
signal temp : std_logic_vector (7 downto 0);
begin
process(WhichDisplay ,temp)
begin
    case WhichDisplay is
         when "000" => -- Digit 1 (Millisecond Units, DP OFF)
        temp <= '1'&converter(to_integer(unsigned(digit1))); -- DP OFF
      when "001" => -- Digit 2 (Millisecond Tens, DP OFF)
        temp <= '1'&converter(to_integer(unsigned(digit2))); -- DP OFF
      when "010" => -- Digit 3 (Second Units, DP ON)
        temp <= '0'&converter(to_integer(unsigned(digit3))); -- DP ON
      when "011" => -- Digit 4 (Second Tens, DP OFF)
        temp <= '1'&converter(to_integer(unsigned(digit4))); -- DP OFF
      when "100" => -- Digit 5 (Minute Units, DP ON)
        temp <= '0'&converter(to_integer(unsigned(digit5))); -- DP ON
      when "101" => -- Digit 6 (Minute Tens, DP OFF)
        temp <= '1'&converter(to_integer(unsigned(digit6))); -- DP OFF
      when "110" => -- Digit 7 (Hour Units, DP ON)
        temp <= '0'&converter(to_integer(unsigned(digit7))); -- DP ON
      when "111" => -- Digit 8 (Hour Tens, DP OFF)
        temp <= '1'&converter(to_integer(unsigned(digit8))); -- DP OFF
      when others =>
        temp <= "11111111"; -- Default: All segments off
    end case;

end process;

segments<=temp;

end Behavioral;