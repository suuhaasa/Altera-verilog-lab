module part1(SW, LEDG, KEY);
input [7:0] SW;
input [2:1] KEY;
output [8:0] LEDG;
reg ov;
reg [7:0] store_A, store_B;
wire overflow;
wire [7:0] answer;
assign LEDG[8:8] = ov;
assign LEDG[7:0]  = store_B;
adder a1(store_A, store_B, 0, overflow, answer);
initial begin
store_A = 8'b0;
store_B = 8'b0;
end

always @(posedge KEY[2]) begin
store_A <= SW;
store_B <= answer;
end

always @(posedge KEY[2])
ov <=overflow;

endmodule
module adder(next, prev, cin, overflow, added);
input [7:0] next, prev;
input cin;
output [7:0] added;
output overflow;
assign {overflow, added} = next + prev + cin;
endmodule
