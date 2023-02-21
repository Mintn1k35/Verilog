module Multiplicand(
	input logic [31:0] data,
	input logic load,
	input logic reset,
	input logic shiftLeft,
	output logic [31:0] out
);

	always_ff @(posedge clk or negedge reset) begin
		if(!reset) out <= 32'd0;
		else if(load) out <= data;
		else if(shiftLeft) out <= {out[31:1], 1'b0};
	end

endmodule 