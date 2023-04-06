library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x2 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end entity; 
    
architecture arch of mux4x2 is

    signal g0, g1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12: std_logic;
    component AND_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;
    
    component OR_Gate is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;
    
    component NOT_Gate is
        port(x: in std_logic;
        y: out std_logic);
    end component;
begin
    dut_instance1: NOT_GATE
    port map(S(0), g0);

    dut_instance2: NOT_GATE
    port map(S(1), g1);

    dut_instance3: AND_GATE
    port map(D(0), g1, f2);

    dut_instance4: AND_GATE
    port map(f2, g0, f3);

    dut_instance5: AND_GATE
    port map(D(1), g1, f4);

    dut_instance6: AND_GATE
    port map(f4, S(0), f5);

    dut_instance7: AND_GATE
    port map(D(2), S(1), f6);

    dut_instance8: AND_GATE
    port map(f6, g0, f7);

    dut_instance9: AND_GATE
    port map(D(3), S(1), f8);

    dut_instance10: AND_GATE
    port map(f8, S(0), f9);

    dut_instance11: OR_GATE
    port map(f3, f5, f10);

    dut_instance12: OR_GATE
    port map(f7, f9, f11);

    dut_instance13: OR_GATE
    port map(f10, f11, f12);

    Y <= f12;
end architecture;    

