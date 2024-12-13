module c_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1;

not_m m1(Y,w1);

or_m m2(X,w1,w2);
or_m m3(w2,Z,Out);

endmodule
