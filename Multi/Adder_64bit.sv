module Adder_64bit(
	input logic [64:0] A,
	input logic [64:0] B,
	output logic overflow,
	output logic [63:0] S
);
	logic [62:0] Cout;
	
	FullAdder_1bit Adder[63:0](.A(A[63:0]), .B(B[63:0]), .Cin({Cout[62:0],1'b0}), .S(S[63:0]), .Cout({overflow,Cout[62:0]}));

endmodule 