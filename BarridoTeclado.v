`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:53 10/20/2014 
// Design Name: 
// Module Name:    BarridoSencilloOneHot 
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
module BarridoTeclado(
    input [3:0] row,
	 input clk,switch,
	 output  [7:1] out,
    output reg [3:0] column
    
    );
	reg [1:0] barrido;	

	assign out[7] = (switch)? !row[3]:row[3];
	assign out[6] = (switch)? !row[2]:row[2];
	assign out[5] = (switch)? !row[1]:row[1];
	assign out[4] = (switch)? !row[0]:row[0];
	assign out[3:1] = column[3:1];
	
	always @(posedge clk)
		begin
			barrido = barrido +1;
			case ( barrido)
				0: column <='b1110;
				1: column <='b1101;
				2: column <='b1011;
				3:column <='b0111;
				default: column <=0;
			endcase
		end
		

endmodule
