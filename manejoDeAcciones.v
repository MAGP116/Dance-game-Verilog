`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:35 05/02/2020 
// Design Name: 
// Module Name:    manejoDeAcciones 
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
module manejoDeAcciones(
	input clk, clkChange,
	output reg [2:0] n1 = 0,n2 = 0,n3 = 0
    );

	wire [2:0] num;
	reg [15:0] count = 123;
	always @(posedge clk)
		count <= count*41 + 71;
	
	
	assign num = count[15:13];
	
	always @(posedge clkChange)
		begin
		n1[1:0] <= count[4:3];
		n2[1:0] <= count[8:7];
		n3[1:0] <= count[11:10];
		n1[2] <= 0;
		n2[2] <= 0;
		n3[2] <= 0;

		
		if(num[2] || (n1 == 3))
			n1 <= 4;
		if(num[1] || (n2 == 3))
			n2 <= 4;
		if(num[0] || (n3 == 3))
			n3 <= 4;
		end
endmodule









