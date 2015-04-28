//Justin Liang
//ECE 154A
//Encoder testbench

module test_encoder_8_3;
  reg[7:0] in;
  wire[2:0] out;
  
  encoder_8_3 testing(in, out);
  //encoder_8_3_structural testing(in, out);
  
  initial begin
    //Set in[0] to 1, output should be decimal 0
    in = 8'b00000001;
    #50
    in = 8'b00000010;
    #50
    in = 8'b00000100;
    #50
    in = 8'b00001000;
    #50
    in = 8'b00010000;
    #50
    in = 8'b00100000;
    #50
    in = 8'b01000000;
    #50
    in = 8'b10000000;
    #50
    in = 8'b00000000;
    
  end
endmodule
