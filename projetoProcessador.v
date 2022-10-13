module projetoProcessador(DIN, Resetn, Clock, Run, Done);
	input [4:0] DIN;
	input Resetn, Clock, Run;
	output Done;
	reg [15:0] IR;
	wire [2:0] III;
	wire IMM;
	wire [2:0]rX;
	wire [2:0]rY;
	reg rX_in, A_in; reg [2:0]Tstep_Q; reg [2:0]Tstep_D; reg[15:0]BusWires;
	 
	wire[15:0]r0, r7, r1, r2, r3, r4, r5, r6; //registradores de proposito geral
	reg Done,IR_in;reg[3:0]Select;
	wire [8:0]Imm;
	wire [15:0]G;
	reg [15:0]IR_wire;
	reg G_in, AddSub, ALU_and, wren, addr_in, pc_incr, pc_in, DOUT_in, Wd;
	wire[7:0] R_in;
	wire [15:0] RA_out,RG_out;
	wire [15:0] saidaALU, saidaROM, saidaIR, DadoMem;
	reg [15:0] data;
	reg [7:0] endMem;
	wire [4:0]enderecoInstrucao;
	
	assign III = saidaIR[15:13]; //opcode da instrução
	assign IMM = saidaIR[12]; //bit que indica se é imediato ou não
	assign rX = saidaIR[11:9]; // registrador x
	assign rY = saidaIR[2:0]; //registrador y (existe quando IMM é igual a 0)
	
	
	dec3to8 decX (rX_in, rX, R_in); //habilita os registradores de propósito geral a receberem dados
	
	instr_memory memInstr(r7[4:0], Clock, saidaROM); //modulo da memória de intruções
	
	memory memPrincipal(endMem, Clock, BusWires, wren, DadoMem); //módulo da memória principal
	
	regn regIR(saidaROM, Resetn, IR_in, Clock, saidaIR);
	
	parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011, T4 = 3'b100, T5 = 3'b101;
	
	initial begin
		Tstep_Q = T0;
		IR_in = 1'b0;
	end
	
	// Control FSM state table
	
	always @(Tstep_Q, Run, Done)//controla o funcionamento do processador
		
		case (Tstep_Q)
			
			T0: // data is loaded into IR in this time step
				if (~Run) Tstep_D = T0;
				else Tstep_D = T1;
			
			T1: 
				if(Done)Tstep_D = T0;
				else Tstep_D = T2;
			
			T2: 
				if(Done)Tstep_D = T0;
				else Tstep_D = T3;
			
			T3:
				if(Done)Tstep_D = T0;
				else Tstep_D = T4;
			
			T4:
				if(Done)Tstep_D = T0;
				else Tstep_D = T5;
			
			T5:
				Tstep_D = T0;
				
		endcase
		
			
		//parametros que indicam o opcode da instrução
		parameter mv = 3'b000, mvt = 3'b001, add = 3'b010, sub = 3'b011, load = 3'b100, store = 3'b101, _and = 3'b110, b_cond = 3'b111;
		
		//selectors for the BusWires multiplexer
		parameter _R0 = 4'b0000, _R1 = 4'b0001, _R2 = 4'b0010,
			_R3 = 4'b0011, _R4 = 4'b0100,_R5 = 4'b0101,_R6 = 4'b110, _PC = 4'b0111, _G = 4'b1000,
			_IR8_IR8_0 /* signed-extended immediate data */ = 4'b1001,
			_IR7_0_0 /* immediate data << 8 */ = 4'b1010,_DIN = 4'b1011;
	
		// control FSM outputs
		always @(*) begin
			
			// initializing variable values
			rX_in = 1'b0; Done = 1'b0;
			AddSub = 1'b0;
			ALU_and = 1'b0;
			G_in = 1'b0;
			IR_in =1'b0;
			addr_in =1'b0;
			pc_in = 1'b0;
			pc_incr = 1'b0;
			
			
			case (Tstep_Q) //controla o estado da instrução //
				T0:begin
					Select = _PC;
					addr_in = 1'b1;
					pc_incr = 1'b1;
					
				end
				T1: ;
				
				T2: // store DIN into IR
					begin
					IR_in = 1'b1;
					//pc_incr = 1'b1;
					//IR = saidaROM;
					end
				T3: // define signals in time step T1
					case (III)
						mv: begin
							if (!IMM) Select = rY;           
							else Select = _IR8_IR8_0;
							
							rX_in = 1'b1; // enable rX
							Done = 1'b1;
						end
						
						mvt: // mvt rX, #D
							begin
							Select = _IR7_0_0;
							rX_in = 1'b1;
							Done = 1'b1;
							
							end
							
						add, sub, _and: begin
							A_in = 1'b1;
							Select = rX;           
						end
						
						load, store:begin
							addr_in = 1'b1;
							Select = rY;           
						end
						
						b_cond: begin
								A_in = 1'b1;
								Select = _PC;
								case(rX)	
									3'b001: //beq
										if(G != 0) Done = 1'b1;
									
									3'b010: //bne
										if(G == 0) Done = 1'b1;
									
									//default: always branch
								endcase
						end

					endcase
				T4: // define signals in time step T2
					
					case(III) 
						add: begin

							if (!IMM) Select = rY;           
							else Select = _IR8_IR8_0;
							G_in = 1'b1;
							
						end
						
						sub: begin
							if (!IMM) Select = rY;           
							else Select = _IR8_IR8_0;
							
							//sinais de controle
							G_in = 1'b1;
							AddSub = 1'b1;
							
						end
						
						store: begin
							Select = rX;
							DOUT_in = 1'b1;
							Wd = 1'b1;
							Done = 1'b1;
						end
						
						_and: begin
							if (!IMM) Select = rY;           
							else Select = _IR8_IR8_0;
							
							//sinais de controle
							G_in = 1'b1;
							ALU_and = 1'b1;
							
							end
						
						b_cond: begin
							Select = _IR8_IR8_0;
							G_in = 1'b1;
							
						end
						
						endcase
						
				T5: // define signals in time step T3
					
					case (III)
						add, sub, _and: begin
							
							Select = _G;
							rX_in = 1'b1;
							Done = 1'b1;
						
						end
						load: begin
							Select =_DIN;
							rX_in = 1'b1;
							Done = 1'b1;
						end
						
						b_cond: begin
							Select = G;
							pc_in = 1'b1;
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
			Tstep_Q <= T0;
		end else begin
			Tstep_Q <= Tstep_D;
		end
		
			
			regn reg_0(BusWires, Resetn, R_in[7], Clock ,r0);
		
			regn reg_1(BusWires, Resetn, R_in[6], Clock, r1);
			
			regn reg_2(BusWires, Resetn, R_in[5], Clock, r2);
			
			regn reg_3(BusWires, Resetn, R_in[4], Clock, r3);
			
			regn reg_4(BusWires, Resetn, R_in[3], Clock, r4);
		
			regn reg_5(BusWires, Resetn, R_in[2], Clock, r5);
			
			regn reg_6(BusWires, Resetn, R_in[1], Clock, r6);
			
			pc_counter reg_7(Clock, BusWires, pc_incr, pc_in, r7);
			
			regn D(BusWires, Resetn, DOUT_in, Clock, RD_out);
			
			regW W(Clock, Wd, W);
			
			regInstr registradorInstrucao(r7[4:0], Clock, addr_in, enderecoInstrucao);
			
			regn A(BusWires, Resetn, A_in, Clock, RA_out);
			 
			regn regG(saidaALU, Resetn, G_in, Clock, G);
			
			Alu alu(BusWires, RA_out, AddSub, ALU_and, saidaALU);
	
		
	//. . . instantiate other registers and the adder/subtracter unit
	// define the internal processor bus
		always @(*)
			case (Select)
				_R0: BusWires = r0;
				_R1: BusWires = r1;
				_R2: BusWires = r2;
				_R3: BusWires = r3;
				_R4: BusWires = r4;
				_R5: BusWires = r5;
				_R6: BusWires = r6;
				_PC: BusWires = r7;
				_G: BusWires = G;
				_IR8_IR8_0: BusWires = {{7{IR[8]}}, IR[8:0]};
				_IR7_0_0: BusWires = {IR[7:0], 8'b00000000};
				_DIN: BusWires = DadoMem;
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
	
	module regW(Clock, Wd, W);
		input Clock;
		input Wd;
		output W;
		
		always @(posedge clock)
			W = Wd;
		
	endmodule
	
	module DOUT();
		input Clock;
		input DOUT_in;
		output D;
	
	endmodule
	
	
	module Addr();
	
	
	endmodule
	
	module pc_counter(clock, entrada_pc, pc_incr, pc_in, saida_pc);
		input clock;
		input [15:0] entrada_pc;
		input pc_incr;
		input pc_in;
		output reg [15:0] saida_pc;
		initial begin
			saida_pc = 16'b0;
		end
				
		always @(posedge clock)
			
			if(pc_in) begin
				saida_pc = entrada_pc;
			end else if(pc_incr)begin
				saida_pc = saida_pc + 1'b1;
			end
				
	endmodule
	module regInstr(endereco,clock,in,endInstr);
		input [4:0] endereco;
		input clock;
		input in;
		output reg endInstr;
		always@(posedge clock)
			if(in)endInstr<=endereco;
	endmodule
	
	module regn(BusW,Reset,R_IN,clock,R_OUT);
		input [15:0]BusW;
		input Reset;
		input R_IN,clock;
		output reg[15:0] R_OUT;
		
		always @(posedge clock) // antigo: negedge reset
			if (R_IN) R_OUT <= BusW;	
	endmodule 
	
	
	module Alu(BusW, RA_out, AddSub, ALU_and, Res);
		input [15:0] BusW;
		input [15:0] RA_out;
		input AddSub;
		input ALU_and;
		output reg [15:0] Res;

		always@(*)
		
		if(ALU_and)begin
			$display("ra_out: %16b & BusW: %16b", RA_out, BusW);
			Res = RA_out & BusW;
		end else if (AddSub) begin
			Res = RA_out - BusW;
		end else begin
			Res = BusW + RA_out;
		end
		
		
	endmodule

	module barrel (shift_type, shift, data_in, data_out);
		input wire [1:0] shift_type;
		input wire [3:0] shift;
		input wire [15:0] data_in;
		output reg [15:0] data_out;
		parameter lsl = 2'b00, lsr = 2'b01, asr = 2'b10, ror = 2'b11;
			
			always @(*)
				if (shift_type == lsl)
				data_out = data_in << shift;
				
				else if (shift_type == lsr)
				data_out = data_in >> shift;
				
				else if (shift_type == asr)
				data_out = {{16{data_in[15]}},data_in} >> shift; // sign extend
				
				else // ror
				data_out = (data_in >> shift) | (data_in << (16 - shift));
				
	endmodule

