module incrementer (
	input [9:0] instruction,
	output logic [9:0] instructionB);
	
	assign instructionB = instruction + 10'h4;
	
endmodule
