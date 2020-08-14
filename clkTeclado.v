`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:18 11/07/2013 
// Design Name: 
// Module Name:    clk100 
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
module clkTeclado(
    input clk,
    output reg clkRedu = 0
    );
reg [18:0] counter = 0;
 


always @(posedge clk)
   begin
		
		if (counter == 500_000 )
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
