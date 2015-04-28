//Justin Liang
//ECE 154A
//Homework 3

module test_machine;
	reg clk, in, reset;
	wire z;

	machine_a m1 (z, clk, in, reset);
	//machine_b m2 (z, clk, in, reset);

	initial begin
    	clk=1;  	
    	reset = 1;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 1;
    	#10 in = 1;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 1;
    	#10 in = 1;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;
    	#10 in = 0;


    end // initial begin

    always begin
      #5 clk = ~clk;
    end
endmodule