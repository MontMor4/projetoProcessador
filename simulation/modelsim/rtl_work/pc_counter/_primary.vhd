library verilog;
use verilog.vl_types.all;
entity pc_counter is
    port(
        clock           : in     vl_logic;
        entrada_pc      : in     vl_logic_vector(15 downto 0);
        pc_incr         : in     vl_logic;
        pc_in           : in     vl_logic;
        saida_pc        : out    vl_logic_vector(15 downto 0)
    );
end pc_counter;
