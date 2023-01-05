module test(
	input logic [1:0] A,
	input logic [1:0] B,
	input logic [1:0] C, 
	input logic [1:0] D,
	input logic [1:0] S,
	output logic [1:0] O
);

	always @(*) begin
		case(S)
			2'b00: O = A;
			2'b01: O = B;
			2'b10: O = C;
			2'b11: O = D;
			default: O = 1'bx;
		endcase
	end

endmodule