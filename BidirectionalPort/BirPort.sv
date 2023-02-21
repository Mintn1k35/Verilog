module BirPort(
	inout logic data,
	input logic out,
	input logic enable,
	output logic in
);

	assign data = enable ? out : 1'bz;
	assign in = data;
	
endmodule 