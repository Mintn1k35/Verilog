module UpDownCounter(
	input logic D,
	input logic E, 
	input logic reset,
	input logic clk,
	output logic over,
	output logic [31:0] Q
);
	
	logic [31:0] Di;
	
	Hash_32 hash(.Q(Q), .Q_n(~Q), .D(D), .E(E), .over(over), .Di(Di));
	
	
	always_ff @(posedge clk, negedge reset) begin
		if(!reset) Q <= 32'd0;
		else Q <= Di;
	end
endmodule 