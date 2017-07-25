module part1(SW, KEY, LEDG);
input [1:1] SW;
input [2:1] KEY;
output [9:0] LEDG;
assign reset = KEY[1];
//assign w = SW[1];
assign clock = KEY[2];
assign LEDG[8:0] = state;
wire reset, clock;
reg w;
reg [8:0] state = 9'd1;
wire [8:0] next_state;
always @(negedge clock, negedge reset) begin
if(!reset) begin
state<=9'd0;
end
else begin
w = SW[1];
state<=next_state;
end
end

assign next_state =(state==9'd0&&w==0)? 9'd3:
					(state==9'd0&&w==1)? 9'd5:
					(state==9'd3&&w==0)? 9'd5:
					(state==9'd3&&w==1)? 9'd33:
					(state==9'd5&&w==0)? 9'd9:
					(state==9'd5&&w==1)? 9'd33:
					(state==9'd9&&w==0)? 9'd17:
					(state==9'd9&&w==1)? 9'd33:
					(state==9'd17&&w==0)? 9'd17:
					(state==9'd17&&w==1)? 9'd33:
					(state==9'd33&&w==0)? 9'd3:
					(state==9'd33&&w==1)? 9'd65:
					(state==9'd65&&w==0)? 9'd3:
					(state==9'd65&&w==1)? 9'd129:
					(state==9'd129&&w==0)? 9'd3:
					(state==9'd129&&w==1)? 9'd257:
					(state==9'd257&&w==0)? 9'd3:
					(state==9'd257&&w==1)? 9'd257: 9'b111111111;
					
assign LEDG[9] = (state==9'd17&&w==0)? 1'b1:
					(state==9'd257&&w==1)? 1'b1: 1'b0;
endmodule
					