module pulseKey (
    input       btn,
    input       clk,
    input       reset,
    output reg  keyPulse
);
    reg q_DFF, out;
    always @(posedge clk or posedge reset) begin
        if (reset) q_DFF = 0;
        else       q_DFF = btn;
    end
    always @(posedge clk or posedge reset) begin
        if (reset) keyPulse = 0;
        else       keyPulse = (q_DFF == 0) && (btn == 1);
    end
endmodule
