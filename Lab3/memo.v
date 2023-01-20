module lab3(
    input            CLOCK_50_2,
    input      [0:0] SW,
    input      [0:0] BUTTON,
    output     [2:0] OUT
);
    wire        keyPulse;
    wire [2:0]  out;

    pulseKey i_pulseKey(
        .btn        (BUTTON),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse)
    );

    FSM i_fsm(
        .clk        (CLOCK_50_2),
        .rst        (SW),
        .inputKey   (keyPulse),
        .outputdata (out)
    );

    assign OUT = out;

endmodule

module FSM (
    input               clk,
    input               rst,
    input               inputKey,
    output reg [2:0]    outputdata
);
    reg [2:0] state;
    always @(posedge clk) begin
        if (rst) begin
            state <= 0;
            outputdata <= 0;
        end
        else begin
            case (state)
                0 : begin
                    outputdata <= 0;
                    if (inputKey == 1) state <= 1;
                end
                1 : begin
                    outputdata <= 1;
                    if (inputKey == 1) state <= 2;
                end 
                2 : begin
                    outputdata <= 2;
                    if (inputKey == 1) state <= 3;
                end 
                3 : begin
                    outputdata <= 3;
                    if (inputKey == 1) state <= 4;
                end 
                4 : begin
                    outputdata <= 4;
                    if (inputKey == 1) state <= 5;
                end
                5 : begin
                    outputdata <= 5;
                    if (inputKey == 1) state <= 6;
                end 
                6 : begin
                    outputdata <= 6;
                    if (inputKey == 1) state <= 7;
                end
                7 : begin
                    outputdata <= 7;
                    if (inputKey == 1) state <= 0;
                end 
                default: state <= 0;
            endcase
        end
    end
endmodule
