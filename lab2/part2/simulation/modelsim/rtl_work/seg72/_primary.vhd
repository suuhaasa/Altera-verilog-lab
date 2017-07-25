library verilog;
use verilog.vl_types.all;
entity seg72 is
    port(
        HEX1            : out    vl_logic_vector(0 to 6);
        SW              : in     vl_logic
    );
end seg72;
