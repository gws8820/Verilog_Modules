module or_m(A,B,Y);

input A,B;
output Y;

wire w1;

nand_m m1(A,A,w1);
nand_m m2(B,B,w2);
nand_m m3(w1,w2,Y);

endmodule
