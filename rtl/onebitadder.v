// Tutorial 1 - 1 bit full adder
//
module onebitadder (
  input a, b, cin,
  output sum, cout
);

wire a_b_xor, a_cin_and, b_cin_and, a_b_and;

xor (a_b_xor, a, b),
    (sum, a_b_xor, cin);

and (a_cin_and, a, cin),
    (b_cin_and, b, cin),
    (a_b_and, a, b);

or (cout, a_cin_and, b_cin_and, a_b_and);
endmodule
