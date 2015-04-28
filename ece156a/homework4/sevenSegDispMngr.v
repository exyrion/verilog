//Justin Liang
//ECE 154A
//Homework 4

module sevenSegDispMngr (clk, reset, apple, banana, carrot, date, error, credit, digit1, digit0);

	input clk, reset;
	input apple, banana, carrot, date, error;
	input [7:0] credit;

	output [6:0] digit1, digit0;

	reg [3:0] d_in1, d_in0;
	reg [3:0] count;
	reg downReset = 0; //Down counter reset signal
	reg downStart = 0; //Down counter start signa	
	//Signals the BCD display to continuing display respective letter
	reg astart, bstart, cstart, dstart, estart; 

	wire [6:0] digit1, digit0;

	bcdto7 bcd1(digit1,d_in1,clk);
	bcdto7 bcd0(digit0,d_in0,clk);

	//Detects apple, banana, carrot, date, error signals
	//Once detected, reset and start the down counter
	always @ (posedge clk or apple or banana or carrot or date or error) begin

		if(apple) begin 
			downReset <= 1; downStart <= 1; 
			astart <= 1; bstart <= 0; cstart <= 0; dstart <= 0; estart <= 0;
		end
		else if(banana) begin 
			downReset <= 1; downStart <= 1; 
			astart <= 0; bstart <= 1; cstart <= 0; dstart <= 0; estart <= 0;
		end
		else if(carrot) begin 
			downReset <= 1; downStart <= 1; 
			astart <= 0; bstart <= 0; cstart <= 1; dstart <= 0; estart <= 0;
		end
		else if(date) begin 
			downReset <= 1; downStart <= 1; 
			astart <= 0; bstart <= 0; cstart <= 0; dstart <= 1; estart <= 0; 
		end
		else if(error) begin 
			downReset <= 1; downStart <= 1; 
			astart <= 0; bstart <= 0; cstart <= 0; dstart <= 0; estart <= 1;
		end
		else begin
			downReset <= 0;
		end
	end

	//Detects start signals of fruits/error
	//If signal is asserted, display respective hexadecimal representation
	//Else, display credit
	always @ (posedge clk or astart or bstart or cstart or dstart or estart) begin
		if(astart) begin d_in1 <= 4'b1010; d_in0 <= 4'b1010; end
		else if(bstart) begin d_in1 <= 4'b1011; d_in0 <= 4'b1011; end
		else if(cstart) begin d_in1 <= 4'b1100; d_in0 <= 4'b1100; end
		else if(dstart) begin d_in1 <= 4'b1101; d_in0 <= 4'b1101; end
		else if(estart) begin d_in1 <= 4'b1110; d_in0 <= 4'b1110; end
		else begin d_in1 <= credit[7:4]; d_in0 <= credit[3:0]; end
	end

	//Modified 6-0 down counter
	//Stops at 0 instead of looping back to 6
	//Also sets fruit signals back to 0 when count = 0
	always @ (posedge clk) begin
		if(downReset)
			count <= 4'b100;
		else if(downStart) begin
			case(count)
				//4'b110: count <= 4'b101;
				//4'b101: count <= 4'b100;
				4'b100: count <= 4'b011;
				4'b011: count <= 4'b010;
				4'b010: count <= 4'b001;
				4'b001: count <= 4'b000;
				4'b000: begin downStart <= 0; astart <= 0; bstart <= 0; cstart <= 0; dstart <= 0; estart <= 0; end
				default: count <= 4'b100;
			endcase
		end
	end

endmodule