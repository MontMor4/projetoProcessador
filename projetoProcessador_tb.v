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
		assign reset = 1'b1;
		assign run = 1'b1;
		assign Din = 16'b0001000000000010;
	
	end
	initial begin
	
		//teste instrução mv
		$display("Testa mv");
		for(i=0;i<5;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out);
			assign clock =~clock;
			
		end
		
		//testa instrução mvt
		$display("Testa mvt");
		assign reset = ~reset;
		#50;
		assign reset = ~reset;
		assign Din = 16'b0010001000000111;
		
		for(i=0;i<6;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out);
			assign clock =~clock;
		end
		
		
		//testa instrução add
		$display("Testa Add");
		assign reset = ~reset;
		#50;
		assign reset = ~reset;
		assign Din = 16'b0100000000000001;
		for(i=0;i<9;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			assign clock =~clock;
		end
		
		//testa instrução sub
		$display("Testa Sub");
		assign reset = ~reset;
		#50;
		assign reset = ~reset;
		assign Din = 16'b0111000000000111;
		for(i=0;i<9;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			assign clock =~clock;
		end
		
	end

endmodule 