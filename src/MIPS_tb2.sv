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
  for(j = 0; j<1024; j= j +1) begin
      uut.DataMemory.data_mem_ff[j] = 0;
  end
  
  // INSTRUCTION DATA INITIALIZATION
  for(j = 0; j<512; j= j +1) begin
      uut.InstructionMemory.regData[j] = 0;
  end
  
  // REG BANK INIT (PREVENTS X)
  for(j = 0; j<128; j= j +1) begin
      uut.RegBank.RegBank[j] = 0;
  end


//STORED PROGRAM
  uut.InstructionMemory.regData[0]  = 32'h00000000;  
  uut.InstructionMemory.regData[1]  = 32'h00000820;
  uut.InstructionMemory.regData[2]  = 32'h20020024;
  uut.InstructionMemory.regData[3]  = 32'h8c230000;
  uut.InstructionMemory.regData[4]  = 32'h20210004;
  uut.InstructionMemory.regData[5]  = 32'h8c240000;
  uut.InstructionMemory.regData[6]  = 32'h0083282a;
  uut.InstructionMemory.regData[7]  = 32'h10a00001;
  uut.InstructionMemory.regData[8]  = 32'h00801820;
  uut.InstructionMemory.regData[9]  = 32'h10220001;
  uut.InstructionMemory.regData[10] = 32'h08100004;
  uut.InstructionMemory.regData[11] = 32'hac230004;
  uut.InstructionMemory.regData[12] = 32'h20000000;
  uut.InstructionMemory.regData[13] = 32'h0810000c;
  uut.InstructionMemory.regData[14] = 32'h0;



  
    #40;
    rst = 0;

  // DATA MEMORY EDIT
    uut.DataMemory.data_mem_ff[0]   = 10; 
    uut.DataMemory.data_mem_ff[1]   = 9; 
    uut.DataMemory.data_mem_ff[2]   = 8; 
    uut.DataMemory.data_mem_ff[3]   = 7;
    uut.DataMemory.data_mem_ff[4]   = 6;
    uut.DataMemory.data_mem_ff[5]   = 5;
    uut.DataMemory.data_mem_ff[6]   = 4;
    uut.DataMemory.data_mem_ff[7]   = 3;
    uut.DataMemory.data_mem_ff[8]   = 2;
    uut.DataMemory.data_mem_ff[9]   = 1;
    uut.DataMemory.data_mem_ff[10]  = 0;
    uut.DataMemory.data_mem_ff[11]  = 0;
    uut.DataMemory.data_mem_ff[12]  = 0;


    // uut.DataMemory.data_mem_ff[0]   = 0; 
    // uut.DataMemory.data_mem_ff[1]   = 1; 
    // uut.DataMemory.data_mem_ff[2]   = 2; 
    // uut.DataMemory.data_mem_ff[3]   = 3;
    // uut.DataMemory.data_mem_ff[4]   = 4;
    // uut.DataMemory.data_mem_ff[5]   = 5;
    // uut.DataMemory.data_mem_ff[6]   = 6;
    // uut.DataMemory.data_mem_ff[7]   = 7;
    // uut.DataMemory.data_mem_ff[8]   = 8;
    // uut.DataMemory.data_mem_ff[9]   = 9;
    // uut.DataMemory.data_mem_ff[10]  = 10;
    // uut.DataMemory.data_mem_ff[11]  = 0;
    // uut.DataMemory.data_mem_ff[12]  = 0;    

end
  initial begin 
    forever #5 clk = ~clk;
  end
endmodule


