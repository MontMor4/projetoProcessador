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
		assign run = 1'b0;
		assign Din = 5'b00000;
	
	end
	initial begin
	
		//teste instrução mv 0001000000000100
		$display("Testa mv");
		for(i=0;i<10;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaROM=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.saidaROM);
			if(i==1)assign run = ~run;
			assign clock =~clock;
			
		end
		
		//testa instrução load 1000001000000000
		$display("Testa load");
		assign run = ~run;
		#50;
		assign Din = 5'b00001;
		
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		
		//testa instrução add 0101001000001001
		$display("Testa Add");
		assign run = ~run;
		#50;
		
		assign Din = 5'b00010;
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		//testa instrução store 1010000000000001
		$display("Testa store");
		assign run = ~run;
		#50;
		
		assign Din = 5'b00011;
		for(i=0;i<12;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r1,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		$display("Testa load"); //load 1000000000000001
		assign run = ~run;
		#50;
		assign reset = ~reset;
		assign Din = 5'b00100;
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%4h BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.IR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
	end

endmodule 