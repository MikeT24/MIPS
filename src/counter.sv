module counter(
	input shift,
	input clk,
	input rst,
	output logic done,
	output logic save);


	reg [2:0]contador;

	always_ff @(posedge clk) begin
		if (rst) begin
			contador <= 0;
		end
		else if (shift) begin
			contador <= contador + 1;
		end
	end
	assign save = (contador == 3'b011)? 1:0 ;
	assign done = (contador == 3'b100)? 1:0 ;

endmodule
