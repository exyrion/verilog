// Justin Liang
// ECE 154A
// Homework 4

module piggyBank(clk, reset, penny, nickel, dime, quarter, apple, banana, carrot, date, credit);
	input clk, reset, penny, nickel, dime, quarter;
	input apple, banana, carrot, date;
	output [7:0] credit;

	reg [7:0] credit = 8'b00000000;
	
	always @ (posedge clk) begin
		if(reset) begin
			credit <= 8'b00000000;
		end

		else if(penny) begin
			credit <= credit + 8'b00000001; //Add 1 to register
		end

		else if(nickel) begin
			credit <= credit + 8'b00000101; //Add 5 to register
		end

		else if(dime) begin
			credit <= credit + 8'b00001010; //Add 10 to register
		end

		else if(quarter) begin
			credit <= credit + 8'b00011001; //Add 25 to register
		end

		else if(apple) begin
			credit <= credit - 8'b01001011; //Subtract 75 from register
		end

		else if(banana) begin
			credit <= credit - 8'b00010100; //Subtract 20 from register, 
		end

		else if(carrot) begin
			credit <= credit - 8'b00011110; //Subtract 30 from register
		end

		else if(date) begin
			credit <= credit - 8'b00101000; //Subtract 40 from register
		end
	end
endmodule