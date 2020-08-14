`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:45 05/02/2020 
// Design Name: 
// Module Name:    contadorMux 
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
module contadorMux(
	input clk,
	output [3:0] mux,
	output reg [1:0] valor = 0
   );
	
	always @(posedge clk)
		valor <= valor+1;
	
	assign mux =(valor == 0)?4'b 1110:
					(valor == 1)?4'b 1101:
					(valor == 2)?4'b 1011:
									 4'b 0111;

		
		

endmodule
