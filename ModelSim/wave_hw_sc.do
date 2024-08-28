onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb_HW/uut/InstructionMemory/clk
add wave -noupdate /MIPS_tb_HW/uut/InstructionMemory/rst
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/InstructionMemory/Address
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/InstructionMemory/direct_addressing
add wave -noupdate /MIPS_tb_HW/uut/InstructionMemory/error_addr
add wave -noupdate -divider GRAL
add wave -noupdate /MIPS_tb_HW/uut/control/instr_pnem
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/instructionB
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/instructionC
add wave -noupdate /MIPS_tb_HW/uut/beq_valid
add wave -noupdate /MIPS_tb_HW/uut/Jump
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/instructionJump
add wave -noupdate /MIPS_tb_HW/uut/alu_control
add wave -noupdate /MIPS_tb_HW/uut/ALUSrc
add wave -noupdate /MIPS_tb_HW/uut/MemRead
add wave -noupdate /MIPS_tb_HW/uut/MemToReg
add wave -noupdate /MIPS_tb_HW/uut/MemWrite
add wave -noupdate -divider CONTROL
add wave -noupdate /MIPS_tb_HW/uut/control/alu_control
add wave -noupdate /MIPS_tb_HW/uut/control/ALUSrc
add wave -noupdate /MIPS_tb_HW/uut/control/Branch
add wave -noupdate /MIPS_tb_HW/uut/control/MemRead
add wave -noupdate /MIPS_tb_HW/uut/control/MemToReg
add wave -noupdate /MIPS_tb_HW/uut/control/MemWrite
add wave -noupdate /MIPS_tb_HW/uut/control/RegDst
add wave -noupdate /MIPS_tb_HW/uut/control/RegWrite
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_ctrl
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_result
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_slt
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_a
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_b
add wave -noupdate -divider REGBaANK
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[5]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[4]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[3]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[1]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/RegBank[0]}
add wave -noupdate /MIPS_tb_HW/uut/RegBank/RegWrite
add wave -noupdate -divider MEM
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[11]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[10]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[9]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[8]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[7]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[6]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[5]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[4]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[3]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[1]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {715 ps} 0}
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
WaveRestoreZoom {53 ps} {217 ps}
