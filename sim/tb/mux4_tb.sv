`timescale 10ns/1ps

module mux4_tb;

   parameter WIDTH= 8;

   reg [WIDTH-1:0] din1, din2, din3, din4;
   wire [WIDTH-1:0] dout;
   reg [1:0] select;

   mux4 u1 (.din1(din1), .din2(din2), .din3(din3), .din4(din4), .select(select), .dout(dout));

   initial begin
      din1 = 1;
      din2 = 2;
      din3 = 3;
      din4 = 4;
      select = 2'b00;
      #10 select = 2'b11;
      #10 select = 2'b01;
      #10 select = 2'b10;
      #10 $finish;
   end

   initial begin
      $display (" din1 | din2 | din3 | din4 | select | dout |");
      $monitor (" %d  | %d  | %d  | %d  |   %d   |  %d  |", din1, din2, din3, din4, select, dout);
   end

endmodule
      
