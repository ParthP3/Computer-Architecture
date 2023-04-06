library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench2 is
end entity;

architecture tb of Testbench2 is

    signal x: std_logic_vector (3 downto 0);
    signal y: std_logic_vector (1 downto 0);
    signal g : std_logic;

    component mux4x2 is
        port(D: in std_logic_vector (3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component;

begin
    dut_instancea: mux4x2 
    port map(D => x,  S => y, Y => g);
    
    process
    begin

        loop1: for k in 0 to 15 loop
            x <= std_logic_vector(to_unsigned(k, 4));
            loop2: for j in 0 to 3 loop
                y <= std_logic_vector(to_unsigned(j, 2));
                wait for 1 ns;
            end loop loop2;
        end loop loop1;
        wait;          
    end process;
end architecture ; -- arch
