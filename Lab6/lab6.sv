module lab6(
    input				CLOCK_50_2,
    input      [9:0]	SW,
	output reg [31:0]	cnt,
    output reg       	flag,
    output reg [9:0]    LEDG
);
	parameter target = 20000000;
	parameter targetTB = 20;
	always @(posedge CLOCK_50_2) begin
		if 	    (target > cnt) begin
			 cnt <= cnt + 1;
			 flag <= 0;
		end
		else if (cnt >= target) begin
			cnt  <= 0;
			flag <= 1;
		end
	end

	always @(posedge CLOCK_50_2) begin
		if (SW[9] == 1) begin
			LEDG <= 10'b1;
		end
		if(flag) LEDG <= 1;
	end
endmodule