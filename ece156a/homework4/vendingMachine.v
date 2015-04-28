//Justin Liang
//ECE 154A
//Homework 4

module vendingMachine(clk, reset, serialIn, buy, product, digit1, digit0);
	input clk, reset, serialIn, buy;
	input [1:0] product;
	output [6:0] digit1, digit0;

	wire penny, nickel, dime, quarter;
	wire apple, banana, carrot, date, error;
	wire [7:0] credit;

	coinSensor c1(clk, reset, serialIn, penny, nickel, dime, quarter);
	piggyBank p1(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);
	purchaseMngr m1(clk, buy, product, credit, apple, banana, carrot, date, error);
	sevenSegDispMngr s1(clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);

endmodule