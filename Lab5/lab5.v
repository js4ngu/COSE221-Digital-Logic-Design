module lab5(
    input            CLOCK_50_2,
    input      [9:0] SW,
    output     [4:0] money,
    output     [4:0] coffe,
    output     [4:0] money_H,
    output     [4:0] money_L,
    output     [6:0] HEX0_D,
    output     [6:0] HEX1_D,
    output     [6:0] HEX3_D
    );
    wire [9:0] keyPulse;

    pulseKey i_pulseKey0(
        .btn        (SW[0]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[0])
    );
    pulseKey i_pulseKey1(
        .btn        (SW[1]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[1])
    );
    pulseKey i_pulseKey2(
        .btn        (SW[2]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[2])
    );
    pulseKey i_pulseKey3(
        .btn        (SW[3]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[3])
    );
    pulseKey i_pulseKey4(
        .btn        (SW[4]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[4])
    );
    pulseKey i_pulseKey9(
        .btn        (SW[9]),
        .clk        (CLOCK_50_2),
		.reset      (SW),
        .keyPulse   (keyPulse[9])
    );

    FSM i_fsm(
        .clk        (CLOCK_50_2),
        .rst        (keyPulse[9]),
        .SW         (keyPulse),
        .coffe      (coffe),
        .money      (money),
        .money_H    (money_H),
        .money_L    (money_L)
    );

    SEG i_seg0(
        .HEX        (0),
        .num        (money_L),
        .HEX0_D     (HEX0_D)
    );
    SEG i_seg1(
        .HEX        (1),
        .num        (money_H),
        .HEX1_D     (HEX1_D)
    );
    SEG i_seg3(
        .HEX        (3),
        .num        (coffe),
        .HEX3_D     (HEX3_D)
    );
endmodule

module FSM (
    input            clk,
    input            rst,
    input      [9:0] SW,
    output reg [4:0] coffe,
    output reg [4:0] money,
    output     [4:0] money_H,
    output     [4:0] money_L
);
    parameter modeINPUT = 0, modeCOFFE = 1, modeCHARGE = 2;
    reg [2:0] mode;

    always @(posedge clk) begin
        if (rst == 1) begin
            mode  <= modeINPUT;
            money <= 0;
            coffe <= 0;
        end
        else begin
            case (mode)
                modeINPUT : begin
                    if(SW[0] == 1)  money <= money + 1;
                    if(SW[1] == 1)  money <= money + 5;
                    if(SW[2] == 1)  money <= money + 10;
                    if (money > 20) money <= 20; 

                    if(SW[3] == 1) begin 
                        if(money >= 6) begin
                            mode <= modeCOFFE;
                            coffe <= coffe + 1;
                            money <= money - 6;
                        end
                    end
                end
                modeCOFFE : begin
                    if(SW[3] == 1) begin
                        if (money >= 6) begin
                            money <= money - 6;
                            coffe <= coffe + 1;
                        end
                    end
                    if(SW[4] == 1) mode <= modeCHARGE;
                end
                default: begin
                    mode  <= modeINPUT;
                    money <= 0;
                end
            endcase
        end
    end

    assign money_H = (money/10) % 10;
    assign money_L = money % 10;
endmodule

