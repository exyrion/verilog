// Justin Liang
// ECE 154A
// 2 to 1 multiplexer, structural implementation
// Used for regfile

module mux_2_1_structural(out, in0, in1, s);
  
	output out;
	input in0, in1, s;
	reg out;
	always @ (s or in0 or in1)
	begin
		case(s)
			1'b0: out = in0;
			1'b1: out = in1;
		endcase
	end
	
endmodule