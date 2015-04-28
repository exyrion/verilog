//Justin Liang
//ECE 154A
//Homework 4

module test_sevenSegDispMngr;

	reg clk, reset;
	reg apple, banana, carrot, date, error;
	reg [7:0] credit;

	wire [6:0] digit1, digit0;

	sevenSegDispMngr t1(clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);

	initial begin
		clk = 1;
		reset = 0;
		apple = 0;
		banana = 0;
		carrot = 0;
		date = 0;
		error = 0;
		credit = 8'b11111111;

		#10	apple = 1;
		#10 apple = 0;

		#100 banana = 1;
		#10 banana = 0;

		#100 carrot = 1;
		#10 carrot = 0;

		#100 date = 1;
		#10 date = 0;

		#100 error = 1;
		#10 error = 0;

		#30 apple = 1;
		#10 apple = 0;

	end

	always begin
    	#5 clk = ~clk;
    end
endmodule