library verilog;
use verilog.vl_types.all;
entity part5 is
    port(
        S0              : out    vl_logic_vector(3 downto 0);
        S1              : out    vl_logic_vector(3 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic
    );
end part5;
