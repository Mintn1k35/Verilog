module Register(
	input logic [31:0] I,
	input logic clk,
	input logic reset,
	input logic set,
	output logic [31:0] Q
);
	
	always_ff @(posedge clk, negedge reset, negedge set) begin
		if(!reset) Q <= 32'd0;
		else if(!set) Q <= 32'd4294967295;
		else Q <= I;
	end
	

endmodule 