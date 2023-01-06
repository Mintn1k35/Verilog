module Decoder2to4(
	input logic E,
	input logic A[1:0],
	output logic [3:0] O
);
	
	logic [3:0] O_temp;
	Decoder1to2 Decoder0(.E(E), .A(A[0]), .O(O_temp[1:0]));
	Decoder1to2 Decoder1(.E(E), .A(A[1]), .O(O_temp[3:2]));

	assign O[3:0] = {~A[1] & O_temp[3:2], A[1] & O_temp[1:0]};
	
endmodule 