// Justin Liang
// ECE 156A
// Homework 5

module test_upcnt;

	reg clk, enable, reset;
	wire [3:0] count;
	upcnt u1(clk, enable, reset, count);
	//upcnt_structural u1(clk, enable, reset, count); //TEST UPCNT_STRUCTURAL, ignore this line

	initial begin
		clk = 1; enable = 0; reset = 1;
		#10 enable = 1; reset = 0; //Start the counter
		#120 reset = 1; //Let it run for 12 clock cycles then reset, should stop counting after 10
		#10 reset = 0;
		#40 enable = 0; 
		#30 enable = 1; //Hold enable for 3 clock cycles, then assert it again to resume the counter
		#30 reset = 1;
		#10 reset = 0;
	end

	always begin
      #5 clk = ~clk;
    end

endmodule