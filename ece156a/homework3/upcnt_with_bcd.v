//Justin Liang
//ECE 154A
//Homework 3

module upcnt_with_bcd(all_out, start, a_reset, s_reset, clk);
	output[6:0] all_out;
	input start, a_reset, s_reset, clk;
	wire [3:0] w1;

	upcnt up1(w1, start, a_reset, s_reset, clk);
	//upcnt_structural up1(w1, start, a_reset, s_reset, clk);

	bcdto7 b1(all_out, w1, clk);
	//bcdto7_structural b1(all_out, w1);

endmodule