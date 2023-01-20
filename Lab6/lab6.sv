module lab6(
    input				CLOCK_50_2,
    input      [9:0]	SW,
	output reg [31:0]	cnt,
    output reg       	flag,
    output     [9:0]    LEDG
);
	parameter target = 20000000;
	parameter targetTB = 20;
	reg out = 1;
	always @(posedge CLOCK_50_2) begin
		if 	    (targetTB > cnt) begin
			 cnt <= cnt + 1;
			 flag <= 0;
		end
		else if (cnt >= targetTB) begin
			cnt  <= 0;
			flag <= 1;
		end
	end

	always @(posedge CLOCK_50_2) begin
		if (SW[9] == 1) begin
			out <= 1;
		end
		if(flag == 1) begin
			if(1024 > out)out <= out <<< 1;
			else if(out >= 1024) out <= 1;
		end
	end

	assign LEDG = 0x3FF;
endmodule