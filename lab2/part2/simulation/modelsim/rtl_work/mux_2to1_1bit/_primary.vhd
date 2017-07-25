library verilog;
use verilog.vl_types.all;
entity mux_2to1_1bit is
    port(
        \out\           : out    vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        s               : in     vl_logic
    );
end mux_2to1_1bit;
