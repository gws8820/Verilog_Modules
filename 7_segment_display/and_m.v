module and_m(A,B,Y);

input A,B;
output Y;

wire w1;

nand_m m1(A,B,w1);
nand_m m2(w1,w1,Y);

endmodule
