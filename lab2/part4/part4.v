	module part4(HEX1, HEX0, SW);
input [7:0] SW;
output [0:6] HEX0;
output [0:6] HEX1;
wire [3:0] addOut;
wire cout;
part3_adder adder1(addOut, cout, SW);
part4_bcdcircuit bcdcircuit1(HEX1, HEX0, addOut, cout);
endmodule

module part4_bcdcircuit(HEX1, HEX0, addIn, cin);
input [3:0] addIn;
input cin;
output [0:6] HEX0;
output [0:6] HEX1;
wire z;
wire [3:0] M;
wire [3:0] t;
comparator comparator1(z, {cin, addIn});
circuitA circuita1(t, addIn);	
mux_2to1_1bit mux3(M[3], addIn[3], t[3], z);
mux_2to1_1bit mux2(M[2], addIn[2], t[2], z);
mux_2to1_1bit mux1(M[1], addIn[1], t[1], z);
mux_2to1_1bit mux0(M[0], addIn[0], t[0], z);
seg71 segd0(HEX0, M);
seg72 segd1(HEX1, z);
endmodule

module comparator(z, V);
input [4:0] V;
output z;
assign z = (V==5'b01010)? 1'b1:
			  (V==5'b01011)? 1'b1:
			  (V==5'b01100)? 1'b1:
			  (V==5'b01101)? 1'b1:
			  (V==5'b01110)? 1'b1:
			  (V==5'b01111)? 1'b1:
			  (V==5'b10000)? 1'b1:
			  (V==5'b10001)? 1'b1:
			  (V==5'b10010)? 1'b1:
			  (V==5'b10011)? 1'b1:1'b0;
endmodule

module circuitA(M, V);
input [3:0] V;
output [3:0] M;
assign M = (V==4'b1010)? 4'b0000:
			  (V==4'b1011)? 4'b0001:
			  (V==4'b1100)? 4'b0010:
			  (V==4'b1101)? 4'b0011:
			  (V==4'b1110)? 4'b0100:
			  (V==4'b1111)? 4'b0101:
			  (V==4'b0000)? 4'b0110:
			  (V==4'b0001)? 4'b0111:
			  (V==4'b0010)? 4'b1000:
			  (V==4'b0011)? 4'b1001:4'b0000;
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
				  (SW==4'b1000)? 7'b000_0000:
				  (SW==4'b1001)? 7'b000_1100: 7'b111_111;
endmodule

module seg72(HEX1, SW);
input  SW;
output [0:6] HEX1;
assign HEX1 = (SW==1'b0)? 7'b000_0001:
				  (SW==1'b1)? 7'b100_1111:7'b111_111;
endmodule	

module part3_adder(addOut, cout, SW);
input [7:0] SW;
output [3:0] addOut;
output cout;
wire t1, t2, t3;
fulladder1 fa1(addOut[0], t1, SW[0], SW[4], 1'b0);
fulladder1 fa2(addOut[1], t2, SW[1], SW[5], t1);
fulladder1 fa3(addOut[2], t3, SW[2], SW[6], t2);
fulladder1 fa4(addOut[3], cout, SW[3], SW[7], t3);

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
