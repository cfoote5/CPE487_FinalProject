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

type display is array (0 to 9) of std_logic_vector (7 downto 0);
constant converter : display :=
		("11000000","11111001","10100100","10110000","10011001","10010010","10000010","11111000",
		 "10000000","10010000");
		 
signal temp : std_logic_vector (7 downto 0);
begin
process(WhichDisplay ,temp)
begin
    case WhichDisplay is
         when "000" => -- Digit 1 (Hour Tens, DP OFF)
        temp <= converter(to_integer(unsigned(digit1))) OR "10000000"; -- DP OFF
      when "001" => -- Digit 2 (Hour Units, DP ON)
        temp <= converter(to_integer(unsigned(digit2))) AND "01111111"; -- DP ON
      when "010" => -- Digit 3 (Minute Tens, DP OFF)
        temp <= converter(to_integer(unsigned(digit3))) OR "10000000"; -- DP OFF
      when "011" => -- Digit 4 (Minute Units, DP ON)
        temp <= converter(to_integer(unsigned(digit4))) AND "01111111"; -- DP ON
      when "100" => -- Digit 5 (Second Tens, DP OFF)
        temp <= converter(to_integer(unsigned(digit5))) OR "10000000"; -- DP OFF
      when "101" => -- Digit 6 (Second Units, DP ON)
        temp <= converter(to_integer(unsigned(digit6))) AND "01111111"; -- DP ON
      when "110" => -- Digit 7 (Millisecond Tens, DP OFF)
        temp <= converter(to_integer(unsigned(digit7))) OR "10000000"; -- DP OFF
      when "111" => -- Digit 8 (Millisecond Units, DP OFF)
        temp <= converter(to_integer(unsigned(digit8))) OR "10000000"; -- DP OFF
      when others =>
        temp <= "11111111"; -- Default: All segments off
    end case;

end process;

segments<=temp;

end Behavioral;