library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        BusW            : in     vl_logic_vector(15 downto 0);
        RA_out          : in     vl_logic_vector(15 downto 0);
        saidaBarril     : in     vl_logic_vector(15 downto 0);
        op              : in     vl_logic_vector(2 downto 0);
        Res             : out    vl_logic_vector(15 downto 0);
        bitZero         : out    vl_logic
    );
end Alu;
