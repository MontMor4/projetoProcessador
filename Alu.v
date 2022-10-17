module Alu(BusW, RA_out, saidaBarril, op, Res, bitZero);
		input [15:0] BusW;
		input [15:0] RA_out;
		input [15:0] saidaBarril;
		input [2:0]op;
		output reg [15:0] Res;
		output reg bitZero;

		always@(*)
		
		if(op == 3'b011)begin
			Res = RA_out & BusW;
		end else if (op == 3'b010) begin
			Res = RA_out - BusW;
		end else if(op == 3'b001) begin
			Res = BusW + RA_out;
		end else if(op == 3'b100)begin
			Res = saidaBarril;
		end
		always@(*)
		if(Res == 16'b0)begin
			bitZero = 1'b1;
		end else begin
			bitZero = 1'b0;
		end
		
	endmodule