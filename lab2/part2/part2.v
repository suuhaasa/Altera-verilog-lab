module part2(HEX1, HEX0, SW);
input [3:0] SW;
output [0:6] HEX0;
output [0:6] HEX1;
wire z;
wire [3:0] M;
wire [2:0] t;
comparator comparator1(z, SW);
circuitA circuita1(t, SW);
mux_2to1_1bit mux3(M[3], SW[3], 1'b0, z);
mux_2to1_1bit mux2(M[2], SW[2], t[2], z);
mux_2to1_1bit mux1(M[1], SW[1], t[1], z);
mux_2to1_1bit mux0(M[0], SW[0], t[0], z);
seg71 segd0(HEX0, M);
seg72 segd1(HEX1, z);
endmodule

module comparator(z, V);
input [3:0] V;
output z;
assign z = 	  (V==4'b1010)? 1'b1:
			  (V==4'b1011)? 1'b1:
			  (V==4'b1100)? 1'b1:
			  (V==4'b1101)? 1'b1:
			  (V==4'b1110)? 1'b1:
			  (V==4'b1111)? 1'b1:1'b0;
endmodule

module circuitA(M, V);
input [3:0] V;
output [2:0] M;
assign M =    (V==4'b1010)? 3'b000:
			  (V==4'b1011)? 3'b001:
			  (V==4'b1100)? 3'b010:
			  (V==4'b1101)? 3'b011:
			  (V==4'b1110)? 3'b100:
			  (V==4'b1111)? 3'b101:3'b000;
endmodule

module mux_2to1_1bit(out, x, y, s);
input x, y, s;
output out;
assign out = (~s&x)|(s&y);
endmodule

module seg71(HEX0, SW);
input [3:0] SW;
output [0:6] HEX0;
assign HEX0 = (SW==4'b0000)? 7'b000_0001:
				  (SW==4'b0001)? 7'b100_1111:
				  (SW==4'b0010)? 7'b001_0010:
				  (SW==4'b0011)? 7'b000_0110:
				  (SW==4'b0100)? 7'b100_1100:
				  (SW==4'b0101)? 7'b010_0100:
				  (SW==4'b0110)? 7'b010_0000:
				  (SW==4'b0111)? 7'b000_1111:
				  (SW==4'b1000)? 7'b000_0000:7'b111_111;
endmodule

module seg72(HEX1, SW);
input  SW;
output [0:6] HEX1;
assign HEX1 = (SW==1'b0)? 7'b000_0001:
				  (SW==1'b1)? 7'b100_1111:7'b111_111;
endmodule	