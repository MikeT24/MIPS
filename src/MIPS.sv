
import mips_pkg::*;

`include "mips_header.svh"

module MIPS_core (
	input clk,
	input rst);
	
	logic [9:0] MuxBranch;
	logic [9:0] pcOut;
	
	logic [9:0] instructionB;
	logic [9:0] instructionC;
	
	t_alu_opcode alu_control;																	//temp variables control unit
	logic RegDst;
	logic Branch;
	logic MemRead;
	logic MemToReg;
	logic MemWrite;
	logic ALUSrc;
	logic RegWrite;
	
	logic zero;																				//zero flag from ALU
	
	logic [31:0] muxALUSrc;																	//ALU SOURCE	
	logic [31:0] signExt;																	//Sign Extend
	
	logic [4:0] muxWriteReg; 																//Muxes for registers
	logic [31:0] muxMemToReg;																
	logic [31:0] AddressData;																//ALU resultado
	logic [31:0] ReadDataMem;																//Data from data memory
	logic [31:0] ReadData1;																	//Read Data from RegBank
	logic [31:0] ReadData2;
	logic [31:0] Instruction;
	logic beq_valid;
	
	logic Jump;
	
	logic [9:0] muxJump;	
	logic [9:0] instructionJump;
	
	// ONLY BEQ SUPPPORTED
	assign beq_valid = (Branch & zero)? 1 : 0;					// Exclusive BEQ ONLY
	assign MuxBranch = (beq_valid)? instructionC :  instructionB; // Branch Mux
	assign muxJump = (Jump)? instructionJump : MuxBranch;	// Jump Mux
	
	pc programCounter(
		.clk(clk), 
		.rst(rst), 
		.pcIn(muxJump), 
		.pcOut(pcOut));
	
// Instruction Increment by 4	
	incrementer incrementer(			
		.instruction(pcOut), 
		.instructionB(instructionB));

 // Branch Instruction Adder
 // This is adding the result of the immidiate sign extended, shifted by 2 value
 //	With the current PC Address

	adderInstruction adder(
		 .instructionB(instructionB),	// +4 Incrementer output
		.SignExtend(signExt_shift),			// Sign_extend shifted	
		.instructionC(instructionC));	// Addition of both inputs
	
	// Instruction Memory 
	InstructionMemory InstructionMemory(
		.clk(clk), 
		.Address(pcOut), 
		.ReadData(Instruction), 
		.rst(rst));


	//Control logic
	control control(
		.instruction31_26(Instruction[31:26]), 
		.instruction5_0(Instruction[5:0]), 
		.alu_control(alu_control), 
		.RegDst(RegDst), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemToReg(MemToReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.Jump(Jump));
	
	assign muxWriteReg = (RegDst)? Instruction[15:11] : Instruction[20:16];
	
	RegBank RegBank(
		.clk(clk), 
		.rst(rst), 
		.ReadReg1(Instruction[25:21]), 
		.ReadReg2(Instruction[20:16]), 
		.WriteReg(muxWriteReg), 
		.RegWrite(RegWrite), 
		.WriteData(muxMemToReg), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);
	
	signExtend signExtend(
		.in16(Instruction[15:0]), 
		.out32(signExt)
	);

	logic [31:0] signExt_shift;
	assign signExt_shift = {signExt[31:2], 2'h0};

	assign muxALUSrc = (ALUSrc)? signExt : ReadData2;

	
	ALU ALU(
		.alu_src_a(ReadData1), 
		.alu_src_b(muxALUSrc), 
		.alu_ctrl(alu_control), 
		.alu_result(AddressData), 
		.alu_zero(zero)
	);
	
	assign instructionJump = Instruction[9:0];
	assign muxMemToReg = (MemToReg)? ReadDataMem : AddressData;
	
	
	DataMemory #(
    .DATA_MEM_DEPTH(`DATA_MEM_DEPTH)
	) DataMemory(
		.clk(clk), 
		.rst(rst), 
		.MemWrite(MemWrite), 
		//.MemRead(MemRead), 
		.Address(AddressData[9:0]), 
		.WriteData(ReadData2), 
		.ReadData(ReadDataMem)
	);
	
endmodule
	
	