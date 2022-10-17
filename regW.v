module regW(Clock, Wd, W);
		input Clock;
		input Wd;
		output reg W;
		
		always @(posedge Clock)
			W = Wd;
		
	endmodule