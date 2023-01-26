`define COUNT_MODE     	2'b11
`define ALRAMSET_MODE   2'b00
`define TIMESET_MODE    2'b01
`define ALRAM_MODE      2'b10

module lab7(
    input				CLOCK_50_2,
    input      [9:0]	SW,
    input 	   [9:0]    BUTTON,
    output          	presclaerFlag,
	output reg       	Alarm_flag,

	output reg [8:0]	smallSec,
	output reg [8:0]	sec,
	output reg [8:0]	min,

    output     [6:0] 	HEX0_D,
    output     [6:0] 	HEX1_D,
    output     [6:0] 	HEX2_D,
    output     [6:0] 	HEX3_D,
    output reg [9:0]    LEDG
);
	parameter target = 5000000;
	reg [10:0] Alr;
	reg [1:0] FSM_flag;
	reg [8:0] alr_sec, alr_min;
	reg [3:0] min_hex, secH_hex, secL_hex, smallSec_hex;
    wire [9:0] keyPulse;

    pulseKey i_pulseKey1(
        .btn        (BUTTON[1]),
        .clk        (CLOCK_50_2),
		.reset      (),
        .keyPulse   (keyPulse[1])
    );
    pulseKey i_pulseKey2(
        .btn        (BUTTON[2]),
        .clk        (CLOCK_50_2),
		.reset      (),
        .keyPulse   (keyPulse[2])
    );

	presclaer i_presclaer(
		.CLK			(CLOCK_50_2),
		.rst			(SW[9]),
		.target			(target),
		.cnt			(cnt),
		.presclaerFlag	(presclaerFlag),
		.preCLK			(preCLK)
	);

    SEG i_seg0(
        .HEX        (0),
        .num        (smallSec_hex),
        .HEX0_D     (HEX0_D),
        .HEX1_D     (),
        .HEX2_D     (),
        .HEX3_D     ()
    );
    SEG i_seg1(
        .HEX        (1),
        .num        (secL_hex),
        .HEX0_D     (),
        .HEX1_D     (HEX1_D),
        .HEX2_D     (),
        .HEX3_D     ()
    );
    SEG i_seg2(
        .HEX        (2),
        .num        (secH_hex),
        .HEX0_D     (),
        .HEX1_D     (),
        .HEX2_D     (HEX2_D),
        .HEX3_D     ()
    );
    SEG i_seg3(
        .HEX        (3),
        .num        (min_hex),
        .HEX0_D     (),
        .HEX1_D     (),
        .HEX2_D     (),
        .HEX3_D     (HEX3_D)
    );
	//FSM-flag set
	always @(posedge CLOCK_50_2) begin
		if (SW[8] == 1) FSM_flag = 0;		//알람 설정
		else if (SW[9] == 1) FSM_flag = 1;	//시간 설정
		else if ((min == alr_min) && (sec == alr_sec)) FSM_flag = 2;
		else FSM_flag = 3;
	end
	always @(posedge CLOCK_50_2) begin
		case (FSM_flag)
			0: begin
				Alr = 10'h0;
				if (keyPulse[2]) alr_min <= alr_min + 1;
				if (keyPulse[1]) alr_sec <= alr_sec + 1;

				if (alr_min >= 10) alr_min <= 0;
				if (alr_sec >= 60) alr_sec <= 0;

				min_hex		 <= alr_min;
				secH_hex	 <=	(alr_sec/10) % 10;
				secL_hex	 <=	alr_sec % 10;
			end
			1: begin
				Alr = 10'h0;
				if (keyPulse[2]) min <= min + 1;
				if (keyPulse[1]) sec <= sec + 1;

				if (min >= 10) min <= 0;
				if (sec >= 60) sec <= 0;

				min_hex		 <= min;
				secH_hex	 <=	(sec/10) % 10;
				secL_hex	 <=	sec % 10;
			end
			2 : begin
				Alr = 10'h3FF;
				sec <= alr_sec;
				min <= alr_min;
				min_hex		 <= min;
				secH_hex	 <=	(sec/10) % 10;
				secL_hex	 <=	sec % 10;
			end
			default: begin
				//Time count mode
				Alr = 10'h0;
				if (presclaerFlag == 1) smallSec <= smallSec + 1;
				if(smallSec >= 10) begin
					smallSec <= 0;
					sec <= sec + 1;
				end
				if (sec >= 60) begin
					sec <= 0;
					min <= min + 1;
				end
				if (min >= 10) min <= 0;

				min_hex		 <= min;
				secH_hex	 <=	(sec/10) % 10;
				secL_hex	 <=	sec % 10;
				smallSec_hex <=	smallSec;
			end
		endcase
		LEDG <= Alr;
	end
endmodule