module part4(HEX0, HEX1, HEX2, SW, KEY);
output [0:6] HEX0, HEX1, HEX2;
input [9:0] SW;
input [2:2] KEY;
wire [4:0] a, b;
reg [9:0] S;
wire [3:0] temp1, temp2, temp3, temp4;
wire [9:0] p;
wire [2:0] cout;
wire [9:0] after_reg;
reg [9:0] p1;
seg71 seg1(HEX0, after_reg[3:0]);
seg71 seg2(HEX1, after_reg[7:4]);
seg71 seg3(HEX2, after_reg[9:7]);
assign a = S[4:0];
assign b = S[9:5];
assign after_reg = p1;
always @ (posedge KEY[2])
begin
p1<=p;
end

always @ (posedge KEY[2])
begin
S<=SW;
end
and(p[0], a[0], b[0]);
and(temp1[0], a[1], b[0]);
and(temp1[1], a[2], b[0]);
and(temp1[2], a[3], b[0]);
and(temp1[3], a[4], b[0]);
full_adder_array array1(a, b[1], {1'b0, temp1}, {temp2, p[1]}, 1'b0, cout[0]); 
full_adder_array array2(a, b[2], {cout[0], temp2}, {temp3, p[2]}, 1'b0, cout[1]);
full_adder_array array3(a, b[3], {cout[1], temp3}, {temp4, p[3]}, 1'b0, cout[2]);
full_adder_array array4(a, b[4], {cout[2], temp4}, p[8:4], 1'b0, p[9]);
endmodule

module full_adder(a, b, c, s, cin, cout);
input a, b, c, cin;
output s;
output cout;
wire x;
assign x = a & b;
assign {cout, s} = x + c+cin;
endmodule

module full_adder_array(a, b, c, s, cin, cout);
parameter n = 4;
input [n:0] a, c;
input b, cin;
wire [n-1:0] temp_cout;
output cout;
output [n:0] s;
full_adder fa1(a[0], b, c[0], s[0], cin, temp_cout[0]);
//full_adder fa2(a[1], b, c[1], s[1], temp_cout[0], temp_cout[1]);
//full_adder fa3(a[2], b, c[2], s[2], temp_cout[1], temp_cout[2]);
//full_adder fa3(a[3], b, c[3], s[3], temp_cout[2], temp_cout[3]);
full_adder fa4(a[n], b, c[n], s[n], temp_cout[n-1], cout);
genvar i;
generate
for(i=1; i<=n-1; i=i+1) 
begin : fa
full_adder(a[i], b, c[i], s[i], temp_cout[i-1], temp_cout[i]);
end
endgenerate
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