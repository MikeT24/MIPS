import mips_pkg::*;

`include "mips_header.svh"

// Same RegBank as RISC-V
module mult_register (
    input clk,
    input rst,
    input logic [DATA_32_W - 1:0] reg_file_mult_data_low,
    input logic [DATA_32_W - 1:0] reg_file_mult_data_high,
    input logic reg_file_mult_write,
    output logic [DATA_32_W - 1:0] mult_val_low,
    output logic [DATA_32_W - 1:0] mult_val_high
);


logic [DATA_32_W - 1:0] lo;
logic [DATA_32_W - 1:0] hi;
logic [DATA_32_W - 1:0] lo_ff;
logic [DATA_32_W - 1:0] hi_ff;

always_comb begin 
    if (reg_file_mult_write) begin 
        lo = reg_file_mult_data_low;
        hi = reg_file_mult_data_high;
    end
    else begin
        lo = lo_ff;
        hi = hi_ff;
    end
end

 `MIKE_FF_RST(lo_ff, lo, clk, rst)
 `MIKE_FF_RST(hi_ff, hi, clk, rst)

endmodule