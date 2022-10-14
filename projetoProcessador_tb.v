module projetoProcessador_tb();

	reg Resetn, Clock, Run,Din;
	wire Done, f, zero;
	wire [2:0] Tstep_Q;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, pc, a, g, DIN, addr, dout, DATA;
	integer i;

    projetoProcessador proc(Resetn, Clock, Run, Done,r0, r1, r2, r3, r4, r5, r6, pc,DIN);

   initial begin
        Clock = 1'b0;
        Run = 1'b1;
        Resetn = 1'b1;
        $monitor("T%d | Done: %b | r0: %h | r1: %h | r2: %h | r3: %h | r4: %h | r5: %h | r6: %h | buswires: %h | pc: %h | pc_incr: %b\naddr: %d | addr_in: %b | DATA: %h | dout: %h | dout_in: %b | a: %h | g: %h | f: %d | F_in: %b | zero: %b | IR: %16b | W: %b\n", 
		  proc.Tstep_Q, Done, proc.r0,proc.r1,proc.r2,proc.r3,proc.r4,proc.r5,proc.r6, proc.BusWires, proc.PC,proc.pc_incr, proc.endereco, proc.addr_in, proc.data, proc.DadoMem, proc.DOUT_in, proc.RA_out,proc.G,proc.F, proc.f_in, proc.zeroULA, proc.saidaIR,proc.wren);
    end

   initial begin
			/*for(i=0;i<23;i=i+1)begin
			#1;
			assign Clock=~Clock;
			end*/
			//assign Run = ~Run;
		  $display("-------------------------------------- MV R0, #2 --------------------------------------");
		  for(i=0;i<16;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- MV R1, #3 --------------------------------------");
		  
		  for(i=0;i<8;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
        $display("-------------------------------------- ADD R1, R0 --------------------------------------");
        for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
        $display("-------------------------------------- MV R2, R0 --------------------------------------");
        for(i=0;i<8;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
        
		  $display("-------------------------------------- ADD R2, #4 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SUB R2, R1 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- MV R3, R2 --------------------------------------");
		  for(i=0;i<8;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- ADD R0,R3 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- AND R0, R1 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
       
		  
		  $display("-------------------------------------- SLL R1, R3  --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SRL R1, R3 --------------------------------------");
		 for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- MV R2, R1 --------------------------------------");
		  for(i=0;i<8;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- AND R2, #3 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SLL R0, #2 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SUB R0, #1 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SRL R1, #2 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- ADD R1, R1 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- LD R2, R0 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- ADD R2, R3 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SUB R0, #3 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SD R2, R0 --------------------------------------");
		  for(i=0;i<10;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- LD R0, R0 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end
		  
		  $display("-------------------------------------- SUB R0, R3 --------------------------------------");
		  for(i=0;i<12;i=i+1)begin
			 Clock = ~Clock;
			#1;
		  end

    end

 
	/*reg clock;
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
		for(i=0;i<23;i=i+1)begin
			#50;
			assign clock=~clock;
		end
		assign run = ~run;
		#50;
		assign run = ~run;
		//teste instrução mv 000 1 000 000000100
		$display("\n\nTesta mv");
		for(i=0;i<6;i= i+1)begin
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
		
		
		$display("testa bcond"); //beq 001 0 000 000000011
		assign run = ~run;
		#50;
		
		assign Din = 5'b00111;
		for(i=0;i<14;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b instrucao=%16b BusWires =%16b saidaA=%16b PC=%16b saidaALU=%16b G=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.saidaIR,proc.BusWires,proc.RA_out,proc.PC,proc.saidaALU,proc.G);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		
		//testa instrução add 010 1 001 000001001
		/*$display("\n\nTesta Add");
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		
		//assign Din = 5'b00010;
		for(i=0;i<12;i= i+1)begin
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
		for(i=0;i<12;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b Select=%4b data=%16b endereco=%16b wren=%1b",
			$time,clock,reset,run,done,Din,proc.r0,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.Select,proc.data,proc.endereco,proc.wren);
			//if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		$display("\n\nTesta load"); //load 100 0 010 000000001
		//assign run = ~run;
		assign run = ~run;
		#50;
		assign run = ~run;
		
		assign Din = 5'b00100;
		for(i=0;i<12;i= i+1)begin
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
		
		for(i=0;i<6;i= i+1)begin
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
		for(i=0;i<7;i= i+1)begin
			#50;
			$display("Time=%0d clock=%0b reset=%0b run=%0d done=%0b Din=%0b regDestino=%16b tstepQ=%0b instrucao=%16b BusWires =%16b saidaA=%16b Select=%4b saidaALU=%16b",
			$time,clock,reset,run,done,Din,proc.r2,proc.Tstep_Q,proc.saidaIR,proc.BusWires,proc.RA_out,proc.Select,proc.saidaALU);
			if(i==1)assign run = ~run;
			assign clock =~clock;
		end
		
		
	end*/

endmodule 