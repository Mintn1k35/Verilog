module RFC_8(
	input logic [7:0] I,
	input logic WS,
	input logic RS,
	input logic clk,
	output logic [7:0] O
);

	RFC RegiterFileCell[7:0] (.I(I[7:0]), .RS(RS), .WS(WS), .clk(clk), .Q(O[7:0]));

endmodule 