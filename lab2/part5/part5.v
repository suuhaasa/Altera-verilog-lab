module part5(HEX1, HEX0, SW);
input [8:0] SW;
output [0:6] HEX1, HEX0;
wire [3:0] S0, S1;
seg71 seg1(HEX0,S0);
seg72 seg2(HEX1, S1);
part5_BCDADD bcdadd(S0, S1, SW);
endmodule
module part5_BCDADD(S0, S1, SW);
input [8:0] SW;
integer To,Zo,c1;
output [3:0] S0, S1;
reg [3:0] S0, S1;
always @(SW[7:4], SW[3:0], SW[8])
begin
To = SW[7:4] + SW[3:0] + SW[8];
if(To>9)
begin
Zo = 10;
c1 = 1;
end
else
begin
Zo = 0;
c1 = 0;
end
S0 = To-Zo;
S1 = c1;
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
				  (SW==4'b1001)? 7'b000_1100: 7'b111_111;
endmodule

module seg72(HEX1, SW);
input  SW;
output [0:6] HEX1;
assign HEX1 = (SW==1'b0)? 7'b000_0001:
				  (SW==1'b1)? 7'b100_1111:7'b111_111;
endmodule	

