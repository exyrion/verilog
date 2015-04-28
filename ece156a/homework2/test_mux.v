module test_mux;
	reg in0, in1, s;
	wire out;

	mux_2_1_structural m(out, in0, in1, s);

	initial begin
		#10 in0 = 0;
			in1 = 1;
			s = 0;
		#10 s = 1;
	end
	endmodule
