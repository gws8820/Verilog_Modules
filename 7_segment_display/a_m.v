module a_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2,w3,w4;

and_m m1(X,Z,w1);
nor_m m2(X,Z,w2);

or_m m3(W,Y,w3); or_m m4(w1,w2,w4);
or_m m5(w3,w4,Out);

endmodule
