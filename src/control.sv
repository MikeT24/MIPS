import mips_pkg::*;

`include "mips_header.svh"
// SUPPOSE ALL THE STAGES HERE ARE DECODE UNLESS NOTED EXPLICITLY
module control (
	input logic clk,
	input logic rst,
	input logic [5:0] instruction31_26,
	input logic [5:0] instruction5_0,
	input logic zero_X,
	output t_alu_opcode alu_control,
	output logic RegDst,
	output logic Branch,
	output logic MemRead,
	output logic MemToReg,
	output logic MemWrite,
	output logic ALUSrc,
	output logic RegWrite,
	output logic Jump,
	output logic BeqValid_X
);

// Pnmemonic for the instruction
t_instr_pnmen instr_pnem_D;
t_instr_pnmen instr_pnem_X;
t_instr_pnmen instr_pnem_M;
t_instr_pnmen instr_pnem_W;

logic Branch_X;
// Branching logic 

// ONLY BEQ SUPPPORTED
`MIKE_FF_RST(Branch_X, Branch, clk, rst) ;

`MIKE_FF(instr_pnem_X, instr_pnem_D, clk) ;
`MIKE_FF(instr_pnem_M, instr_pnem_X, clk) ;
`MIKE_FF(instr_pnem_W, instr_pnem_M, clk) ;

assign BeqValid_X = (Branch_X & zero_X)?  1'b1 : 1'b0;					// Exclusive BEQ ONLY


	always_comb begin
	Jump		= 0;
	RegDst		= 0;
	RegWrite	= 0;
	ALUSrc		= 0;
	alu_control	= ALU_ADD;
	MemWrite	= 0;
	MemRead		= 0;
	MemToReg	= 0;
	Branch		= 0;
	instr_pnem_D = NEM_ZERO;
		case(instruction31_26)
			ZERO: begin
				case(instruction5_0)
					ADD: begin
						RegDst		= 1;
						RegWrite	= 1;
						ALUSrc		= 0;
						alu_control	= ALU_ADD;
						MemWrite	= 0;
						MemRead		= 0;
						MemToReg	= 0;
						Branch		= 0;
						instr_pnem_D = NEM_ADD;
					end
					AND: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= ALU_AND;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_AND;
					end
					OR: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= ALU_OR;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_OR;
					end
					SLT: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= ALU_SLT;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_SLT;
					end
					SUB: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= ALU_SUB;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_SUB;
					end
					XOR: begin
						RegDst		= 1;
						RegWrite		= 1;
						ALUSrc		= 0;
						alu_control	= ALU_XOR;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_XOR;
					end
					ZERO: begin
						RegDst		= 0;
						RegWrite		= 0;
						ALUSrc		= 0;
						alu_control	= ALU_ADD;
						MemWrite		= 0;
						MemRead		= 0;
						MemToReg		= 0;
						Branch		= 0;
						instr_pnem_D = NEM_ZERO;
					end

				endcase
			end
			ADDI: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= ALU_ADD;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
				instr_pnem_D = NEM_ADDI;
			end
			ADDIU: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= ALU_ADD;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
				instr_pnem_D = NEM_ADDIU;
			end
			BEQ: begin
				RegDst		= 1'b0;
				RegWrite		= 0;
				ALUSrc		= 0;
				alu_control	= ALU_SUB;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 1'b0;
				Branch		= 1;
				instr_pnem_D = NEM_BEQ;
			end
			LW: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 1;
				alu_control	= ALU_ADD;
				MemWrite		= 0;
				MemRead		= 1;
				MemToReg		= 1;
				Branch		= 0;
				instr_pnem_D = NEM_LW;
			end
			SW: begin
				RegDst		= 1'b0;
				RegWrite		= 0;
				ALUSrc		= 1;
				alu_control	= ALU_ADD;
				MemWrite		= 1;
				MemRead		= 0;
				MemToReg		= 1'b0;
				Branch		= 0;
				instr_pnem_D = NEM_SW;
			end
			JUMP: begin
				RegDst		= 0;
				RegWrite		= 0;
				ALUSrc		= 0;
				alu_control	= ALU_ADD;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
				Jump			= 1;
				instr_pnem_D = NEM_JUMP;
			end
			ABS: begin
				RegDst		= 0;
				RegWrite		= 1;
				ALUSrc		= 0;
				alu_control	= ALU_ABS;
				MemWrite		= 0;
				MemRead		= 0;
				MemToReg		= 0;
				Branch		= 0;
				instr_pnem_D = NEM_ABS;
			end
		endcase
	end

endmodule
