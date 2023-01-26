library verilog;
use verilog.vl_types.all;
entity lab7_vlg_check_tst is
    port(
        Alarm_flag      : in     vl_logic;
        FSM_flag        : in     vl_logic_vector(1 downto 0);
        LEDG            : in     vl_logic_vector(9 downto 0);
        min             : in     vl_logic_vector(8 downto 0);
        presclaerFlag   : in     vl_logic;
        sec             : in     vl_logic_vector(8 downto 0);
        smallSec        : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab7_vlg_check_tst;
