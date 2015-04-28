module test_bcdto7;

    reg [3:0] d_in;
    wire[6:0] all_out;

    bcdto7 x(all_out, d_in);
    initial begin
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

endmodule