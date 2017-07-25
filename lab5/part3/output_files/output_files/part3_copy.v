module part4(SW, KEY, CLOCK_50, LEDG);
input [2:0] SW; // letter selection
input [2:1] KEY; //start & asyn reset
input CLOCK_50; //50mhz clock
output [0:0] LEDG;

reg [25:0] count; // counts 50MHZ clock signals to 0.5 secconds
reg [2:0] length; //morse code length 1-4
reg [2:0] counter; // length counter
reg [3:0] M; // code 1=dash, 0= dot
reg [3:0] Q; // shift register outputs Q[3] is input to fsm
reg z; //output to led

reg[2:0] y_Q, Y_D; //current state, next state
parameter Qa = 3'b000, Ra = 3'b001, Sa = 3'b010, Ta = 3'b011, Ua = 3'b100, Va = 3'b101, Wa = 3'b110, Xa = 3'b111;

parameter A = 3'b000, B = 3'b001, C=3'b010, D=3'b011, E=3'b100;

assign LEDG[0] = z;
always @(SW) //anytime user changes his selection
begin: letter_selection
	case(SW[2:0])
		Qa: begin
				length = 3'b100;
				M = 4'b1101;
				end
		Ra: begin
				length = 3'b011;
				M = 4'b0100;
				end
		Sa: begin
				length = 3'b011;
				M =4'b1000;
					end
			Ua: begin
					length = 3'b011;
					M = 4'b0010;
				end
			Va: begin
					length = 3'b100;
					M = 4'b0001;
				end
			Wa: begin
					length = 3'b011;
					M = 4'b0110;
				end
			Xa: begin
					length = 3'b100;
					M = 4'b1001;
				end
		endcase
end

always @(Q[3], KEY[2:1], y_Q)
begin: state_table
	case(y_Q)
		A: if(!KEY[2]) Y_D = B;
				else Y_D = A;
		B: if(!Q[3]) Y_D = E; //if next symbol is E goto sate E
				else Y_D = C;
		C: if(!KEY[1]) Y_D = A;
				else Y_D = D;
		D: if(!KEY[1]) Y_D = A;
				else Y_D = E;
		E: if(counter == 0) Y_D = A;
				else Y_D = B;
		default: Y_D = 3'bxxx;
	endcase
end

always @(posedge CLOCK_50)
begin	
	if(count<50000000/2)
		count<=count + 1;
	else
	begin
		count <=0;
		y_Q <=Y_D;
		if(Y_D == A) begin
			counter <=length;
			Q<= M;
		end
		if(Y_D == E) begin
			counter <=counter - 1;
			Q[3] <= Q[2];
			Q[2] <= Q[1];
			Q[1] <= Q[0];
			Q[0] <= 1'b0;
			end
end
end
			
always @(y_Q)
begin: zassign
	case(y_Q)
		B:z = 1;
		C:z = 1;
		D:z = 1;
		default: z=0;
		endcase
		end
		endmodule
		
		
				
		