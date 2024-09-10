import mips_pkg::*;

`include "mips_header.svh"
module mips_stall_generator (
    input logic clk,
    input logic rst,
    input logic mult_start_D,
    input logic [REG_ADDR_W-1:0] reg_src_a_addr_D,
    input logic [REG_ADDR_W-1:0] reg_src_b_addr_D,
    input logic reg_dest_addr_D,
    input logic reg_dest_addr_mult, // DONE FOR THIS APPLICATION 
    input logic RegWrite_D,
    output logic stall
);


logic [REG_ADDR_W-1:0] reg_src_a_addr_P0;
logic [REG_ADDR_W-1:0] reg_src_b_addr_P0;
logic [REG_ADDR_W-1:0] reg_src_a_addr_P1;       // P1
logic [REG_ADDR_W-1:0] reg_src_b_addr_P1;       // P1    
logic [REG_ADDR_W-1:0] reg_src_a_addr_P2;       // P2
logic [REG_ADDR_W-1:0] reg_src_b_addr_P2;       // P2
logic [REG_ADDR_W-1:0] reg_src_a_addr_P3;       // P3
logic [REG_ADDR_W-1:0] reg_src_b_addr_P3;       // P3
logic [REG_ADDR_W-1:0] reg_src_a_addr_W;        // W
logic [REG_ADDR_W-1:0] reg_src_b_addr_W;        // W
logic [REG_ADDR_W-1:0] reg_src_a_addr_Wp1;      // Wp1 -- NOT NEEDED
logic [REG_ADDR_W-1:0] reg_src_b_addr_Wp1;      // Wp1 -- NOT NEEDED


`MIKE_FF_RST(reg_src_a_addr_P0, reg_src_a_addr_D, clk, rst)
`MIKE_FF_RST(reg_src_a_addr_P1, reg_src_a_addr_P0, clk, rst)
`MIKE_FF_RST(reg_src_a_addr_P2, reg_src_a_addr_P1, clk, rst)
`MIKE_FF_RST(reg_src_a_addr_P3, reg_src_a_addr_P2, clk, rst)
`MIKE_FF_RST(reg_src_a_addr_W, reg_src_a_addr_P3, clk, rst)
`MIKE_FF_RST(reg_src_a_addr_Wp1, reg_src_a_addr_W, clk, rst)


`MIKE_FF_RST(reg_src_b_addr_P0, reg_src_b_addr_D, clk, rst)
`MIKE_FF_RST(reg_src_b_addr_P1, reg_src_b_addr_P0, clk, rst)
`MIKE_FF_RST(reg_src_b_addr_P2, reg_src_b_addr_P1, clk, rst)
`MIKE_FF_RST(reg_src_b_addr_P3, reg_src_b_addr_P2, clk, rst)
`MIKE_FF_RST(reg_src_b_addr_W, reg_src_b_addr_P3, clk, rst)
`MIKE_FF_RST(reg_src_b_addr_Wp1, reg_src_b_addr_W, clk, rst)

logic mult_start_P0;
logic mult_start_P1;

`MIKE_FF_RST(mult_start_P0, mult_start_D, clk, rst)
`MIKE_FF_RST(mult_start_P1, mult_start_P0, clk, rst)


logic register_stall;
assign register_stall = (reg_src_a_addr_D == reg_src_a_addr_P0) | (reg_src_b_addr_D == reg_src_a_addr_P0) |
                        (reg_src_a_addr_D == reg_src_a_addr_P1) | (reg_src_b_addr_D == reg_src_a_addr_P1) |
                        (reg_src_a_addr_D == reg_src_a_addr_P2) | (reg_src_b_addr_D == reg_src_a_addr_P2);


logic write_port_stall;
assign write_port_stall = mult_start_P1 & RegWrite_D & ~mult_start_D;

logic register_dest_stall;
assign register_dest_stall = (reg_dest_addr_mult == reg_dest_addr_D); // Don't check other P0 and P1 because address is static 

assign stall = register_stall & write_port_stall & register_dest_stall;



endmodule