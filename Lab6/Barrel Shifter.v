module barrel_shifter_10bit(
    input				CLK,
    input               direction,
    input               shiftEN,
    input        [9:0]	in,
	output reg   [9:0]	out
);

	always @(posedge CLK) begin
        out <= in;
        if (shiftEN == 1) begin
            if (direction == 1) begin
                out[0] <= in[9];
                out[1] <= in[0];
                out[2] <= in[1];
                out[3] <= in[2];
                out[4] <= in[3];
                out[5] <= in[4];
                out[6] <= in[5];
                out[7] <= in[6];
                out[8] <= in[7];
                out[9] <= in[8];
            end
            else begin
                out[0] <= in[1];
                out[1] <= in[2];
                out[2] <= in[3];
                out[3] <= in[4];
                out[4] <= in[5];
                out[5] <= in[6];
                out[6] <= in[7];
                out[7] <= in[8];
                out[8] <= in[9];
                out[9] <= in[0];
            end
        end
    end
endmodule

//해당 모듈은 검증 안됨
//but 비슷한 로직이 탑모듈에 적용되어 작동하는걸 확인