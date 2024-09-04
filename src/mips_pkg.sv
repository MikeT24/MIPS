package mips_pkg;
`include "mips_header.svh"

// Some of this code is reused from the RISC_V done by me.

parameter ADDRESS_32_W = 32;
parameter DATA_32_W = ADDRESS_32_W;
parameter INSTR_32_W  = 32;
parameter REG_ADDR_W = 5;
parameter INSTR_OPCODE_W = 6;
parameter FUNCT3_W = 3;
parameter FUNCT7_W = 7;
parameter U_IMM_W = 25;
parameter PC_CNT_ADDR_WIDTH = `INST_MEM_DEPTH ;
parameter PC_CNT_ADDR_SIZE = $clog2(PC_CNT_ADDR_WIDTH);
parameter GPIO_BYTE = 8;

parameter CLK_DIV_NAT = 4; 
parameter CLK_DIV = $clog2(CLK_DIV_NAT) ; // ONLY COMPATIBLE WITH BINARY VALUES! 
//parameter CLK_DIV = 500;

// .text    --> 0x00400000
// .data    --> 0x10010000
// .stack   --> 0x7fffeffc
// .MMIO    --> 0xffff0000

parameter STACK_UPPER   = 32'h7fffeffc;
parameter TEXT_LOWER    = 32'h00400000;
parameter DATA_LOWER    = 32'h10010000;
parameter MMIO_LOWER    = 32'hffff0000;


typedef logic [REG_ADDR_W - 1:0] t_register_addr; 
//typedef logic [INSTR_OPCODE_W - 1:0] t_instr_opcode;
typedef logic [ADDRESS_32_W - 1:0] t_pc_addr;
//typedef logic [] t_mnemonic;

typedef struct packed {
    logic [6:0] funct7;
    logic [2:0] funct3;
    logic [6:0] opcode;
} t_current_operation;


// Instruction types 
parameter INST_OPCODE_MSB       = 6;
parameter INST_RD_LSB           = INST_OPCODE_MSB + 1;                  //7
parameter INST_RD_MSB           = INST_RD_LSB + REG_ADDR_W - 1;         //11
parameter INST_FUNCT3_LSB       = INST_RD_MSB + 1;                      //12
parameter INST_FUNCT3_MSB       = INST_FUNCT3_LSB + FUNCT3_W - 1;       //14                        
parameter INST_RS1_LSB          = INST_FUNCT3_MSB + 1;                  //15
parameter INST_RS1_MSB          = INST_RS1_LSB + REG_ADDR_W - 1;        //19
parameter INST_RS2_LSB          = INST_RS1_MSB + 1;                     //20
parameter INST_RS2_MSB          = INST_RS2_LSB + REG_ADDR_W - 1;        //24
parameter INST_FUNCT7_LSB       = INST_RS2_MSB + 1;                     //25
parameter INST_FUNCT7_MSB       = INST_FUNCT7_LSB + FUNCT7_W - 1;            //31
    

typedef enum logic [3:0] {
    ALU_ADD,    //0
    ALU_SUB,    //1
    ALU_SLL,    //2
    ALU_SLT,    //3
    ALU_ABS,    //4
    ALU_XOR,    //5
    ALU_SRL,    //6
    ALU_SRA,    //7
    ALU_OR,     //8
    ALU_AND     //9
} t_alu_opcode;

//typedef enum logic[INSTR_OPCODE_W-1:0] {
	parameter ZERO        = 6'b0;
	parameter ADD 		= 6'b100000;
	parameter AND 		= 6'b100100;
	parameter MULT        = 6'b011000;
	parameter MULTU       = 6'b011001;
	parameter OR          = 6'b100101;
	parameter SLT	        = 6'b101010;
	parameter SUB	        = 6'b100010;
	parameter XOR         = 6'b100110;
//} t_instr5_0_opcode;

//typedef enum logic[INSTR_OPCODE_W-1:0] {
	parameter ADDI		= 6'b001000;
	parameter ADDIU		= 6'b001001;
	parameter BEQ 		= 6'b000100;
	parameter LW          = 6'b100011;
	parameter SW          = 6'b101011;
	parameter JUMP		= 6'b000010;
	parameter ABS         = 6'b100001;
//} t_instr_31_26_opcode;


