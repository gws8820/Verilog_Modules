module f_m(W,X,Y,Z,Out);

input W,X,Y,Z;
output Out;

wire w1,w2;

nor_m m3(Y,Z,w1);

or_m m4(W,X,w2);
or_m m5(w2,w1,Out);

endmodule
