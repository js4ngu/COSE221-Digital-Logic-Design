module lab5(
    input            CLOCK_50_2,
    input      [9:0] SW,
    output     [4:0] money,
    output     [6:0] HEX0_D,
    output     [6:0] HEX1_D,
    output     [6:0] HEX3_D
    );

    wire [6:0] HEX0_wire, HEX1_wire;

    FSM i_fsm(
        .SW         (SW[4:0]),
        .rst        (SW[9]),
        .clk        (CLOCK_50_2),
        .money      (money),
        .coffe      (),
        .money_H    (HEX0_D),
        .money_L    (HEX1_D)
    );
endmodule

module FSM (
    input      [9:0] SW,
    input            rst,
    input            clk,
    output reg [4:0] money,
    output     [3:0] coffe,
    output     [3:0] money_H,
    output     [3:0] money_L
);
    parameter modeINPUT = 0, modeCOFFE = 1, modeCHARGE = 2;

    reg [1:0] mode;

    always @(posedge SW, posedge rst, posedge clk) begin
        if (rst) begin
            mode     <= modeINPUT;
            money    <= 0;
        end
        else begin
            case (mode)
                modeINPUT : begin
                    if(SW[0] == 1)  money <= money + 1;
                    if(SW[1] == 1)  money <= money + 5;
                    if(SW[2] == 1)  money <= money + 10;
                    if (money > 20) money <= 20;
                end
                default: mode <= modeINPUT;
            endcase
        end
    end

    assign money_H = (money/10) % 10;
    assign money_L = money % 10;
endmodule