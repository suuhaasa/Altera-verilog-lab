module part1(KEY, LEDG);
output [7:0] LEDG;
input [0:2] KEY;
wire [7:0] Q;
counter eight_bit(KEY[0], KEY[1] , Q);
	defparam eight_bit.n = 8;
	defparam eight_bit.k = 5;
assign LEDG = Q;
endmodule

module counter(clock, reset_n, Q);
parameter n = 4;
parameter k = 10;
input clock, reset_n;
output [n-1:0] Q;
reg [n-1:0] Q;

always @(negedge clock or negedge reset_n)
begin
	if(!reset_n)
		Q<= 'd0;
	else
		Q<=(Q + 1'b1)%k;
end
endmodule
