library IEEE;
use IEEE.std_logic_1164.all;

entity encoder4x2 is
    port(I: in std_logic_vector (3 downto 0);
    Y: out std_logic_vector(1 downto 0));
end entity;
    
    
architecture arch of encoder4x2 is

    component OR_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;
    
begin
    dut_instance1: OR_GATE
    port map(I(1), I(3), Y(0));

    dut_instance2: OR_GATE
    port map(I(2), I(3), Y(1));

end architecture;    

