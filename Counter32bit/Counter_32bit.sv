module Counter_32bit(
	input logic clk,
	input logic reset,
	output logic over,
	output logic [31:0] sum,
	output logic[31:0] count
);
	
	
	Adder_32bit adder(count, 32'd1, over, sum);
	
	
	
	always_ff @(posedge clk, negedge reset) begin
		if(!reset) count <= 32'd0;
		else count <= sum;
	end

endmodule 