module counter(
	input shift,
	input clk,
	input rst,
	output logic done,
	output logic save);


	reg [2:0]count;

	always_ff @(posedge clk) begin
		if (rst) begin
			count <= 0;
		end
		else if (shift) begin
			count <= count + 1;
		end
	end
	assign save = (count == 3'b011)? 1:0 ;
	assign done = (count == 3'b100)? 1:0 ;

endmodule
