module decoder(W,X,Y,Z,a,b,c,d,e,f,g);

input W,X,Y,Z;
output a,b,c,d,e,f,g;

a_m m1(W,X,Y,Z,a);
b_m m2(W,X,Y,Z,b);
c_m m3(W,X,Y,Z,c);
d_m m4(W,X,Y,Z,d);
e_m m5(W,X,Y,Z,e);
f_m m6(W,X,Y,Z,f);
g_m m7(W,X,Y,Z,g);

endmodule