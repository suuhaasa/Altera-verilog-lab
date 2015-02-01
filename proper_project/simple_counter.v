//single clock input and a 32 bit output
module simple_counter(output reg [31:0] counter_out, input clock);
always @(posedge clock)//on positive edge
begin
counter_out <= #1 counter_out + 1;//increment counter
end
endmodule //end of module

