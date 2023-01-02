module FullAdder_1bit(
	input logic A,
	input logic B,
	input logic Cin,
	output logic S,
	output logic Cout
);
	assign S = A ^ B ^ Cin;
	assign Cout = (A & B) | ((A ^ B) & Cin);
	

endmodule 