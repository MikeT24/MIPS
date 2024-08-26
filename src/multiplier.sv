module multiplier(
	input [3:0] a,						   //inputs
	input [3:0] b,
	input rstEx,
	input clk,
	input start,
	output logic [7:0] result,    			//combi output
	output logic [7:0] out2,  			//reg output
	output logic done,
	output logic minusMulti);

	logic [3:0] a2;							// input register a 
	logic [4:0] b2;							//value for injecting 0
		
	assign b2 = {b[3:0],1'b0};  		//injecting a zero 

	logic enableFFin;
	logic [4:0] b3;							//input register b

	always_ff @ (posedge clk) begin     //input reg implementation
		if(~rstEx) begin
			a2 <= 0;
			b3 <= 0;
		end
		else if (enableFFin) begin
			a2 <= a;
			b3 <= b2;
		end
	end
		logic enableFijo;
		logic [3:0] suma;
		logic shift;
		logic load;
		logic [4:0] registroFijo;
		logic [3:0] registroSuma;
		logic add;
		logic [1:0] xy;
		logic rst;
		logic save;
		logic saveTmp;

		fsm fsm (.start(start), .rstFSM(~rstEx), .done(done), .enableFFin(enableFFin), .load(load), .enableFijo(enableFijo), .shift(shift), .rst(rst), .clk(clk));

		registroChido register(.suma(suma), .multiplierIn(b3), .clk(clk), .shift(shift), .rst(rst), .enableFijo(enableFijo), .load(load), .registroFijo(registroFijo), .registroSuma(registroSuma));

		adder adder(.a(a2), .b(registroSuma), .xy(registroFijo[1:0]), .suma(suma));

		counter counterDone(.shift(shift), .clk(clk), .rst(rst), .done(done), .save(save));

		assign result = {registroSuma[3:0], registroFijo[4:1]};

		always_ff @ (posedge clk) begin         //reg for delaying one clock cycle the output reg
			if(~rstEx)
				saveTmp <= 0;
			else
				saveTmp <= save;
		end

		always_ff @ (posedge clk) begin			//output reg
		if(~rstEx)
			out2 <= 0;
		else if (saveTmp)
			out2 <= result;
		else
			out2 <= out2;
		end
		

		assign minusMulti = (a[3]^b[3]);


		endmodule
