//Justin Liang
//ECE 154A

module test_regfile;

   	reg [3:0] d_in; 
   	reg [2:0] a_in;
   	reg a_reset, we, clk;
   	wire [3:0]d_out;

   	regfile r(d_out, d_in, a_in, a_reset, we, clk);

   	
   	initial begin
		d_in = 4'b0000;
		a_in = 3'b000;
		a_reset = 1;
		we = 1;
		clk = 0;
		

	   	#10 a_reset = 0; //Set every register to 0
	   	#10 a_reset = 1;
	   	
	   	#10 a_in = 4'b011;
	   		d_in = 4'b1001; //Writes 1001 to address 011

	   	#10 a_in = 4'b001;
	   		d_in = 4'b0001; //Writes 0001 to address 001
	   	
	   	#10 a_in = 3'b000; //Read from the first address, which is 0000
	   		we = 0;

	   	#10 a_in = 3'b001; //Read from the second address, which is 0001

	   	#10 a_reset = 0; //Asynch reset
	   		a_in = 3'b0011; //Read from third adddress, output should be 0
	 end

		always begin
	     	#5 clk = ~clk;
	    end

    
endmodule 
