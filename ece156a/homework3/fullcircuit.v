//Justin Liang
//ECE 154A
//Homework 3

module fullcircuit(out, start, a_reset, s_reset, clk);
	output out;
	input start, a_reset, s_reset, clk;
	wire [3:0] w1, w2;
	wire [6:0] x1, x2;
	wire out;

	upcnt up1(w1, start, a_reset, s_reset, clk);
	upcnt_structural up2(w2, start, a_reset, s_reset, clk);

	bcdto7 b1(x1, w1, clk);
	bcdto7_structural b2(x2, w2);

	miter m1(out, x1, x2);
endmodule