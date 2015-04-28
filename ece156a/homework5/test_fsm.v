//Justin Liang
//ECE 156A
//Homework 5

module test_fsm;

	reg clk, x, rs;
	wire reset, shift, update, run;

	fsm f1(clk, x, rs, reset, run, shift, update);

	initial begin
		clk = 1;
		#10	rs = 0;	x = 0; //Go to run state

		#10 x = 1; //Go to shift state

		#70 x = 1; //Shift for 8 cycles

		#10 x = 0; //Go to update state

		#10 x = 1; //Go to reset state
	end

	always begin
      #5 clk = ~clk;
    end
endmodule