module lab3(
    input            CLOCK_50_2,
    input      [0:0] SW,
    input      [0:0] BUTTON
);
    wire keypulse_wire;

    pulseKey i_pulsekey(
        .btnSignal  (BUTTON),
        .clk        (CLOCK_50_2),
        .reset      (SW),
        .keyPulse   ()
    )
endmodule

module pulseKey (
    input   btnSignal,
    input   clk,
    input   reset,
    output  keyPulse
);
    wire Q;
    DFf i_dff(
        .d      (btnSignal),
        .clk    (clk),
        .reset  (reset),
        .q      (Q),
    )

    assign keyPulse = ~Q & btnSignal;
endmodule

module DFF( d, clk, q, reset );
  input d, clk, reset;
  output q;
  reg q;
  
  always@(posedge reset or posedge clk)
    if(~reset) q <= 0;
    else q <= d;    
endmodule

module FSM (
    input            clk,
    input            rst,
    input            btn,
    output reg [6:0] HEX1_D,
);
    reg state;
    if (rst) begin
        state = 0;
    end
    else begin
    end
endmodule