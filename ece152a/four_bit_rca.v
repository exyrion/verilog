`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:44 02/06/2013 
// Design Name: 
// Module Name:    four_bit_rca 
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
module four_bit_rca(sum, overflow, a, bin, cin);

    output [4:0] sum;
    output overflow;
    input [3:0] a, bin;
	 input cin;
	 wire [3:0] bout, c;
	 mux2_1 mux0 (bout[0], bin[0], cin);	 
	 fullAdder m0 (sum[0], c[0], a[0], bout[0], cin);
 	 mux2_1 mux1 (bout[1], bin[1], cin);	
	 fullAdder m1 (sum[1], c[1], a[1], bout[1], c[0]);
	 mux2_1 mux2 (bout[2], bin[2], cin);	
	 fullAdder m2 (sum[2], c[2], a[2], bout[2], c[1]);
	 mux2_1 mux3 (bout[3], bin[3], cin);	
	 fullAdder m3 (sum[3], c[3], a[3], bout[3], c[2]);
	 
	assign overflow = c[3]^a[3]^bout[3]^sum[3];
	assign sum[4] = overflow^sum[3];

endmodule

module fullAdder(sum, cout, a, b, cin);

	input a, b, cin;
	output sum, cout;
	assign sum = a^b^cin;
	assign cout = ((a^b)&cin) | (a&b);
	
endmodule

module mux2_1(f,in,s);

	output f;
	input s;
	input in;
	assign f = s ? ~in:in;
	
endmodule