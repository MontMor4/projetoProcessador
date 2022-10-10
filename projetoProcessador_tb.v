module projetoProcessador_tb();
	reg clock;
	reg reset;
	reg [4:0] Din;
	reg run;
	wire done;
	integer i;
	projetoProcessador proc(Din,reset,clock,run,done);
	initial begin
		assign clock = 1'b0;
		assign reset = 1'b0;
		assign run = 1'b1;
		assign Din = 5'b00000;
	
	end
	initial begin
	
		//teste instrução mv
		$display("Testa mv");
		for(i=0;i<10;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out);
			if(i==2)assign reset = 1'b1;
			assign clock =~clock;
			
		end
		
		//testa instrução mvt
		$display("Testa mvt");
		assign reset = ~reset;
		#50;
		assign Din = 5'b00001;
		
		for(i=0;i<10;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out);
			if(i==2)assign reset =~reset;
			assign clock =~clock;
		end
		
		
		//testa instrução add
		$display("Testa Add");
		assign reset = ~reset;
		#50;
		
		assign Din = 5'b00010;
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==2)assign reset = ~reset;
			assign clock =~clock;
		end
		
		//testa instrução sub
		$display("Testa Sub");
		assign reset = ~reset;
		#50;
		
		assign Din = 5'b00011;
		for(i=0;i<16;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==2)assign reset = ~reset;
			assign clock =~clock;
		end
		$display("Testa Add");
		assign reset = ~reset;
		#50;
		assign reset = ~reset;
		assign Din = 5'b00100;
		for(i=0;i<16;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			assign clock =~clock;
		end
		
	end

endmodule 