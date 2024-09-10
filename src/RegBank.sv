import mips_pkg::*;

`include "mips_header.svh"

// Same RegBank as RISC-V
module RegBank #(
    parameter REG_FILE_WIDTH = 32,
    parameter REG_FILE_DEPTH = 16
)(
    input logic clk,
    input logic rst,
    input logic [REG_ADDR_W-1:0] reg_file_rd_addr_1,     // rs1,
    input logic [REG_ADDR_W-1:0] reg_file_rd_addr_2,     // rs2,
    input logic [REG_ADDR_W-1:0] reg_file_wr_addr,       // rsd,
    input logic reg_file_write,                         //reg_write,
    input logic [DATA_32_W - 1:0] reg_file_wr_data,
    output logic [DATA_32_W - 1:0] reg_file_rd_data_1,
    output logic [DATA_32_W - 1:0] reg_file_rd_data_2
);


logic [REG_FILE_DEPTH - 1:0][DATA_32_W - 1:0] reg_file;
logic [REG_FILE_DEPTH - 1:0][DATA_32_W - 1:0] reg_file_ff /* synthesis preserve */ ;

//Data read assignments
assign reg_file_rd_data_1 = reg_file[reg_file_rd_addr_1];
assign reg_file_rd_data_2 = reg_file[reg_file_rd_addr_2];


//TODO: Asserts to prevent undesired addresses
//TODO: Add reset value to stack pointer



assign reg_file[0]      = 32'h0;
assign reg_file_ff[0]   = 32'h0;
genvar depth;
generate
    for ( depth = 1; depth < REG_FILE_DEPTH; depth++) begin: gen_reg_file
        // Write to reg_file if reg_write is asserted
        // Write just to the enabled address
        assign reg_file[depth] = (reg_file_write & (depth == reg_file_wr_addr))? reg_file_wr_data : reg_file_ff[depth];
        // Actual flip flop
        `MIKE_FF_RST(reg_file_ff[depth], reg_file[depth], clk, rst)
    end
endgenerate


endmodule
