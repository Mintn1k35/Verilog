module Hash(
	input logic Q,
	input logic Q_n,
	input logic C,
	input logic D,
	output logic Di,
	output logic Ci
);

	assign Ci = (D & Q_n & C) | (~D & Q & C);
	assign Di = Q ^ C;
	
endmodule 