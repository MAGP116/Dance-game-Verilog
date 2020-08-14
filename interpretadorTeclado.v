`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:56:51 05/02/2020 
// Design Name: 
// Module Name:    interpretadorTeclado 
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
module interpretadorTeclado(
	input clk,
	input [7:1] in,
	//					derecha 					izq
	output reg [2:0] num0, num1, num2, num3
    );
	 wire column [3:1];
	 wire row[3:0];
	 
	 assign row[3]		= in[7]; //abajo
	 assign row[2] 	= in[6];
	 assign row[1] 	= in[5];
	 assign row[0] 	= in[4]; //arriba
	 assign column[3] = !in[3]; //der
	 assign column[2] = !in[2];
	 assign column[1] = !in[1];
  //assign column[0] = !in[0]; //izq
	 
	  

	always @(posedge clk)
		begin
		if(column[3])
			begin
				num3 <=(row[0])? 0:
				(row[1])? 1:
				(row[2])? 2:
				(row[3])? 3:
				4;
			end
		else if(column[2])
			begin
			num2 <=(row[0])? 0:
					 (row[1])? 1:
					 (row[2])? 2:
					 (row[3])? 3:
									 4;
			end
		else if(column[1])
				begin
				num1 <=(row[0])? 0:
						 (row[1])? 1:
						 (row[2])? 2:
						 (row[3])? 3:
									  4;
			end
		else
			begin
				num0 <=(row[0])? 0:
						 (row[1])? 1:
						 (row[2])? 2:
						 (row[3])? 3:
									  4;
			end

		end
				
endmodule
