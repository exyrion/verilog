//Justin Liang
//ECE 154A
//Homework 4

module test_purchaseMngr;

	reg clk, buy;
	reg [1:0] product;
	reg [7:0] credit;
	wire apple, banana, carrot, date, error;
	
	purchaseMngr t1(clk, buy, product, credit, apple, banana, carrot, date, error);

	initial begin

		clk = 1;
		credit = 8'b11111111; //Credit is $2.55
		buy = 1;
		product = 2'b00; //Buy an apple

		#10
		buy = 1;
		product = 2'b01; //Buy a banana

		#10
		buy = 1;
		product = 2'b10; //Buy an carrot

		#10
		buy = 1;
		product = 2'b11; //Buy a date

		//Here credit should be $2.55 - $1.65 = $0.90

		//Test for error

		#10
		credit = 8'b00000001; //Credit is $0.01
		buy = 1;
		product = 2'b00; //Buy an apple

		#10
		buy = 0;

	end

	always begin
      #5 clk = ~clk;
    end
endmodule