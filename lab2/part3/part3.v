module part3(LEDG, cout, SW, cin);
input [7:0] SW;
input cin;
output [3:0] LEDG;
output cout;
wire t1, t2, t3;
fulladder1 fa1(LEDG[0], t1, SW[0], SW[4], cin);
fulladder1 fa2(LEDG[1], t2, SW[1], SW[5], t1);
fulladder1 fa3(LEDG[2], t3, SW[2], SW[6], t2);
fulladder1 fa4(LEDG[3], cout, SW[3], SW[7], t3);

endmodule

module fulladder1(s, cout, a, b, cin);
input a, b;
input cin;
output s;
output cout;
wire t;
xor xor1(t, a, b);
xor xor2(s, t, cin);
mux_2to1_1bit(cout, b, cin, t);
endmodule
	
module mux_2to1_1bit(out, x, y, s);
input x, y, s;
output out;
assign out = (~s&x)|(s&y);
endmodule
