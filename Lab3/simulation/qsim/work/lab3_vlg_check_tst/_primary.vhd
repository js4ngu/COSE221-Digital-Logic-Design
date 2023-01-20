library verilog;
use verilog.vl_types.all;
entity lab3_vlg_check_tst is
    port(
        HEX1_D          : in     vl_logic_vector(6 downto 0);
        KEYPULSE        : in     vl_logic;
        \OUT\           : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab3_vlg_check_tst;
