module part3(KEY, HEX0, HEX1, HEX2, HEX3, CLOCK_50, SW);
input wire [2:1] KEY;
input CLOCK_50;
output wire [0:6] HEX0, HEX1, HEX2, HEX3;
reg [26:0] count;
input wire [7:0] SW;
reg delay;
reg [3:0] ones, tens;
reg [7:0] minutes;
initial 
begin
ones = 4'b0;
tens = 4'b0;
minutes = 8'b0;
end

always @(posedge delay, negedge KEY[1], negedge KEY[2])
begin
if(!KEY[1])
begin
tens<=2'b0;
ones<=2'b0;
end
else if(!KEY[2])
begin
minutes <= SW[7:0];
end
else if(tens==4'd9 && ones==4'd9)
begin
ones<=0;
tens<=0;
end
else if(ones==4'd9)
begin
ones<=0;
tens<=tens+1;
end
else if(tens==4'd6 && ones==4'd0)
begin
tens <= 0;
ones <= 0;
minutes = minutes + 1;
end
else 
ones<=ones + 1;
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

seg71 seg1(HEX1, tens);
seg71 seg2(HEX0, ones);
seg71 seg3(HEX2, minutes[3:0]);
seg71 seg4(HEX3, minutes[7:4]);

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



