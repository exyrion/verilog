//Justin Liang
//ECE 154A
//Homework 3

module machine_a(z, clk, in, reset);
	output z;
	input clk, in, reset;
	reg [4:0] state;
	reg z;

	always @ (posedge clk or in)
		if(~reset)
			state <= 5'bzzzzz;
		else begin

			case(state)
			//LEFT SIDE OF STATE DIAGRAM
			5'bzzzzz:
			begin
				if(in) begin
					state <= 5'bzzzzz; //go to initial
					z <= 0;
				end
				else begin
					state <= 5'bzzzz0; //go to 0
					z <= 0;
				end
			end

			5'bzzzz0:
			begin
				if(in) begin
					state <= 5'bzzz01; //go to 01
					z <= 0;
				end
				else begin
					state <= 5'bzzz00; //go to 00
					z <= 0;
				end
			end

			5'bzzz00:
			begin
				if(in) begin
					state <= 5'bzz001; //go to 001
					z <= 0;
				end
				else begin
					state <= 5'bzzzzz; //go to initial
					z <= 0;
				end
			end

			5'bzz001:
			begin
				if(in) begin
					state <= 5'bzzzzz; //go to initial
					z <= 0;
				end
				else begin
					state <= 5'bz0010; //go to 0010
					z <= 1;
				end
			end

			5'bz0010:
			begin
				if(in) begin
					state <= 5'bzzz01; //go to 01
					z <= 0;
				end
				else begin
					state <= 5'bz0100; //go to 0100
					z <= 0;
				end
			end

			//RIGHT SIDE OF STATE DIAGRAM
			5'bzzz01:
			begin
				if(in) begin
					state <= 5'bzzzzz; //go to initial
					z <= 0;
				end
				else begin
					state <= 5'bzz010; //go to 010
					z <= 0;
				end
			end

			5'bzz010:
			begin
				if(in) begin
					state <= 5'bzzz01; //go to 01
					z <= 0;
				end
				else begin
					state <= 5'bz0100; //go to 0100
					z <= 0;
				end
			end

			5'bz0100:
			begin
				if(in) begin
					state <= 5'bzz001; //go to 001
					z <= 0;
				end
				else begin
					state <= 5'b01000; //go to 01000
					z <= 1;
				end
			end

			5'b01000:
			begin
				if(in) begin
					state <= 5'bzz001; //go to 001
					z <= 0;
				end
				else begin
					state <= 5'bzzz00; //go to 00
					z <= 0;
				end
			end

			default: state <= 5'bzzzzz;

			endcase
		end	
endmodule
