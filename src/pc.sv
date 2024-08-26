module pc (
	input [9:0] pcIn,
	input rst,
	input clk,
	output logic [9:0] pcOut);
	
	always_ff @(posedge clk) begin
		if (rst)
			pcOut <= 0;
		else
			pcOut <= pcIn;
	end
endmodule
