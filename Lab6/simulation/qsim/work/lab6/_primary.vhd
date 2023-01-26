library verilog;
use verilog.vl_types.all;
entity lab6 is
    port(
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        cnt             : out    vl_logic_vector(31 downto 0);
        presclaerFlag   : out    vl_logic;
        preCLK          : out    vl_logic;
        LEDG            : out    vl_logic_vector(9 downto 0)
    );
end lab6;
