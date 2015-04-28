// Justin Liang
// ECE 154A
// Homework 3

module upcnt(count, start, a_reset, s_reset, clk);
	output [3:0] count;
	input start, a_reset, s_reset, clk;

	reg [3:0] count;

	always @ (posedge clk or negedge a_reset)
		if(~a_reset || ~s_reset)
			count <= 4'b0000;
		else if(~start) begin
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
				4'b1010: count <= 4'b1011;
				4'b1011: count <= 4'b1100;
				4'b1100: count <= 4'b1101;
				4'b1101: count <= 4'b1110;
				4'b1110: count <= 4'b1111;
				4'b1111: count <= 4'b0000;
				default: count <= 4'b0000;
			endcase
		end
endmodule