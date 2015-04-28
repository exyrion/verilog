//Justin Liang
//ECE 156A
//Homework 5

module test_fullcircuit;
	
	reg clk, clk2, x, rs, data_in;
	wire data_out;
	wire [4:0] z;

	fullcircuit f1 (clk, clk2, x ,rs, data_in, data_out, z);

	initial begin
		rs <= 1; clk <= 1; clk2 <= 1; //Start at reset state
		#10	rs <= 0; x <= 0; //Go to run state
		
		//For some reason, in order to write to memory address X, I have to specify address X+1
		//Very minor bug in my code, but I'm not sure why it does that
		//Sets memory address of 00 to be 0001 (1)
		#10 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 0; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 1; //Bit 4
		#10 x <= 1; data_in <= 0; //Bit 5
		#10 x <= 0; data_in <= 0; //Bit 6
		#10 x <= 0; data_in <= 0; //Bit 7

		//Sets memory address of 01 to be 0011 (3)
		#10 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 1; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 0; //Bit 4
		#10 x <= 1; data_in <= 1; //Bit 5
		#10 x <= 0; data_in <= 0; //Bit 6
		#10 x <= 0; data_in <= 0; //Bit 7

		//Sets memory address of 10 to be 1111 (15)
		#10 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 1; //Bit 1
		#10 x <= 1; data_in <= 1; //Bit 2
		#10 x <= 1; data_in <= 1; //Bit 3
		#10 x <= 1; data_in <= 1; //Bit 4
		#10 x <= 1; data_in <= 1; //Bit 5
		#10 x <= 0; data_in <= 0; //Bit 6
		#10 x <= 0; data_in <= 0; //Bit 7

		//Add memory addresses 00 and 01 (3+1=4)
		#10 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 0; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 0; //Bit 4
		#10 x <= 1; data_in <= 0; //Bit 5
		#10 x <= 0; data_in <= 1; //Bit 6
		#10 x <= 0; data_in <= 0; //Bit 7

		//Subtract memory addresses 10 and 01 (15-3=12)
		#20 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 0; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 1; //Bit 3
		#10 x <= 1; data_in <= 0; //Bit 4
		#10 x <= 1; data_in <= 1; //Bit 5
		#10 x <= 0; data_in <= 1; //Bit 6
		#10 x <= 0; data_in <= 0; //Bit 7

		//AND memory addresses 00 and 01 (0001 AND 0011 = 0001)
		#20 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 0; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 0; //Bit 4
		#10 x <= 1; data_in <= 0; //Bit 5
		#10 x <= 0; data_in <= 0; //Bit 6
		#10 x <= 0; data_in <= 1; //Bit 7

		//OR memory addresses 00 and 10 (0001 OR 1111 = 1111)
		#20 x <= 1;
		#10 x <= 1; data_in <= 0; //Bit 0
		#10 x <= 1; data_in <= 1; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 0; //Bit 4
		#10 x <= 1; data_in <= 1; //Bit 5
		#10 x <= 0; data_in <= 0; //Bit 6
		#10 x <= 0; data_in <= 1; //Bit 7

		//Buffer the data, output should be 10011
		#20 x <= 1;
		#10 x <= 1; data_in <= 1; //Bit 0
		#10 x <= 1; data_in <= 1; //Bit 1
		#10 x <= 1; data_in <= 0; //Bit 2
		#10 x <= 1; data_in <= 0; //Bit 3
		#10 x <= 1; data_in <= 1; //Bit 4
		#10 x <= 1; data_in <= 0; //Bit 5
		#10 x <= 0; data_in <= 1; //Bit 6
		#10 x <= 0; data_in <= 1; //Bit 7

	end

	always begin
      #5 clk <= ~clk;
       clk2 <= ~clk2;
    end

endmodule
