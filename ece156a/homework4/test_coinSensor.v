//Justin Liang
//ECE 154A
//Homework 4

module test_coinSensor;

	reg clk, reset, serialIn;
	wire penny, nickel, dime, quarter;

	coinSensor c(clk, reset, serialIn, penny, nickel, dime, quarter);

	initial begin
		clk = 1;
		reset = 0;
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
	end

	always begin
		#5 clk = ~clk;
	end

endmodule