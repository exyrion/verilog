//Justin Liang
//ECE 154A
//Homework 3

module bcdto7_structural(all_out,d_in);
	output [6:0] all_out;
	input  [3:0] d_in;
	wire a1, a2, a3, a4, a5;
	wire b1, b2, b3, b4, b5;
	wire c1, c2, c3, c4, c5;
	wire d1, d2, d3, d4, d5, d6;
	wire e1, e2, e3, e4;
	wire f1, f2, f3, f4, f5;
	wire g1, g2, g3, g4, g5;
	wire a, b, c, d, e, f, g;
	
	and(a1, ~d_in[2], ~d_in[1]);
	and(a2, ~d_in[3], d_in[0]);
	and(a3, d_in[1], ~d_in[0]);
	and(a4, d_in[2], d_in[1]);
	and(a5, d_in[3], ~d_in[0]);
	or x1(a, a1, a2, a3, a4, a5);

	and(b1, ~d_in[3], ~d_in[1], ~d_in[0]);
	and(b2, ~d_in[3], d_in[1], d_in[0]);
	and(b3, d_in[3], ~d_in[1], d_in[0]);
	and(b4, ~d_in[2], ~d_in[1]);
	and(b5, ~d_in[2], d_in[0]);
	or x2(b, b1, b2, b3, b4, b5);

	and(c1, ~d_in[2], ~d_in[1], ~d_in[0]);
	and(c2, ~d_in[2], d_in[1], d_in[0]);
	and(c3, d_in[3], ~d_in[1], d_in[0]);
	and(c4, ~d_in[3], d_in[2]);
	and(c5, d_in[3], ~d_in[2]);
	or x3(c, c1, c2, c3, c4, c5);

	and(d1, ~d_in[2], ~d_in[1], ~d_in[0]);
	and(d2, ~d_in[2], d_in[1], d_in[0]);
	and(d3, ~d_in[3], d_in[1], ~d_in[0]);
	and(d4, d_in[2], ~d_in[1], d_in[0]);
	and(d5, d_in[3], d_in[2], ~d_in[0]);
	and(d6, d_in[3], ~d_in[1]);
	or x4(d, d1, d2, d3, d4, d5, d6);

	and(e1, ~d_in[2], ~d_in[0]);
	and(e2, d_in[1], ~d_in[0]);
	and(e3, d_in[3], d_in[2]);
	and(e4, d_in[3], d_in[1]);
	or x5(e, e1, e2, e3, e4);

	and(f1, ~d_in[3], d_in[2], ~d_in[1]);
	and(f2, ~d_in[1], ~d_in[0]);
	and(f3, d_in[2], ~d_in[0]);
	and(f4, d_in[3], d_in[1]);
	and(f5, d_in[3], ~d_in[2]);
	or x6(f, f1, f2, f3, f4, f5);

	and(g1, ~d_in[3], d_in[2], ~d_in[0]);
	and(g2, d_in[2], ~d_in[1], d_in[0]);
	and(g3, ~d_in[2], d_in[1]);
	and(g4, d_in[3], d_in[1]);
	and(g5, d_in[3], ~d_in[2]);
	or x7(g, g1, g2, g3, g4, g5);

	buf( all_out[0], g);
	buf( all_out[1], f);
	buf( all_out[2], e);
	buf( all_out[3], d);
	buf( all_out[4], c);
	buf( all_out[5], b);
	buf( all_out[6], a);  
	
endmodule  
	
	