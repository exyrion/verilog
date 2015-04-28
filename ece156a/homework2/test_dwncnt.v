module test_dwncnt;
		reg start,a_reset,s_reset,clk;
		wire[2:0] count;

		dwncnt t1(count,start,a_reset,s_reset,clk);  
		
		initial begin
			clk=0;
			start = 1;
			s_reset = 0;    	
			a_reset=0;
		
		end // initial begin

		always begin
			#5 clk = ~clk;
		end
		
endmodule
