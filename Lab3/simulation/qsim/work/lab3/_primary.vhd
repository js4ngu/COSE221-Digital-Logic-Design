library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(0 downto 0);
        BUTTON          : in     vl_logic_vector(0 downto 0);
        pobe_reg        : out    vl_logic_vector(2 downto 0)
    );
end lab3;
