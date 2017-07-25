library verilog;
use verilog.vl_types.all;
entity part6_convert is
    port(
        OUT2            : out    vl_logic_vector(3 downto 0);
        OUT1            : out    vl_logic_vector(3 downto 0);
        SW              : in     vl_logic_vector(5 downto 0)
    );
end part6_convert;
