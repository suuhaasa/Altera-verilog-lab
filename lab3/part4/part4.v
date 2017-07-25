module part4(D, Clk, Qa, Qb, Qc);
input D, Clk;
output wire Qa, Qb, Qc;
f_latch f1(D, Clk, Qa);
d_flip d1(D, Clk, Qb);
d_flop d2(D, Clk, Qc);
endmodule

module f_latch(D, Clk, Qa);
input D, Clk;
output reg Qa;
always @(D, Clk)
	if(Clk)
		Qa = D;
endmodule

module d_flip(D, Clk, Qb);
input D, Clk;
output reg Qb;

always @(posedge Clk)
	Qb=D;
endmodule

module d_flop(D, Clk, Qc);
input D, Clk;
output reg Qc;
always @(negedge Clk)
	Qc=D;
endmodule
