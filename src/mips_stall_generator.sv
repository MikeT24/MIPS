import mips_pkg::*;

`include "mips_header.svh"
module mips_stall_generator (
    input logic clk,
    input logic rst,
    input logic mult_start_D,
    input logic [REG_ADDR_W-1:0] reg_src_a_addr_D,
    input logic [REG_ADDR_W-1:0] reg_src_b_addr_D,
    input logic [REG_ADDR_W-1:0] reg_dest_addr_D,
    input logic [REG_ADDR_W-1:0] reg_dest_addr_mult, // DONE FOR THIS APPLICATION 
    input logic RegWrite_D,
    input t_instr_pnmen instr_pnem_D,
    output logic stall
);

// The logic below is to make the stall generator as seen in class. It is not necesary in this application 
// as I want to keep compliant with oficial mips language in which there is no destination

logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_D;
logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_P0;
logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_P1;
logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_P2;
logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_P3;
logic [REG_ADDR_W-1:0] reg_dest_addr_adapted_W;

assign reg_dest_addr_adapted_D = (mult_start_D)? reg_dest_addr_mult : reg_dest_addr_D;

`MIKE_FF_RST(reg_dest_addr_adapted_P0, reg_dest_addr_adapted_D, clk, rst)
`MIKE_FF_RST(reg_dest_addr_adapted_P1, reg_dest_addr_adapted_P0, clk, rst)
`MIKE_FF_RST(reg_dest_addr_adapted_P2, reg_dest_addr_adapted_P1, clk, rst)
`MIKE_FF_RST(reg_dest_addr_adapted_P3, reg_dest_addr_adapted_P2, clk, rst)
`MIKE_FF_RST(reg_dest_addr_adapted_W, reg_dest_addr_adapted_P3, clk, rst)


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
logic mult_start_P2;
logic mult_start_P3;
logic mult_start_W;

`MIKE_FF_RST(mult_start_P0, mult_start_D, clk, rst)
`MIKE_FF_RST(mult_start_P1, mult_start_P0, clk, rst)
`MIKE_FF_RST(mult_start_P2, mult_start_P1, clk, rst)
`MIKE_FF_RST(mult_start_P3, mult_start_P2, clk, rst)
`MIKE_FF_RST(mult_start_W, mult_start_P3, clk, rst)

logic valid_instruction_D;
assign valid_instruction_D = (instr_pnem_D != NEM_ZERO);

logic src_a_D_P0;
logic src_a_D_P1;
logic src_a_D_P2;

logic src_b_D_P0;
logic src_b_D_P1;
logic src_b_D_P2;

assign src_a_D_P0 = (reg_src_a_addr_D == reg_dest_addr_adapted_P0) & mult_start_P0;
assign src_a_D_P1 = (reg_src_a_addr_D == reg_dest_addr_adapted_P1) & mult_start_P1;
assign src_a_D_P2 = (reg_src_a_addr_D == reg_dest_addr_adapted_P2) & mult_start_P2;
assign src_a_D_P3 = (reg_src_a_addr_D == reg_dest_addr_adapted_P3) & mult_start_P3;

assign src_b_D_P0 = (reg_src_b_addr_D == reg_dest_addr_adapted_P0) & mult_start_P0;
assign src_b_D_P1 = (reg_src_b_addr_D == reg_dest_addr_adapted_P1) & mult_start_P1;
assign src_b_D_P2 = (reg_src_b_addr_D == reg_dest_addr_adapted_P2) & mult_start_P2;
assign src_b_D_P3 = (reg_src_b_addr_D == reg_dest_addr_adapted_P3) & mult_start_P3;

logic register_stall;
assign register_stall = valid_instruction_D &
                        (((src_a_D_P0 | src_b_D_P0)) |
                         ((src_a_D_P1 | src_b_D_P1)) |
                         ((src_a_D_P2 | src_b_D_P2)) |
                         ((src_a_D_P3 | src_b_D_P3)));

logic stall_livelock;
logic write_port_stall;
assign write_port_stall = mult_start_P1 & RegWrite_D & ~mult_start_D;

logic register_dest_stall;
assign register_dest_stall = ((reg_dest_addr_mult == reg_dest_addr_D) & mult_start_P0 & mult_start_P1); // Don't check other P0 and P1 because address is static 

assign stall = (register_stall | write_port_stall | register_dest_stall);



// LIVELOCK FIX THIS SHOULD NEVER RISE


logic stall_ff0;
logic stall_ff1;
logic stall_ff2;
logic stall_ff3;
logic stall_ff4;
logic stall_ff5;
logic stall_ff6;
logic stall_ff7;
logic stall_ff8;
logic stall_ff9;
logic stall_ff10;


assign stall_livelock = stall_ff0 & 
                        stall_ff1 & 
                        stall_ff2 & 
                        stall_ff3 & 
                        stall_ff4 & 
                        stall_ff5 & 
                        stall_ff6 & 
                        stall_ff7 & 
                        stall_ff8 & 
                        stall_ff9 & 
                        stall_ff10;


endmodule