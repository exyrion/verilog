// Justin Liang
// ECE 154A
// Homework 4

module dwncnt(count, start, a_reset, s_reset, clk);
	output [2:0] count;
	input start, a_reset, s_reset, clk;

	reg [2:0] count;

	always @ (posedge clk or negedge a_reset) begin
		if(a_reset || s_reset)
			count <= 4'b110;
		else if(start) begin
			case(count)
				4'b110: count <= 4'b101;
				4'b101: count <= 4'b100;
				4'b100: count <= 4'b011;
				4'b011: count <= 4'b010;
				4'b010: count <= 4'b001;
				4'b001: count <= 4'b000;
				4'b000: count <= 4'b110;
				default: count <= 4'b110;
			endcase
		end
	end
endmodule