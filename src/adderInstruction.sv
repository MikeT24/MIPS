module adderInstruction (
	input [9:0] instructionB,
	input [9:0] SignExtend,
	output logic [9:0] instructionC);
	
	assign instructionC = instructionB + SignExtend;
	
endmodule
