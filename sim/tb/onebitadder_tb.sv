`timescale 10ns/1ps

module onebitadder_tb;

   reg a, b, cin, sum, cout;

   onebitadder u1 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

   initial begin
          a = 1'b0; b = 1'b0; cin = 1'b0;
      #10 a = 1'b0; b = 1'b0; cin = 1'b1;
      #10 a = 1'b0; b = 1'b1; cin = 1'b0;
      #10 a = 1'b0; b = 1'b1; cin = 1'b1;
      #10 a = 1'b1; b = 1'b0; cin = 1'b0;
      #10 a = 1'b1; b = 1'b0; cin = 1'b1;
      #10 a = 1'b1; b = 1'b1; cin = 1'b0;
      #10 a = 1'b1; b = 1'b1; cin = 1'b1;
      #10 $finish;
   end

   initial begin
      $display (" a | b | cin | sum | cout |");
      $monitor (" %b | %b |  %b  |  %b  |    %b |", a, b, cin, sum, cout);
   end

endmodule
