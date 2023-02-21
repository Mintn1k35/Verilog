module Product(
	input logic [63:0] data,
	input logic clk,
	input logic reset,
	input logic write,
	output logic [63:0] out
);
	always_ff @(posedge clk or negedge reset) begin
		if(!reset) out <= 64'd0;
		else if(write) out <= data;
		else out <= out;
	end

endmodule 