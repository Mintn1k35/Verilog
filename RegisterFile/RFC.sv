module RFC(
	input logic I,
	input logic RS,
	input logic WS,
	input logic clk,
	output logic Q
);
	
	logic D;
	logic Q1;
	assign D = (I & WS) | (Q1 & ~WS);
	
	always_ff @(posedge clk) begin
		Q1 <= D;
	end
	assign Q = (RS) ? Q1 : 1'bz;
endmodule 