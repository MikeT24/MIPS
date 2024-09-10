
import mips_pkg::*;

`include "mips_header.svh"

module mips_branch_unit (
    input logic [DATA_32_W-1:0] read_data_1,
    input logic [DATA_32_W-1:0] read_data_2,
    input t_instr_pnmen instr_pnem,
    output logic BeqValid,
    output logic flush_branch
);

logic data_equals;

assign data_equals = (read_data_1 == read_data_2);

assign BeqValid = ((instr_pnem == NEM_BEQ) & data_equals);

assign flush_branch = BeqValid;

endmodule
