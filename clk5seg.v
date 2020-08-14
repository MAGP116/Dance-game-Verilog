`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:48 05/06/2020 
// Design Name: 
// Module Name:    clk5seg 
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
module clk5seg(
    input clk,reset, pause,
    output reg clkRedu = 0
    );
reg [27:0] counter = 0;

always @(posedge clk)
   begin
		if(reset)
			begin
			counter = 0;
			clkRedu = 0;
			end
		else 
			begin
			if(!pause)
				begin
				if (counter == 125_000_000 )
					begin
					counter = 0;
					clkRedu=clkRedu+1;
					end
				else
					begin
					counter = counter+1;
					end
				end
			end
	end
endmodule
