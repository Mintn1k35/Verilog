module Adder_32bit(
	input logic [31:0] A,
	input logic [31:0] B,
	output logic overflow,
	output logic [31:0] S
);
	logic [30:0] Cout;
	
	FullAdder_1bit Adder[31:0](.A(A[31:0]), .B(B[31:0]), .Cin({Cout[30:0],1'b0}), .S(S[31:0]), .Cout({overflow,Cout[30:0]}));
	
endmodule 