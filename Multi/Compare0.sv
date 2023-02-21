module Compare0(
	input [31:0] data,
	output out
);
	
	assign out = (data == 32'd0) ? 1'b1 : 1'b0;

endmodule  