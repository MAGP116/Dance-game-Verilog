`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:33 05/02/2020 
// Design Name: 
// Module Name:    clkDisplay 
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
module clkDisplay(
    input clk,
    output reg clkRedu = 0
    );
reg [16:0] counter = 0;

always @(posedge clk)
   begin
		
		if (counter == 100_000 )
			begin
			counter = 0;
			clkRedu=clkRedu+1;
			end
		else
			begin
			counter=counter+1;
			end
	end


endmodule

