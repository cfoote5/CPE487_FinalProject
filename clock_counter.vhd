library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity clock_counter is
  Port (clk1: in std_logic;
  clk2: in std_logic;
  reset: in std_logic;
  houradder: in std_logic_vector (1 downto 0);
  minuteadder: in std_logic_vector (1 downto 0);
  digit1,digit2,digit3,digit4,digit5,digit6,digit7,digit8: out std_logic_vector   (3 downto 0);
  LED: OUT std_logic_vector (15 downto 0);
  alarm: IN std_logic
  );
end clock_counter;

architecture Behavioral of clock_counter is

signal seconds: INTEGER:=0;
signal milliseconds: INTEGER:=0;
signal next_seconds: INTEGER:=0;
signal reset_secs: INTEGER:=0;
signal alarm_secs: INTEGER:=0;
signal temp_reset: INTEGER:=0;
signal delay10: Integer:=10;
signal cnt: integer:=0;

type int_to_bin is array (0 to 9) of std_logic_vector   (3 downto 0);
constant int_bin : int_to_bin :=
("0000","0001","0010","0011","0100","0101","0110","0111","1000","1001");

begin

process(clk2, reset)
begin
    if reset = '1' then
        milliseconds <= 0;
    elsif rising_edge(clk2) then
        
        if milliseconds = 999 then
            milliseconds <= 0;
            next_seconds <= next_seconds + 1;
        else
            if(alarm='0') then
            milliseconds <= milliseconds + 1;
            else
            milliseconds <= milliseconds;
            end if;
        end if;
    end if;
end process;

process (clk1, reset, minuteadder, houradder, seconds)
begin
if (reset='1' or seconds >= 86400) then
    seconds<=0;
--elsif(seconds > 86400) then
--seconds<= seconds - 86400;

elsif rising_edge(clk1) then 
  
    if (alarm = '0' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='0') then
    seconds<=seconds+1;
    next_seconds <= next_seconds+1;
      if temp_reset = 1 then
    seconds <= reset_secs;
    temp_reset <= 0;
    alarm_secs <= seconds;
      end if;  
    elsif (alarm = '1' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='0') then
    seconds <= seconds;
        if temp_reset = 0 then
            reset_secs <= seconds;
            temp_reset <= 1;
        end if;
    elsif (alarm = '1' AND minuteadder(0)='1' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='0') then
        seconds<=seconds+60;
        alarm_secs <= alarm_secs+60;
    elsif (alarm = '1' AND minuteadder(0)='0' AND minuteadder(1)='1' AND houradder(0)='0' AND houradder(1)='0') then
        seconds<=seconds+600;
        alarm_secs <= alarm_secs+600;
    elsif (alarm = '1' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='1' AND houradder(1)='0') THEN
        seconds<=seconds+3600;
        alarm_secs <= alarm_secs+3600;
    elsif (alarm = '1' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='1') then
        seconds<=seconds+36000;
        alarm_secs <= alarm_secs+36000;
    elsif (alarm = '0' AND minuteadder(0)='1' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='0') then
        seconds<=seconds+60;
    elsif (alarm = '0' AND minuteadder(0)='0' AND minuteadder(1)='1' AND houradder(0)='0' AND houradder(1)='0') then
        seconds<=seconds+600;    
    elsif (alarm = '0' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='1' AND houradder(1)='0') THEN
        seconds<=seconds+3600;
    elsif (alarm = '0' AND minuteadder(0)='0' AND minuteadder(1)='0' AND houradder(0)='0' AND houradder(1)='1') then
        seconds<=seconds+36000;
    end if;
 end if;
end process;

process(clk1,alarm_secs, alarm, seconds)
begin
if rising_edge(clk1) then   
    if(alarm_secs = seconds AND alarm = '0')then
    LED <= x"FFFF";
    elsif (alarm_secs + 1 =seconds AND alarm = '0') then
    LED <= x"0000";
    elsif (alarm_secs + 2 =seconds AND alarm = '0') then
    LED <= x"FFFF";
    elsif (alarm_secs + 3 =seconds AND alarm = '0') then
    LED <= x"0000";
    elsif (alarm_secs + 4 =seconds AND alarm = '0') then
    LED <= x"FFFF";
    elsif (alarm_secs + 5 =seconds AND alarm = '0') then
    LED <= x"0000";
    elsif (alarm_secs + 6 =seconds AND alarm = '0') then
    LED <= x"FFFF";
    else
    LED <= x"0000";
    end if;
end if;
end process;

 digit1<=int_bin ((milliseconds mod 10));
 digit2<=int_bin ((milliseconds/10) mod 10); 
 digit3<=int_bin (((seconds mod 3600) mod 60) mod 10);
 digit4<=int_bin (((seconds mod 3600) mod 60 ) /10);
 digit5<=int_bin (((seconds mod 3600) /60) mod 10);
 digit6<=int_bin (((seconds mod 3600) /60) /10);
 digit7<=int_bin ((seconds /3600) mod 10);
 digit8<=int_bin ((seconds /3600) /10); 
 
end Behavioral;