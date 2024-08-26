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
    uut.DataMemory.regData[20] = 25;
     
  for(j = 0; j<512; j= j +1) begin
      uut.InstructionMemory.regData[j] = 0;
  end
  
  for(j = 0; j<128; j= j +1) begin
      uut.RegBank.RegBank[j] = 0;
  end
  #10;
  uut.InstructionMemory.regData[0]  = 0;  
  uut.InstructionMemory.regData[1]  = 32'b00000000001000101000000000100000; //ADD
  uut.InstructionMemory.regData[2]  = 32'b00000000001000100001100000100101; //OR
  uut.InstructionMemory.regData[3]  = 32'b00000000001000100010000000101010; //SLT
  uut.InstructionMemory.regData[4]  = 32'b00000000001000100010100000100010; //SUB
  uut.InstructionMemory.regData[5]  = 32'b00000000001000100011000000100110; //XOR
  uut.InstructionMemory.regData[6]  = 32'b00000000000000010011100010000000; //SLL
  uut.InstructionMemory.regData[7]  = 32'b00000000000000010100000010000010; //SRL
  uut.InstructionMemory.regData[8]  = 32'b00000000000000010100100010000011; //SRA
  uut.InstructionMemory.regData[9]  = 32'b10000111111000000101000000000000; //ABS        
  uut.InstructionMemory.regData[10] = 32'b00100000001010110000000000001111; //ADDI
  uut.InstructionMemory.regData[11] = 32'b00100100001011000000000000010000; //ADDIU    
  uut.InstructionMemory.regData[12] = 32'b00110000010011010000000000000010; //ANDI
  uut.InstructionMemory.regData[13] = 32'b00110100010011100000000000000011; //ORI
  uut.InstructionMemory.regData[14] = 32'b00111000010011110000000000000111; //XORI
  uut.InstructionMemory.regData[15] = 32'b00010000001000100000000000000000; //BEQ
  uut.InstructionMemory.regData[16] = 32'b10001100001100110000000000000000; //LW
  uut.InstructionMemory.regData[17] = 32'b10101100001101010000000000000000; //SW
  uut.InstructionMemory.regData[18] = 32'b00000010100000000000000000001000; //JR
  uut.InstructionMemory.regData[26] = 32'b00001000000000000000000000000001; //J


  
    #40;
    rst = 1;
        
    
end
  initial begin 
    forever #5 clk = ~clk;
  end
endmodule
2080

