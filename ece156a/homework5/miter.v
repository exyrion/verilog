//Justin Liang
//ECE 156A
//Homework 5

module miter(clk, enable, reset, m_out);
	output m_out;
	wire [3:0] count_b;
	wire [3:0] count_s;
	input clk, enable, reset;
	wire w1, w2, w3, w4;

	upcnt b1(clk, enable, reset, count_b);
	upcnt_structural s1(clk, enable, reset, count_s); 

	xor (w1, count_b[3], count_s[3]);
	xor (w2, count_b[2], count_s[2]);
	xor (w3, count_b[1], count_s[1]);
	xor (w4, count_b[0], count_s[0]);

	or(m_out, w1, w2, w3, w4);

endmodule
