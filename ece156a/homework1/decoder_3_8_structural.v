//Justin Liang
//ECE 154A
//Homework 1, Problem 2b

module decoder_3_8_structural(in, out);
  input[2:0] in;
  output[7:0] out;
  
  //Make the not wires
  wire not2, not1, not0;
  not(not2, in[2]);
  not(not1, in[1]);
  not(not0, in[0]);  
  
  //And them according to the boolean equation for a decoder
  and(out[0], not2, not1, not0);
  and(out[1], not2, not1, in[0]);
  and(out[2], not2, in[1], not0);
  and(out[3], not2, in[1], in[0]);
  and(out[4], in[2], not1, not0);
  and(out[5], in[2], not1, in[0]);
  and(out[6], in[2], in[1], not0);
  and(out[7], in[2], in[1], in[0]);

endmodule
  
    
