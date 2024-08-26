module control (
	input [5:0] instruction31_26,
	input [5:0] instruction5_0,
	output logic [3:0] alu_control,
	output logic RegDst,
	output logic Branch,
	output logic MemRead,
	output logic MemToReg,
	output logic MemWrite,
	output logic ALUSrc,
	output logic RegWrite,
	output logic Jump);

	parameter zero 	= 0;
	parameter ADD 		= 6'b100000;
	parameter AND 		= 6'b100100;
	parameter MULT 	  = 6'b011000;
	parameter MULTU 	= 6'b011001;
	parameter OR			= 6'b100101;
	parameter SLT			= 6'b101010;
	parameter SUB			= 6'b100010;
	parameter XOR			= 6'b100110;


	parameter ADDI		= 6'b001000;
	parameter ADDIU		= 6'b001001;
	parameter BEQ 		= 6'b000100;
	parameter LW 			= 6'b100011;
	parameter SW			= 6'b101011;
	parameter JUMP		= 6'b000010;
	parameter ABS			= 6'b100001;

	always_comb begin
	Jump 			= 0;
	RegDst		= 0;
	RegWrite		= 0;
	ALUSrc		= 0;
	alu_control	= 0;
	MemWrite		= 0;
	MemRead		= 0;
	MemToReg		= 0;
	Branch		= 0;
		case(instruction31_26)
			zero: begin
				case(instruction5_0)
					ADD: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 0;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					AND: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 4;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					OR: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 5;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					SLT: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 7;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					SUB: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 1;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					XOR: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= 6;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end
					zero: begin
						RegDst		= 0;
						RegWrite		= 0;
						ALUSrc		= 0;
						alu_control	= 3;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
					end

				endcase
			end
			ADDI: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= 0;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
			end
			ADDIU: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= 0;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
			end
			BEQ: begin
				RegDst		= 1'bx;
				RegWrite		= 0;
				ALUSrc		= 0;
				alu_control	= 1;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 1'bx;
				Branch		= 1;
			end
			LW: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= 0;
				MemWrite		= 0;
				MemRead		= 1;
				MemToReg		= 1;
				Branch		= 0;
			end
			SW: begin
				RegDst		= 1'bx;
				RegWrite		= 0;
				ALUSrc		= 1;
				alu_control	= 0;
				MemWrite		= 1;
				MemRead		= 0;
				MemToReg		= 1'bx;
				Branch		= 0;
			end
			JUMP: begin
				RegDst		= 0;
				RegWrite		= 0;
				ALUSrc		= 0;
				alu_control	= 0;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
				Jump			= 1;
			end
			ABS: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 0;
				alu_control	= 2;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
			end
		endcase
	end

endmodule
