module finally(G1, G2, B, A, Y0, Y1, Y2, Y3);
input G1, G2, B, A;
output Y0, Y1, Y2, Y3;
wire en;
and(en, G1, ~G2);
and(Y0, en, ~B, ~A);
and(Y1, en, ~B, A);
and(Y2, en, B, ~A);
and(Y3, en, B, A);
endmodule
