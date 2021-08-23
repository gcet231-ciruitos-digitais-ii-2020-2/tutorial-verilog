// Tutorial 5 Parte 3 - Basic ALU

module alu #(
   parameter WIDTH = 8
   )(
   input signed [WIDTH-1:0]    in1, in2,
   input [3:0]          op,
   input nvalid_data,
   output reg signed [2*WIDTH-1:0]  out,
   output reg zero, 
   output reg error
);

   localparam ADD = 0;
   localparam SUB = 2;
   localparam MUL = 4;
   localparam DIV = 8;

   always @(*) begin : proc_alu 
      zero = 0;
      error = 0;
      out = 0;
      if (nvalid_data) begin
         error = 1;
         out = -1;
      end else
         case (op)
            ADD : out  = in1 + in2;
            SUB : out = in1 - in2;
            MUL : out = in1 * in2;
            DIV : begin
               if (in2 == 0) begin
                  out = -1;
                  error = 1;
               end else begin
                  out = in1 / in2;
               end
            end // DIV :
            default : /* default */;
         endcase
      if (out == 0) begin
         zero = 1;
      end
   end
 
endmodule
