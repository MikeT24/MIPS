module MIPS_tb2 ();
  
  logic clk;
  logic rst;
  integer i;
  integer j;

  MIPS uut(.clk(clk), .rst(rst));
  
  
  initial begin
    rst = 1;
    clk = 0;
  #20;
  
    
    rst = 0;
  #10;
    for(j = 0; j<1024; j= j +1) begin
      uut.DataMemory.regData[j] = 0;
  end
    
    
    uut.DataMemory.regData[0] = 0; 
    uut.DataMemory.regData[1] = 10; 
    uut.DataMemory.regData[2] = 9; 
    uut.DataMemory.regData[3] = 8; 
    uut.DataMemory.regData[4] = 7; 
    uut.DataMemory.regData[5] = 6; 
    uut.DataMemory.regData[6] = 5; 
    uut.DataMemory.regData[7] = 4; 
    uut.DataMemory.regData[8] = 3; 
    uut.DataMemory.regData[9] = 2; 
   
   
  for(j = 0; j<512; j= j +1) begin
      uut.InstructionMemory.regData[j] = 0;
  end
  
  for(j = 0; j<128; j= j +1) begin
      uut.RegBank.RegBank[j] = 0;
  end
  #10;
  uut.InstructionMemory.regData[0] = 0;  
  uut.InstructionMemory.regData[1] = 2080;
  uut.InstructionMemory.regData[2] = 604110857;
  uut.InstructionMemory.regData[3] = 2351104000;
  uut.InstructionMemory.regData[4] = 539033601;
  uut.InstructionMemory.regData[5] = 2351169536;
  uut.InstructionMemory.regData[6] = 8595498;
  uut.InstructionMemory.regData[7] = 279052289;
  uut.InstructionMemory.regData[8] = 8394784;
  uut.InstructionMemory.regData[9] = 270663681;        //ADDI
  uut.InstructionMemory.regData[10] = 134217732;
  uut.InstructionMemory.regData[11] = 2887974917;      //ADDIU
  uut.InstructionMemory.regData[12] = 0;
  uut.InstructionMemory.regData[13] = 0;               //BEQ
  uut.InstructionMemory.regData[14] = 0;
  uut.InstructionMemory.regData[15] = 0;
  uut.InstructionMemory.regData[16] = 0;
  uut.InstructionMemory.regData[17] = 0;
  uut.InstructionMemory.regData[18] = 0;
  uut.InstructionMemory.regData[19] = 0;
  uut.InstructionMemory.regData[21] = 0;
  uut.InstructionMemory.regData[23] = 0;

  
    #40;
    rst = 1;
        
    
end
  initial begin 
    forever #5 clk = ~clk;
  end
endmodule
2080

