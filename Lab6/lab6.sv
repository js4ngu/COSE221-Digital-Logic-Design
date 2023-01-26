module lab6(
    input				CLOCK_50_2,
    input      [9:0]	SW,
	output reg [31:0]	cnt,
    output          	presclaerFlag,
	output reg			preCLK,
    output     [9:0]    LEDG
);
	parameter target = 20000000;
	parameter targetTB = 10;
	reg [9:0] regLED = 1;
	reg [9:0] regLED_buff;

	presclaer i_presclaer(
		.CLK			(CLOCK_50_2),
		.rst			(SW[9]),
		.target			(target),
		.cnt			(cnt),
		.presclaerFlag	(presclaerFlag),
		.preCLK			(preCLK)
	);

	always @(posedge CLOCK_50_2) begin
		regLED_buff <= regLED;
		if (presclaerFlag == 1) begin
			if (SW[0] == 1) begin
				regLED[0] <= regLED_buff[9];
				regLED[1] <= regLED_buff[0];
				regLED[2] <= regLED_buff[1];
				regLED[3] <= regLED_buff[2];
				regLED[4] <= regLED_buff[3];
				regLED[5] <= regLED_buff[4];
				regLED[6] <= regLED_buff[5];
				regLED[7] <= regLED_buff[6];
				regLED[8] <= regLED_buff[7];
				regLED[9] <= regLED_buff[8];
			end
			else begin
				regLED[0] <= regLED_buff[1];
				regLED[1] <= regLED_buff[2];
				regLED[2] <= regLED_buff[3];
				regLED[3] <= regLED_buff[4];
				regLED[4] <= regLED_buff[5];
				regLED[5] <= regLED_buff[6];
				regLED[6] <= regLED_buff[7];
				regLED[7] <= regLED_buff[8];
				regLED[8] <= regLED_buff[9];
				regLED[9] <= regLED_buff[0];
			end
		end
	end
	always @(posedge CLOCK_50_2) begin
		if (SW[9] == 1) LEDG <= 0;
		else LEDG <= regLED;
	end
endmodule	