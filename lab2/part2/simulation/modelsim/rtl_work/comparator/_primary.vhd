library verilog;
use verilog.vl_types.all;
entity comparator is
    port(
        z               : out    vl_logic;
        V               : in     vl_logic_vector(3 downto 0)
    );
end comparator;
