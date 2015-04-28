//Justin Liang
//ECE 154A
//Homework 4

module purchaseMngr(clk, buy, product, credit, apple, banana, carrot, date, error);

	input clk, buy;
	input [1:0] product;
	input [7:0] credit;
	output apple, banana, carrot, date, error;

	reg apple, banana, carrot, date, error;

	always @ (posedge clk or product or buy) begin

		if(buy) begin //If buy is asserted, begin choosing an item			
			
			if(product == 2'b00) begin //If apple is selected
				if(8'b01001011 <= credit) begin //If credit has 75 cents or more
					apple <= 1; banana <= 0; carrot <= 0; date <= 0; error <= 0;
				end
				else begin
					apple <= 0; banana <= 0; carrot <= 0; date <= 0; error <= 1;
				end
			end

			if(product == 2'b01) begin //If banana is selected
				if(8'b00010100 <= credit) begin //If credit has 20 cents or more
					apple <= 0; banana <= 1; carrot <= 0; date <= 0; error <= 0;
				end
				else begin
					apple <= 0; banana <= 0; carrot <= 0; date <= 0; error <= 1;
				end
			end

			if(product == 2'b10) begin //If carrot is selected
				if(8'b00011110 <= credit) begin //If credit has 30 cents or more
					apple <= 0; banana <= 0; carrot <= 1; date <= 0; error <= 0;
				end
				else begin
					apple <= 0; banana <= 0; carrot <= 0; date <= 0; error <= 1;
				end
			end

			if(product == 2'b11) begin //If date is selected
				if(8'b00101000 <= credit) begin //If credit has 40 cents or more
					apple <= 0; banana <= 0; carrot <= 0; date <= 1; error <= 0;
				end
				else begin
					apple <= 0; banana <= 0; carrot <= 0; date <= 0; error <= 1;
				end
			end
		end

		else begin
			apple <= 0;
			banana <= 0;
			carrot <= 0;
			date <= 0;
			error <= 0;
		end
	end
endmodule