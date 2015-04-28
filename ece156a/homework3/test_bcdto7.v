module test_bcdto7;

    reg [3:0] d_in;
    reg clk;
    wire[6:0] all_out;

    //bcdto7 x(all_out, d_in, clk);
    bcdto7_structural x(all_out, d_in);
    initial begin
    		clk = 1;
    		d_in = 4'b0000; 
    	#10 d_in = 4'b0001; 
    	#10 d_in = 4'b0010; 
    	#10 d_in = 4'b0011; 
    	#10 d_in = 4'b0100; 
    	#10 d_in = 4'b0101; 
    	#10 d_in = 4'b0110; 
    	#10 d_in = 4'b0111; 
    	#10 d_in = 4'b1000; 
    	#10 d_in = 4'b1001;
    	#10 d_in = 4'b1010;
    	#10 d_in = 4'b1011;
    	#10 d_in = 4'b1100;
    	#10 d_in = 4'b1101;
    	#10 d_in = 4'b1110;
    	#10 d_in = 4'b1111;
    end

    always begin
    	#5 clk = ~clk;
    end

endmodule