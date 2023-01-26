library verilog;
use verilog.vl_types.all;
entity lab7 is
    port(
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        BUTTON          : in     vl_logic_vector(9 downto 0);
        presclaerFlag   : out    vl_logic;
        FSM_flag        : out    vl_logic_vector(1 downto 0);
        Alarm_flag      : out    vl_logic;
        smallSec        : out    vl_logic_vector(8 downto 0);
        sec             : out    vl_logic_vector(8 downto 0);
        min             : out    vl_logic_vector(8 downto 0);
        LEDG            : out    vl_logic_vector(9 downto 0)
    );
end lab7;
