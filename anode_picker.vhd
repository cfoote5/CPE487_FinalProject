library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity anode_picker is
  Port (WhichDisplay: in std_logic_vector (2 downto 0);
  anode: out std_logic_vector (7 downto 0) );
end anode_picker;

architecture Behavioral of anode_picker is
		 
signal temp : std_logic_vector (7 downto 0);		 
		 
begin
process(WhichDisplay , temp)
begin
    case WhichDisplay is
        when "000" =>
            temp <= "01111111"; -- Enable first segment (active low)
        when "001" =>
            temp <= "10111111"; -- Enable second segment (active low)
        when "010" =>
            temp <= "11011111"; -- Enable third segment (active low)
        when "011" =>
            temp <= "11101111"; -- Enable fourth segment (active low)
        when "100" =>
            temp <= "11110111"; -- Enable fifth segment (active low)
        when "101" =>
            temp <= "11111011"; -- Enable sixth segment (active low)
        when "110" =>
            temp <= "11111101"; -- Enable seventh segment (active low)
        when "111" =>
            temp <= "11111110"; -- Enable eighth segment (active low)
        when others =>
            temp <= "11111111"; -- Default state (all off)
    end case;
end process;


anode<=temp;

end Behavioral;