module Multiplicand(
	input logic [31:0] data,
	input logic clk,
	input logic reset,
	input logic shift,
	input logic  load,
	output logic [31:0] out
);
	logic [31:0] outTemp;
	logic [31:0] shiftLeft;
	
	assign shiftLeft = {out[30:0], 1'b0};
	
	assign outTemp = (shift) ? shiftLeft : out;
	
	always_ff @(posedge clk or negedge reset) begin
		if(!reset) out <= 32'd0;
		else if(load) out <= data;
		else out <= outTemp;
	end

endmodule 