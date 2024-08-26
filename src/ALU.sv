module ALU(
	input [3:0] alu_ctrl,
	input [31:0] a,
	input [31:0] b,
	input clk,
	input rst,
	output logic [31:0] resultado,
	output logic zero);
	

	logic [31:0] resTmp1;
	logic [7:0] resMulti;





	parameter MULTI = 8;
	
	fullAdder SUMA (.A(a), .B(b), .resAdd(resTmp1), .add(alu_ctrl)); 											  	  //combi part of ALU
	
	multiplier mutiplier (.a(a), .b(b), .rstEx(rst), .clk(clk), .start(start), .out2(resMulti));			  //seq part of the ALU (multiplication)
	
	assign resultado = (alu_ctrl[3]==1)? resMulti : resTmp1;    													  //selector of combi and seq
	
	
	always_comb begin 																											  //zero flag
		if(alu_ctrl == 3) 
			zero = 0;
		else if (resultado == 0)
			zero = 1;
		else 
			zero = 0;
	end
	
	
endmodule
	
	