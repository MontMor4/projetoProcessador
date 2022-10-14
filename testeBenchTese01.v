module testeBenchTese01;
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
        $monitor("T%d | Done: %b | r0: %h | r1: %h | r2: %h | r3: %h | r4: %h | r5: %h | r6: %h | buswires: %h | pc: %h | pc_incr: %b\naddr: %d | addr_in: %b | DATA: %h | dout: %h | dout_in: %b | a: %h | g: %h | f: %d | F_in: %b | zero: %b | IR: %b | W: %b\n", 
		  proc.Tstep_Q, Done, proc.r0,proc.r1,proc.r2,proc.r3,proc.r4,proc.r5,proc.r6, proc.BusWires, proc.PC,proc.pc_incr, proc.addr, proc.addr_in, proc.data, proc.DadoMem, proc.DOUT_in, proc.Ra_out,proc.G,proc.F, proc.f_in, proc.zero, proc.saidaIR,proc.wren);
    end

   initial begin
			/*for(i=0;i<23;i=i+1)begin
			#1;
			assign clock=~clock;
			end*/
		  $display("-------------------------------------- MV R0, #2 --------------------------------------");
		  for(i=0;i<8;i=i+1)begin
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
endmodule
 