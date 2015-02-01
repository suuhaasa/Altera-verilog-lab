module tutorial1( output reg [32:0] counter_out, input clock);
always @(posedge clock)
begin
counter_out <= counter_out + 1;
end
endmodule