library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        BusW            : in     vl_logic_vector(15 downto 0);
        RA_out          : in     vl_logic_vector(15 downto 0);
        Addsub          : in     vl_logic;
        Res             : out    vl_logic_vector(15 downto 0)
    );
end Alu;
