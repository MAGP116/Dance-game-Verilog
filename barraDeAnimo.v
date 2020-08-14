`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:41 05/03/2020 
// Design Name: 
// Module Name:    barraDeAnimo 
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
module barraDeAnimo(
	input [26:0] aumento,
	output [7:0] leds
    );
	assign leds[7] = (aumento >= 5_000_000);
	assign leds[6] = (aumento >= 10_000_000);
	assign leds[5] = (aumento >= 15_000_000);
	assign leds[4] = (aumento >= 20_000_000);
	assign leds[3] = (aumento >= 25_000_000);
	assign leds[2] = (aumento >= 30_000_000);
	assign leds[1] = (aumento >= 35_000_000);
	assign leds[0] = (aumento >= 40_000_000);

endmodule
