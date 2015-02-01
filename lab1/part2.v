module part2(out, x, y, s);
input [2:0] x, y;
input s;
output [2:0] out;
mux_2to1_part2 mux1(out[2], x[2], y[2], s);
mux_2to1_part2 mux2(out[1], x[1], y[1], s);
mux_2to1_part2 mux3(out[0], x[0], y[0], s);
endmodule
module mux_2to1_part2(out, x, y, s);
input x, y, s;
output out;
assign out = (~s&x)|(s&y);
endmodule