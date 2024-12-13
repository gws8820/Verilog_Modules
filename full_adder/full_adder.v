module full_adder (a, b, c_in, c_out, sum);

output c_out, sum;
input a, b, c_in;

assign {c_out, sum} = a + b + c_in;

endmodule