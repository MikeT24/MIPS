module DataMemory(
	input clk,
	input rst,
	input MemWrite,
	input MemRead,
	input [9:0] Address,
	input [31:0] WriteData,
	input [31:0] fantasma,
	input finish,
	output logic [31:0] ReadData,
	output logic [9:0] lcd_data,
	output logic start,
	output logic go
);

	reg[31:0] regData [1023:0];
	
	assign ReadData = (MemRead)? regData[Address] : 8'h xxxxxxxx;
	assign lcd_data = regData[1022];
	assign start	 = regData[1021];
	assign go 		 = regData[1020];
	
	always_ff @(posedge clk) begin
		if (rst) begin
		 	for(int j = 0; j<1024; j= j +1) begin
				regData[j] = 0;
			end
		end
		else if(MemWrite)begin
			regData[Address] <= WriteData;
		end
		else begin
			regData[1023] <= fantasma; //FANTASMA DONE INIT
			regData[1019] <= finish; //FINISH DEL COUNTER
		end
		
	end
	

	
	
endmodule
