library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_GATE is
    port(x: in std_logic;
    y: out std_logic);
end entity;

architecture arch of NOT_GATE is

begin
    y <= not x;
end architecture;    

