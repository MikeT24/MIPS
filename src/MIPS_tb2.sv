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

  // STORED PROGRAM
  uut.InstructionMemory.regData[0]  = 0;  
  uut.InstructionMemory.regData[1]  = 32'h20010001;
  uut.InstructionMemory.regData[2]  = 32'h20020002;
  uut.InstructionMemory.regData[3]  = 32'h20030003;
  uut.InstructionMemory.regData[4]  = 32'h20040004;
  uut.InstructionMemory.regData[5]  = 32'h20050005;
  uut.InstructionMemory.regData[6]  = 32'h20060006;
  uut.InstructionMemory.regData[7]  = 32'h20070007;
  uut.InstructionMemory.regData[8]  = 32'h20080008;
  uut.InstructionMemory.regData[9]  = 32'h20090009;
  uut.InstructionMemory.regData[10] = 32'h200a000a;
  uut.InstructionMemory.regData[11] = 32'h200b000b;
  uut.InstructionMemory.regData[12] = 32'h200c000c;
  uut.InstructionMemory.regData[13] = 32'h200d000d;
  uut.InstructionMemory.regData[14] = 32'h200e000e;
  uut.InstructionMemory.regData[15] = 32'h200f000f;
  uut.InstructionMemory.regData[16] = 32'h20101001;
  uut.InstructionMemory.regData[17] = 32'h00000000; 
  uut.InstructionMemory.regData[18] = 32'hafef0000;
  uut.InstructionMemory.regData[19] = 32'h8fee0000;
  uut.InstructionMemory.regData[20] = 32'h00420820;
  uut.InstructionMemory.regData[21] = 32'h00252020;
  uut.InstructionMemory.regData[22] = 32'h00273020;
  uut.InstructionMemory.regData[23] = 32'h00294020;
  uut.InstructionMemory.regData[24] = 32'h00252020;
  uut.InstructionMemory.regData[25] = 32'h00220820;
  uut.InstructionMemory.regData[26] = 32'h00230820;
  uut.InstructionMemory.regData[27] = 32'h00240820;
  uut.InstructionMemory.regData[28] = 32'h002f8825;
  uut.InstructionMemory.regData[29] = 32'h002f8824;
  uut.InstructionMemory.regData[30] = 32'h0023882a;
  uut.InstructionMemory.regData[31] = 32'h0061882a;
  uut.InstructionMemory.regData[32] = 32'h01ee8822;
  uut.InstructionMemory.regData[33] = 32'h002f8826;
  uut.InstructionMemory.regData[34] = 32'h000f8882;
  uut.InstructionMemory.regData[35] = 32'h000f8883;
  uut.InstructionMemory.regData[36] = 32'h000f8e00;
  uut.InstructionMemory.regData[37] = 32'h000f0fc3;
  uut.InstructionMemory.regData[38] = 32'h002f8826;
  uut.InstructionMemory.regData[39] = 32'h02218823;
  uut.InstructionMemory.regData[40] = 32'h35f10001;
  uut.InstructionMemory.regData[41] = 32'h31f10001;
  uut.InstructionMemory.regData[42] = 32'h39f10001;
  uut.InstructionMemory.regData[43] = 32'h00000000;
  uut.InstructionMemory.regData[44] = 32'h00000000;
  uut.InstructionMemory.regData[45] = 32'h10010003;
  uut.InstructionMemory.regData[46] = 32'h10210002;
  uut.InstructionMemory.regData[47] = 32'h00000000;
  uut.InstructionMemory.regData[48] = 32'h00000000;
  uut.InstructionMemory.regData[49] = 32'h22310001;
  uut.InstructionMemory.regData[50] = 32'h08100030;  
  
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


