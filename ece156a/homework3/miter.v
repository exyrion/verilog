//Justin Liang
//ECE 154A
//Homework 3

module miter(out, in1, in2);
	output out;
	input [6:0] in1;
	input [6:0] in2;
	wire w0, w1, w2, w3, w4, w5, w6;
	wire out;

	xor(w0, in1[0], in2[0]);
	xor(w1, in1[1], in2[1]);
	xor(w2, in1[2], in2[2]);
	xor(w3, in1[3], in2[3]);
	xor(w4, in1[4], in2[4]);
	xor(w5, in1[5], in2[5]);
	xor(w6, in1[6], in2[6]);

	or(out, w0, w1, w2, w3, w4, w5, w6);
endmodule

