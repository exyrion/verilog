`timescale 1ns / 1ps
module fulladder(sum, cout, a, b, cin);

	input a, b, cin;
	output sum, cout;
	assign sum = a^b^cin;
	assign cout = ((a^b)&cin) | (a&b);
	
endmodule