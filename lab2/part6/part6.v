module part6(HEX1, HEX0, HEX2, SW);
input [7:0] SW;
output [0:6] HEX1, HEX0, HEX2;
wire [3:0] OUT1, OUT2, OUT3;
part6_convert convert(.hundreds(OUT3),.tens(OUT2), .ones(OUT1), .binary(SW));
seg71 seg1(HEX0, OUT1);
seg71 seg2(HEX1, OUT2);
seg71 seg3(HEX2, OUT3);
endmodule

module part6_convert(input [7:0] binary, output reg [3:0] hundreds, output reg [3:0] tens, output reg [3:0] ones);
integer i;
always @(binary)
begin
hundreds = 4'd0;
tens = 4'd0;
ones = 4'd0;
for(i=7;i>=0;i = i -1)
begin
	if(hundreds>=5)
	hundreds = hundreds + 3;
	if(tens>=5)
	tens = tens+3;
	if(ones>=5)
	ones = ones + 3;

	hundreds = hundreds << 1;
	hundreds[0] = tens[3];
	tens = tens << 1;
	tens[0] = ones[3];
	ones = ones << 1;
	ones[0] = binary[i];
end
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
	
