import mips_pkg::*;

`include "mips_header.svh"

module pc (
	input [ADDRESS_32_W-1:0] pcIn,
	input rst,
	input clk,
	output logic [ADDRESS_32_W-1:0] pcOut);
	
	always_ff @(posedge clk) begin
		if (rst)
			pcOut <= 0;
		else
			pcOut <= pcIn;
	end
endmodule
