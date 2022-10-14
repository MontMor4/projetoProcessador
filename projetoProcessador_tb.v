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
		assign reset = 1'b1;
		assign run = 1'b1;
		assign Din = 5'b00000;
	
	end
	initial begin
		for(i=0;i<11;i=i+1)begin
			#50;
			assign clock=~clock;
		end
		assign run = ~run;
		#50;
		assign run = ~run;
		//teste instrução mv 000 1 000 000000100
		$display("\n\nTesta mv");
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b endereco=%16b addrIn=%1b regRX=%3b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.endereco,proc.addr_in,proc.rX);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
			
		end
		
		//testa instrução load 100 0 001 000000000
		$display("\n\nTesta load");
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		assign Din = 5'b00001;
		
		for(i=0;i<12;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b endereco=%16b saidaROM=%16b rx=%1b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.endereco,proc.saidaROM,proc.rX);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		/*
		$display("testa bcond"); //beq 111 0 000 000000011
		assign run = ~run;
		#50;
		
		assign Din = 5'b00111;
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		*/
		
		//testa instrução add 010 1 001 000001001
		$display("\n\nTesta Add");
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		
		//assign Din = 5'b00010;
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		//testa instrução store 101 0 000 000000001
		$display("\n\nTesta store");
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		
		assign Din = 5'b00011;
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		$display("\n\nTesta load"); //load 100 0 010 000000001
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		
		assign Din = 5'b00100;
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
		end

		//teste instrução mv 000 1 010 000000010
		$display("\n\nTesta mv");
		assign run = ~run;
		#50;
		assign run = ~run;
		assign Din = 5'b00101;
		
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b endereco=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.endereco);
			if(i==1)assign run = ~run;
			assign clock =~clock;
			
		end


		$display("\n\ntesta and"); //and 110 1 010 000000001
		assign run = ~run;
		#50;
		assign run = ~run;
		
		assign Din = 5'b00110;
		for(i=0;i<22;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		
	end

endmodule 