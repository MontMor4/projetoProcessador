library verilog;
use verilog.vl_types.all;
entity regInstr is
    port(
        endereco        : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        \in\            : in     vl_logic;
        endInstr        : out    vl_logic
    );
end regInstr;
