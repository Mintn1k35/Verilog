class cSimData;
	rand bit [31:0] bit_stream;
	function new();
	endfunction
endclass: cSimData

class cStimulusGenerator;
	cSimData driver_in;
	virtual iDUT iDutPort;
	
	function new(virtual iDUT iDutGen);
		iDutPort = iDutGen;
	endfunction
	
	task tRun(int pkgNum, bit [31:0] Min, bit [31:0] Max);
		iDutPort.I = 32'd0;
		@(posedge iDutPort.reset);
		for(int i = 0 ; i < pkgNum; i = i + 1) begin
			driver_in = new();
			assert(driver_in.randomize() with {bit_stream >= Min; bit_stream <= Max;});
			@(posedge iDutPort.clk);
			iDutPort.I = driver_in.bit_stream;
			$strobe("Input: %32b", driver_in.bit_stream);
		end
		repeat (8) @(posedge iDutPort.clk);
		$stop;
	endtask: tRun
endclass: cStimulusGenerator 

class Monitor:
	virtual iDUT iDutPort;
	bit 

endclass: Monitor