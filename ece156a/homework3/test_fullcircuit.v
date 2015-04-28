//Justin Liang
//ECE 154A
//Homework 3

module test_fullcircuit;
    reg start,a_reset,s_reset,clk;
    wire out;

  	fullcircuit c1(out,start,a_reset,s_reset,clk);  
  	
  	initial begin
    	clk=1;
    	start = 0;
    	s_reset = 1;    	
    	a_reset = 1;

    end // initial begin

    always begin
      #5 clk = ~clk;
    end





endmodule
