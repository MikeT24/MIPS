module signExtend (
	input [15:0] in16,
	output logic [31:0] out32);
	
	logic [15:0] tmp16;
	
	assign tmp16 = (in16[15]==1)? 4'hffff : 4'h0000;
	
	assign out32 = {tmp16,in16};
endmodule
