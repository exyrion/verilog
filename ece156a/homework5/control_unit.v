//Justin Liang
//ECE 156A
//Homework 5
module control_unit (clk, data_in, reset, run, shift, update, data_out, z);
	`define INITLZ_MEM 2'b00
	`define ARITH 2'b01
	`define LOGIC 2'b10
	`define BUFFER 2'b11

	input clk, data_in;
	input reset, run, shift, update;
	output data_out;
	output [4:0] z; //Output of shift register
	reg [3:0] mem [3:0]; //Memory
	reg [7:0] shift_reg, shadow_reg;
	reg data_out;
	reg [4:0] z;
	reg [1:0] address;
	reg [1:0] addressA, addressB;
	reg [1:0] opcode;

	//Initialize memory, shift and shadow registers
	initial begin
		mem[3] <= 0;
		mem[2] <= 0;
		mem[1] <= 0;
		mem[0] <= 0;
		shift_reg <= 8'b00000000;
		shadow_reg <= 8'b00000000;
	end

	always @ (posedge clk or negedge reset or shift or run) begin
		
		//Reset behaviour, resets all memory and shift/shadow registers to 0
		if(reset) begin
			mem[3] <= 0;
			mem[2] <= 0;
			mem[1] <= 0;
			mem[0] <= 0;
			shift_reg <= 8'b00000000;
			shadow_reg <= 8'b00000000;
		end

		//Run the operation as specified by the shadow register
		else if(run) begin
			opcode <= shadow_reg[7:6];
			address <= shadow_reg[5:4];
			if(opcode == `INITLZ_MEM) begin
			    
			    if(address == 2'b11) begin mem[3] = shadow_reg[3:0]; end
			    if(address == 2'b10) begin mem[2] = shadow_reg[3:0]; end
			    if(address == 2'b01) begin mem[1] = shadow_reg[3:0]; end
			    if(address == 2'b00) begin mem[0] = shadow_reg[3:0]; end
			end

			else if(opcode == `ARITH) begin
				addressA <= shadow_reg[3:2];
				addressB <= shadow_reg[1:0];
				if(shadow_reg[5] == 0) z <= mem[addressA] + mem[addressB];
				else if(shadow_reg[5] == 1) z <= mem[addressA] - mem[addressB];
			end

			else if(opcode == `LOGIC) begin
				addressA <= shadow_reg[3:2];
				addressB <= shadow_reg[1:0];
				if(shadow_reg[5] == 0) z <= mem[addressA] & mem[addressB];
				else if(shadow_reg[5] == 1) z <= mem[addressA] | mem[addressB];
			end

			else if(opcode == `BUFFER) begin
				z <= shadow_reg[4:0];
			end
		end

		//Shift bits to the right, MSB -> LSB
		else if(shift) begin
			shift_reg[7] <= data_in; //First bit arrives to shift_reg[7]
			shift_reg[6] <= shift_reg[7]; //Shift MSB bit to 2nd MSB bit
			shift_reg[5] <= shift_reg[6]; //Repeat
			shift_reg[4] <= shift_reg[5]; //Repeat
			shift_reg[3] <= shift_reg[4]; //Repeat
			shift_reg[2] <= shift_reg[3]; //Repeat
			shift_reg[1] <= shift_reg[2]; //Repeat
			shift_reg[0] <= shift_reg[1]; //2nd LSB bit to LSB bit
			data_out <= shift_reg[0]; //Shift LSB bit out
		end

		//The contents of the shift register is latched onto the shadow register
		else if(update) begin
			shadow_reg <= shift_reg;
		end
	end
endmodule