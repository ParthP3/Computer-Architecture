library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
    port(a, b, c: in std_logic;
    sum: out std_logic;
    carry: out std_logic);

end entity;

architecture arch1 of fulladder is 

    begin
        
        sum <= a xor b xor c;
        carry <= (a and b) or (b and c) or (a and c);

end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity RCA8 is
    port(a, b: in std_logic_vector(7 downto 0);
    sum: out std_logic_vector(7 downto 0);
    cout: out std_logic);
end entity;
    
    
architecture arch of RCA8 is

    signal cin1, c1, c2, c3, c4, c5, c6, c7: std_logic;

    component fulladder is
        port(a, b, c: in std_logic;
        sum: out std_logic;
        carry: out std_logic);
    end component;
    

begin
    dut_1: fulladder
    port map(a(0), b(0), '0', sum(0), c1);

    dut_2: fulladder
    port map(a(1), b(1), c1, sum(1), c2);

    dut_3: fulladder
    port map(a(2), b(2), c2, sum(2), c3);

    dut_4: fulladder
    port map(a(3), b(3), c3, sum(3), c4);

    dut_5: fulladder
    port map(a(4), b(4), c4, sum(4), c5);

    dut_6: fulladder
    port map(a(5), b(5), c5, sum(5), c6);

    dut_7: fulladder
    port map(a(6), b(6), c6, sum(6), c7);

    dut_8: fulladder
    port map(a(7), b(7), c7, sum(7), cout);
end architecture;    

