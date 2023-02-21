module Multiplier(
	input logic [31:0] data,
	input logic clk,
	input logic reset,
	input logic shift,
	input logic load,
	output logic LSB,
	output logic [31:0] out
);

	logic [31:0] outTemp;
	logic [31:0] shiftRight;
	
	assign shiftRight = {1'b0,out[31:1]};
	assign outTemp = (shift) ? shiftRight : out;
	always_ff @(posedge clk or negedge reset) begin
		if(!reset) begin
			out <= 32'd0;
			LSB <= 1'b0;
		end 
		else if (load) begin
			out <= data;
			LSB <= data[0];
		end
		else begin
			out <= outTemp;
			LSB <= outTemp[0];
		end
	end
	
endmodule 