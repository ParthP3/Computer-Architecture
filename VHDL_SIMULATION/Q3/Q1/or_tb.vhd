library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench5 is
end entity;

architecture tb of Testbench5 is

    signal x1, x2 : std_logic;
    signal g : std_logic;

    component OR_GATE is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

begin
    dut_instance: OR_GATE
    port map(x1 => x1, x2 => x2, y => g);
    
    process
    begin
    x1 <= '0';
    x2 <= '0';
    wait for 1 ns;

    x1 <= '0';
    x2 <= '1';
    wait for 1 ns;

    x1 <= '1';
    x2 <= '0';
    wait for 1 ns;

    x1 <= '1';
    x2 <= '1';
    wait for 1 ns;
    wait;
    end process;
end architecture ; -- arch
