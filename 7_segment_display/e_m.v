module e_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2,w3;

not_m m1(Z,w1);
nor_m m2(X,Z,w2);
and_m m3(Y,w1,w3);

or_m m4(w2,w3,Out);

endmodule
