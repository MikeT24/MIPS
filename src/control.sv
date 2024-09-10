import mips_pkg::*;

`include "mips_header.svh"
// SUPPOSE ALL THE STAGES HERE ARE DECODE UNLESS NOTED EXPLICITLY
module control (
	input logic clk,
	input logic rst,
	input logic [5:0] instruction31_26,
	input logic [5:0] instruction5_0,
	input logic [DATA_32_W-1:0] Instruction_D,
	input logic zero_X,
	input logic Instruction_Flush,
	output t_alu_opcode alu_control,
	output logic RegDst,
	output logic Branch,
	output logic MemRead,
	output logic MemToReg,
	output logic MemWrite,
	output logic ALUSrc,
	output logic RegWrite,
	output logic Jump,
	output logic BeqValid_X,
	output t_instr_pnmen instr_pnem_D,
	output t_instr_pnmen instr_pnem_X,
	output t_instr_pnmen instr_pnem_M,
	output t_instr_pnmen instr_pnem_W
);

// Pnmemonic for the instruction


logic Branch_X;
// Branching logic 


// Instruction Pnemonic
always_ff @(posedge clk) begin
    if (rst) instr_pnem_X <= NEM_ZERO;				
	else	 instr_pnem_X <= instr_pnem_D;					
end		

always_ff @(posedge clk) begin
    if (rst) instr_pnem_M <= NEM_ZERO;				
	else	 instr_pnem_M <= instr_pnem_X;					
end		

always_ff @(posedge clk) begin
    if (rst) instr_pnem_W <= NEM_ZERO;				
	else	 instr_pnem_W <= instr_pnem_M;					
end		


// ONLY BEQ SUPPPORTED
`MIKE_FF_RST(Branch_X, Branch, clk, rst) ;
// ONLY BEQ SUPPPORTED
assign BeqValid_X = (Branch_X & zero_X)?  1'b1 : 1'b0;					

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
					SRA: begin
						RegDst		= 1;
						RegWrite	= 1;
						ALUSrc		= 0;
						alu_control	= ALU_SRA;
						MemWrite	= 0;
						MemRead		= 0;
						MemToReg	= 0;
						Branch		= 0;
						instr_pnem_D = NEM_SRA;
					end			
					SRL: begin
						RegDst		= 1;
						RegWrite	= 1;
						ALUSrc		= 0;
						alu_control	= ALU_SRL;
						MemWrite	= 0;
						MemRead		= 0;
						MemToReg	= 0;
						Branch		= 0;
						instr_pnem_D = NEM_SRL;
					end		
					SLL: begin  // SRA 
						if (|Instruction_D == 1'b1) begin 
							RegDst		= 1;
							RegWrite	= 1;
							ALUSrc		= 0;
							alu_control	= ALU_SLL;
							MemWrite	= 0;
							MemRead		= 0;
							MemToReg	= 0;
							Branch		= 0;
							instr_pnem_D = NEM_SLL;
						end
						else  begin
							RegDst		= 0;
							RegWrite	= 0;
							ALUSrc		= 0;
							alu_control	= ALU_ADD;
							MemWrite	= 0;
							MemRead		= 0;
							MemToReg	= 0;
							Branch		= 0;
							instr_pnem_D = NEM_ZERO;
						end
					end
					MULT: begin
						RegDst		= 1;
						RegWrite	= 1;
						ALUSrc		= 0;
						alu_control	= ALU_ADD;
						MemWrite	= 0;
						MemRead		= 0;
						MemToReg	= 0;
						Branch		= 0;
						instr_pnem_D = NEM_MULT;					
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