typedef enum logic [INSTR_OPCODE_W-1:0] {
    NEM_ZERO        = 6'b0,
    NEM_ADD 		= 6'b100000,
    NEM_AND 		= 6'b100100,
    NEM_MULT        = 6'b011000,
    NEM_MULTU       = 6'b011001,
    NEM_OR          = 6'b100101,
    NEM_SLT	        = 6'b101010,
    NEM_SUB	        = 6'b100010,
    NEM_XOR         = 6'b100110,
    NEM_ADDI		= 6'b001000,
    NEM_ADDIU		= 6'b001001,
    NEM_BEQ 		= 6'b000100,
    NEM_LW          = 6'b100011,
    NEM_SW          = 6'b101011,
    NEM_JUMP		= 6'b000010,
    NEM_ABS         = 6'b100001
} t_instr_pnmen;

typedef enum {
    //R-TYPE
    OP_ADD, 
    OP_SUB, 
    OP_XOR, 
    OP_OR, 
    OP_AND, 
    OP_SLL, 
    OP_SRL, 
    OP_SRA, 
    OP_SLT, 
    OP_SLTU,
    //I-TYPE
    OP_ADDI, 
    OP_XORI, 
    OP_ORI, 
    OP_ANDI, 
    OP_SLLI, 
    OP_SRLI, 
    OP_SRAI, 
    OP_SLTI,
    OP_SLTIU, 
    OP_LB, 
    OP_LH, 
    OP_LW, 
    OP_LBU, 
    OP_LHU, 
    OP_JALR, 
    OP_ECALL, 
    OP_EBREAK,
    //S-TYPE
    OP_SB, 
    OP_SH, 
    OP_SW,
    //B-TYPE
    OP_BEQ, 
    OP_BNE, 
    OP_BLT, 
    OP_BGE, 
    OP_BLTU, 
    OP_BGEU,
    //J-TYPE
    OP_JAL,
    //U-TYPE
    OP_LUI, 
    OP_AUIPC,
    //INVALID
    OP_NA
} t_instr_nmemonic;

typedef enum logic[REG_ADDR_W-1:0] { 
    ZZERO    = 5'd0,
    RA      = 5'd1,
    SP      = 5'd2,
    GP      = 5'd3,
    TP      = 5'd4,
    T0      = 5'd5,
    T1      = 5'd6,
    T2      = 5'd7,
    S0      = 5'd8,
    S1      = 5'd9,
    A0      = 5'd10,
    A1      = 5'd11,
    A2      = 5'd12,
    A3      = 5'd13,
    A4      = 5'd14,
    A5      = 5'd15,
    A6      = 5'd16,
    A7      = 5'd17,
    S2      = 5'd18,
    S3      = 5'd19,
    S4      = 5'd20,
    S5      = 5'd21,
    S6      = 5'd22,
    S7      = 5'd23,
    S8      = 5'd24,
    S9      = 5'd25,
    S10     = 5'd26,
    S11     = 5'd27,
    T3      = 5'd28,
    T4      = 5'd29,
    T5      = 5'd30,
    T6      = 5'd31
} t_instr_register;




parameter DATA_MAPPING_STACK_DIV = `DATA_MEM_DEPTH / 2;
parameter MEM_MAP_STACK_UPPER_LIMIT = STACK_UPPER;                                     // Stack upper limit definition
parameter MEM_MAP_STACK_LOWER_LIMIT = MEM_MAP_STACK_UPPER_LIMIT - DATA_MAPPING_STACK_DIV;       // Stack lower limit = stack upper limit, and static division we are setting
parameter MEM_MAP_DATA_LOWER_LIMIT = DATA_LOWER;
parameter MEM_MAP_DATA_UPPER_LIMIT = MEM_MAP_DATA_LOWER_LIMIT + DATA_MAPPING_STACK_DIV - 1;     
parameter MEM_MAP_TEXT_LOWER_LIMIT = TEXT_LOWER;
parameter MEM_MAP_TEXT_UPPER_LIMIT = MEM_MAP_TEXT_LOWER_LIMIT + `INST_MEM_DEPTH;
parameter MEM_MAP_MMIO_UPPER_LIMIT = MMIO_LOWER + `MMIO_MEM_SIZE;
parameter MEM_MAP_MMIO_LOWER_LIMIT = MMIO_LOWER;


endpackage