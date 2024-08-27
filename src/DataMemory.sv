import mips_pkg::*;

`include "mips_header.svh"

module DataMemory #(
    parameter DATA_MEM_DEPTH = 16
)(
    input logic clk,
    input logic rst,
    input [$clog2(`DATA_MEM_DEPTH) - 1:0] Address,     // rs1,
    input logic MemWrite,              // mem_write
    input logic [DATA_32_W - 1:0] WriteData,
    output logic [DATA_32_W - 1:0] ReadData
    //ENDIF
);

parameter DATA_BYTES = DATA_32_W/8;

logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem;
logic [DATA_MEM_DEPTH - 1:0][DATA_32_W - 1:0] data_mem_ff;
logic [$clog2(DATA_32_W) - 1:0] Address_allign;
logic error_addr;

assign Address_allign = Address >> 2;
assign error_addr = |(Address_allign % 4);



genvar depth;
generate
    for (depth = 0; depth < DATA_MEM_DEPTH; depth++) begin : g_data_mem 
        assign data_mem[depth] = (MemWrite & (depth == Address_allign))? WriteData : data_mem_ff[depth];
        // Actual flip flop
        `MIKE_FF_RST(data_mem_ff[depth], data_mem[depth], clk, rst) // Add enable to save power
    end
endgenerate

//Data read assignments
//Should some sort of address error be added? 
assign ReadData = (Address_allign < DATA_MEM_DEPTH) ? data_mem_ff[Address_allign] : 'b0;



//TODO: Asserts to prevent undesired addresses	

endmodule
