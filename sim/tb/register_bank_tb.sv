`timescale 10ns/1ps

module register_bank_tb;

   parameter WIDTH = 8;
   
   wire [WIDTH-1:0] out;
   reg clk, rst, wr_en;
   reg [WIDTH-1:0] in;

   register_bank u1 (.clk(clk), .rst(rst), .wr_en(wr_en), .in(in), .out(out));
   
   initial begin 
      clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
      in = 4;
      rst = 0;
      wr_en = 0;
      #10 wr_en = 1;
      #10 wr_en = 0;
      #10 rst = 1; wr_en = 1;
      #10 wr_en = 0;
      #10 in = 6;
      #10 wr_en = 1;
      #10 rst = 0;
      $finish;
   end

   initial begin
      $display ("clk | rst  | wr_en |  in  |  out |");
      $monitor (" %b  |  %b   |   %b   | %d  | %d  |", clk, rst, wr_en, in, out);
   end

endmodule
      
