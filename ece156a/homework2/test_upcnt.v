module test_upcnt;
    reg start,a_reset,s_reset,clk;
    wire[3:0] count;

  	upcnt t1(count,start,a_reset,s_reset,clk);  
    
    
    
  	
  	initial begin
    	clk=0;
    	start = 0;
    	s_reset = 1;    	
    	a_reset=1;

      #10 start = 0;
      #10 start = 1;
      #80 start = 0;
      #120 start = 1;
    
    end // initial begin

    always begin
      #5 clk = ~clk;
    end





endmodule
