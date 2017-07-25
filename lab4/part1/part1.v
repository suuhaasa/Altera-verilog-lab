module part1(enable, clock, clear, Q1, HEX0, HEX1);
input enable, clock, clear;
output [0:6] HEX0, HEX1;
wire  [7:1] out;
output [0:7] Q1;
T_FF t1(enable, clock, clear, Q1[7]);
and(out[7], Q1[7], enable);
T_FF t2(out[7], clock, clear, Q1[6]);
and(out[6], Q1[6], out[7]);
T_FF t3(out[6], clock, clear, Q1[5]);
and(out[5], Q1[5], out[6]);
T_FF t4(out[5], clock, clear, Q1[4]);
and(out[4], Q1[4], out[5]);
T_FF t5(out[4], clock, clear, Q1[3]);
and(out[3], Q1[3], out[4]);
T_FF t6(out[3], clock, clear, Q1[2]);
and(out[2], Q1[2], out[3]);
T_FF t7(out[2], clock, clear, Q1[1]);
and(out[1], Q1[1], out[2]);
T_FF t8(out[1], clock, clear, Q1[0]);
seg71 seg1(HEX0, Q1[4:7]);
seg71 seg2(HEX1, Q1[0:3]);
endmodule

module T_FF(data, clk, reset, q);
input data, clk, reset;
output q;
reg q;
always @(negedge clk, negedge reset)
begin
if(!reset)
q<=1'b0;
else if(data)
q<=!q;
end
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
