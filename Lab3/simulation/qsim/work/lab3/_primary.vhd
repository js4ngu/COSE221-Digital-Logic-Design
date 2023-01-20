library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(0 downto 0);
        BUTTON          : in     vl_logic_vector(0 downto 0);
        \OUT\           : out    vl_logic_vector(2 downto 0);
        KEYPULSE        : out    vl_logic;
        HEX1_D          : out    vl_logic_vector(6 downto 0)
    );
end lab3;
