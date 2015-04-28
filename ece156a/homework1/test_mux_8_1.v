//Justin Liang
//ECE 154A
//Mux testbench

module test_mux_8_1;
  reg[7:0] in;
  reg[2:0] s;
  wire out;
  
  mux_8_1 testing(in, out, s);
  //mux_8_1_structural testing(in, out, s);
  
  initial begin
    //Set in[0] to 1, select in[0], output should be 1
    in = 8'b00000001;
    s = 3'b000;
    #50
    //Set in[1] to 1, select in[1], output should be 1
    in = 8'b00000010;
    s = 3'b001;
    #50
    //Set in[2] to 1, select in[2], output should be 1
    in = 8'b00000100;
    s = 3'b010;
    #50
    //Set in[3] to 1, select in[3], output should be 1
    in = 8'b00001000;
    s = 3'b011;
    #50
    //Set in[4] to 1, select in[4], output should be 1
    in = 8'b00010000;
    s = 3'b100;
    #50
    //Set in[5] to 1, select in[5], output should be 1
    in = 8'b00100000;
    s = 3'b101;
    #50
    //Set in[6] to 1, select in[6], output should be 1
    in = 8'b01000000;
    s = 3'b110;
    #50
    //Set in[7] to 1, select in[7], output should be 1
    in = 8'b10000000;
    s = 3'b111;
    #50
    //Change select value, output should be 0
    s = 3'b001;
    
  end
endmodule
    
    