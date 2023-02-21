interface iDUT();
	logic clk;
	logic reset;
	logic set;
	logic [31:0] I; // input of DUT
	logic [31:0] Q; // output of DUT
endinterface: iDUT