// Tutorial 5 Parte 2 - Register bank
//
module register_bank #(
   parameter WIDTH = 8 )
 (
   input                   clk,
   input                   rst,
   input                   wr_en,
   input       [WIDTH-1:0] in,
   output  reg [WIDTH-1:0] out
);
   
 always @(posedge clk) begin : proc_out
   if(!rst) begin
     out <= 0;
   end else if (wr_en) out <= in;
   else begin
     out <= out;
   end
 end
endmodule
