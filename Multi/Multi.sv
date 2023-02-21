module Multi(
	input logic [31:0] multiplicand,
	input logic [31:0] multiplier,
	input logic clk,
	input logic reset,
	input logic start,
	output logic overflow,
	output logic [63:0] result
);

	logic load, Reset, showResult, done;
	
	Controller controller(clk, reset, start, done, load, Reset, showResult);
	Datapath datapath(multiplicand, multiplier, clk, Reset, load, showResult, overflow, done, result);

endmodule 	