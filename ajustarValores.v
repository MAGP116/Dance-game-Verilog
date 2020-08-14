`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:53 05/02/2020 
// Design Name: 
// Module Name:    ajustarValores 
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
module ajustarValores(
	input [2:0]in,
	output [2:0]out
    );

	 
	 assign out = (in == 3)?in-1:(in<3)?in:4;


endmodule
