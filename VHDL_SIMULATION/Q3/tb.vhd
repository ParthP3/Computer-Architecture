library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
    component RLE_Encoder
        port(clk, rst: in std_logic;
        a: in std_logic_vector(7 downto 0);
        data_valid: out std_logic;
        z: out std_logic_vector(7 downto 0));
    end component;
    signal input_sig, output_sig: std_logic_vector (7 downto 0);
    signal clk, rst, data_valid : std_logic;
    signal tmp : integer := 0;
begin
    dut_instance: RLE_Encoder
        port map (a => input_sig, clk => clk, z => output_sig, data_valid => data_valid, rst => rst);
    
    process
        file input_file: text open read_mode is "test.txt";
        file output_file: text open write_mode is "out.txt";
        variable input_line, output_line: line;
        variable input_var, output_var : std_logic_vector (7 downto 0); 
    begin
        rst <= '0';
        while not endfile(input_file) loop
            if tmp = 0 then
                clk <= '0';
            end if;
            tmp <= 1;
            clk <= '1';
            wait for 1 ns;
            if data_valid = '1' then
                output_var := output_sig;
                write (output_line, output_var);
                writeline (output_file, output_line);
            end if;
            clk <= '0';
            wait for 1 ns;
            readline (input_file, input_line);
            read (input_line, input_var);
            input_sig <= input_var;
            
        end loop;
        rst <= '1';
        loop2: for k in 0 to 100 loop
            
            clk <= '1';
            wait for 1 ns;
            if data_valid = '1' then
                output_var := output_sig;
                write (output_line, output_var);
                writeline (output_file, output_line);
            end if;
            clk <= '0';
            wait for 1 ns;
        end loop;
    wait;
    end process;
    

end architecture;