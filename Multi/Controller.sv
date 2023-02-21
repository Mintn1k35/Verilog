module Controller(
	input logic clk,
	input logic reset,
	input logic start,
	input logic done,
	output logic load,
	output logic Reset,
	output logic showResult
);
	parameter STATE0 = 2'd0;
	parameter STATE1 = 2'd1;
	parameter STATE2 = 2'd2;
	parameter STATE3 = 2'd3;
	
	logic [1:0] state, next_state;
	
	
	// next_state
	
	assign next_state = ((state == STATE0) && (start == 1'b1)) ? STATE1 : (state == STATE1) ? STATE2 :
								((state == STATE2) && (done == 1'b1)) ? STATE3 : state;
								
	// fsm
	always_ff @(posedge clk or negedge reset) begin
		if(!reset) begin
			state <= STATE0;
		end
		else state <= next_state;
	end
	
	// output
	assign load = (state == STATE1) ? 1'b1 : 1'b0;
	assign Reset = reset;
	assign showResult = (done) ? 1'b1 : 1'b0;


endmodule 