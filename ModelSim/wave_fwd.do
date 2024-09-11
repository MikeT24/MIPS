onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_tb_HW/uut/clk
add wave -noupdate /MIPS_tb_HW/uut/BeqValid_X
add wave -noupdate /MIPS_tb_HW/uut/Instruction_Flush
add wave -noupdate /MIPS_tb_HW/uut/Jump_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrPc_Jump_D
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /MIPS_tb_HW/uut/NextAddress_F
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/Instruction_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/pcOut_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/pcOut_plus4_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/pcOut_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/pcOut_plus4_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/InstructionMemory/Address
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/InstructionMemory/direct_addressing
add wave -noupdate /MIPS_tb_HW/uut/InstructionMemory/error_addr
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/InstructionMemory/ReadData
add wave -noupdate /MIPS_tb_HW/uut/rst
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/AddressData_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/AddressData_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/AddressData_X
add wave -noupdate /MIPS_tb_HW/uut/alu_control_D
add wave -noupdate /MIPS_tb_HW/uut/alu_control_M
add wave -noupdate /MIPS_tb_HW/uut/alu_control_W
add wave -noupdate /MIPS_tb_HW/uut/alu_control_X
add wave -noupdate /MIPS_tb_HW/uut/ALUSrc_D
add wave -noupdate /MIPS_tb_HW/uut/ALUSrc_M
add wave -noupdate /MIPS_tb_HW/uut/ALUSrc_W
add wave -noupdate /MIPS_tb_HW/uut/ALUSrc_X
add wave -noupdate /MIPS_tb_HW/uut/BeqValid_M
add wave -noupdate /MIPS_tb_HW/uut/BeqValid_W
add wave -noupdate /MIPS_tb_HW/uut/Branch_D
add wave -noupdate /MIPS_tb_HW/uut/Branch_M
add wave -noupdate /MIPS_tb_HW/uut/Branch_W
add wave -noupdate /MIPS_tb_HW/uut/Branch_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrentAddress_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrPc_Branch_F
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrPc_Jump_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrPc_Jump_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/CurrPc_Jump_X
add wave -noupdate /MIPS_tb_HW/uut/control/instruction5_0
add wave -noupdate /MIPS_tb_HW/uut/control/instruction31_26
add wave -noupdate /MIPS_tb_HW/uut/MemRead_D
add wave -noupdate /MIPS_tb_HW/uut/MemRead_M
add wave -noupdate /MIPS_tb_HW/uut/MemRead_W
add wave -noupdate /MIPS_tb_HW/uut/MemRead_X
add wave -noupdate /MIPS_tb_HW/uut/MemToReg_D
add wave -noupdate /MIPS_tb_HW/uut/MemToReg_M
add wave -noupdate /MIPS_tb_HW/uut/MemToReg_W
add wave -noupdate /MIPS_tb_HW/uut/MemToReg_X
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_D
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_M
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_W
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_X
add wave -noupdate /MIPS_tb_HW/uut/muxALUSrc_M
add wave -noupdate /MIPS_tb_HW/uut/muxALUSrc_W
add wave -noupdate /MIPS_tb_HW/uut/muxALUSrc_X
add wave -noupdate /MIPS_tb_HW/uut/muxMemToReg_W
add wave -noupdate /MIPS_tb_HW/uut/muxWriteReg_M
add wave -noupdate /MIPS_tb_HW/uut/muxWriteReg_W
add wave -noupdate /MIPS_tb_HW/uut/muxWriteReg_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_toAluMux_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_toAluMux_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_toAluMux_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadDataMem_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadDataMem_W
add wave -noupdate /MIPS_tb_HW/uut/RegDst_D
add wave -noupdate /MIPS_tb_HW/uut/RegDst_M
add wave -noupdate /MIPS_tb_HW/uut/RegDst_W
add wave -noupdate /MIPS_tb_HW/uut/RegDst_X
add wave -noupdate /MIPS_tb_HW/uut/RegWrite_D
add wave -noupdate /MIPS_tb_HW/uut/RegWrite_M
add wave -noupdate /MIPS_tb_HW/uut/RegWrite_W
add wave -noupdate /MIPS_tb_HW/uut/RegWrite_X
add wave -noupdate /MIPS_tb_HW/uut/signExt_D
add wave -noupdate /MIPS_tb_HW/uut/signExt_M
add wave -noupdate /MIPS_tb_HW/uut/signExt_shift_M
add wave -noupdate /MIPS_tb_HW/uut/signExt_shift_W
add wave -noupdate /MIPS_tb_HW/uut/signExt_shift_X
add wave -noupdate /MIPS_tb_HW/uut/signExt_W
add wave -noupdate /MIPS_tb_HW/uut/signExt_X
add wave -noupdate /MIPS_tb_HW/uut/zero_X
add wave -noupdate /MIPS_tb_HW/uut/zero_M
add wave -noupdate /MIPS_tb_HW/uut/zero_W
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_D
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_X
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_X
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_M
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_M
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_W
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_W
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_X
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_ctrl
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_a
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_src_b
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ALU/alu_result
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_slt
add wave -noupdate /MIPS_tb_HW/uut/ALU/alu_zero
add wave -noupdate -divider RegBank
add wave -noupdate /MIPS_tb_HW/uut/RegBank/clk
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/RegBank/reg_file_rd_addr_1
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/RegBank/reg_file_rd_addr_2
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/RegBank/reg_file_rd_data_1
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/RegBank/reg_file_rd_data_2
add wave -noupdate /MIPS_tb_HW/uut/RegBank/reg_file
add wave -noupdate /MIPS_tb_HW/uut/RegBank/REG_FILE_DEPTH
add wave -noupdate -radix hexadecimal -childformat {{{/MIPS_tb_HW/uut/RegBank/reg_file_ff[31]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[30]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[29]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[28]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[27]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[26]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[25]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[24]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[23]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[22]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[21]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[20]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[19]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[18]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[17]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[16]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[15]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[14]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[13]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[12]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[11]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[10]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[9]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[8]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[7]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[6]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[5]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[4]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[3]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[2]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[1]} -radix hexadecimal} {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[0]} -radix hexadecimal}} -expand -subitemconfig {{/MIPS_tb_HW/uut/RegBank/reg_file_ff[31]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[30]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[29]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[28]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[27]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[26]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[25]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[24]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[23]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[22]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[21]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[20]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[19]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[18]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[17]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[16]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[15]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[14]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[13]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[12]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[11]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[10]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[9]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[8]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[7]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[6]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[5]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[4]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[3]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[2]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[1]} {-height 15 -radix hexadecimal} {/MIPS_tb_HW/uut/RegBank/reg_file_ff[0]} {-height 15 -radix hexadecimal}} /MIPS_tb_HW/uut/RegBank/reg_file_ff
add wave -noupdate /MIPS_tb_HW/uut/RegBank/REG_FILE_WIDTH
add wave -noupdate /MIPS_tb_HW/uut/RegBank/reg_file_wr_addr
add wave -noupdate /MIPS_tb_HW/uut/RegBank/reg_file_wr_data
add wave -noupdate /MIPS_tb_HW/uut/RegBank/reg_file_write
add wave -noupdate /MIPS_tb_HW/uut/RegBank/rst
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_D
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData1_X
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_X
add wave -noupdate -divider MemCtrl
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/data_mem_wr_addr_val
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_mem_ctrl/data_mem_wr_addr
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_mem_ctrl/data_mem_rd_addr
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/data_mem_rd_addr_val
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_rd_addr
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_rd_addr_error
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_read
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_wr_addr
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_wr_addr_error
add wave -noupdate /MIPS_tb_HW/uut/mips_mem_ctrl/mem_bus_write
add wave -noupdate -divider DataMem
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_D
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_X
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_M
add wave -noupdate /MIPS_tb_HW/uut/instr_pnem_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadDataMem_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/DataMemory/ReadData
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/DataMemory/Address
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/DataMemory/Address_allign
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_D
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_X
add wave -noupdate /MIPS_tb_HW/uut/MemWrite_M
add wave -noupdate /MIPS_tb_HW/uut/DataMemory/MemWrite
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_toAluMux_M
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/DataMemory/WriteData
add wave -noupdate /MIPS_tb_HW/uut/DataMemory/error_addr
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[0]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[1]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[2]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[3]}
add wave -noupdate -radix hexadecimal {/MIPS_tb_HW/uut/DataMemory/data_mem_ff[4]}
add wave -noupdate -divider DATA_FWD
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/ReadData2_M
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_X
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_M
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/AddressData_W
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/alu_src_a_fwd
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/alu_src_b_fwd
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/reg_file_rd_data_1_e
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/reg_file_rd_data_2_e
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/reg_file_2_alu_1_e
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/reg_file_2_alu_2_e
add wave -noupdate -color Gold -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/reg_file_2_alu_2_m
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/alu_result_m
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/alu_result_w
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/data_mem_bus_rd_data_m
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/data_mem_bus_rd_data_w
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/data_mem_rd_data_m
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/data_mem_rd_data_w
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/data_mem_rd_data_w_plus1
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/intr_opcode_d
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/intr_opcode_e
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/intr_opcode_m
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/intr_opcode_w
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/intr_opcode_w_plus1
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rs2_e
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rsd_w
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_e
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_hzd_free_m
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_hzd_free_w
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_hzd_free_w_plus1
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_m
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_w
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/reg_write_w_plus1
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rs1_e
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rsd_e
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rsd_m
add wave -noupdate -radix hexadecimal /MIPS_tb_HW/uut/mips_data_fwd/rsd_w_plus1
add wave -noupdate /MIPS_tb_HW/uut/mips_data_fwd/rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {85 ps} 0} {{Cursor 2} {748 ps} 0} {{Cursor 3} {726 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {58 ps} {143 ps}