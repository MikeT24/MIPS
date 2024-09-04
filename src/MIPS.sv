
import mips_pkg::*;

`include "mips_header.svh"

module MIPS_core (
	input clk,
	input rst);
	
	logic [ADDRESS_32_W-1:0] CurrPc_Branch;
	logic [ADDRESS_32_W-1:0] pcOut;
	
	logic [ADDRESS_32_W-1:0] pcOut_plus4;
	logic [ADDRESS_32_W-1:0] pcOut_Branch;
	
	t_alu_opcode alu_control;																	//temp variables control unit
	logic RegDst;
	logic Branch;
	logic MemRead;
	logic MemToReg;
	logic MemWrite;
	logic ALUSrc;
	logic RegWrite;
	
	logic zero;																				//zero flag from ALU
	
	logic [DATA_32_W-1:0] muxALUSrc;																	//ALU SOURCE	
	logic [DATA_32_W-1:0] signExt;																	//Sign Extend
	
	logic [REG_ADDR_W:0] muxWriteReg; 																//Muxes for registers
	logic [DATA_32_W-1:0] muxMemToReg;																
	logic [DATA_32_W-1:0] AddressData;																//ALU resultado
	logic [DATA_32_W-1:0] ReadDataMem;																//Data from data memory
	logic [DATA_32_W-1:0] ReadData1;																	//Read Data from RegBank
	logic [DATA_32_W-1:0] ReadData2;
	logic [DATA_32_W-1:0] Instruction;
	logic BeqValid;
	logic Jump;
	
	logic [ADDRESS_32_W-1:0] CurrentAddress;	
	logic [ADDRESS_32_W-1:0] CurrPc_Jump;
	
	logic [ADDRESS_32_W-1:0] signExt_shift;

	// ------------------------------------------------------
	// CurrentAddress Selection 
	// ------------------------------------------------------

	// Muxes for Program Counter Jump
	assign CurrPc_Branch = (BeqValid)? pcOut_Branch :  pcOut_plus4; // Branch Mux
	assign CurrentAddress = (Jump)? CurrPc_Jump : CurrPc_Branch;	// Jump Mux


	// ------------------------------------------------------
	// Jump Address Generation
	// ------------------------------------------------------	
	// TODO: Should a MUX be added to tie to zero in case instruction is not a JUMP? 
	assign CurrPc_Jump = {4'h0, Instruction[26:0],2'h0};

	// ------------------------------------------------------
	// Next Address INCREMENT 4
	// ------------------------------------------------------	
	// Instruction Address Increment by 4	
	incrementer incrementer(			
		.instruction(pcOut), 
		.pcOut_plus4(pcOut_plus4));

	// ------------------------------------------------------
	// Branch Address Generation
	// ------------------------------------------------------	
 	// Branch Instruction Adder
 	// This is adding the result of the immidiate sign extended, shifted by 2 value
 	//	With the current PC Address
	adderInstruction adder(
		.pcOut_plus4(pcOut_plus4),		// +4 Incrementer output
		.SignExtend(signExt_shift),		// Sign_extend shifted	
		.pcOut_Branch(pcOut_Branch));	// Addition of both inputs	

	// ------------------------------------------------------
	// Sign Extend
	// ------------------------------------------------------	
	assign signExt_shift = {signExt[29:0], 2'h0};


	// ------------------------------------------------------
	// PC Register
	// ------------------------------------------------------	
	pc programCounter(
		.clk(clk), 
		.rst(rst), 
		.pcIn(CurrentAddress), 
		.pcOut(pcOut));
	

	// ------------------------------------------------------
	// Instruction Memory
	// ------------------------------------------------------	
	InstructionMemory InstructionMemory(
		.clk(clk), 
		.Address(pcOut), 
		.ReadData(Instruction), 
		.rst(rst));

	// ------------------------------------------------------
	// Control logic
	// ------------------------------------------------------	
	control control(
		.instruction31_26(Instruction[31:26]), 
		.instruction5_0(Instruction[5:0]), 
		.alu_control(alu_control), 
		.zero(zero),
		.RegDst(RegDst), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemToReg(MemToReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.Jump(Jump),
		.BeqValid(BeqValid)
	);
	

	// ------------------------------------------------------
	// Data Muxes
	// ------------------------------------------------------	
	assign muxWriteReg	= (RegDst)?		Instruction[15:11] : Instruction[20:16];
	assign muxALUSrc	= (ALUSrc)?		signExt : ReadData2;
	assign muxMemToReg	= (MemToReg)?	ReadDataMem : AddressData;

	
	RegBank #(
    	.REG_FILE_DEPTH(32)
	) RegBank (
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
	
	ALU ALU(
		.alu_src_a(ReadData1), 
		.alu_src_b(muxALUSrc), 
		.alu_ctrl(alu_control), 
		.alu_result(AddressData), 
		.alu_zero(zero)
	);
	
	DataMemory #(
    .DATA_MEM_DEPTH(`DATA_MEM_DEPTH)
	) DataMemory (
		.clk(clk), 
		.rst(rst), 
		.MemWrite(MemWrite), 
		//.MemRead(MemRead), 
		.Address(AddressData[$clog2(`DATA_MEM_DEPTH) - 1:0]), 
		.WriteData(ReadData2), 
		.ReadData(ReadDataMem)
	);
	
endmodule
	
	