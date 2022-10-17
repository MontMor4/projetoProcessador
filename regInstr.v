module regInstr(endereco,clock,in,endInstr);
		input [4:0] endereco;
		input clock;
		input in;
		output reg endInstr;
		always@(posedge clock)
			if(in)endInstr<=endereco;
	endmodule