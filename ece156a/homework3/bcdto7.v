//Justin Liang
//ECE 154A
//Homework 3

module bcdto7(all_out,d_in,clk);
	output [6:0] all_out;
	input[3:0] d_in;
	input clk;

	reg [6:0] all_out;

	always @ (posedge clk)
		case(d_in)
			4'b0000: all_out = 7'b1111110; //0
			4'b0001: all_out = 7'b1100000; //1
			4'b0010: all_out = 7'b1101101; //2
			4'b0011: all_out = 7'b1111001; //3
			4'b0100: all_out = 7'b0110011; //4
			4'b0101: all_out = 7'b1011011; //5
			4'b0110: all_out = 7'b1011111; //6
			4'b0111: all_out = 7'b1110000; //7
			4'b1000: all_out = 7'b1111111; //8
			4'b1001: all_out = 7'b1111011; //9
			4'b1010: all_out = 7'b1110111; //10
			4'b1011: all_out = 7'b0011111; //11
			4'b1100: all_out = 7'b1001110; //12
			4'b1101: all_out = 7'b0111101; //13
			4'b1110: all_out = 7'b1001111; //14
			4'b1111: all_out = 7'b1000111; //15
		endcase

endmodule