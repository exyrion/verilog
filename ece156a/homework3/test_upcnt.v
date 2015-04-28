module test_upcnt;
    reg start,a_reset,s_reset,clk;
    wire[3:0] count;

  	//upcnt_structural t1(count,start,a_reset,s_reset,clk);  
    upcnt t1(count,start,a_reset,s_reset,clk); 
  	
  	initial begin
    	clk=1;
    	start = 0;
    	s_reset = 1;    	
    	a_reset=1;
    
    end // initial begin

    always begin
      #5 clk = ~clk;
    end





endmodule
