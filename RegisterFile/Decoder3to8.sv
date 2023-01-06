module Decoder3to8(
	input logic E,
	input logic [2:0] A,
	output logic [7:0] O
);
	logic [7:0] O_Temp;

	
	always_comb begin
		case(A)
			3'd0: O_Temp = 8'd1;
			3'd1: O_Temp = 8'd2;
			3'd2: O_Temp = 8'd4;
			3'd3: O_Temp = 8'd8;
			3'd4: O_Temp = 8'd16;
			3'd5: O_Temp = 8'd32;
			3'd6: O_Temp = 8'd64;
			3'd7: O_Temp = 8'd128;
			default: O_Temp = 8'd0;	
		endcase
	end
   assign O = (E) ? O_Temp : 8'd0;
endmodule 