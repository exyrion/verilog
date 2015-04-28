//Justin Liang
//ECE 154A
//Decoder testbench

module test_decoder_3_8;
  reg[2:0] in;
  wire[7:0] out;
  
  decoder_3_8 testing(in, out);
  //decoder_3_8_structural testing(in, out);
  
  initial begin
    //Set in to 000, output should be 00000001
    in = 3'b000;
    #50
    //Set in to 001, output should be 00000010
    in = 3'b001;
    #50
    //Set in to 010, output should be 00000100
    in = 3'b010;
    #50
    //Set in to 011, output should be 00001000
    in = 3'b011;
    #50
    //Set in to 100, output should be 00010000
    in = 3'b100;
    #50
    //Set in to 101, output should be 00100000
    in = 3'b101;
    #50
    //Set in to 110, output should be 01000000
    in = 3'b110;
    #50
    //Set in to 111, output should be 10000000
    in = 3'b111;
    
  end
endmodule