library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity RLE_Encoder is
    port(clk, rst: in std_logic;
    a: in std_logic_vector(7 downto 0);
    data_valid: out std_logic;
    z: out std_logic_vector(7 downto 0));
end entity;


architecture compressor of RLE_Encoder is
    --type arr is array (0 to 100) of std_logic_vector(7 downto 0);
    --signal arr1 : arr;
    --signal arrq : integer := 0;
    signal arr : std_logic_vector(7 downto 0);
    signal arrb : std_logic_vector(7 downto 0);
    signal arrc : std_logic_vector(7 downto 0);
    signal qH : std_logic := '0';
    signal number :  integer := 0;
    signal test : integer := 0;
    signal test1 : integer := 0;

    type bfr is array (0 to 100) of std_logic_vector(7 downto 0);
    signal buff: bfr;
    signal head : integer := 0;
    signal tail : integer := 0;
    signal temp : integer := 0;

    begin
        process(clk)
        begin
            
            if rising_edge(clk) then
                arrb <= arr;
                if rst = '0' or rst = '1' then
                    if temp = 0 or temp = 1 then
                        if qH = '0' then
                            arr <= a;
                            number <= number +1;
                            qH <= '1';
                        elsif arr = a then
                            number <= number + 1;
                            test1 <= test1 + 1;
                            if temp = 1 then
                                number <= number +1;
                                if arr = "00011011" then
                                    buff(tail) <= "00011011";
                                    buff(tail+1) <= std_logic_vector(to_unsigned(number, 8));
                                    buff(tail+2) <= arr;
                                    tail <= tail +3;
                                elsif number > 2 then
                                    buff(tail) <= "00011011";
                                    buff(tail+1) <= std_logic_vector(to_unsigned(number, 8));
                                    buff(tail+2) <= arr;
                                    tail <= tail +3;
                                elsif number = 2 then
                                    buff(tail) <= arr;
                                    buff(tail+1) <= arr;
                                    tail <= tail + 2;
                                elsif number = 1 then
                                    buff(tail) <= arr;
                                    tail <= tail +1;
                                end if;

                            elsif number = 16 then
                                buff(tail) <= "00011011";
                                buff(tail+1) <= std_logic_vector(to_unsigned(number, 8));
                                buff(tail+2) <= arr;
                                tail <= tail +3;
                            end if;
                        elsif arr /= a then
                            if arr = "00011011" then
                                buff(tail) <= "00011011";
                                buff(tail+1) <= std_logic_vector(to_unsigned(number, 8));
                                buff(tail+2) <= arr;
                                tail <= tail +3;
                            elsif number > 2 then
                                buff(tail) <= "00011011";
                                buff(tail+1) <= std_logic_vector(to_unsigned(number, 8));
                                buff(tail+2) <= arr;
                                tail <= tail +3;
                            elsif number = 2 then
                                buff(tail) <= arr;
                                buff(tail+1) <= arr;
                                tail <= tail + 2;
                            elsif number = 1 then
                                buff(tail) <= arr;
                                tail <= tail +1;
                            end if;
                            if temp = 1 then
                                arr <= a;
                                if arr = "00011011" then
                                    buff(tail) <= "00011011";
                                    buff(tail+1) <= std_logic_vector(to_unsigned(1, 8));
                                    buff(tail+2) <= "00011011";
                                    tail <= tail +3;
                                else
                                    buff(tail) <= arr;
                                    tail <= tail +1;
                                end if;
                            end if;
                            test <= number;
                            number <= 1;
                            arr <= a;
                        end if;
                    end if;
                    if rst = '1' then
                        temp <= temp+1;
                    end if;
                end if;
            end if;
            if falling_edge(clk) then
                if head /= tail then
                    data_valid <= '1';
                    z <= buff(head);
                    head <= head +1;
                else
                    data_valid <= '0';
                end if; 
            end if;

        end process;
     
end architecture;