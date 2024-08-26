onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb2/uut/Instruction
add wave -noupdate /MIPS_tb2/uut/clk
add wave -noupdate /MIPS_tb2/uut/alu_control
add wave -noupdate /MIPS_tb2/uut/rst
add wave -noupdate /MIPS_tb2/uut/programCounter/pcIn
add wave -noupdate /MIPS_tb2/uut/InstructionMemory/ReadData
add wave -noupdate /MIPS_tb2/uut/RegBank/RegBank
add wave -noupdate /MIPS_tb2/uut/ALU/a
add wave -noupdate /MIPS_tb2/uut/ALU/b
add wave -noupdate /MIPS_tb2/uut/DataMemory/regData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {195 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}
