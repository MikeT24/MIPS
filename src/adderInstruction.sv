import mips_pkg::*;

`include "mips_header.svh"

module adderInstruction (
	input logic [ADDRESS_32_W-1:0] pcOut_plus4,
	input logic [ADDRESS_32_W-1:0] SignExtend,
	output logic [ADDRESS_32_W-1:0] pcOut_Branch);
	
	assign pcOut_Branch = pcOut_plus4 + SignExtend;
	
endmodule
