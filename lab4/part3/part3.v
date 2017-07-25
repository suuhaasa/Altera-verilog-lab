module part3(input clock, output [0:6] HEX0, HEX1, HEX2, HEX3);
wire [15:0] q;
mega_counter counter1(clock, q);
seg71 seg1(HEX0, q[15:12]);
seg71 seg2(HEX1, q[11:8]);
seg71 seg3(HEX2, q[7:4]);
seg71 seg4(HEX3, q[3:0]);
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
