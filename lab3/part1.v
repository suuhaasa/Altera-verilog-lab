module part1(input Clk, R, S, output Q);
wire R_g, S_g, Qa, Qb; /* synthesis keep*/
and(R_g, R, Clk);
and(S_g, S, Clk);
nor(Qa, R_g, Qb);
nor(Qb, Qa, S_g);
assign Q = Qa;
endmodule
//module part1(Clk, R, S, Q);
//input Clk, R, S;
//output Q;
//wire R_g, S_g, Qa, Qb/*synthesis keep*/;
//assign R_g = R&Clk;
//assign S_g = S&Clk;
//assign Qa = ~(R_g|Qb);
//assign Qb = ~(S_g|Qa);
//assign Q = Qa;
//endmodule