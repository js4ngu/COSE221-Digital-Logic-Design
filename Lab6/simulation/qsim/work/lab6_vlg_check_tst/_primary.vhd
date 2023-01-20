library verilog;
use verilog.vl_types.all;
entity lab6_vlg_check_tst is
    port(
        LEDG            : in     vl_logic_vector(9 downto 0);
        cnt             : in     vl_logic_vector(31 downto 0);
        flag            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lab6_vlg_check_tst;
