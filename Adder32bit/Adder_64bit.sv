module Adder_64bit(
	input logic [61:0] A,
	input logic [61:0] B,
	output logic overflow,
	output logic [61:0] S
);
	logic [60:0] Cout;
	
	FullAdder_1bit Adder[61:0](.A(A[61:0]), .B(B[61:0]), .Cin({Cout[60:0],1'b0}), .S(S[61:0]), .Cout({overflow,Cout[60:0]}));

endmodule 