module part4(CLOCK_50, HEX0);
input	CLOCK_50;
reg delay;
integer i = 0;
reg	[25:0] count;
output [0:6] HEX0;
seg71 seg1(HEX0, i);

always @(posedge delay)
begin
i = (i + 1)%9;
end

always @(posedge CLOCK_50)
begin
if(count==26'd49_999_999)
begin
count<=26'd0;
delay<=1;
end
else
begin
count<=count+1;
delay<=0;
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
				  (SW==4'b1001)? 7'b000_1100:
				  (SW==4'b1010)? 7'b000_1000:
				  (SW==4'b1011)? 7'b110_0000:
				  (SW==4'b1100)? 7'b011_0001:
				  (SW==4'b1101)? 7'b100_0010:
				  (SW==4'b1110)? 7'b011_0000:
				  (SW==4'b1111)? 7'b011_1000: 7'b111_111;
endmodule
