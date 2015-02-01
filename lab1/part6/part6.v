module part6(segm1, segm2, segm3, segm4, s);
output [6:0] segm1;
output [6:0] segm2;
output [6:0] segm3;
output [6:0] segm4;
input [1:0] s;
seg71 seg1(segm1, s);
seg72 seg2(segm2, s);
seg73 seg3(segm3, s);
seg74 seg4(segm4, s);
endmodule

module seg71(seg7, s);
input [1:0] s;
output [6:0] seg7;
assign seg7 = (s==2'b00)? 7'b010_0001:
				  (s==2'b01)? 7'b000_0110:
				  (s==2'b10)? 7'b100_0000:7'b011_1111;
endmodule

module seg72(seg7, s);
input [1:0] s;
output [6:0] seg7;
assign seg7 = (s==2'b00)? 7'b010_0001:
				  (s==2'b01)? 7'b000_0110:
				  (s==2'b10)? 7'b100_0000:7'b011_1111;
endmodule

module seg73(seg7, s);
input [1:0] s;
output [6:0] seg7;
assign seg7 = (s==2'b00)? 7'b010_0001:
				  (s==2'b01)? 7'b000_0110:
				  (s==2'b10)? 7'b100_0000:7'b011_1111;
endmodule

module seg74(seg7, s);
input [1:0] s;
output [6:0] seg7;
assign seg7 = (s==2'b00)? 7'b010_0001:
				  (s==2'b01)? 7'b000_0110:
				  (s==2'b10)? 7'b100_0000:7'b011_1111;
endmodule

module mux_3to1_2bit(out, x, y, z, s);
input [1:0] x, y, z;
input [1:0] s;
output [1:0] out;
wire [1:0] out1;
mux_2to1_3bit(out1, z, y, s[0]);
mux_2to1_3bit(out, out1, x, s[1]);
endmodule

module mux_2to1_3bit(out, x, y, s);
input [2:0] x, y;
input s;
output [2:0] out;
mux_2to1_1bit mux1(out[2], x[2], y[2], s);
mux_2to1_1bit mux2(out[1], x[1], y[1], s);
mux_2to1_1bit mux3(out[0], x[0], y[0], s);
endmodule

module mux_3to1_1bit(out, x, y, z, s);
input x, y, z;
output out;
input [1:0] s;
wire out1;
mux_2to1_1bit mux1(out1, z, y, s[0]);
mux_2to1_1bit mux2(out, out1, x ,s[1]);
endmodule

module mux_2to1_1bit(out, x, y, s);
input x, y, s;
output out;
assign out = (~s&x)|(s&y);
endmodule