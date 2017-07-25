library verilog;
use verilog.vl_types.all;
entity seg71 is
    port(
        HEX0            : out    vl_logic_vector(0 to 6);
        SW              : in     vl_logic_vector(3 downto 0)
    );
end seg71;
