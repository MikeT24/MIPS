onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb_basic/uut/InstructionMemory/clk
add wave -noupdate /MIPS_tb_basic/uut/InstructionMemory/rst
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/InstructionMemory/Address
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/InstructionMemory/direct_addressing
add wave -noupdate /MIPS_tb_basic/uut/InstructionMemory/error_addr
add wave -noupdate -divider GRAL
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/Instruction
add wave -noupdate -radix hexadecimal -childformat {{{/MIPS_tb_basic/uut/Instruction[31]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[30]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[29]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[28]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[27]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[26]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[25]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[24]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[23]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[22]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[21]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[20]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[19]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[18]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[17]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[16]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[15]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[14]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[13]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[12]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[11]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[10]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[9]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[8]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[7]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[6]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[5]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[4]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[3]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[2]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[1]} -radix hexadecimal} {{/MIPS_tb_basic/uut/Instruction[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_tb_basic/uut/Instruction[31]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[30]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[29]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[28]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[27]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[26]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[25]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[24]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[23]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[22]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[21]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[20]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[19]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[18]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[17]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[16]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[15]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[14]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[13]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[12]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[11]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[10]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[9]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[8]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[7]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[6]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[5]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[4]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[3]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[2]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[1]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/Instruction[0]} {-height 15 -radix hexadecimal}} /MIPS_tb_basic/uut/Instruction
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/instructionB
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/instructionC
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/signExt
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/signExt_shift
add wave -noupdate /MIPS_tb_basic/uut/AddressData
add wave -noupdate /MIPS_tb_basic/uut/beq_valid
add wave -noupdate /MIPS_tb_basic/uut/Jump
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/instructionJump
add wave -noupdate /MIPS_tb_basic/uut/alu_control
add wave -noupdate /MIPS_tb_basic/uut/ALUSrc
add wave -noupdate /MIPS_tb_basic/uut/Branch
add wave -noupdate /MIPS_tb_basic/uut/clk
add wave -noupdate /MIPS_tb_basic/uut/MemRead
add wave -noupdate /MIPS_tb_basic/uut/MemToReg
add wave -noupdate /MIPS_tb_basic/uut/MemWrite
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/muxALUSrc
add wave -noupdate /MIPS_tb_basic/uut/MuxBranch
add wave -noupdate /MIPS_tb_basic/uut/muxJump
add wave -noupdate /MIPS_tb_basic/uut/muxMemToReg
add wave -noupdate /MIPS_tb_basic/uut/muxWriteReg
add wave -noupdate /MIPS_tb_basic/uut/pcOut
add wave -noupdate /MIPS_tb_basic/uut/ReadData1
add wave -noupdate /MIPS_tb_basic/uut/ReadData2
add wave -noupdate /MIPS_tb_basic/uut/ReadDataMem
add wave -noupdate /MIPS_tb_basic/uut/RegDst
add wave -noupdate /MIPS_tb_basic/uut/RegWrite
add wave -noupdate /MIPS_tb_basic/uut/rst
add wave -noupdate /MIPS_tb_basic/uut/signExt
add wave -noupdate /MIPS_tb_basic/uut/zero
add wave -noupdate /MIPS_tb_basic/uut/incrementer/instruction
add wave -noupdate /MIPS_tb_basic/uut/incrementer/instructionB
add wave -noupdate -divider CONTROL
add wave -noupdate /MIPS_tb_basic/uut/control/alu_control
add wave -noupdate /MIPS_tb_basic/uut/control/ALUSrc
add wave -noupdate /MIPS_tb_basic/uut/control/Branch
add wave -noupdate /MIPS_tb_basic/uut/control/instruction5_0
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/control/instruction31_26
add wave -noupdate /MIPS_tb_basic/uut/control/Jump
add wave -noupdate /MIPS_tb_basic/uut/control/MemRead
add wave -noupdate /MIPS_tb_basic/uut/control/MemToReg
add wave -noupdate /MIPS_tb_basic/uut/control/MemWrite
add wave -noupdate /MIPS_tb_basic/uut/control/RegDst
add wave -noupdate /MIPS_tb_basic/uut/control/RegWrite
add wave -noupdate /MIPS_tb_basic/uut/control/instr_pnem
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_ctrl
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_result
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_signed
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_slt
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/ALU/alu_src_a
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/ALU/alu_src_b
add wave -noupdate -divider REGBaANK
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadData1
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadData2
add wave -noupdate -radix decimal /MIPS_tb_basic/uut/RegBank/ReadReg1
add wave -noupdate -radix decimal /MIPS_tb_basic/uut/RegBank/ReadReg2
add wave -noupdate /MIPS_tb_basic/uut/RegBank/RegWrite
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_zero
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[31]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[30]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[29]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[28]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[27]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[26]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[25]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[24]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[23]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[22]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[21]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[20]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[19]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[18]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[17]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[16]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[15]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[14]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[13]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[12]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[11]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[10]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[9]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[8]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[7]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[6]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[5]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[4]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[3]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[1]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_basic/uut/RegBank/RegBank[0]}
add wave -noupdate -divider MEM
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/error_addr
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/MemWrite
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/DataMemory/Address
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/Address_allign
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/clk
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/data_mem_ff
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/ReadData
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/WriteData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {425 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 307
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {406 ps} {479 ps}
