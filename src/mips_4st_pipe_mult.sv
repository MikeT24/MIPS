import mips_pkg::*;

`include "mips_header.svh"
module mips_4st_pipe_mult (
    input logic clk,
    input logic rst,
    input logic [DATA_32_W - 1:0] src_a,
    input logic [DATA_32_W - 1:0] src_b, 
    input logic start, 
    output logic done,
    output logic [DATA_32_W - 1:0] mult_lower,
    output logic [DATA_32_W - 1:0] mult_higher
);

logic [2*DATA_32_W - 1:0] mult_internal_P0;
logic [2*DATA_32_W - 1:0] mult_internal_P1;
logic [2*DATA_32_W - 1:0] mult_internal_P2;
logic [2*DATA_32_W - 1:0] mult_internal_P3;
logic [2*DATA_32_W - 1:0] mult_internal_W;

logic in_prog_P1;
logic in_prog_P2;
logic in_prog_P3;
logic in_prog_W;


`MIKE_FF_RST(mult_internal_P1, mult_internal_P0, clk, rst)
`MIKE_FF_RST(mult_internal_P2, mult_internal_P1, clk, rst)
`MIKE_FF_RST(mult_internal_P3, mult_internal_P2, clk, rst)
`MIKE_FF_RST(mult_internal_W, mult_internal_P3, clk, rst)

assign mult_lower   = mult_internal_W[DATA_32_W - 1:0];
assign mult_higher  = mult_internal_W[2*DATA_32_W - 1:DATA_32_W];
assign mult_internal_P0 = (start)? (src_a * src_b) : 'b0;

`MIKE_FF_RST(in_prog_P1, start, clk, rst)
`MIKE_FF_RST(in_prog_P2, in_prog_P1, clk, rst)
`MIKE_FF_RST(in_prog_P3, in_prog_P2, clk, rst)
`MIKE_FF_RST(in_prog_W, in_prog_P3, clk, rst)

assign done = in_prog_W;



endmodule