// Justin Liang
// ECE 156A
// Homework 5

module upcnt(clk, enable, reset, count);
	output [3:0] count;
	input enable, reset, clk;

	reg [3:0] count;

	always @ (posedge clk or posedge reset)
		if(reset)
			count <= 4'b0000;
		else if(enable) begin
			case(count)
				4'b0000: count <= 4'b0001;
				4'b0001: count <= 4'b0010;
				4'b0010: count <= 4'b0011;
				4'b0011: count <= 4'b0100;
				4'b0100: count <= 4'b0101;
				4'b0101: count <= 4'b0110;
				4'b0110: count <= 4'b0111;
				4'b0111: count <= 4'b1000;
				4'b1000: count <= 4'b1001;
				4'b1001: count <= 4'b1010;
			endcase
		end
endmodule