//Justin Liang
//ECE 154A
//Homework 3

module machine_b(z, clk, in, reset);
	output z;
	input clk, in, reset;

	wire w4, w3, w2, w1, w0;
	wire nw4, nw3, nw2, nw1, nw0;
	wire x1, x2, z;

	d_ff d4(w4, nw4, in, ~reset, ~reset, enable, clk);
	d_ff d3(w3, nw3, w4, ~reset, ~reset, enable, clk);
	d_ff d2(w2, nw2, w3, ~reset, ~reset, enable, clk);
	d_ff d1(w1, nw1, w2, ~reset, ~reset, enable, clk);
	d_ff d0(w0, nw0, w1, ~reset, ~reset, enable, clk);

	and a1(x1, nw4, w3, nw2, nw1);
	and a2(x2, nw4, nw3, nw2, w1, nw0);

	or o1(z, x1, x2);
endmodule