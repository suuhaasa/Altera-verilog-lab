library verilog;
use verilog.vl_types.all;
entity circuitA is
    port(
        M               : out    vl_logic_vector(2 downto 0);
        V               : in     vl_logic_vector(3 downto 0)
    );
end circuitA;
