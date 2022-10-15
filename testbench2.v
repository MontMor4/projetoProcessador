module testbench2();
	reg Resetn, Clock, Run;
	wire Done, f, zero;
	wire [2:0] Tstep_Q;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, pc, a, g, DIN, addr, dout, DATA;

   projetoProcessador proc(Resetn, Clock, Run, Done,r0, r1, r2, r3, r4, r5, r6, pc,DIN);

   initial begin
        Clock = 1'b0;
        Run = 1'b1;
        Resetn = 1'b1;
		  $monitor("T%d | Done: %b | r0: %h | r1: %h | r2: %h | r3: %h | r4: %h | r5: %h | r6: %h | buswires: %h | pc: %h | pc_incr: %b\naddr: %d | addr_in: %b | DATA: %h | dout: %h | dout_in: %b | a: %h | g: %h | f: %d | F_in: %b | zero: %b | IR: %16b | W: %b\n", 
		  proc.Tstep_Q, Done, proc.r0,proc.r1,proc.r2,proc.r3,proc.r4,proc.r5,proc.r6, proc.BusWires, proc.PC,proc.pc_incr, proc.endereco, proc.addr_in, proc.data, proc.DadoMem, proc.DOUT_in, proc.RA_out,proc.G,proc.F, proc.f_in, proc.zeroULA, proc.saidaIR,proc.wren);
    end

   initial begin
		  $display("-------------------------------------- mv r0, #5 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  $display("-------------------------------------- mvt r1, #0xFF --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  
		  
        $display("-------------------------------------- add r1, #0xFF --------------------------------------");
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
		  #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1

        $display("-------------------------------------- sub r1, r0 --------------------------------------");
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
		  #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
		  #1
        Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
        
		  $display("-------------------------------------- add r1, #1 --------------------------------------");
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1
		  Clock = ~Clock;
        #1
        Clock = ~Clock;
        #1

        Clock = ~Clock;
        #1
        Clock = ~Clock;
    end
endmodule
 