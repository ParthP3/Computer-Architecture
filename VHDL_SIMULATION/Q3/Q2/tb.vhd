library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench7 is
end entity;

architecture tb of Testbench7 is

    signal x: std_logic_vector (7 downto 0);
    signal y: std_logic_vector (7 downto 0);
    signal z: std_logic_vector (7 downto 0);
    signal g : std_logic;

    component RCA8 is
        port(a, b: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(7 downto 0);
        cout: out std_logic);
    end component;

begin
    dut_instancea: RCA8 
    port map(a => x,  b => y,  sum => z, cout => g);
    
    process
    begin

        x <= "01010011";
        y <= "00100100";
        wait for 1 ns;

        x <= "00010101";
        y <= "10110100";
        wait for 1 ns;
        wait;
    end process;
end architecture ; -- arch
