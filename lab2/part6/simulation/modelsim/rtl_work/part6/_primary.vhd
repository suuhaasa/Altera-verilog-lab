library verilog;
use verilog.vl_types.all;
entity part6 is
    port(
        HEX1            : out    vl_logic_vector(0 to 6);
        HEX0            : out    vl_logic_vector(0 to 6);
        SW              : in     vl_logic_vector(5 downto 0)
    );
end part6;
