// Tutorial 6 - Datapath completo.
`include "../rtl/mux4.v"
`include "../rtl/alu.v"
`include "../rtl/register_bank.v"

module top #(
   parameter WIDTH = 8
   )(
   input clk,
   input rst,
   input [5:0] cmdin,
   input [WIDTH-1:0] din_1,
   input [WIDTH-1:0] din_2,
   input [WIDTH-1:0] din_3,
   output [WIDTH-1:0] dout_low,
   output [WIDTH-1:0] dout_high,
   output zero,
   output error
);

   wire [1:0] in_select_a, in_select_b;
   wire aluin_reg_en, datain_reg_en;
   wire [WIDTH-1:0] mux_a, mux_b, alu_reg_a, alu_reg_b;
   wire [5:0] cmd_dec;
   wire [3:0] opcode;
   wire nvalid_data, alu_zero, alu_error, aluout_reg_en;
   wire [WIDTH*2-1:0] alu_out;

   mux4 #(.WIDTH(WIDTH)) muxA (.din1(din_1), .din2(din_2), .din3(din_3), .din4(dout_high), .select(in_select_a), .dout(mux_a));
   mux4 #(.WIDTH(WIDTH)) muxB (.din1(din_1), .din2(din_2), .din3(din_3), .din4(dout_low), .select(in_select_b), .dout(mux_b));
   register_bank #(.WIDTH(WIDTH)) regA (.clk(clk), .rst(rst), .wr_en(aluin_reg_en), .in(mux_a), .out(alu_reg_a));
   register_bank #(.WIDTH(WIDTH)) regB (.clk(clk), .rst(rst), .wr_en(aluin_reg_en), .in(mux_b), .out(alu_reg_b));
   register_bank #(.WIDTH(6)) regCmd (.clk(clk), .rst(rst), .wr_en(datain_reg_en), .in(cmdin), .out(cmd_dec));
   alu #(.WIDTH(WIDTH)) aluW (.in1(alu_reg_a), .in2(alu_reg_b), .op(opcode), .nvalid_data(nvalid_data), .out(alu_out), .zero(alu_zero), .error(alu_error));
   register_bank #(.WIDTH(2)) regZeroError (.clk(clk), .rst(rst), .wr_en(aluout_reg_en), .in({alu_zero,alu_error}), .out({zero, error}));
   register_bank #(.WIDTH(2*WIDTH)) regOut (.clk(clk), .rst(rst), .wr_en(aluout_reg_en), .in(alu_out), .out({dout_high, dout_low}));



endmodule
