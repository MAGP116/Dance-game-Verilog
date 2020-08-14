`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:28 05/02/2020 
// Design Name: 
// Module Name:    comparador 
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
module comparador(
	input clk, clkComp,
	input [2:0] num1,num2,
	output reg point = 0
    );
	 always@(posedge clk,posedge clkComp)
	 begin
		if(clk)
			begin
			point <= (num1 == num2)| point;
			end
		if(clkComp)
			begin
			point <= 0;
			end
	 end
		


endmodule
