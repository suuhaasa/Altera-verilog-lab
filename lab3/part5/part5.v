module part5(HEX3, HEX2, HEX1, HEX0, SW);
input [9:0] SW;
output [0:6] HEX2, HEX3, HEX1, HEX0;
wire [7:0] Qa;
_regis regs(.D(SW[7:0]), .Clk(SW[8]), .reset(SW[9]),.Q(Qa[7:0]));
seg71 seg1(HEX2, Qa[3:0]);
seg71 seg2(HEX3, Qa[7:4]);
seg71 seg3(HEX0, SW[3:0]);
seg71 seg4(HEX1, SW[7:4]);
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
				  (SW==4'b1001)? 7'b000_1100:
				  (SW==4'b1010)? 7'b000_1000:
				  (SW==4'b1011)? 7'b110_0000:
				  (SW==4'b1100)? 7'b011_0001:
				  (SW==4'b1101)? 7'b100_0010:
				  (SW==4'b1110)? 7'b011_0000:
				  (SW==4'b1111)? 7'b011_1000: 7'b111_111;
endmodule

module _regis(D, Clk, reset, Q);
genvar i;
input Clk, reset;
input [7:0] D;
output [7:0] Q;
generate
for(i=0; i<8; i=i+1)
begin:flops
d_flip ds(D[i], Clk, reset, Q[i]);
end
endgenerate
endmodule

module d_flip(D, Clk, Reset, Qb);
input D, Clk, Reset;
output reg Qb;

always @(posedge Clk or negedge Reset)
	if(!Reset)
	Qb<=1'b0;
	else
	Qb<=D;
endmodule
