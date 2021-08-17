`timescale 10ns/1ps

module alu_tb;

   parameter WIDTH = 8;

   reg signed [WIDTH-1:0] in1, in2;
   reg [3:0] op;
   reg nvalid_data;
   wire  signed [2*WIDTH-1:0] out;
   wire zero, error;

   alu u1 (.in1(in1), .in2(in2), .op(op), .nvalid_data(nvalid_data), .out(out), .zero(zero), .error(error));

   initial begin
      //addition
      in1 = 3; in2 = 5;
      op = 0;
      nvalid_data = 0;
      //substraction
      #10 op = 2;
      //multiplication
      #10 op = 4;
      //division
      #10 op = 8;
      //division with exact result
      #10 in1 = 8; in2 = 2;
      //division by zero
      #10 in1 = 8; in2 = 0;
      //multiplication
      #10 in1 = 2; in2 = -2; op = 4;
      //multiplication
      #10 in1 = 129; in2 = -129; op = 4;
      
      #10 $finish;
   end

   initial begin
      $display ("nvalid_data | in1 | in2 | op |     out     | zero | error");
      $monitor ("     %b      |%d  |%d  | %d | %d |  %b   |  %b   |", nvalid_data, in1, in2, op, out, zero, error);
   end

endmodule 
