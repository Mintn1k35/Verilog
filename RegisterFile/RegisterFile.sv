module RegisterFile(
	input logic [7:0] I,
	input logic WE,
	input logic [2:0] WA,
	input logic RE,
	input logic [2:0] RA,
	input logic clk,
	output logic [7:0] O
);

	logic [7:0] WA_Decode, RA_Decode;
	Decoder3to8 DecoderWA(.E(WE), .A(WA), .O(WA_Decode));
	Decoder3to8 DecoderRA(.E(RE), .A(RA), .O(RA_Decode));

	generate
		genvar i;
		for(i = 0; i < 8; i = i + 1) begin: genRFC
			RFC_8 RFC(.I(I), .WS(WA_Decode[i]), .RS(RA_Decode[i]), .clk(clk), .O(O));
		end
	
	endgenerate
	
endmodule 