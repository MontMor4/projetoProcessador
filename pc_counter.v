module pc_counter(clock, entrada_pc, pc_incr, pc_in, saida_pc);
		input clock;
		input [15:0] entrada_pc;
		input pc_incr;
		input pc_in;
		output reg [15:0] saida_pc;
		initial begin
			saida_pc <= 16'b0;
		end
				
		always @(posedge clock)
			if(pc_in) begin
				saida_pc <= entrada_pc;
			end else if(pc_incr)begin
				saida_pc <= saida_pc + 1'b1;
			end
				
	endmodule