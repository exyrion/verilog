// Justin Liang
// ECE 154A
// Homework 4

module test_piggyBank;

	reg clk, reset, penny, nickel, dime, quarter;
	reg apple, banana, carrot, date;
	wire [7:0] credit;

 	piggyBank t1(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);

 	initial begin
 		clk = 1;
 		penny = 0;
 		nickel = 0;
 		dime = 0;
 		quarter = 0;
 		apple = 0;
 		banana = 0;
 		carrot = 0;
 		date = 0;
 		reset = 0;

 		#10
 		penny = 1; //Insert a penny, 1
 		#10
 		penny = 0;
 		nickel = 1; //Insert a nickel, 6
 		#10
 		nickel = 0;
 		dime = 1; //Insert a dime, 16
 		#10
 		dime = 0;
 		quarter = 1; //Insert a quarter, 41
 		#10
 		quarter = 1; //66
 		#10
 		quarter = 1; //91
 		#10
 		quarter = 1; //116
 		#10
 		quarter = 1; //141
 		#10
 		quarter = 1; //Total credit should be $1.66

 		#10
 		quarter = 0;
 		apple = 1; //Credit = $0.91
 		#10
 		apple = 0;
 		banana = 1; //Credit = $0.71
 		#10
 		banana = 0;
 		carrot = 1; //Credit = $0.41
 		#10
 		carrot = 0;
 		date = 1; //Credit = $0.01
 		#10
 		date = 0;
 		reset = 1; //Credit = $0.00
 	end

 	always begin
    	#5 clk = ~clk;
    end
endmodule