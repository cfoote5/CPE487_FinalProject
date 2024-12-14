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
         when "000" => 
        temp <= '1'&converter(to_integer(unsigned(digit1))); 
      when "001" =>
        temp <= '1'&converter(to_integer(unsigned(digit2))); 
      when "010" =>
        temp <= '0'&converter(to_integer(unsigned(digit3))); 
      when "011" => 
        temp <= '1'&converter(to_integer(unsigned(digit4))); 
      when "100" => 
        temp <= '0'&converter(to_integer(unsigned(digit5))); 
      when "101" => 
        temp <= '1'&converter(to_integer(unsigned(digit6))); 
      when "110" => 
        temp <= '0'&converter(to_integer(unsigned(digit7))); 
      when "111" => 
        temp <= '1'&converter(to_integer(unsigned(digit8))); 
      when others =>
        temp <= "11111111"; 
    end case;

end process;

segments<=temp;

end Behavioral;