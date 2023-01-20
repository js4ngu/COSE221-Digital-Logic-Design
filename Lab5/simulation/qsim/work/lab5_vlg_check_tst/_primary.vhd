library verilog;
use verilog.vl_types.all;
entity lab5_vlg_check_tst is
    port(
        coffe           : in     vl_logic_vector(4 downto 0);
        money           : in     vl_logic_vector(4 downto 0);
        money_H         : in     vl_logic_vector(4 downto 0);
        money_L         : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab5_vlg_check_tst;
