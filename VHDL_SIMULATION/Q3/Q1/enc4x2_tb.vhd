library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench1 is
end entity;

architecture tb of Testbench1 is

    signal x: std_logic_vector (3 downto 0);
    signal y: std_logic_vector (1 downto 0);

    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0));
    end component;

begin
    dut_instancea: encoder4x2
    port map(I => x,  Y => y);
    
    process
    begin

        x(0) <= '1';
        x(1) <= '0';
        x(2) <= '0';
        x(3) <= '0';
        wait for 1 ns;

        x(0) <= '0';
        x(1) <= '1';
        x(2) <= '0';
        x(3) <= '0';
        wait for 1 ns;

        x(0) <= '0';
        x(1) <= '0';
        x(2) <= '1';
        x(3) <= '0';
        wait for 1 ns;

        x(0) <= '0';
        x(1) <= '0';
        x(2) <= '0';
        x(3) <= '1';
        wait for 1 ns;
        wait;
    end process;
end architecture ; -- arch
