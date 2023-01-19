`define DISPLAY_0     7'b1000000
`define DISPLAY_1     7'b1111001
`define DISPLAY_2     7'b0100100
`define DISPLAY_3     7'b0110000
`define DISPLAY_4     7'b0011001
`define DISPLAY_5     7'b0010010
`define DISPLAY_6     7'b0000010
`define DISPLAY_7     7'b1111000
`define DISPLAY_8     7'b0000000
`define DISPLAY_9     7'b0010000
`define DISPLAY_A     7'b0001000
`define DISPLAY_b     7'b0000011
`define DISPLAY_C     7'b1000110
`define DISPLAY_d     7'b0100001
`define DISPLAY_E     7'b0000110
`define DISPLAY_F     7'b0001110
`define DISPLAY_OFF   7'b1111111


module lab3(
    input      CLOCK_50_2,
	input      [0:0] SW,
    input      [0:0] BUTTON,
    output     [6:0] HEX1_D
);
    wire       signalBTN;
    wire [2:0] signalHEX;

    pulseKey i_pulseKey(
        .clk        (CLOCK_50_2),
        .rst        (SW[0:0]),
        .btn        (BUTTON[0:0]),
        .outputBTN  (signalBTN)
    );
    
    FSM i_fsm(
        .clk        (CLOCK_50_2),
        .rst        (SW[0:0]),
        .inputKey   (signalBTN),
        .outputdata (signalHEX)
    );

    SEG i_seg(
        .num        (signalHEX),
        .HEX1_D     (HEX1_D),
    );

endmodule

module pulseKey(
    input       clk,
    input       rst,
    input       btn,
    output reg  outputBTN
);

    reg prev_btn;
    always @(posedge clk, posedge rst, posedge btn) begin
        prev_btn = btn;
        if ((btn==1)&&(prev_btn ^ btn)) assign outputBTN = 1;
        else outputBTN = 0;
    end
endmodule


module FSM (
    input               clk,
    input               rst,
    input               inputKey,
    output reg [2:0]    outputdata
);
    reg [2:0] state = 0;
    always @(posedge clk, posedge rst, posedge inputKey) begin
        case (state)
            0 : begin
                outputdata = 0;
                if (inputKey == 1) state = 1;
            end
            1 : begin
                outputdata = 1;
                if (inputKey == 1) state = 2;
            end 
            2 : begin
                outputdata = 2;
                if (inputKey == 1) state = 3;
            end 
            3 : begin
                outputdata = 3;
                if (inputKey == 1) state = 4;
            end 
            4 : begin
                outputdata = 4;
                if (inputKey == 1) state = 5;
            end
            5 : begin
                outputdata = 5;
                if (inputKey == 1) state = 6;
            end 
            6 : begin
                outputdata = 6;
                if (inputKey == 1) state = 7;
            end
            7 : begin
                outputdata = 7;
                if (inputKey == 1) state = 0;
            end 
            default: state = 0;
        endcase
    end
endmodule


module SEG(
    input      [3:0] num,
    output reg [6:0] HEX1_D
);
    always @(num) begin
        case(num)
            4'h0 : HEX1_D = `DISPLAY_0;
            4'h1 : HEX1_D = `DISPLAY_1;
            4'h2 : HEX1_D = `DISPLAY_2;
            4'h3 : HEX1_D = `DISPLAY_3;
            4'h4 : HEX1_D = `DISPLAY_4;
            4'h5 : HEX1_D = `DISPLAY_5;
            4'h6 : HEX1_D = `DISPLAY_6;
            4'h7 : HEX1_D = `DISPLAY_7;
            4'h8 : HEX1_D = `DISPLAY_8;
            4'h9 : HEX1_D = `DISPLAY_9;
            4'hA : HEX1_D = `DISPLAY_A;
            4'hB : HEX1_D = `DISPLAY_b;
            4'hC : HEX1_D = `DISPLAY_C;
            4'hD : HEX1_D = `DISPLAY_d;
            4'hE : HEX1_D = `DISPLAY_E;
            4'hF : HEX1_D = `DISPLAY_F;
        endcase 
    end
endmodule