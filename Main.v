// Luiz Eduardo Leroy e Victor Samuel Levindo Mont'Mor

module Main(
	input wire [17:0] SW,
	input wire CLOCK_50,
	
	output wire [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
   output wire [17:0] LEDR
);
	//wire Clock;
	//Clock_divider #(50000000) divider (CLOCK_50, Clock); //divide a frequência do clock, diminuindo a frequencia	

	wire [15:0] r0, r1, r2, r3, r4, r5, r6, pc, Instr;
	

	projetoProcessador Controle(1, CLOCK_50, 1, LEDR[17], r0, r1, r2, r3, r4, r5, r6, pc, Instr);
   
/*	
	//teste 1 - 95%
	
	assign HEX7 = 7'b1111111;
	assign HEX6 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	
	Display registrador0(r0[3:0], HEX3);
	
	Display registrador1(r1[3:0], HEX2);
	
	Display registrador2(r2[3:0], HEX1);
	
	Display registrador3(r3[3:0], HEX0);
	
	//fim do teste1
*/


/*
	//teste 2 - 100%
	
	assign HEX7 = 7'b1111111;
	assign HEX6 = 7'b1111111;	
	assign HEX5 = 7'b1111111;
	
	Display registrador0(r0[3:0], HEX4);
	
	Display registrador1_3(r1[15:12], HEX3);
	Display registrador1_2(r1[11:8], HEX2);
	Display registrador1_1(r1[7:4], HEX1);
	Display registrador1_0(r1[3:0], HEX0);
	
	//fim do teste 2
*/

/*
	//teste 3 - errado
	
	assign HEX7 = 7'b1111111;
	assign HEX6 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	Display registrador0(r0[3:0], HEX4);
	
	Display registrador4_3(r4[15:12], HEX3);
	Display registrador4_2(r4[11:8], HEX2);
	Display registrador4_1(r4[7:4], HEX1);
	Display registrador4_0(r4[3:0], HEX0);
	
	//fim do teste 3
*/

	
	//teste 4 - errado
	
	assign HEX7 = 7'b1111111;
	assign HEX6 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	
	Display registrador0_3(r0[15:12], HEX3);
	Display registrador0_2(r0[11:8], HEX2);
	Display registrador0_1(r0[7:4], HEX1);
	Display registrador0_0(r0[3:0], HEX0);
	
	//fim do teste 4
	
endmodule 