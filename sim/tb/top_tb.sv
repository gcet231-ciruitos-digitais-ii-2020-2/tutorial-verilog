module top_tb;

   parameter WIDTH = 8;

   reg clk, rst;
   reg [5:0] cmdin;
   reg [WIDTH-1:0] din_1;
   reg [WIDTH-1:0] din_2;
   reg [WIDTH-1:0] din_3;
   wire zero, error;
   wire [WIDTH-1:0] dout_low;
   wire [WIDTH-1:0] dout_high;

    top u1 (.clk(clk), .rst(rst), .cmdin(cmdin), .din_1(din_1), .din_2(din_2), .din_3(din_3), .dout_low(dout_low), .dout_high(dout_high), .zero(zero), .error(error));

   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
      rst = 0;
      #50 rst = 1;
      din_1 = 3;
      din_2 = 4;
      din_3 = 5;
      //addition
      cmdin = 0; //din_1 + din_1
      #100 cmdin = 7; //din_1 / din_2
      #100 cmdin = 4; //din_1 + din_2
      #100 cmdin = 7; //din_1 / din_2
      #100 cmdin = 11; //din_1 / din_3
      #100 cmdin = 24; // din_2 + din_3
      #100 cmdin = 8; //din_1 + din_3
      //substraction
      #100  din_1 = 8;
      cmdin = 9; // din_1 - din_3
      #100 cmdin = 5; //din_1 - din_2
      //multiplication
      #100 din_1 = 30;
      din_2 = 5;
      din_3 = 4;
      cmdin = 6; // din_1 * din_2
      #100 cmdin = 10; // din_1 * din_3
      #100 cmdin = 26; // din_2 * din_3
      #100 din_1 = 80;
      cmdin = 6; // din_1 * din_2
      #100 cmdin = 10; // din_1 * din_3
      #100 cmdin = 26; // din_2 * din_3
      //division
      #100 din_1 = 20;
      din_2 = 5;
      din_3 = 4;
      cmdin = 7; //din_1 / din_2
      #100 cmdin = 11; //din_1 / din_3
      #100 cmdin = 27; //din_2 / din_3
      #100 cmdin = 19; //din_2 / din_1
      #100 cmdin = 35; //din_3 / din_1
      #100 cmdin = 39; //din_3 / din_2
      //division by zero
      #100 din_1 = 20;
      din_2 = 5;
      din_3 = 0;
      cmdin = 11; //din_1 / din_2
      //border cases
      #100 din_1 = 255;
      din_2 = 255;
      din_3 = 0;
      #100 cmdin = 4; //din_1 + din_2
      #100 cmdin = 6; //din_1 * din_2
      #100 cmdin = 10; //din_1 * din_3
      #100 cmdin = 3; //din_1 / din_1
      #100 $finish;
   end

   initial begin
      $display ("cmdin  | din_1| din_2 | din_3 | dout_high  | dout_low | zero | error|");
      $monitor ("%d | %d  | %d   | %d   |   %b     |    %b    |  %b   |   %b  |", cmdin, din_1, din_2, din_3, dout_high, dout_low, zero, error);
   end

endmodule 
