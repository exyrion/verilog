`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:44 02/07/2013 
// Design Name: 
// Module Name:    eight_bit_cla 
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
module eight_bit_cla(sum, overflow, a, b, cin);

	output [7:0] sum;
	output overflow;
	input [7:0] a, b;
	input cin;
	wire overflow1;
	
	four_bit_cla2 cla0 (sum[3:0], overflow1, a[3:0], b[3:0], cin, cin);
	four_bit_cla2 cla1 (sum[7:4], overflow, a[7:4], b[7:4], overflow1, cin);

endmodule

module four_bit_cla2(S, Cout, A, B, Cin, control);
	
	input [3:0] A, B;
	input Cin, control;
	output [3:0] S;
	output Cout;
	wire [3:0] C;
	wire [3:0] g;
	wire [3:0] p;
	wire [3:0] Bout;
	wire GP, GG;		mux2_1 mux0 (Bout[0], B[0], control);
	mux2_1 mux1 (Bout[1], B[1], control);
	mux2_1 mux2 (Bout[2], B[2], control);
	mux2_1 mux3 (Bout[3], B[3], control);
	
	assign g = A&Bout;
	assign p = A^Bout;
	assign C[0]=Cin;
	assign C[1]=g[0] | p[0]&C[0];
	assign C[2]=g[1] | p[1]&g[0] | p[1]&p[0]&C[0];
	assign C[3]=g[2] | p[2]&g[1] | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&C[0];	
	assign S = C^p;
	
	//Compute group propagate and group generate
	assign GP = p[3]&p[2]&p[1]&p[0];
	assign GG = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0];
	assign Cout = GG | GP&C[0];

endmodule

module mux2_1(f,in,s);

	output f;
	input s;
	input in;
	assign f = s ? ~in:in;
	
endmodule
