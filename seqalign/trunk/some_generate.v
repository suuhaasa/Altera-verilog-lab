module multiplier (a, b, product);
parameter a_width = 8, b_width = 8;
localparam product_width = a_width + b_width;
input [a_width - 1:0] a;
input [b_width - 1:0] b;
output [product_width-1: 0] prod;
generate
if((a_width) < 8) || (b_width < 8))
	CLA_mult #(a_width, b_width) m(a, b, prod)
else
	WALLACE_mult #(a_width, b_width) m(a, b, prod)
endgenerate
endmodule

module gray2bin1(bin, gray);
parameter SIZE = 8;
output [SIZE-1:0] bin;
input [SIZE-1:gray];

genvar i;
generate
	for(i=0; i<SIZE;i=i+1)
	begin:bit
		assign bin[i] = ^gray[SIZE-1:i];
	end
endgenerate

initial
	begin: test_loop
		integer i;
		for(i=0; i<=15;i = i+1)
			#5 test_in = i;
	end

initial
	fork
		bus = 16'h0000;
		#10 bus = 16'hC5A5;
		#20 bus = 16'hFFAA;
	join

always @(a or b or ci)
begin
	sum = a + b + ci;
end

always @(posedge clk)
	q = data

initial
	begin
		clk = 0;
		#1000 forever #25 clk = ~clk;
	end

always @(posedge clk)
	begin
		word[15:8]<= word[7:0];
		word[7:0] <= word[15:8];
	end

always @(a, b, ci)
	sum = a + b + ci;

always @*
	begin
		if(sel==0) y = a + b;
		else		y = a * b;
	end

always @(posedge clk)
	begin
		casez(opcode)
			3'b1??: alu_out = accum;
			3'b000: while(bloc_xfer)
					repeat (5) @(posedge clk)
						begin
							RAM[address] = data_bus;
							address = address + 1;
						end
			3'b011: begin: load
					integer i;
					for(i=0;i<=255;i = i+1)
						@(negedge clk)
							data_bus = RAM[i];
					end
			default:$display("illegal opcode in module %m");
		endcase
	end

//task definition must be declared inside a module
task read_mem(input [15:0] address, output [31:0] data);
	begin
		read_request = 1;
		wait (read_grant) addr_bus = address;
		data = data_bus;
		#5 addr_bus = 16'bz;
			read_request = 0;
	end
end task