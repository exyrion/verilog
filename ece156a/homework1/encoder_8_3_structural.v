//Justin Liang
//ECE 154A
//Homework 1, Problem 2c

module encoder_8_3_structural(in, out);
  input[7:0] in;
  output[2:0] out;
  
  or(out[2], in[4], in[5], in[6],  in[7]);
  or(out[1], in[2], in[3], in[6],  in[7]);
  or(out[0], in[1], in[3], in[5],  in[7]);
endmodule
    


