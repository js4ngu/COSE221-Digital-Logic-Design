library verilog;
use verilog.vl_types.all;
entity lab5 is
    port(
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        money           : out    vl_logic_vector(4 downto 0);
        coffe           : out    vl_logic_vector(4 downto 0);
        money_H         : out    vl_logic_vector(4 downto 0);
        money_L         : out    vl_logic_vector(4 downto 0)
    );
end lab5;
