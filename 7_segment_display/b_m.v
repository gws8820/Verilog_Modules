module b_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2,w3,w4;

not_m m1(X,w1);
and_m m2(Y,Z,w2);
nor_m m3(Y,Z,w3);

or_m m4(w1,w2,w4);
or_m m5(w4,w3,Out);

endmodule
