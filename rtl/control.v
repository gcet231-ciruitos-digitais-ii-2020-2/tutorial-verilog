module control (
   input             clk, 
   input             rst,
   input [5:0]       cmd_in,
   input             p_error,
   output reg        aluin_reg_en,
   output reg        datain_reg_en,
   output reg        aluout_reg_en,
   output reg        nvalid_data,
   output reg [1:0]  in_select_a,
   output reg [1:0]  in_select_b,
   output reg [3:0]  opcode
);

endmodule