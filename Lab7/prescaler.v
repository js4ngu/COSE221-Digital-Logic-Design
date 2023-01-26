module presclaer(
    input				CLK,
    input               rst,
    input      [31:0]	target,
	output reg [31:0]	cnt,
    output reg         	presclaerFlag,
	output reg			preCLK
);
	reg prescalingCLK = 1;

	// clk counter
	always @(posedge CLK) begin
        if (rst == 1) begin
            cnt <= 0;
            presclaerFlag <= 0;
        end
        else begin
            if(target > cnt) begin
                cnt <= cnt + 1;
                presclaerFlag <= 0;
            end
            else if (cnt >= target) begin
                cnt <= 0;
                presclaerFlag <= 1;
            end
        end
	end

	always @(posedge CLK) begin
		if (presclaerFlag == 1) preCLK <= preCLK ^ 1;
	end
endmodule