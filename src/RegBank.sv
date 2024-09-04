import mips_pkg::*;

`include "mips_header.svh"

module RegBank #(    
	parameter REG_FILE_DEPTH = 32
)(
	input logic clk,
	input logic rst,
	input logic [REG_ADDR_W-1:0] ReadReg1,
	input logic [REG_ADDR_W-1:0] ReadReg2,
	input logic [REG_ADDR_W-1:0] WriteReg,
	input logic RegWrite,
	input logic [DATA_32_W-1:0] WriteData,
	input logic done,
	output logic [DATA_32_W-1:0] ReadData1,
	output logic [DATA_32_W-1:0] ReadData2);

	logic [DATA_32_W-1:0] RegBank [REG_FILE_DEPTH-1:0];

		assign ReadData1 = RegBank[ReadReg1];
		assign ReadData2 = RegBank[ReadReg2];
		
	always_ff @ (posedge clk ) begin
		if (rst) begin
		 	for(int j = 0; j<128; j= j +1) begin
				RegBank[j] = 0;
			end	

			// RegBank[1]  = 1;
			// RegBank[2]  = 1021;
			// RegBank[3]  = 1022;
			// RegBank[4]  = 1023;
			// RegBank[10] = 10'b0001001000;
			// RegBank[11] = 10'b0001100101;
			// RegBank[12] = 10'b0001101100;
			// RegBank[13] = 10'b0001101111;
			// RegBank[14] = 10'b0000100000;
			// RegBank[15] = 10'b0001010111;	
			// RegBank[16] = 10'b0001110010;
			// RegBank[17] = 10'b0001100100;
			// RegBank[18] = 10'b0000100001;
			// RegBank[20] = 32'd1020;
			// RegBank[21] = 32'd1019;
			
			//$10 = 8'b01001000; //"H" en BINARIO;
			//$11 = 8'b01100101; //"e" en BINARIO;
			//$12 = 8'b01101100; //"l" en BINARIO;
			//$13 = 8'b01101111; //"o" en BINARIO;
			//$14 = 8'b00100000; //" "
			//$15 = 8'b01010111; //"W"
			//$16 = 8'b01110010; //"r"
			//$17 = 8'b01100100; //"d"
			//$18 = 8'b00100001; //"!"


			
		end
		else if(RegWrite) begin
			RegBank[WriteReg] <= WriteData;
		end
	end

endmodule
