library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench4 is
end entity;

architecture tb of Testbench4 is

    signal x1: std_logic;
    signal g : std_logic;

    component NOT_GATE is
        port(x: in std_logic;
        y: out std_logic);
    end component;

begin
    dut_instance: NOT_GATE
    port map(x => x1, y => g);
    
    process
    begin
    x1 <= '0';
    wait for 1 ns;

    x1 <= '1';
    wait for 1 ns;

    wait;
    end process;
end architecture ; -- arch
