module projetoProcessador_tb();
	reg clock;
	reg reset;
	reg [15:0] Din;
	reg run;
	wire done;
	integer i;
	projetoProcessador proc(Din,reset,clock,run,done);
	initial begin
		assign clock = 1'b0;
		assign reset = 1'b0;
		assign run = 1'b1;
		assign Din = 16'b0001000000000010;
	
	end
	initial begin
		for(i=0;i<5;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%0b",$time,clock,reset,run,done,Din,proc.r0);
			assign clock =~clock;
		end
	end

endmodule 