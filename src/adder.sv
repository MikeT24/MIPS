module adder(
	input [3:0] a,
	input [3:0] b,
	input [1:0] xy,
	output logic [3:0] suma);
	
	
	
	always_comb begin
		case (xy)
			2'b01: suma = a + b;
			2'b10: suma = ~a + b + 1;
			default: suma = b;
		endcase
	end
	
	
	
endmodule