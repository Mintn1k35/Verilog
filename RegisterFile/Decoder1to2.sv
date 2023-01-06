module Decoder1to2(
	input logic E,
	input logic A,
	output logic [1:0] O
);

	assign O[0] = E & ~A;
	assign O[1] = E & A;

endmodule 