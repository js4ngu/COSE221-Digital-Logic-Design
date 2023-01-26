library verilog;
use verilog.vl_types.all;
entity lab7_vlg_sample_tst is
    port(
        BUTTON          : in     vl_logic_vector(9 downto 0);
        CLOCK_50_2      : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab7_vlg_sample_tst;
