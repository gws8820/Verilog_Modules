module g_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2,w3,w4,w5,w6,w7,w8;

not_m m1(X,w1);
not_m m2(Y,w2);
not_m m3(Z,w3);
and_m m4(X,w2,w4);
and_m m5(w1,Y,w5);
and_m m6(X,w3,w6);

or_m m7(W,w4,w7); or_m m8(w5,w6,w8);
or_m m9(w7,w8,Out);

endmodule
