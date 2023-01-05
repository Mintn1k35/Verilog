module Hash_32(
	input logic [31:0] Q,
	input logic [31:0] Q_n,
	input logic D,
	input logic E,
	output logic over,
	output logic [31:0] Di
);
	logic [30:0] C;
	
	Hash hash[31:0](.Q(Q[31:0]), .Q_n(Q_n[31:0]), .C({C[30:0], E}), .D(D), .Di(Di[31:0]), .Ci({over, C[30:0]}));
	
endmodule