//Justin Liang
//ECE 154A
//Homework 4

module test_vendingMachine;

	reg clk, reset, serialIn, buy;
	reg [1:0] product;
	wire [6:0] digit1, digit0;

	vendingMachine v1(clk, reset, serialIn, buy, product, digit1, digit0);

	initial begin
		clk = 1;
		reset = 0;
		buy = 0;
		#10 serialIn = 0;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //PENNY
		#10 serialIn = 0; 
		#10 serialIn = 1; 
		#10 serialIn = 0;
		#10 serialIn = 0;
		#10 serialIn = 0; //NICKEL
		#10 serialIn = 0; 
		#10 serialIn = 1;
		#10 serialIn = 1;
		#10 serialIn = 1;
		#10 serialIn = 0; //DIME
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0;
		#10 serialIn = 1;
		#10 serialIn = 0; //QUARTER

		//Credit should be $1.66

		#10 buy = 1; product = 2'b00; //Buy an apple, credit should be $0.91
		#10 buy = 0;
		#100 buy = 1; product = 2'b01; //Buy a banana, credit should be $0.71
		#10 buy = 0;
		#40 buy = 1; product = 2'b10; //Buy a carrot, credit should be $0.41
		#10 buy = 0;
		#100 buy = 1; product = 2'b11; //Buy a date, credit should be $0.01
		#10 buy = 0;
		#100 buy = 1; product = 2'b00; //Buy an apple, not enough credit
		#10 buy = 0;
		#60 reset = 1;
		#10 reset = 0;
	end

	always begin
    	#5 clk = ~clk;
    end

	
endmodule