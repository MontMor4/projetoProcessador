library verilog;
use verilog.vl_types.all;
entity regn is
    port(
        BusW            : in     vl_logic_vector(15 downto 0);
        Reset           : in     vl_logic;
        R_IN            : in     vl_logic;
        clock           : in     vl_logic;
        R_OUT           : out    vl_logic_vector(15 downto 0)
    );
end regn;
