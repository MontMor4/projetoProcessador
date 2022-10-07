library verilog;
use verilog.vl_types.all;
entity projetoProcessador is
    generic(
        T0              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        T1              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        T2              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        T3              : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        mv              : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        mvt             : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        add             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        sub             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \_R0\           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        \_R1\           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        \_R2\           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        \_R3\           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        \_R4\           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        \_R5\           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        \_R6\           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        \_R7\           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        \_G\            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        \_IR8_IR8_0\    : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        \_IR7_0_0\      : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0)
    );
    port(
        DIN             : in     vl_logic_vector(15 downto 0);
        Resetn          : in     vl_logic;
        Clock           : in     vl_logic;
        Run             : in     vl_logic;
        Done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of T0 : constant is 1;
    attribute mti_svvh_generic_type of T1 : constant is 1;
    attribute mti_svvh_generic_type of T2 : constant is 1;
    attribute mti_svvh_generic_type of T3 : constant is 1;
    attribute mti_svvh_generic_type of mv : constant is 1;
    attribute mti_svvh_generic_type of mvt : constant is 1;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of sub : constant is 1;
    attribute mti_svvh_generic_type of \_R0\ : constant is 1;
    attribute mti_svvh_generic_type of \_R1\ : constant is 1;
    attribute mti_svvh_generic_type of \_R2\ : constant is 1;
    attribute mti_svvh_generic_type of \_R3\ : constant is 1;
    attribute mti_svvh_generic_type of \_R4\ : constant is 1;
    attribute mti_svvh_generic_type of \_R5\ : constant is 1;
    attribute mti_svvh_generic_type of \_R6\ : constant is 1;
    attribute mti_svvh_generic_type of \_R7\ : constant is 1;
    attribute mti_svvh_generic_type of \_G\ : constant is 1;
    attribute mti_svvh_generic_type of \_IR8_IR8_0\ : constant is 1;
    attribute mti_svvh_generic_type of \_IR7_0_0\ : constant is 1;
end projetoProcessador;
