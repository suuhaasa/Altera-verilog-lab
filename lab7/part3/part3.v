module part3(SW, LEDG, KEY);
input [1:0] SW;
input [2:2] KEY;
output [9:8] LEDG;
reg [3:0] shift1, shift2;
reg x;
wire w;
assign w = SW[1];
wire one_yes, zero_yes;
assign clock = KEY[2];
always @(w)
x = w;
assign LEDG[9] = one_yes;
assign LEDG[8] = zero_yes;

always @(negedge clock) begin
	
	shift1[3] <= x;
	shift1[2] <= shift1[3];
	shift1[1] <= shift1[2];
	shift1[0] <= shift1[1];
	end
assign one_yes = (shift1==4'b1111)? 1'b1: 1'b0;
assign zero_yes = (shift1==4'b0000) ? 1'b1: 1'b0;
//always @(posedge clock) begin
//	shift2[3] <= x;
//	shift2[2] <= shift2[3];
//	shift2[1] <= shift2[2];
//	shift2[0] <= shift2[1];
//	if(shift1 == 4'b0000)
//	zero_yes<=1'b1;
//	else
//	zero_yes<=1'b0;
//end
endmodule
