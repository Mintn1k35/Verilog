module Datapath(
	input logic [31:0] multiplicand,
	input logic [31:0] multiplier,
	input logic clk,
	input logic reset,
	input logic load,
	input logic showResult,
	output logic overflow,
	output logic done,
	output logic [64:0] result
);
	
	logic [31:0] outMultiplier;
	logic lsbMultiplier;
	logic shift, is0;
	logic [31:0] outMultiplicand;
	logic [63:0] outMultiplicandExtend;
	logic write;

	logic [63:0] outAdder;
	logic [63:0] outProduct;
	
	assign done = is0;
	assign write = ~is0 & lsbMultiplier;
	assign outMultiplicandExtend = {32'd0, outMultiplicand};
	assign shift = (~is0 | lsbMultiplier);
	assign result = (showResult) ? outProduct : 32'dz; 
	
	Multiplier m0(multiplier, clk, reset, shift, load, lsbMultiplier, outMultiplier);
	Multiplicand m1(multiplicand, clk, reset, shift, load, outMultiplicand);
	Product m2(outAdder, clk, reset, write, outProduct);
	Adder_64bit add(outMultiplicandExtend, outProduct, overflow, outAdder);
	Compare0 compare(outMultiplier, is0);


endmodule 