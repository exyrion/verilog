`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:43 02/07/2013 
// Design Name: 
// Module Name:    four_bit_cla 
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
module four_bit_cla(sum, overflow, a, bin, cin);

wire [3:0] bout, c, p, g;
output [4:0] sum;
output overflow;
input [3:0] a, bin;
input cin;


mux2_1 mux0 (bout[0], bin[0], cin);
mux2_1 mux1 (bout[1], bin[1], cin);
mux2_1 mux2 (bout[2], bin[2], cin);
mux2_1 mux3 (bout[3], bin[3], cin);
assign g = a&bout;
assign p = a^bout;
assign c[0] = cin;
assign c[1] = g[0] | p[0]&c[0];
assign c[2] = g[1] | p[1]&g[0] | p[1]&p[0]&c[0];
assign c[3] = g[2] | p[2]&g[1] | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
//assign overflow = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];

assign sum[0] = p[0]^c[0];
assign sum[1] = p[1]^c[1];
assign sum[2] = p[2]^c[2];
assign sum[3] = p[3]^c[3];
assign overflow = c[3]^a[3]^bout[3]^sum[3];
assign sum[4] = overflow^sum[3];
endmodule

module mux2_1 (f,in,s);

	output f;
	input s;
	input in;
	assign f = s ? ~in:in;
	
endmodule