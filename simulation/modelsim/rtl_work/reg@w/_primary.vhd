library verilog;
use verilog.vl_types.all;
entity regW is
    port(
        Clock           : in     vl_logic;
        Wd              : in     vl_logic;
        W               : out    vl_logic
    );
end regW;
