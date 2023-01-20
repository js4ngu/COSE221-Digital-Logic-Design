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


module lab4(
    input      [9:0] SW,
    output reg [6:0] HEX1_D
    );

    always @(*) begin
        if      (SW[0] == 1) HEX1_D = `DISPLAY_0;
        else if (SW[1] == 1) HEX1_D = `DISPLAY_1;
        else if (SW[2] == 1) HEX1_D = `DISPLAY_2;
        else if (SW[3] == 1) HEX1_D = `DISPLAY_3;
        else if (SW[4] == 1) HEX1_D = `DISPLAY_4;
        else if (SW[5] == 1) HEX1_D = `DISPLAY_5;
        else if (SW[6] == 1) HEX1_D = `DISPLAY_6;
        else if (SW[7] == 1) HEX1_D = `DISPLAY_7;
        else if (SW[8] == 1) HEX1_D = `DISPLAY_8;
        else if (SW[9] == 1) HEX1_D = `DISPLAY_9;
        else HEX1_D = `DISPLAY_OFF;
    end
endmodule



















