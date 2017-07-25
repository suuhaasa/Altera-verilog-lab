module part2(SW, LEDG, KEY);
input [1:0] SW;
input [2:2] KEY;
output [9:0] LEDG;
reg [4:0] state, next_state;
wire reset, clock;
reg z;
assign clock = KEY[2];
assign reset = SW[0];
assign w = SW[1];
assign LEDG[9] = z;
assign LEDG[3:0] = state;
always @(state, reset, w)
case(state)
4'd0: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd1;
		else next_state = 4'd5;
4'd1: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd2;
		else next_state = 4'd5;
4'd2: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd3;
		else next_state = 4'd5;
4'd3: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd4;
		else next_state = 4'd5;
4'd4: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd4;
		else next_state = 4'd5;
4'd5: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd1;
		else next_state = 4'd6;
4'd6: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd1;
		else next_state = 4'd7;
4'd7: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd1;
		else next_state = 4'd8;
4'd8: if(!reset) next_state = 4'd0;
		else if(w==0) next_state = 4'd1;
		else next_state = 4'd8;
endcase
always @(negedge clock) begin
state<=next_state;
end
always @(state) begin
if(state==4'd4 || state==4'd8)
z = 1'b1;
else z = 1'b0;
end
endmodule

