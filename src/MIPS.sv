
import mips_pkg::*;

`include "mips_header.svh"

module MIPS_core (
	input clk,
	input rst);
	
	// FETCH STAGE
	logic [ADDRESS_32_W-1:0] CurrPc_Branch_F;
	
	// PC ADDRESS  -- FETCH STAGE
	logic [ADDRESS_32_W-1:0] pcOut_F;
	logic [ADDRESS_32_W-1:0] pcOut_plus4_F;
	logic [ADDRESS_32_W-1:0] CurrentAddress_F;	
	logic [ADDRESS_32_W-1:0] pcOut_D;
	logic [ADDRESS_32_W-1:0] pcOut_plus4_D;
	logic [ADDRESS_32_W-1:0] CurrentAddress_D;	
	logic [ADDRESS_32_W-1:0] pcOut_X;
	logic [ADDRESS_32_W-1:0] pcOut_plus4_X;
	logic [ADDRESS_32_W-1:0] CurrentAddress_X;	
	logic [ADDRESS_32_W-1:0] pcOut_M;
	logic [ADDRESS_32_W-1:0] pcOut_plus4_M;
	logic [ADDRESS_32_W-1:0] CurrentAddress_M;
	logic [ADDRESS_32_W-1:0] pcOut_W;
	logic [ADDRESS_32_W-1:0] pcOut_plus4_W;
	logic [ADDRESS_32_W-1:0] CurrentAddress_W;

	// F -> D
	`MIKE_FF_RST(pcOut_D, pcOut_F, clk, rst) 
	`MIKE_FF_RST(pcOut_plus4_D, pcOut_plus4_F, clk, rst) 
	`MIKE_FF_RST(CurrentAddress_D, CurrentAddress_F, clk, rst) 
	// D -> X
	`MIKE_FF_RST(pcOut_X, pcOut_D, clk, rst) 
	`MIKE_FF_RST(pcOut_plus4_X, pcOut_plus4_D, clk, rst) 
	`MIKE_FF_RST(CurrentAddress_X, CurrentAddress_D, clk, rst) 
	// X -> M
	`MIKE_FF_RST(pcOut_M, pcOut_X, clk, rst) 
	`MIKE_FF_RST(pcOut_plus4_M, pcOut_plus4_X, clk, rst) 
	`MIKE_FF_RST(CurrentAddress_M, CurrentAddress_X, clk, rst) 
	// M -> W
	`MIKE_FF_RST(pcOut_W, pcOut_M, clk, rst) 
	`MIKE_FF_RST(pcOut_plus4_W, pcOut_plus4_M, clk, rst) 
	`MIKE_FF_RST(CurrentAddress_W, CurrentAddress_M, clk, rst) 


	// INSTRUCTION -- FETCH STATE
	logic [DATA_32_W-1:0] Instruction_F;
	logic [DATA_32_W-1:0] Instruction_D;
	logic [DATA_32_W-1:0] Instruction_X;
	logic [DATA_32_W-1:0] Instruction_M;
	logic [DATA_32_W-1:0] Instruction_W;

	`MIKE_FF_RST(Instruction_D, Instruction_F, clk, rst) 
	`MIKE_FF_RST(Instruction_X, Instruction_D, clk, rst) 
	`MIKE_FF_RST(Instruction_M, Instruction_X, clk, rst) 
	`MIKE_FF_RST(Instruction_W, Instruction_M, clk, rst) 


	// CONTROL FLAGS --- DECODE STAGE
	t_alu_opcode alu_control_D;																	//temp variables control unit
	logic RegDst_D;
	logic Branch_D;
	logic MemRead_D;
	logic MemToReg_D;
	logic MemWrite_D;
	logic ALUSrc_D;
	logic RegWrite_D;
	
	t_alu_opcode alu_control_X;																	//temp variables control unit
	logic RegDst_X;
	logic Branch_X;
	logic MemRead_X;
	logic MemToReg_X;
	logic MemWrite_X;
	logic ALUSrc_X;
	logic RegWrite_X;

	t_alu_opcode alu_control_M;																	//temp variables control unit
	logic RegDst_M;
	logic Branch_M;
	logic MemRead_M;
	logic MemToReg_M;
	logic MemWrite_M;
	logic ALUSrc_M;
	logic RegWrite_M;

	t_alu_opcode alu_control_W;																	//temp variables control unit
	logic RegDst_W;
	logic Branch_W;
	logic MemRead_W;
	logic MemToReg_W;
	logic MemWrite_W;
	logic ALUSrc_W;
	logic RegWrite_W;

	`MIKE_FF(alu_control_X, alu_control_D, clk);
	`MIKE_FF_RST(RegDst_X, RegDst_D, clk, rst) 
	`MIKE_FF_RST(Branch_X, Branch_D, clk, rst) 
	`MIKE_FF_RST(MemRead_X, MemRead_D, clk, rst) 
	`MIKE_FF_RST(MemToReg_X, MemToReg_D, clk, rst) 
	`MIKE_FF_RST(MemWrite_X, MemWrite_D, clk, rst) 
	`MIKE_FF_RST(ALUSrc_X, ALUSrc_D, clk, rst) 
	`MIKE_FF_RST(RegWrite_X, RegWrite_D, clk, rst) 

	`MIKE_FF(alu_control_M, alu_control_X, clk);
	`MIKE_FF_RST(RegDst_M, RegDst_X, clk, rst) 
	`MIKE_FF_RST(Branch_M, Branch_X, clk, rst) 
	`MIKE_FF_RST(MemRead_M, MemRead_X, clk, rst) 
	`MIKE_FF_RST(MemToReg_M, MemToReg_X, clk, rst) 
	`MIKE_FF_RST(MemWrite_M, MemWrite_X, clk, rst) 
	`MIKE_FF_RST(ALUSrc_M, ALUSrc_X, clk, rst) 
	`MIKE_FF_RST(RegWrite_M, RegWrite_X, clk, rst) 
	
	`MIKE_FF(alu_control_W, alu_control_M, clk);
	`MIKE_FF_RST(RegDst_W, RegDst_M, clk, rst) 
	`MIKE_FF_RST(Branch_W, Branch_M, clk, rst) 
	`MIKE_FF_RST(MemRead_W, MemRead_M, clk, rst) 
	`MIKE_FF_RST(MemToReg_W, MemToReg_M, clk, rst) 
	`MIKE_FF_RST(MemWrite_W, MemWrite_M, clk, rst) 
	`MIKE_FF_RST(ALUSrc_W, ALUSrc_M, clk, rst) 
	`MIKE_FF_RST(RegWrite_W, RegWrite_M, clk, rst) 
	
	// DECODE STAGE																			
	logic [DATA_32_W-1:0] signExt_D;					//Sign Extend
	logic [DATA_32_W-1:0] ReadData1_D;					//Read Data from RegBank
	logic [DATA_32_W-1:0] ReadData2_D;					//Read Data from RegBank

	logic [DATA_32_W-1:0] muxALUSrc_X;					//ALU SOURCE	
	logic [DATA_32_W-1:0] signExt_X;
	logic [REG_ADDR_W:0] muxWriteReg_X;					//Muxes for registers
	logic [DATA_32_W-1:0] AddressData_X;				//ALU result
	logic [DATA_32_W-1:0] ReadData1_X;
	logic [DATA_32_W-1:0] ReadData2_X;
	
	logic [DATA_32_W-1:0] muxALUSrc_M;
	logic [DATA_32_W-1:0] signExt_M;
	logic [REG_ADDR_W:0] muxWriteReg_M;
	logic [DATA_32_W-1:0] AddressData_M;
	logic [DATA_32_W-1:0] ReadDataMem_M;				//Data from data memory
	logic [DATA_32_W-1:0] ReadData1_M;
	logic [DATA_32_W-1:0] ReadData2_M;

	logic [DATA_32_W-1:0] muxALUSrc_W;
	logic [DATA_32_W-1:0] signExt_W;
	logic [REG_ADDR_W:0]  muxWriteReg_W;
	logic [DATA_32_W-1:0] muxMemToReg_W;
	logic [DATA_32_W-1:0] AddressData_W;
	logic [DATA_32_W-1:0] ReadDataMem_W;
	logic [DATA_32_W-1:0] ReadData1_W;
	logic [DATA_32_W-1:0] ReadData2_W;

	`MIKE_FF_RST(signExt_X, signExt_D, clk, rst) 
	`MIKE_FF_RST(ReadData1_X, ReadData1_D, clk, rst) 
	`MIKE_FF_RST(ReadData2_X, ReadData2_D, clk, rst) 

	`MIKE_FF_RST(muxALUSrc_M, muxALUSrc_X, clk, rst) 
	`MIKE_FF_RST(signExt_M, signExt_X, clk, rst) 
	`MIKE_FF_RST(muxWriteReg_M, muxWriteReg_X, clk, rst) 
	`MIKE_FF_RST(AddressData_M, AddressData_X, clk, rst) 
	`MIKE_FF_RST(ReadData1_M, ReadData1_X, clk, rst) 
	`MIKE_FF_RST(ReadData2_M, ReadData2_X, clk, rst) 

	`MIKE_FF_RST(muxALUSrc_W, muxALUSrc_M, clk, rst) 
	`MIKE_FF_RST(signExt_W, signExt_M, clk, rst) 
	`MIKE_FF_RST(muxWriteReg_W, muxWriteReg_M, clk, rst) 
	`MIKE_FF_RST(AddressData_W, AddressData_M, clk, rst) 
	`MIKE_FF_RST(ReadDataMem_W, ReadDataMem_M, clk, rst) 
	`MIKE_FF_RST(ReadData1_W, ReadData1_M, clk, rst) 
	`MIKE_FF_RST(ReadData2_W, ReadData2_M, clk, rst) 

	logic Jump_D;
	logic Jump_X;
	logic Jump_M;
	logic Jump_W;

	`MIKE_FF_RST(Jump_X, Jump_D, clk, rst) 
	`MIKE_FF_RST(Jump_M, Jump_X, clk, rst) 
	`MIKE_FF_RST(Jump_W, Jump_M, clk, rst) 

	// EXECUTE STAGE
	logic zero_X;	//zero flag from ALU
	logic zero_M;	//zero flag from ALU
	logic zero_W;	//zero flag from ALU

	`MIKE_FF_RST(zero_M, zero_X, clk, rst) 
	`MIKE_FF_RST(zero_W, zero_M, clk, rst) 

	logic BeqValid_X;
	logic [ADDRESS_32_W-1:0] pcOut_Branch_X;
	logic [ADDRESS_32_W-1:0] CurrPc_Jump_X;
	logic [ADDRESS_32_W-1:0] signExt_shift_X;

	logic BeqValid_M;
	logic [ADDRESS_32_W-1:0] pcOut_Branch_M;
	logic [ADDRESS_32_W-1:0] CurrPc_Jump_M;
	logic [ADDRESS_32_W-1:0] signExt_shift_M;

	logic BeqValid_W;
	logic [ADDRESS_32_W-1:0] pcOut_Branch_W;
	logic [ADDRESS_32_W-1:0] CurrPc_Jump_W;
	logic [ADDRESS_32_W-1:0] signExt_shift_W;

	`MIKE_FF_RST(BeqValid_M, BeqValid_X, clk, rst) 
	`MIKE_FF_RST(pcOut_Branch_M, pcOut_Branch_X, clk, rst) 
	`MIKE_FF_RST(CurrPc_Jump_M, CurrPc_Jump_X, clk, rst) 
	`MIKE_FF_RST(signExt_shift_M, signExt_shift_X, clk, rst) 

	`MIKE_FF_RST(BeqValid_W, BeqValid_M, clk, rst) 
	`MIKE_FF_RST(pcOut_Branch_W, pcOut_Branch_M, clk, rst) 
	`MIKE_FF_RST(CurrPc_Jump_W, CurrPc_Jump_M, clk, rst) 
	`MIKE_FF_RST(signExt_shift_W, signExt_shift_M, clk, rst) 


	// ------------------------------------------------------
	// CurrentAddress_F Selection 
	// ------------------------------------------------------
	// Muxes for Program Counter Jump
	assign CurrPc_Branch_F	= (BeqValid_W)? pcOut_Branch_W :  pcOut_plus4_W;	// Branch Mux
	assign CurrentAddress_F = (Jump_W)? CurrPc_Jump_W : CurrPc_Branch_F;		// Jump Mux


	// ------------------------------------------------------
	// Jump Address Generation
	// ------------------------------------------------------	
	assign CurrPc_Jump_X = {4'h0, Instruction_X[26:0],2'h0};

	// ------------------------------------------------------
	// Next Address INCREMENT 4
	// ------------------------------------------------------	
	// Instruction Address Increment by 4	
	incrementer incrementer(			
		.instruction(pcOut_F), 
		.pcOut_plus4(pcOut_plus4_F));

	// ------------------------------------------------------
	// Branch Address Generation
	// ------------------------------------------------------	
 	// Branch Instruction Adder
 	// This is adding the result of the immidiate sign extended, shifted by 2 value
 	//	With the current PC Address
	adderInstruction adder(
		.pcOut_plus4(pcOut_plus4_X),		// +4 Incrementer output
		.SignExtend(signExt_shift_X),		// Sign_extend shifted	
		.pcOut_Branch(pcOut_Branch_X));	// Addition of both inputs	

	// ------------------------------------------------------
	// Sign Extend
	// ------------------------------------------------------	
	assign signExt_shift_X = {signExt_X[29:0], 2'h0};


	// ------------------------------------------------------
	// PC Register
	// ------------------------------------------------------	
	pc programCounter(
		.clk(clk), 
		.rst(rst), 
		.pcIn(CurrentAddress_F), 
		.pcOut(pcOut_F));
	

	// ------------------------------------------------------
	// Instruction Memory
	// ------------------------------------------------------	
	InstructionMemory InstructionMemory(
		.clk(clk), 
		.Address(pcOut_F), 
		.ReadData(Instruction_F), 
		.rst(rst));

	// ------------------------------------------------------
	// Control logic
	// ------------------------------------------------------	
	control control(
		.clk(clk),
		.rst(rst),
		.instruction31_26(Instruction_D[31:26]), 
		.instruction5_0(Instruction_D[5:0]), 
		.alu_control(alu_control_D), 
		.zero_X(zero_X),
		.RegDst(RegDst_D), 
		.Branch(Branch_D), 
		.MemRead(MemRead_D), 
		.MemToReg(MemToReg_D), 
		.MemWrite(MemWrite_D), 
		.ALUSrc(ALUSrc_D), 
		.RegWrite(RegWrite_D), 
		.Jump(Jump_D),
		.BeqValid_X(BeqValid_X)
	);
	

	// ------------------------------------------------------
	// Data Muxes
	// ------------------------------------------------------	
	// always_comb begin 
	// 	if (RegDst_X)	muxWriteReg_X = Instruction_X[15:11];
	// 	else			muxWriteReg_X = Instruction_X[20:16];
	// end
	assign muxWriteReg_X	= (RegDst_X)?		Instruction_X[15:11] : Instruction_X[20:16];
	assign muxALUSrc_X		= (ALUSrc_X)?		signExt_X : ReadData2_X;
	assign muxMemToReg_W	= (MemToReg_W)?	ReadDataMem_W : AddressData_W;

	
	RegBank #(
    	.REG_FILE_DEPTH(32)
	) RegBank (
		.clk(clk), 
		.rst(rst), 
		.ReadReg1(Instruction_D[25:21]),	//Register is read in D   
		.ReadReg2(Instruction_D[20:16]),	//Register is read in D   
		.WriteReg(muxWriteReg_W),	//Register is written in WB  
		.RegWrite(RegWrite_W),		//Register is written in WB 
		.WriteData(muxMemToReg_W),	//Register is written in WB  
		.ReadData1(ReadData1_D),	//Register is read in D  
		.ReadData2(ReadData2_D)		//Register is read in D  
	);
	
	signExtend signExtend(
		.in16(Instruction_D[15:0]), 
		.out32(signExt_D)
	);
	
	ALU ALU(
		.alu_src_a(ReadData1_X), 
		.alu_src_b(muxALUSrc_X), 
		.alu_ctrl(alu_control_X), 
		.alu_result(AddressData_X), 
		.alu_zero(zero_X)
	);
	
	DataMemory #(
    .DATA_MEM_DEPTH(`DATA_MEM_DEPTH)
	) DataMemory (
		.clk(clk), 
		.rst(rst), 
		.MemWrite(MemWrite_M), 
		//.MemRead(MemRead), 
		.Address(AddressData_M[$clog2(`DATA_MEM_DEPTH) - 1:0]), 
		.WriteData(ReadData2_M), 
		.ReadData(ReadDataMem_M)
	);
	
endmodule
	
	