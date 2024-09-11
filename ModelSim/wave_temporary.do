onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb_basic/uut/AddressData
add wave -noupdate /MIPS_tb_basic/uut/alu_control
add wave -noupdate /MIPS_tb_basic/uut/ALUSrc
add wave -noupdate /MIPS_tb_basic/uut/BeqValid
add wave -noupdate /MIPS_tb_basic/uut/Branch
add wave -noupdate /MIPS_tb_basic/uut/clk
add wave -noupdate /MIPS_tb_basic/uut/CurrentAddress
add wave -noupdate /MIPS_tb_basic/uut/CurrPc_Branch
add wave -noupdate /MIPS_tb_basic/uut/CurrPc_Jump
add wave -noupdate /MIPS_tb_basic/uut/Instruction
add wave -noupdate /MIPS_tb_basic/uut/Jump
add wave -noupdate /MIPS_tb_basic/uut/MemRead
add wave -noupdate /MIPS_tb_basic/uut/MemToReg
add wave -noupdate /MIPS_tb_basic/uut/MemWrite
add wave -noupdate /MIPS_tb_basic/uut/muxALUSrc
add wave -noupdate /MIPS_tb_basic/uut/muxWriteReg
add wave -noupdate /MIPS_tb_basic/uut/pcOut
add wave -noupdate /MIPS_tb_basic/uut/pcOut_Branch
add wave -noupdate /MIPS_tb_basic/uut/pcOut_plus4
add wave -noupdate /MIPS_tb_basic/uut/ReadData1
add wave -noupdate /MIPS_tb_basic/uut/ReadData2
add wave -noupdate /MIPS_tb_basic/uut/ReadDataMem
add wave -noupdate /MIPS_tb_basic/uut/RegDst
add wave -noupdate /MIPS_tb_basic/uut/RegWrite
add wave -noupdate /MIPS_tb_basic/uut/rst
add wave -noupdate /MIPS_tb_basic/uut/signExt
add wave -noupdate /MIPS_tb_basic/uut/signExt_shift
add wave -noupdate /MIPS_tb_basic/uut/zero
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_ctrl
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/ALU/alu_result
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/ALU/alu_src_a
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/ALU/alu_src_b
add wave -noupdate /MIPS_tb_basic/uut/ALU/alu_zero
add wave -noupdate /MIPS_tb_basic/uut/RegBank/clk
add wave -noupdate /MIPS_tb_basic/uut/RegBank/done
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadData1
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadData2
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadReg1
add wave -noupdate /MIPS_tb_basic/uut/RegBank/ReadReg2
add wave -noupdate /MIPS_tb_basic/uut/RegBank/REG_FILE_DEPTH
add wave -noupdate /MIPS_tb_basic/uut/control/instr_pnem
add wave -noupdate -radix hexadecimal -childformat {{{/MIPS_tb_basic/uut/RegBank/RegBank[31]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[30]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[29]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[28]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[27]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[26]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[25]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[24]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[23]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[22]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[21]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[20]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[19]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[18]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[17]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[16]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[15]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[14]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[13]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[12]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[11]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[10]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[9]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[8]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[7]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[6]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[5]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[4]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[3]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[2]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[1]} -radix hexadecimal} {{/MIPS_tb_basic/uut/RegBank/RegBank[0]} -radix hexadecimal}} -expand -subitemconfig {{/MIPS_tb_basic/uut/RegBank/RegBank[31]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[30]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[29]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[28]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[27]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[26]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[25]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[24]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[23]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[22]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[21]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[20]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[19]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[18]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[17]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[16]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[15]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[14]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[13]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[12]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[11]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[10]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[9]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[8]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[7]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[6]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[5]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[4]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[3]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[2]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[1]} {-height 15 -radix hexadecimal} {/MIPS_tb_basic/uut/RegBank/RegBank[0]} {-height 15 -radix hexadecimal}} /MIPS_tb_basic/uut/RegBank/RegBank
add wave -noupdate /MIPS_tb_basic/uut/RegBank/RegWrite
add wave -noupdate /MIPS_tb_basic/uut/RegBank/rst
add wave -noupdate /MIPS_tb_basic/uut/RegBank/WriteData
add wave -noupdate /MIPS_tb_basic/uut/RegBank/WriteReg
add wave -noupdate /MIPS_tb_basic/uut/muxMemToReg
add wave -noupdate /MIPS_tb_basic/uut/MemToReg
add wave -noupdate /MIPS_tb_basic/uut/AddressData
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/DataMemory/Address
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/DataMemory/Address_allign
add wave -noupdate -childformat {{{/MIPS_tb_basic/uut/DataMemory/data_mem_ff[3]} -radix hexadecimal}} -expand -subitemconfig {{/MIPS_tb_basic/uut/DataMemory/data_mem_ff[3]} {-radix hexadecimal}} /MIPS_tb_basic/uut/DataMemory/data_mem_ff
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/MemWrite
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/DataMemory/ReadData
add wave -noupdate -radix hexadecimal /MIPS_tb_basic/uut/DataMemory/WriteData
add wave -noupdate /MIPS_tb_basic/uut/DataMemory/error_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {381 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 323
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
WaveRestoreZoom {343 ps} {504 ps}
