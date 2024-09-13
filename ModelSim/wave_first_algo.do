onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb_HW/uut/clk
add wave -noupdate /MIPS_tb_HW/rst
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /MIPS_tb_HW/uut/NextAddress_F
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_F
add wave -noupdate /MIPS_tb_HW/uut/Branch_D
add wave -noupdate /MIPS_tb_HW/uut/BeqValid_D
add wave -noupdate /MIPS_tb_HW/uut/Jump_D
add wave -noupdate /MIPS_tb_HW/uut/Instruction_Flush
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_X
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_ctrl
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_a
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_b
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_result
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_slt
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_zero
add wave -noupdate -divider RegBank
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_W
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[31]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[30]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[29]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[28]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[11]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[10]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[9]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[8]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[7]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[6]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[5]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[4]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[3]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[1]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/RegBank/reg_file_ff[0]}
add wave -noupdate /MIPS_tb_HW/uut/RegBank/REG_FILE_WIDTH
add wave -noupdate -radix unsigned /MIPS_tb_HW/uut/RegBank/reg_file_wr_addr
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/RegBank/reg_file_wr_data
add wave -noupdate /MIPS_tb_HW/uut/RegBank/reg_file_write
add wave -noupdate -divider MemCtrl
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/DataMemory/Address
add wave -noupdate -divider DataMem
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[0]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[4]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[8]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[9]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[10]}
add wave -noupdate -divider DATA_FWD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {534 ps} 0} {{Cursor 2} {782 ps} 0} {{Cursor 3} {565 ps} 0} {{Cursor 4} {64 ps} 0}
quietly wave cursor active 4
configure wave -namecolwidth 273
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
WaveRestoreZoom {43 ps} {289 ps}
