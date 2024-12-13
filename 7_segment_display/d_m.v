module d_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

not_m m1(X,w1);
not_m m2(Y,w2);
not_m m3(Z,w3);
and_m m4(w1,Y,w4);
nor_m m5(X,Z,w5);
and_m m6(Y,w3,w6);
and_m m7(X,w2,w7); and_m m8(w7,Z,w8);

or_m m9(W,w4,w9); or_m m10(w5,w6,w10); or_m m11(w9,w10,w11);
or_m m12(w11,w8,Out);

endmodule
