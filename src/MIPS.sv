module MIPS (
	input clk,
	input rst,
	input [31:0] fantasma,
	input finish,
	output [9:0] lcd_data,
	output start,
	output go);
	
	logic [9:0] MuxBranch;
	logic [9:0] MuxBranchTmp;
	logic [9:0] pcOut;
	
	logic [9:0] instructionB;
	logic [9:0] instructionC;
	
	
	logic [3:0] alu_control;																	//temp variables control unit
	logic RegDst;
	logic Branch;
	logic MemRead;
	logic MemToReg;
	logic MemWrite;
	logic ALUSrc;
	logic RegWrite;
	
	logic zero;	
																									//zero flag from ALU
	
	logic [31:0] muxALUSrc;																	//ALU SOURCE	
	logic [31:0] signExt;																		//Sign Extend
	
	logic [4:0] muxWriteReg; 																//Muxes for registers
	logic [31:0] muxMemToReg;																
	
	logic [31:0] AddressData;																//ALU resultado
	
	logic [31:0] ReadDataMem;																//Data from data memory
	
	logic [31:0] ReadData1;																	//Read Data from RegBank
	logic [31:0] ReadData2;
	logic [31:0] Instruction;
	logic tmp;
	
	logic Jump;
	
	logic [9:0] muxJump;	
	logic [9:0] instructionJump;
	
	assign tmp = (Branch & zero)? 1 : 0;
	assign MuxBranch = (tmp)? instructionC :  instructionB;
	assign muxJump = (Jump)? instructionJump : MuxBranch;
	
	pc programCounter(.clk(clk), .rst(rst), .pcIn(muxJump), .pcOut(pcOut));
	
	incrementer incrementer(.instruction(pcOut), .instructionB(instructionB));
	adderInstruction adder(.instructionB(instructionB), .SignExtend(signExt), .instructionC(instructionC));
	

	InstructionMemory InstructionMemory(.clk(clk), .Address(pcOut), .ReadData(Instruction), .rst(rst));
	
	

	
	control control(.instruction31_26(Instruction[31:26]), .instruction5_0(Instruction[5:0]), .alu_control(alu_control), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemToReg(MemToReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .Jump(Jump));
	
																	//REGRESAR 
	assign muxWriteReg = (RegDst)? Instruction[15:11] : Instruction[20:16];
	

	RegBank RegBank(.clk(clk), .rst(rst), .ReadReg1(Instruction[25:21]), .ReadReg2(Instruction[20:16]), .WriteReg(muxWriteReg), .RegWrite(RegWrite), .WriteData(muxMemToReg), .ReadData1(ReadData1), .ReadData2(ReadData2));
	
	
	
	signExtend signExtend(.in16(Instruction[15:0]), .out32(signExt));
	assign muxALUSrc = (ALUSrc)? signExt : ReadData2;

	
	
	ALU ALU(.a(ReadData1), .b(muxALUSrc), .alu_ctrl(alu_control), .clk(clk), .rst(rst), .resultado(AddressData), .zero(zero));
	
	assign instructionJump = Instruction[9:0];
	assign muxMemToReg = (MemToReg)? ReadDataMem : AddressData;
	
	
	DataMemory DataMemory(.finish(finish), .fantasma(fantasma),.lcd_data(lcd_data), .start(start), .clk(clk), .rst(rst), .MemWrite(MemWrite), .MemRead(MemRead), .Address(AddressData[9:0]), .WriteData(ReadData2), .ReadData(ReadDataMem), .go(go));
	
endmodule
	
	