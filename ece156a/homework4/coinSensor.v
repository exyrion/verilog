//Justin Liang
//ECE 154A
//Homework 4

module coinSensor(clk, reset, serialIn, penny, nickel, dime, quarter);

	input clk, reset, serialIn;
	output penny, nickel, dime, quarter;

	reg [3:0] state;
	reg penny, nickel, dime, quarter;
	parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10, s11=11, s12=12, s13=13;

	always @ (posedge clk) begin
		if(reset) begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end

		else begin
			case(state)			
				s0:
				begin
					if(serialIn) begin state <= s0; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s1; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s1:
				begin
					if(serialIn) begin state <= s5; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s2; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s2:
				begin
					if(serialIn) begin state <= s3; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s2; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s3:
				begin
					if(serialIn) begin state <= s11; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s4; penny <= 1;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s4:
				begin
					if(serialIn) begin state <= s0; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s1; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s5:
				begin
					if(serialIn) begin state <= s11; penny <= 0; nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s6; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s6:
				begin
					if(serialIn) begin state <= s9; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s7; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s7:
				begin
					if(serialIn) begin state <= s5; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s8; penny <= 0;	nickel <= 1; dime <= 0;	quarter <= 0; end
				end

				s8:
				begin
					if(serialIn) begin state <= s0; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
					else begin state <= s1; penny <= 0;	nickel <= 0; dime <= 0;	quarter <= 0; end
				end

				s9:
				begin
					if(serialIn) begin state <= s11; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s10; penny <= 0; nickel <= 0; dime <= 0; quarter <= 1; end
				end

				s10:
				begin
					if(serialIn) begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s1; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
				end

				s11:
				begin 
					if(serialIn) begin state <= s12; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s1; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
				end

				s12:
				begin
					if(serialIn) begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s13; penny <= 0; nickel <= 0; dime <= 1; quarter <= 0; end
				end

				s13:
				begin
					if(serialIn) begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s1; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
				end

				default:
				begin
					if(serialIn) begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
					else begin state <= s0; penny <= 0; nickel <= 0; dime <= 0; quarter <= 0; end
				end
			endcase
		end
	end
endmodule

