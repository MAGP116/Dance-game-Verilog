`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:22 03/25/2020 
// Design Name: 
// Module Name:    clkRedu 
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
module clkRedu(
	input clk, reset, pause,
	input [26:0] max,
	output reg clkRedu = 0
    );
	 
	 reg[26:0] conteo = 0; // se defineen 32 bits para el conteo.
	 always @ (posedge clk, posedge reset)
		begin
		if(reset)
			begin
				conteo <=0; //reincicia cuenta
				clkRedu <=0; //reinicia salida
			end
		else
			if(!pause)
				begin
				conteo <= conteo +1;
				if(conteo >= max) // contamos hasta max
					begin
						clkRedu <= clkRedu +1; // toggleamos la salida
						conteo <= 0;
					end
				end
		end


endmodule















