----------------------------------------------------------------------------------
-- Engineer: John Bryan Valle
--  
-- Create Date: 01.01.2021 02:12:37
-- Module Name: blinking_led - Verhalten
-- Description: 
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blinking_led is
    Port ( -- Input clock
           CLK : in STD_LOGIC;
           -- input reset
           reset: in STD_LOGIC;
           -- output leds
           LEDS : out STD_LOGIC_VECTOR(15 downto 0));
           
end blinking_led;

architecture Verhalten of blinking_led is

-- Zählvariable
signal count: STD_LOGIC_VECTOR (24 downto 0);
-- LED Zustand
signal state: STD_LOGIC_VECTOR(15 downto 0);

begin
    process(CLK,reset,state) is 
        begin
            if reset = '0' then
            
                count <= (others => '0');
                state <= (others => '0');
                LEDS  <= (others => '0');
            elsif (rising_edge(CLK)) then
                count <= count + 1;
                
                if(count = 16000000) then 
                    state <= not state;
                    count <= (others => '0');
                end if;
            end if;
            LEDS <= state;
        end process;

end Verhalten;
