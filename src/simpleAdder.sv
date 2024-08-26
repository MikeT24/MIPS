module simpleAdder(
	input A,
	input B,
	input Cin,
	output logic Cout,
	output logic S
	);
	
	
	logic [1:0] tmps;
	
	assign S = (~A & ~B & Cin) + (~A & B & ~Cin) + (A & ~B & ~Cin) + (A & B & Cin);  
	assign Cout = (A & B) + (A & Cin) + (B & Cin);
	
endmodule
	