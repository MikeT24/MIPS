module fullAdder(
	input [31:0] A,
	input [31:0] B,
	input [3:0] add,
	output logic [31:0] resAdd);
	
	parameter SUMA       = 0;
	parameter RESTA      = 1;
	parameter ABS		   = 2;
	parameter IGUAL      = 3;
	parameter AND        = 4;
	parameter OR         = 5;
	parameter XOR        = 6;
	parameter SLT        = 7;
	
	reg Cin;
	reg [3:0] B2;
	wire [3:0] S;
	
	always_comb begin				//ALU Operations (except multi)
		case(add)
			SUMA:			resAdd = A + B;
			RESTA:		resAdd = A - B;
			IGUAL: 		resAdd = A;
			AND:			resAdd = A & B;
			OR:			resAdd = A | B;
			XOR:			resAdd = A ^ B;
			SLT:			resAdd = A < B;
			ABS: 			begin
				if (A[31]==0)
					resAdd = A;
				else 
					resAdd = ~A + 1;
			end
			
			default: 	resAdd = A + B;	
		endcase
	end
	
	
endmodule
	