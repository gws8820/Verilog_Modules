module half_adder(a, b, sum, carry);

output sum, carry;
input a, b;

assign sum = ~a&b | a&~b;
assign carry = a&b;
endmodule