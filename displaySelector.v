`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:55 05/02/2020 
// Design Name: 
// Module Name:    displaySelector 
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
module displaySelector(
	input [2:0] num,
	input [1:0] pos,
	output [6:0] display
    );
	 
	 assign display = (pos == 0)? //derecha
								(num == 0)? 7'b0001000 :
								(num == 1)? 7'b0000011 :
								(num == 2)? 7'b1000110 :
								(num == 3)? 7'b0100001 :
								(num == 4)? 7'b1111111 :
								(num == 5)? 7'b1111110 :
								(num == 6)? 7'b0111111 :
								7'b1110111:
							(pos == 1)?
								(num == 0)? 7'b0110000 :
								(num == 1)? 7'b0000010 :
								(num == 2)? 7'b0010000 :
								(num == 3)? 7'b0001110 :
								(num == 4)? 7'b1111111 :
								(num == 5)? 7'b1111110 :
								7'b0110110:
							(pos == 2)?
								(num == 0)? 7'b0100100 :
								(num == 1)? 7'b0010010 :
								(num == 2)? 7'b0000000 :
								(num == 3)? 7'b1000000 :
								(num == 4)? 7'b1111111 :
								(num == 5)? 7'b1111110 :
								7'b0110110:
								
								(num == 0)? 7'b1111001 :
								(num == 1)? 7'b0011001 :
								(num == 2)? 7'b1111000 :
								(num == 3)? 7'b0000110 :
								(num == 4)? 7'b1111111 :
								(num == 5)? 7'b1111110 :
								7'b0110110;


endmodule
