module part3(out, x, s);
input [2:0] x;
output out;
input [1:0] s;
wire out1;
mux_2to1_part3 mux1(out1,x[2],x[1], s[0]);
mux_2to1_part3 mux2(out, out1, x[0] ,s[1]);
endmodule

module mux_2to1_part3(out, x, y, s);
input x, y, s;
output out;
assign out = (~s&x)|(s&y);
endmodule