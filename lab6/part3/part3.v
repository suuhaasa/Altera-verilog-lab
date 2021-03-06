module part3(SW, LEDG);
input [7:0] SW;
output [7:0] LEDG;
wire [3:0] a, b;
wire [2:0] temp1, temp2, temp3;
wire [7:0] p;
wire [1:0] cout;
assign a = SW[3:0];
assign b = SW[7:4];
assign LEDG = p;
and(p[0], a[0], b[0]);
and(temp1[0], a[1], b[0]);
and(temp1[1], a[2], b[0]);
and(temp1[2], a[3], b[0]);
full_adder_array array1(a, b[1], {1'b0, temp1}, {temp2, p[1]}, 1'b0, cout[0]); 
full_adder_array array2(a, b[2], {cout[0], temp2}, {temp3, p[2]}, 1'b0, cout[1]);
full_adder_array array3(a, b[3], {cout[1], temp3}, p[6:3], 1'b0, p[7]);
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
input [3:0] a, c;
input b, cin;
wire [2:0] temp_cout;
output cout;
output [3:0] s;
full_adder fa1(a[0], b, c[0], s[0], cin, temp_cout[0]);
full_adder fa2(a[1], b, c[1], s[1], temp_cout[0], temp_cout[1]);
full_adder fa3(a[2], b, c[2], s[2], temp_cout[1], temp_cout[2]);
full_adder fa4(a[3], b, c[3], s[3], temp_cout[2], cout);
endmodule



