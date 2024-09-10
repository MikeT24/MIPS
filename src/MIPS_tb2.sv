import mips_pkg::*;

`include "mips_header.svh"
module MIPS_tb_HW ();
  
  logic clk;
  logic rst;
  integer i;
  integer j;

  MIPS_core uut(.clk(clk), .rst(rst));
  
  
  initial begin
    rst = 1;
    clk = 0;
  #20;
  

  // DATA MEMORY INITIALIZATION
  for(j = 0; j<`DATA_MEM_DEPTH; j= j +1) begin
      uut.DataMemory.data_mem_ff[j] = 0;
  end
  
  // INSTRUCTION DATA INITIALIZATION
  for(j = 0; j<512; j= j +1) begin
      uut.InstructionMemory.regData[j] = 0;
  end
  
  // REG BANK INIT (PREVENTS X)
  for(j = 0; j<32; j= j +1) begin
      uut.RegBank.reg_file_ff[j] = 0;
  end

  // SLL SEARCH AND REPLACE h0010fc00

  // STORED PROGRAM
  uut.InstructionMemory.regData[0]  = 0;  
  uut.InstructionMemory.regData[1]  = 32'h2001000f;
  uut.InstructionMemory.regData[2]  = 32'h20020002;
  uut.InstructionMemory.regData[3]  = 32'h00220018;
  uut.InstructionMemory.regData[4]  = 32'h03e10018;
  uut.InstructionMemory.regData[5]  = 32'h00000018;
  uut.InstructionMemory.regData[6]  = 32'h00000000;
  uut.InstructionMemory.regData[7]  = 32'h00000000;
  uut.InstructionMemory.regData[8]  = 32'h00000000;
  uut.InstructionMemory.regData[9]  = 32'h0;
  uut.InstructionMemory.regData[10] = 32'h0;
  uut.InstructionMemory.regData[11] = 32'h0;
  uut.InstructionMemory.regData[12] = 32'h0;
  uut.InstructionMemory.regData[13] = 32'h0;
  uut.InstructionMemory.regData[14] = 32'h0;
  uut.InstructionMemory.regData[15] = 32'h0;
  uut.InstructionMemory.regData[16] = 32'h0;
  uut.InstructionMemory.regData[17] = 32'h0;
  uut.InstructionMemory.regData[18] = 32'h0;
  uut.InstructionMemory.regData[19] = 32'h0;
  uut.InstructionMemory.regData[20] = 32'h0;
  uut.InstructionMemory.regData[21] = 32'h0;
  uut.InstructionMemory.regData[22] = 32'h0;
  uut.InstructionMemory.regData[23] = 32'h0;
  uut.InstructionMemory.regData[24] = 32'h0;
  uut.InstructionMemory.regData[25] = 32'h0;
  uut.InstructionMemory.regData[26] = 32'h0;
  uut.InstructionMemory.regData[27] = 32'h0; 
  uut.InstructionMemory.regData[28] = 32'h0;
  uut.InstructionMemory.regData[29] = 32'h0;
  uut.InstructionMemory.regData[30] = 32'h0;
  uut.InstructionMemory.regData[31] = 32'h0;
  uut.InstructionMemory.regData[32] = 32'h0;
  uut.InstructionMemory.regData[33] = 32'h0;
  uut.InstructionMemory.regData[34] = 32'h0;
  uut.InstructionMemory.regData[35] = 32'h0;
  uut.InstructionMemory.regData[36] = 32'h0;
  uut.InstructionMemory.regData[37] = 32'h0;
  uut.InstructionMemory.regData[38] = 32'h0;
  uut.InstructionMemory.regData[39] = 32'h0;
  uut.InstructionMemory.regData[40] = 32'h0;
  uut.InstructionMemory.regData[41] = 32'h0;
  uut.InstructionMemory.regData[42] = 32'h0;
  uut.InstructionMemory.regData[43] = 32'h0;
  uut.InstructionMemory.regData[44] = 32'h0;
  uut.InstructionMemory.regData[45] = 32'h0;
  uut.InstructionMemory.regData[46] = 32'h0;
  uut.InstructionMemory.regData[47] = 32'h0;
  uut.InstructionMemory.regData[48] = 32'h0;
  uut.InstructionMemory.regData[49] = 32'h0;
  uut.InstructionMemory.regData[50] = 32'h0;  
  
    #40;

  // DATA MEMORY PRELOAD
  // EDIT LINES BELOW FOR PRELOADING THE MEMORY
    // uut.DataMemory.data_mem_ff[0]   = 10; 
    // uut.DataMemory.data_mem_ff[1]   = 9; 
    // uut.DataMemory.data_mem_ff[2]   = 8; 
    // uut.DataMemory.data_mem_ff[3]   = 7;
    // uut.DataMemory.data_mem_ff[4]   = 6;
    // uut.DataMemory.data_mem_ff[5]   = 5;
    // uut.DataMemory.data_mem_ff[6]   = 4;
    // uut.DataMemory.data_mem_ff[7]   = 3;
    // uut.DataMemory.data_mem_ff[8]   = 2;
    // uut.DataMemory.data_mem_ff[9]   = 1;
    // uut.DataMemory.data_mem_ff[10]  = 0;
    // uut.DataMemory.data_mem_ff[11]  = 0;
    // uut.DataMemory.data_mem_ff[12]  = 0;

  // REGISTER PRELOAD

  uut.RegBank.reg_file_ff[31] = 31'h10010000;
  
  rst = 0;


end
  initial begin 
    forever #5 clk = ~clk;
  end
endmodule


