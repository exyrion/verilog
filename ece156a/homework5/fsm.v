//Justin Liang
//ECE 156A
//Homework 5

module fsm(clk, x, rs, reset, run, shift, update);
	`define RS 4'b0001 //Reset state
	`define RI 4'b0010 //Run/Idle state
	`define SH 4'b0100 //Shift state
	`define UP 4'b1000 //Update state
	input clk, x, rs;
	output reset, run, shift, update;
	reg reset, run, shift, update;
	reg [3:0] state, next_state;

	//Initialize parameters
	initial begin
		state <= `RS;
		next_state <= `RS;
		reset = 1;
		shift = 0;
		update = 0;
		run = 0;
	end

	//Basic state diagram implementation
	//Uses active high reset
	always @ (posedge clk) begin
		//If rs is asserted, reset = 1 and state = `RS
		if(rs) begin
			state <= `RS;
			reset <= 1;
			run <= 0;
			shift <= 0;
			update <= 0;
		end
		//If rs is not asserted, then...
		else begin
			//State becomes next state
			assign state = next_state;
			case(state)
				`RS:
				begin
					reset <= 1; run <= 0; shift <= 0; update <= 0;
					if(x) begin next_state <= `RS; end
					else begin next_state <= `RI; end
				end
				`RI:
				begin
					reset <= 0; run <= 1; shift <= 0; update <= 0;
					if(x) begin next_state <= `SH; end
					else begin next_state <= `RI; end
				end
				`SH:
				begin
					reset <= 0; run <= 0; shift <= 1; update <= 0;
					if(x) begin next_state <= `SH; end
					else begin next_state <= `UP; end
				end
				`UP:
				begin
					reset <= 0; run <= 0; shift <= 0; update = 1;
					if(x) begin next_state <= `RS; end
					else begin next_state <= `RI; end
				end
			endcase
		end
	end
	
endmodule
