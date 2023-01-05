module SRwPL(
	input logic [31:0] I,
	input logic [1:0] S,
	input logic clk, 
	input logic IL,
	input logic IR,
	output logic [31:0] Q
);

	logic [31:0] QL, QR;
	assign QR = {IL, Q[30:0]};
	assign QL = {Q[31:1], IR};
	

	logic [31:0] resultSelect;
	
	// Select input
	always @(*) begin
		case(S)
			2'b00: resultSelect = Q; // no change
			2'b01: resultSelect = I; // load input
			2'b10: resultSelect = QL; // shift left
			2'b11: resultSelect = QR; // shift right
			default: resultSelect = 32'bx;
		endcase
	end
	
	always_ff @(posedge clk) begin
		Q <= resultSelect;
	end
endmodule 