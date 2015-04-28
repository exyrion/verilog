//Justin Liang
//ECE 154A
//Homework 3

module test_upcnt_with_bcd;
    reg start,a_reset,s_reset,clk;
    wire [6:0] out;

  	upcnt_with_bcd c(out,start,a_reset,s_reset,clk);  
  	
  	initial begin
    	clk=1;
    	start = 1;
    	s_reset = 1;    	
    	a_reset = 1;
      #10 start = 0;

    end // initial begin

    always begin
      #5 clk = ~clk;
    end





endmodule
