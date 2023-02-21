module ShiftRightReg(
	input logic [7:0] data,
	input logic load,
	input logic clk,
	output logic [7:0] result
);
	
	logic [7:0] shiftResult;
	logic [7:0] inFF;
	assign shiftResult = {1'b0, result[7:1]};
	
	assign inFF = load ? data : shiftResult; 
	
	always_ff @(posedge clk) begin
		result <= inFF;
	end

endmodule 