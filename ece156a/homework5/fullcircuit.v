//Justin Liang
//ECE 156A
//Homework 5

module fullcircuit (clk, clk2, x ,rs, data_in, data_out, z);

	input clk, clk2, x, rs, data_in;
	output data_out;
	output [4:0] z;
	wire reset, run, shift, update;
	fsm f1(clk, x, rs, reset, run, shift, update);
	control_unit c1(clk2, data_in, reset, run, shift, update, data_out, z);

endmodule