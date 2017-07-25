module part3(input Clk, D, output Qa);
wire clk_not, Qm;
not(clk_not, Clk);
part2_dlatch d1(.Clk(clk_not), .D(D), .Q(Qm)); 
part2_dlatch d2(.Clk(clk_not), .D(Qm), .Q(Qa));
endmodule

module part2_dlatch(input Clk, D, output Q);
wire R_g, S_g, Qa, Qb /* synthesis keep*/;
wire not_d;
not(not_d, D);
and(R_g, not_d, Clk);
and(S_g, D, Clk);
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