module part2(output reg [15:0] Q, input clock);
always @(negedge clock)
Q <= Q+1;
endmodule
