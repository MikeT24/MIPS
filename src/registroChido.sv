module registroChido(
	input [3:0] suma,
	input [4:0] multiplierIn,
	input clk,
	input shift,
	input rst,
	input enableFijo,
	input load,
	output logic [4:0] registroFijo,  //bottom register
	output logic [3:0] registroSuma); //top register
	//output [8:0] outReg);
	
	
		logic [3:0] tmpShift;
		assign tmpShift = registroSuma;
	
		always_ff @(posedge clk) begin  //top and bottom registers
		if (rst) begin
			registroSuma <= 0;
			registroFijo <= 0;
		end
		else if (load) begin						 //enable for top register
			registroSuma <= suma;
		end
		else if (enableFijo) begin				 //enable for lower reg
			registroFijo <= multiplierIn;
		end
		else if (shift) begin 					 //shift


			registroFijo <= {registroSuma[0],registroFijo[4:1]};
			registroSuma <= {registroSuma[3],registroSuma[3:1]};
			
		end
	end
	

	
	
	

	
endmodule