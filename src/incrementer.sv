import mips_pkg::*;

`include "mips_header.svh"

module incrementer (
	input logic [ADDRESS_32_W-1:0] instruction,
	output logic [ADDRESS_32_W-1:0] pcOut_plus4);
	
	assign pcOut_plus4 = instruction + 10'h4;
	
endmodule
