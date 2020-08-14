`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:08 05/02/2020 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
	 input clk, start,pause, switch,
    input [3:0] row,
	 output point,
    output [3:0] column,
	 output [6:0] display,
	 output [3:0] mux,
	 output[7:0] leds
   );
	//Variables necesarias
	reg [26:0] timeEvent =0, redux = 0;
	reg reset = 0;
	
	//Botones
	reg estado = 0;
	reg paused = 0;
	always @(posedge start)
		estado <= estado +1;
	
	always @(posedge pause)
		paused <= paused +1;
	
	
	//Relojes
	wire clkDisp, clkTec, clkChange, clk5s;
	clkDisplay clkD(.clk(clk),.clkRedu(clkDisp)); 	//Display
	clkTeclado clkT(.clk(clk),.clkRedu(clkTec));		//Teclado
	clk5seg clks(.clk(clk),.clkRedu(clk5s),.reset(estado == 0),.pause(paused)); //10 segundos	

	
	//Acciones por estado
	reg decrese = 0;
	reg done = 0;
	always @(posedge clk, posedge clk5s)
begin
	if(clk)
	begin
		if(estado == 0)
		begin
			timeEvent = 50_000_000;
			reset = 1;
			redux <= 0;
		end
		else
		begin
			reset = 0;
		end
	end
	if(clk5s)
	begin
		if(done == 0)
		begin
			if(estado == 0)
				redux <= 0;
			if(estado == 1)
			begin
				if(redux < 40_000_000 && !decrese)
					redux <= redux + 5_000_000;
				else if(redux >15_000_000 && decrese)
						redux <= redux - 10_000_000;
				else
					decrese <= decrese +1;
			end
			done <= 1;
		end
	end
	else
		begin
		if(estado == 0)
			redux <= 0;
		done <= 0;
		end
end



		

	

	
	//reloj de evento
	clkRedu clkR(.clk(clk),.clkRedu(clkChange),.reset(reset),.pause(paused),.max(timeEvent - redux)); //Evento


	//Mux y selector de display
	wire [1:0] dispPos;
	contadorMux cM(.clk(clkDisp),.mux(mux),.valor(dispPos));
	
	//Detecta la entrada de teclado
	wire [7:1] out;
	BarridoTeclado bT(.clk(clkTec),.row(row),.column(column), .out(out),.switch(switch));
	
	//Se actualizan los valores 
	wire [2:0] num0, num1, num2, num3, numR;
	interpretadorTeclado intT0(.in(out[7:1]),.num0(num0),.num1(num1),.num2(num2),.num3(num3),.clk(clk));
	
	
	//Manejo de acciones
	wire [2:0] n0,n1,n2,n3,nt0,nt1,nt2;
	
	//Actualiza los numeros a presionar
	manejoDeAcciones mA(.clk(clk),.clkChange(clkChange),.n1(nt0),.n2(nt1),.n3(nt2));
	ajustarValores nn0(.in(nt0),.out(n0));
	ajustarValores nn1(.in(nt1),.out(n1));
	ajustarValores nn2(.in(nt2),.out(n2));
	
	//Compara la respuesta de teclado con las flechas a presionar
	wire p0,p1,p2;
	comparador comp0(.clk(clk),.clkComp(clkChange),.num1(n0),.num2(num0),.point(p0));
	comparador comp1(.clk(clk),.clkComp(clkChange),.num1(n1),.num2(num1),.point(p1));
	comparador comp2(.clk(clk),.clkComp(clkChange),.num1(n2),.num2(num2),.point(p2));
	
	//Determina el punto actual del display
	assign point = 	(estado == 0)?1:
								(dispPos == 0)? !paused:
								(dispPos == 1)? (n2 == 4)?1:!p2:
								(dispPos == 2)? (n1 == 4)?1:!p1:
													 (n0 == 4)?1:!p0;
	
	
	//Realiza los calculos de la barra de salud
	reg [3:0] salud = 8;
	reg [1:0] sumPoints = 0;
	reg [1:0] sumEmptys = 0;
	reg[2:0] suma = 0;
	always @(posedge clkChange)
		begin
		if(estado == 0)
			salud <= 8;
		sumPoints <= 0;
		sumEmptys <= 0;
		suma <= 0;
		
		if(n0 == 4)
			sumEmptys <= 1;
		if(n1 == 4)
			sumEmptys <= sumEmptys +1;
		if(n2 == 4)
			sumEmptys <= sumEmptys +1;
		if(p0)
			sumPoints <= 1;
		if(p1)
			sumPoints <= sumPoints +1;
		if(p2)
			sumPoints <= sumPoints +1;
		
		suma <= sumPoints +2- sumEmptys;
		if(sumEmptys != 0)
			begin
			if(suma == 2)
				begin
				if(salud -1 != 3)
					salud <= salud -1;
				end
			else if(suma == 4)
				begin
				if(salud +1 != 14)
					salud <= salud +1;
				end
			else
				if(salud+2 != 14 && salud +2 != 15)
					salud <= salud +2;
			end
		end
	
	assign n3 = (salud < 8)?7:
					(salud < 12)?6:5;
	//Determina el numero actual del display
	assign numR =  	(estado == 0)?
								(dispPos == 0)? num3:
								(dispPos == 1)? num2:
								(dispPos == 2)? num1:
								 num0:
								 
								(dispPos == 0)? n3:
								(dispPos == 1)? n2:
								(dispPos == 2)? n1:
								 n0;

	//Transforma el numero actual en su display
	displaySelector ds(.num(numR),.pos(dispPos),.display(display));
	
	//Convierte la velocidad actual en los leds
	barraDeAnimo bda(.aumento(redux),.leds(leds));

endmodule
