module projetoProcessador(DIN, Resetn, Clock, Run, Done);
	input [15:0] DIN;
	input Resetn, Clock, Run;
	output Done;
	//. . . declare variables
	reg [15:0] IR;
	wire [2:0] III;
	wire IMM;
	wire [2:0]rX;
	wire [2:0]rY;
	reg rX_in,A_in; reg [2:0]Tstep_Q; reg [2:0]Tstep_D; reg[15:0]BusWires;
	 
	wire[15:0]r0,r7,r1,r2,r3,r4,r5,r6; //registradores de prop´sito geral
	reg Done,IR_in;reg[3:0]Select;
	wire [8:0]Imm;
	wire [15:0]G;
	reg [15:0]IR_wire;
	reg G_in,AddSub;
	wire[7:0] R_in;
	wire [15:0] RA_out;
	wire [15:0] saidaALU;
	
	assign III = IR[15:13]; //opcode da instrução
	assign IMM = IR[12]; //bit que indica se é imediato ou não
	assign rX = IR[11:9]; // registrador x
	assign rY = IR[2:0]; //registrador y (existe quando IMM é igual a 0)
	
	
	dec3to8 decX (rX_in, rX, R_in);

	
	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011;
	
	initial begin
		 Tstep_Q = T0;
	end
	// Control FSM state table
	always @(Tstep_Q, Run, Done)//controla o funcionamento do processador
		case (Tstep_Q)
			T0: // data is loaded into IR in this time step
			begin
				if (~Run) Tstep_D = T0;
				else Tstep_D = T1;
			end
			T1: if(Done)Tstep_D=T0;
			else Tstep_D = T2;//. . .
			
			T2: if(Done)Tstep_D=T0;
			else Tstep_D = T3;//. . .
			
			T3:Tstep_D=T0;//. . .
			//. . .
		endcase
			
		//parametros que indicam o opcode da instrução
		parameter mv = 3'b000, mvt = 3'b001, add = 3'b010, sub = 3'b011;
		// selectors for the BusWires multiplexer
		parameter _R0 = 4'b0000, _R1 = 4'b0001, _R2 = 4'b0010,
			_R3 = 4'b0011, _R4 = 4'b0100,_R5 = 4'b0101,_R6 = 4'b110, _R7 = 4'b0111, _G = 4'b1000,
			_IR8_IR8_0 /* signed-extended immediate data */ = 4'b1001,
			_IR7_0_0 /* immediate data << 8 */ = 4'b1010;
	
		// control FSM outputs
		always @(*) begin
			
			rX_in = 1'b0; Done = 1'b0; //. . . // default values for variables
			AddSub = 1'b0;
			G_in = 1'b0;
			
			
			case (Tstep_Q) //controla o estado da instrução //
				T0: // store DIN into IR
					begin
					IR_in = 1'b1;
					IR = DIN;
					end
				T1: // define signals in time step T1
					case (III)
						mv: begin
							if (!Imm) begin
								case(rY)
								3'b000: Select = _R0;
								3'b001: Select = _R1;
								3'b010: Select = _R2;
								3'b011: Select = _R3;
								3'b100: Select = _R4;
								3'b101: Select = _R5;
								3'b110: Select = _R6;
								3'b111: Select = _R7;
							
								endcase
							end
							else Select = _IR8_IR8_0; // mv rX, #D
							
							rX_in = 1'b1; // enable rX
							Done = 1'b1;
						end
						mvt: // mvt rX, #D
							begin
							Select = _IR7_0_0;
							rX_in = 1'b1;
							Done = 1'b1;
							
							end
						add,sub: begin
						
							A_in = 1'b1;
							case(rX)
								3'b000: Select = _R0;
								3'b001: Select = _R1;
								3'b010: Select = _R2;
								3'b011: Select = _R3;
								3'b100: Select = _R4;
								3'b101: Select = _R5;
								3'b110: Select = _R6;
								3'b111: Select = _R7;
							
							endcase
						end
					endcase
				T2: // define signals in time step T2
					
					case(III) 
						add: begin
							if (!Imm) begin // mv rX, rY
								case(rY)
								3'b000: Select = _R0;
								3'b001: Select = _R1;
								3'b010: Select = _R2;
								3'b011: Select = _R3;
								3'b100: Select = _R4;
								3'b101: Select = _R5;
								3'b110: Select = _R6;
								3'b111: Select = _R7;
							
								endcase
							end
							else Select = _IR8_IR8_0;
							G_in = 1'b1;
						end
						sub: begin
							if (!Imm) begin // mv rX, rY
								case(rY)
								3'b000: Select = _R0;
								3'b001: Select = _R1;
								3'b010: Select = _R2;
								3'b011: Select = _R3;
								3'b100: Select = _R4;
								3'b101: Select = _R5;
								3'b110: Select = _R6;
								3'b111: Select = _R7;
							
								endcase
							end
							else Select = _IR8_IR8_0;
							G_in = 1'b1;
							AddSub = 1'b1;
						end
						
					endcase
					
				T3: // define signals in time step T3
					
					case (III)
						add,sub: begin
							Select = _G;
							rX_in =1'b1;
							Done = 1'b1;
						
						end
						
						
					endcase
					
				default: ;
		endcase
	end
	
	// Control FSM flip-flops
	always @(posedge Clock, negedge Resetn)
		if (!Resetn) 
		begin
			Tstep_Q = Tstep_D;
		end 
			
			regn reg_0(BusWires,Resetn,R_in[0] ,Clock ,r0);
		
			regn reg_1(BusWires, Resetn, R_in[1], Clock, r1);
			
			regn reg_2(BusWires, Resetn, R_in[2], Clock, r2);
			
			regn reg_3(BusWires, Resetn, R_in[3], Clock, r3);
			
			regn reg_4(BusWires, Resetn, R_in[4], Clock, r4);
		
			regn reg_5(BusWires, Resetn, R_in[5], Clock, r5);
			
			regn reg_6(BusWires, Resetn, R_in[6], Clock, r6);
			
			regn reg_7(BusWires, Resetn, R_in[7], Clock, r7);
			
			
			regn A(BusWires,Resetn,R_in[0] ,Clock ,RA_out);
			Alu alu(BusWires,RA_out,AddSub,saidaALU);
	
		
	//. . . instantiate other registers and the adder/subtracter unit
	// define the internal processor bus
		always @(*)
			case (Select)
				_R0: BusWires = r0;
				_R1: BusWires = r1;
				_R1: BusWires = r2;
				_R1: BusWires = r3;
				_R1: BusWires = r4;
				_R1: BusWires = r5;
				_R1: BusWires = r6;
				_R7: BusWires = r7;
				_G: BusWires = G;
				_IR8_IR8_0: BusWires = {{7{IR[8]}}, IR[8:0]};
				_IR7_0_0: BusWires = {IR[7:0], 8'b00000000};
				default: BusWires = 16'bxxxxxxxxxxxxxxxx;
			endcase
	endmodule
	
	module dec3to8(E, W, Y);
		input E; // enable
		input [2:0] W;
		output [0:7] Y;
		reg [0:7] Y;
		
		always @(*)
			if (E == 0)
				Y = 8'b00000000;
			else
				case (W)
					3'b000: Y = 8'b10000000;
					3'b001: Y = 8'b01000000;
					3'b010: Y = 8'b00100000;
					3'b011: Y = 8'b00010000;
					3'b100: Y = 8'b00001000;
					3'b101: Y = 8'b00000100;
					3'b110: Y = 8'b00000010;
					3'b111: Y = 8'b00000001;
				endcase
endmodule
	module regn(BusW,Reset,R_IN,clock,R_OUT);
	input [15:0]BusW;
	input Reset;
	input R_IN,clock;
	output reg[15:0] R_OUT;
	
	always @(posedge clock) // antigo: negedge reset
		if (R_IN) R_OUT <= BusW;
	
	endmodule 
	
	
	module Alu(BusW,RA_out,Addsub,Res);
	input [15:0] BusW;
	input [15:0] RA_out;
	input Addsub;
	output reg [15:0] Res;

	always@(*)
	if(!Addsub) begin 
		Res <= BusW + RA_out;
		end else begin
			Res <= BusW - RA_out;
		end
	
	endmodule

